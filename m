From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH v2 2/5] gpio: 104-idi-48: Add support for GPIO names
Date: Mon, 30 Jan 2017 13:33:11 -0500
Message-ID: <eee939f965371621d2803a6292c006d5355c372e.1485800977.git.vilhelm.gray@gmail.com>
References: <cover.1485800977.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f193.google.com ([209.85.213.193]:34101 "EHLO
        mail-yb0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753215AbdA3SdS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 13:33:18 -0500
In-Reply-To: <cover.1485800977.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>

This patch sets the gpio_chip names option with an array of GPIO line
names that match the manual documentation for the ACCES 104-IDI-48.
This should make it easier for users to identify which GPIO line
corresponds to a respective GPIO pin on the device.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-idi-48.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index eafbf053f3e8..db8bf23e47b8 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -217,6 +217,18 @@ static irqreturn_t idi_48_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+#define IDI48_NGPIO 48
+static const char *idi48_names[IDI48_NGPIO] = {
+	"Bit 0 A", "Bit 1 A", "Bit 2 A", "Bit 3 A", "Bit 4 A", "Bit 5 A",
+	"Bit 6 A", "Bit 7 A", "Bit 8 A", "Bit 9 A", "Bit 10 A", "Bit 11 A",
+	"Bit 12 A", "Bit 13 A", "Bit 14 A", "Bit 15 A",	"Bit 16 A", "Bit 17 A",
+	"Bit 18 A", "Bit 19 A", "Bit 20 A", "Bit 21 A", "Bit 22 A", "Bit 23 A",
+	"Bit 0 B", "Bit 1 B", "Bit 2 B", "Bit 3 B", "Bit 4 B", "Bit 5 B",
+	"Bit 6 B", "Bit 7 B", "Bit 8 B", "Bit 9 B", "Bit 10 B", "Bit 11 B",
+	"Bit 12 B", "Bit 13 B", "Bit 14 B", "Bit 15 B",	"Bit 16 B", "Bit 17 B",
+	"Bit 18 B", "Bit 19 B", "Bit 20 B", "Bit 21 B", "Bit 22 B", "Bit 23 B"
+};
+
 static int idi_48_probe(struct device *dev, unsigned int id)
 {
 	struct idi_48_gpio *idi48gpio;
@@ -237,7 +249,8 @@ static int idi_48_probe(struct device *dev, unsigned int id)
 	idi48gpio->chip.parent = dev;
 	idi48gpio->chip.owner = THIS_MODULE;
 	idi48gpio->chip.base = -1;
-	idi48gpio->chip.ngpio = 48;
+	idi48gpio->chip.ngpio = IDI48_NGPIO;
+	idi48gpio->chip.names = idi48_names;
 	idi48gpio->chip.get_direction = idi_48_gpio_get_direction;
 	idi48gpio->chip.direction_input = idi_48_gpio_direction_input;
 	idi48gpio->chip.get = idi_48_gpio_get;
-- 
2.11.0

