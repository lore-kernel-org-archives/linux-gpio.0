From: <tthayer@opensource.altera.com>
Subject: [PATCH] gpio: gpiolib-devprop: Check chip->parent pointer before dereferencing
Date: Tue, 25 Oct 2016 11:31:23 -0500
Message-ID: <1477413083-9159-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, mika.westerberg@linux.intel.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer@opensource.altera.com
List-Id: linux-gpio@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

Confirm the chip->parent is valid before dereferencing because
the parent parameter is optional.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 drivers/gpio/gpiolib-devprop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpiolib-devprop.c b/drivers/gpio/gpiolib-devprop.c
index 17bfc41..27f383b 100644
--- a/drivers/gpio/gpiolib-devprop.c
+++ b/drivers/gpio/gpiolib-devprop.c
@@ -31,6 +31,11 @@ void devprop_gpiochip_set_names(struct gpio_chip *chip)
 	const char **names;
 	int ret, i;
 
+	if (!chip->parent) {
+		dev_warn(&gdev->dev, "GPIO chip parent is NULL\n");
+		return;
+	}
+
 	ret = device_property_read_string_array(chip->parent, "gpio-line-names",
 						NULL, 0);
 	if (ret < 0)
-- 
1.9.1
