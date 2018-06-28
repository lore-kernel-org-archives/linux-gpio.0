From: Mathias Kresin <dev@kresin.me>
Subject: [PATCH] gpio: stp-xway: Implement get callback
Date: Thu, 28 Jun 2018 21:57:40 +0200
Message-ID: <1530215860-25549-1-git-send-email-dev@kresin.me>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, john@phrozen.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: martin.blumenstingl@googlemail.com
List-Id: linux-gpio@vger.kernel.org

Add an implementation to get the current GPIO state.

The callback is used by the leds-gpio driver for example, in case the
current LED/GPIO state should be kept during driver load.

Signed-off-by: Mathias Kresin <dev@kresin.me>
---
 drivers/gpio/gpio-stp-xway.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index c07385b..63c708c 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -91,6 +91,20 @@ struct xway_stp {
 };
 
 /**
+ * xway_stp_get() - gpio_chip->get - get gpios.
+ * @gc:     Pointer to gpio_chip device structure.
+ * @gpio:   GPIO signal number.
+ *
+ * Gets the shadow value.
+ */
+static int xway_stp_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct xway_stp *chip = gpiochip_get_data(gc);
+
+	return (xway_stp_r32(chip->virt, XWAY_STP_CPU0) & BIT(gpio));
+}
+
+/**
  * xway_stp_set() - gpio_chip->set - set gpios.
  * @gc:     Pointer to gpio_chip device structure.
  * @gpio:   GPIO signal number.
@@ -215,6 +229,7 @@ static int xway_stp_probe(struct platform_device *pdev)
 	chip->gc.parent = &pdev->dev;
 	chip->gc.label = "stp-xway";
 	chip->gc.direction_output = xway_stp_dir_out;
+	chip->gc.get = xway_stp_get;
 	chip->gc.set = xway_stp_set;
 	chip->gc.request = xway_stp_request;
 	chip->gc.base = -1;
-- 
2.7.4
