From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 6/8] extcon: gpio: Get debounce setting from device property
Date: Sun, 24 Sep 2017 16:56:20 +0200
Message-ID: <20170924145622.4031-7-linus.walleij@linaro.org>
References: <20170924145622.4031-1-linus.walleij@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170924145622.4031-1-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Mike Lockwood <lockwood@google.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Look up the debouncing value using the device property that will
pick it from device tree or ACPI DSDT or whatever is available.

Reintroduce the debounce handling previously deleted in the
series, setting the delayed worker to delay 0 ms if the GPIO
driver supports debouncing for us, else just delay the reading
of the value delayed by jiffies.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/extcon/extcon-gpio.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index 6d9cb4ed11c2..8fc52631c8a2 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -24,6 +24,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
@@ -35,7 +36,6 @@
  *			value.
  * @gpiod:		GPIO descriptor for this external connector.
  * @extcon_id:		The unique id of specific external connector.
- * @debounce:		Debounce time for GPIO IRQ in ms.
  * @check_on_resume:	Boolean describing whether to check the state of gpio
  *			while resuming from sleep.
  */
@@ -45,7 +45,6 @@ struct gpio_extcon_data {
 	unsigned long debounce_jiffies;
 	struct gpio_desc *gpiod;
 	unsigned int extcon_id;
-	unsigned long debounce;
 	bool check_on_resume;
 };
 
@@ -74,6 +73,7 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	struct gpio_extcon_data *data;
 	struct device *dev = &pdev->dev;
 	unsigned long irq_flags;
+	u32 debounce_usecs;
 	int irq;
 	int ret;
 
@@ -109,6 +109,15 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	ret = device_property_read_u32(dev, "input-debounce", &debounce_usecs);
+	if (ret || !debounce_usecs) {
+		dev_err(dev, "illegal debounce value, set to 20 ms\n");
+		debounce_usecs = 20000;
+	}
+	ret = gpiod_set_debounce(data->gpiod, debounce_usecs);
+	if (ret)
+		data->debounce_jiffies = msecs_to_jiffies(debounce_usecs * 1000);
+
 	ret = devm_extcon_dev_register(dev, data->edev);
 	if (ret < 0)
 		return ret;
-- 
2.13.5
