From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/8] extcon: gpio: Request reasonable interrupts
Date: Sun, 24 Sep 2017 16:56:19 +0200
Message-ID: <20170924145622.4031-6-linus.walleij@linaro.org>
References: <20170924145622.4031-1-linus.walleij@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170924145622.4031-1-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Mike Lockwood <lockwood@google.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

The only thing that makes sense is to request a falling edge interrupt
if the line is active low and a rising edge interrupt if the line is
active high, so just do that and get rid of the assignment from
platform data. The GPIO descriptor knows if the line is active high
or low.

Also make irq a local variable in probe(), it's not used anywhere else.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/extcon/extcon-gpio.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index 86f3ec6d6014..6d9cb4ed11c2 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -30,26 +30,22 @@
 /**
  * struct gpio_extcon_data - A simple GPIO-controlled extcon device state container.
  * @edev:		Extcon device.
- * @irq:		Interrupt line for the external connector.
  * @work:		Work fired by the interrupt.
  * @debounce_jiffies:	Number of jiffies to wait for the GPIO to stabilize, from the debounce
  *			value.
  * @gpiod:		GPIO descriptor for this external connector.
  * @extcon_id:		The unique id of specific external connector.
  * @debounce:		Debounce time for GPIO IRQ in ms.
- * @irq_flags:		IRQ Flags (e.g., IRQF_TRIGGER_LOW).
  * @check_on_resume:	Boolean describing whether to check the state of gpio
  *			while resuming from sleep.
  */
 struct gpio_extcon_data {
 	struct extcon_dev *edev;
-	int irq;
 	struct delayed_work work;
 	unsigned long debounce_jiffies;
 	struct gpio_desc *gpiod;
 	unsigned int extcon_id;
 	unsigned long debounce;
-	unsigned long irq_flags;
 	bool check_on_resume;
 };
 
@@ -77,21 +73,34 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 {
 	struct gpio_extcon_data *data;
 	struct device *dev = &pdev->dev;
+	unsigned long irq_flags;
+	int irq;
 	int ret;
 
 	data = devm_kzalloc(dev, sizeof(struct gpio_extcon_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	if (!data->irq_flags || data->extcon_id > EXTCON_NONE)
+	if (data->extcon_id > EXTCON_NONE)
 		return -EINVAL;
 
 	data->gpiod = devm_gpiod_get(dev, "extcon", GPIOD_IN);
 	if (IS_ERR(data->gpiod))
 		return PTR_ERR(data->gpiod);
-	data->irq = gpiod_to_irq(data->gpiod);
-	if (data->irq <= 0)
-		return data->irq;
+	irq = gpiod_to_irq(data->gpiod);
+	if (irq <= 0)
+		return irq;
+
+	/*
+	 * It is unlikely that this is an acknowledged interrupt that goes
+	 * away after handling, what we are looking for are falling edges
+	 * if the signal is active low, and rising edges if the signal is
+	 * active high.
+	 */
+	if (gpiod_is_active_low(data->gpiod))
+		irq_flags = IRQF_TRIGGER_FALLING;
+	else
+		irq_flags = IRQF_TRIGGER_RISING;
 
 	/* Allocate the memory of extcon devie and register extcon device */
 	data->edev = devm_extcon_dev_allocate(dev, &data->extcon_id);
@@ -110,8 +119,8 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	 * Request the interrupt of gpio to detect whether external connector
 	 * is attached or detached.
 	 */
-	ret = devm_request_any_context_irq(dev, data->irq,
-					gpio_irq_handler, data->irq_flags,
+	ret = devm_request_any_context_irq(dev, irq,
+					gpio_irq_handler, irq_flags,
 					pdev->name, data);
 	if (ret < 0)
 		return ret;
-- 
2.13.5
