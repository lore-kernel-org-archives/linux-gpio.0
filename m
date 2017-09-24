From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/8] extcon: gpio: Convert to fully use GPIO descriptor
Date: Sun, 24 Sep 2017 16:56:18 +0200
Message-ID: <20170924145622.4031-5-linus.walleij@linaro.org>
References: <20170924145622.4031-1-linus.walleij@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170924145622.4031-1-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Mike Lockwood <lockwood@google.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Since we are not getting the GPIO from any platform data and global
GPIO numberspace, we simply get the named "extcon" GPIO directly from
the device. Cut away "active low" since GPIO descriptors already know
if the line is active high or low. Simplify a bit with a
struct device *dev helper variable in probe() and cut the complex
init() function.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/extcon/extcon-gpio.c | 66 ++++++++++----------------------------------
 1 file changed, 15 insertions(+), 51 deletions(-)

diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index 9c4094edd123..86f3ec6d6014 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -18,7 +18,6 @@
  */
 
 #include <linux/extcon.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -35,12 +34,8 @@
  * @work:		Work fired by the interrupt.
  * @debounce_jiffies:	Number of jiffies to wait for the GPIO to stabilize, from the debounce
  *			value.
- * @id_gpiod:		GPIO descriptor for this external connector.
+ * @gpiod:		GPIO descriptor for this external connector.
  * @extcon_id:		The unique id of specific external connector.
- * @gpio:		Corresponding GPIO.
- * @gpio_active_low:	Boolean describing whether gpio active state is 1 or 0
- *			If true, low state of gpio means active.
- *			If false, high state of gpio means active.
  * @debounce:		Debounce time for GPIO IRQ in ms.
  * @irq_flags:		IRQ Flags (e.g., IRQF_TRIGGER_LOW).
  * @check_on_resume:	Boolean describing whether to check the state of gpio
@@ -51,10 +46,8 @@ struct gpio_extcon_data {
 	int irq;
 	struct delayed_work work;
 	unsigned long debounce_jiffies;
-	struct gpio_desc *id_gpiod;
+	struct gpio_desc *gpiod;
 	unsigned int extcon_id;
-	unsigned gpio;
-	bool gpio_active_low;
 	unsigned long debounce;
 	unsigned long irq_flags;
 	bool check_on_resume;
@@ -67,10 +60,7 @@ static void gpio_extcon_work(struct work_struct *work)
 		container_of(to_delayed_work(work), struct gpio_extcon_data,
 			     work);
 
-	state = gpiod_get_value_cansleep(data->id_gpiod);
-	if (data->gpio_active_low)
-		state = !state;
-
+	state = gpiod_get_value_cansleep(data->gpiod);
 	extcon_set_state_sync(data->edev, data->extcon_id, state);
 }
 
@@ -83,60 +73,34 @@ static irqreturn_t gpio_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int gpio_extcon_init(struct device *dev, struct gpio_extcon_data *data)
-{
-	int ret;
-
-	ret = devm_gpio_request_one(dev, data->gpio, GPIOF_DIR_IN,
-				dev_name(dev));
-	if (ret < 0)
-		return ret;
-
-	data->id_gpiod = gpio_to_desc(data->gpio);
-	if (!data->id_gpiod)
-		return -EINVAL;
-
-	if (data->debounce) {
-		ret = gpiod_set_debounce(data->id_gpiod,
-					 data->debounce * 1000);
-		if (ret < 0)
-			data->debounce_jiffies =
-				msecs_to_jiffies(data->debounce);
-	}
-
-	data->irq = gpiod_to_irq(data->id_gpiod);
-	if (data->irq < 0)
-		return data->irq;
-
-	return 0;
-}
-
 static int gpio_extcon_probe(struct platform_device *pdev)
 {
 	struct gpio_extcon_data *data;
+	struct device *dev = &pdev->dev;
 	int ret;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(struct gpio_extcon_data),
-				   GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(struct gpio_extcon_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
 	if (!data->irq_flags || data->extcon_id > EXTCON_NONE)
 		return -EINVAL;
 
-	/* Initialize the gpio */
-	ret = gpio_extcon_init(&pdev->dev, data);
-	if (ret < 0)
-		return ret;
+	data->gpiod = devm_gpiod_get(dev, "extcon", GPIOD_IN);
+	if (IS_ERR(data->gpiod))
+		return PTR_ERR(data->gpiod);
+	data->irq = gpiod_to_irq(data->gpiod);
+	if (data->irq <= 0)
+		return data->irq;
 
 	/* Allocate the memory of extcon devie and register extcon device */
-	data->edev = devm_extcon_dev_allocate(&pdev->dev, &data->extcon_id);
+	data->edev = devm_extcon_dev_allocate(dev, &data->extcon_id);
 	if (IS_ERR(data->edev)) {
-		dev_err(&pdev->dev, "failed to allocate extcon device\n");
+		dev_err(dev, "failed to allocate extcon device\n");
 		return -ENOMEM;
 	}
 
-	ret = devm_extcon_dev_register(&pdev->dev, data->edev);
+	ret = devm_extcon_dev_register(dev, data->edev);
 	if (ret < 0)
 		return ret;
 
@@ -146,7 +110,7 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	 * Request the interrupt of gpio to detect whether external connector
 	 * is attached or detached.
 	 */
-	ret = devm_request_any_context_irq(&pdev->dev, data->irq,
+	ret = devm_request_any_context_irq(dev, data->irq,
 					gpio_irq_handler, data->irq_flags,
 					pdev->name, data);
 	if (ret < 0)
-- 
2.13.5
