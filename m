From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 7/8] extcon: gpio: Get connector type from device property
Date: Sun, 24 Sep 2017 16:56:21 +0200
Message-ID: <20170924145622.4031-8-linus.walleij@linaro.org>
References: <20170924145622.4031-1-linus.walleij@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170924145622.4031-1-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Mike Lockwood <lockwood@google.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

We do not use the "EXTCON_NONE" type to report this as before, use
the connector type defined in the device property, from device tree or
ACPI DSDT.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/extcon/extcon-gpio.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index 8fc52631c8a2..b7353f5018b5 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -35,7 +35,8 @@
  * @debounce_jiffies:	Number of jiffies to wait for the GPIO to stabilize, from the debounce
  *			value.
  * @gpiod:		GPIO descriptor for this external connector.
- * @extcon_id:		The unique id of specific external connector.
+ * @connector_type:	The connector type we're detecting on this extcon, terminated with EXTCON_NONE
+ *			One GPIO is one cable, so one type only.
  * @check_on_resume:	Boolean describing whether to check the state of gpio
  *			while resuming from sleep.
  */
@@ -44,7 +45,7 @@ struct gpio_extcon_data {
 	struct delayed_work work;
 	unsigned long debounce_jiffies;
 	struct gpio_desc *gpiod;
-	unsigned int extcon_id;
+	unsigned int connector_type[2];
 	bool check_on_resume;
 };
 
@@ -56,7 +57,7 @@ static void gpio_extcon_work(struct work_struct *work)
 			     work);
 
 	state = gpiod_get_value_cansleep(data->gpiod);
-	extcon_set_state_sync(data->edev, data->extcon_id, state);
+	extcon_set_state_sync(data->edev, data->connector_type[0], state);
 }
 
 static irqreturn_t gpio_irq_handler(int irq, void *dev_id)
@@ -74,6 +75,7 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	unsigned long irq_flags;
 	u32 debounce_usecs;
+	u32 connector_type;
 	int irq;
 	int ret;
 
@@ -81,9 +83,6 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
-	if (data->extcon_id > EXTCON_NONE)
-		return -EINVAL;
-
 	data->gpiod = devm_gpiod_get(dev, "extcon", GPIOD_IN);
 	if (IS_ERR(data->gpiod))
 		return PTR_ERR(data->gpiod);
@@ -102,8 +101,16 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	else
 		irq_flags = IRQF_TRIGGER_RISING;
 
+	ret = device_property_read_u32(dev, "extcon-connector-types", &connector_type);
+	if (ret || !connector_type) {
+		dev_err(dev, "illegal cable type or undefined cable type\n");
+		return -EINVAL;
+	}
+	data->connector_type[0] = connector_type;
+	data->connector_type[1] = EXTCON_NONE;
+
 	/* Allocate the memory of extcon devie and register extcon device */
-	data->edev = devm_extcon_dev_allocate(dev, &data->extcon_id);
+	data->edev = devm_extcon_dev_allocate(dev, data->connector_type);
 	if (IS_ERR(data->edev)) {
 		dev_err(dev, "failed to allocate extcon device\n");
 		return -ENOMEM;
-- 
2.13.5
