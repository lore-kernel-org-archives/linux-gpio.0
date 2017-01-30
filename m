From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH v2 4/5] gpio: gpio-mm: Add support for GPIO names
Date: Mon, 30 Jan 2017 13:33:37 -0500
Message-ID: <3b487a6dcdc075d7fc0414911ec8133cdff46eb1.1485800977.git.vilhelm.gray@gmail.com>
References: <cover.1485800977.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f196.google.com ([209.85.213.196]:33370 "EHLO
        mail-yb0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751135AbdA3Sex (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 13:34:53 -0500
In-Reply-To: <cover.1485800977.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>

This patch sets the gpio_chip names option with an array of GPIO line
names that match the manual documentation for the Diamond Systems
GPIO-MM. This should make it easier for users to identify which GPIO
line corresponds to a respective GPIO pin on the device.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-gpio-mm.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-gpio-mm.c b/drivers/gpio/gpio-gpio-mm.c
index 393c8f9cf30d..bf74cc55ab44 100644
--- a/drivers/gpio/gpio-gpio-mm.c
+++ b/drivers/gpio/gpio-gpio-mm.c
@@ -230,6 +230,18 @@ static void gpiomm_gpio_set_multiple(struct gpio_chip *chip,
 	}
 }
 
+#define GPIOMM_NGPIO 48
+static const char *gpiomm_names[GPIOMM_NGPIO] = {
+	"Port 1A0", "Port 1A1", "Port 1A2", "Port 1A3", "Port 1A4", "Port 1A5",
+	"Port 1A6", "Port 1A7", "Port 1B0", "Port 1B1", "Port 1B2", "Port 1B3",
+	"Port 1B4", "Port 1B5", "Port 1B6", "Port 1B7", "Port 1C0", "Port 1C1",
+	"Port 1C2", "Port 1C3", "Port 1C4", "Port 1C5", "Port 1C6", "Port 1C7",
+	"Port 2A0", "Port 2A1", "Port 2A2", "Port 2A3", "Port 2A4", "Port 2A5",
+	"Port 2A6", "Port 2A7", "Port 2B0", "Port 2B1", "Port 2B2", "Port 2B3",
+	"Port 2B4", "Port 2B5", "Port 2B6", "Port 2B7", "Port 2C0", "Port 2C1",
+	"Port 2C2", "Port 2C3", "Port 2C4", "Port 2C5", "Port 2C6", "Port 2C7",
+};
+
 static int gpiomm_probe(struct device *dev, unsigned int id)
 {
 	struct gpiomm_gpio *gpiommgpio;
@@ -250,7 +262,8 @@ static int gpiomm_probe(struct device *dev, unsigned int id)
 	gpiommgpio->chip.parent = dev;
 	gpiommgpio->chip.owner = THIS_MODULE;
 	gpiommgpio->chip.base = -1;
-	gpiommgpio->chip.ngpio = 48;
+	gpiommgpio->chip.ngpio = GPIOMM_NGPIO;
+	gpiommgpio->chip.names = gpiomm_names;
 	gpiommgpio->chip.get_direction = gpiomm_gpio_get_direction;
 	gpiommgpio->chip.direction_input = gpiomm_gpio_direction_input;
 	gpiommgpio->chip.direction_output = gpiomm_gpio_direction_output;
-- 
2.11.0

