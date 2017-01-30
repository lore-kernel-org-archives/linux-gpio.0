From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 5/5] gpio: ws16c48: Add support for GPIO names
Date: Mon, 30 Jan 2017 12:05:55 -0500
Message-ID: <edb689aac0bd4bb2b119dc8216da7cfb6af5243b.1485795642.git.vilhelm.gray@gmail.com>
References: <cover.1485795642.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f193.google.com ([209.85.213.193]:34604 "EHLO
        mail-yb0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751571AbdA3ROx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 12:14:53 -0500
In-Reply-To: <cover.1485795642.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>

This patch sets the gpio_chip names option with an array of GPIO line
names that match the manual documentation for the WinSystems WS16C48.
This should make it easier for users to identify which GPIO line
corresponds to a respective GPIO pin on the device.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-ws16c48.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index 65de20dfbe7a..a49377cf36fd 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -341,6 +341,22 @@ static irqreturn_t ws16c48_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+#define WS16C48_NGPIO 48
+static const char *ws14c48_names[WS16C48_NGPIO] = {
+	"Port 0 Bit 0", "Port 0 Bit 1", "Port 0 Bit 2", "Port 0 Bit 3",
+	"Port 0 Bit 4", "Port 0 Bit 5", "Port 0 Bit 6", "Port 0 Bit 7",
+	"Port 1 Bit 0", "Port 1 Bit 1", "Port 1 Bit 2", "Port 1 Bit 3",
+	"Port 1 Bit 4", "Port 1 Bit 5", "Port 1 Bit 6", "Port 1 Bit 7",
+	"Port 2 Bit 0", "Port 2 Bit 1", "Port 2 Bit 2", "Port 2 Bit 3",
+	"Port 2 Bit 4", "Port 2 Bit 5", "Port 2 Bit 6", "Port 2 Bit 7",
+	"Port 3 Bit 0", "Port 3 Bit 1", "Port 3 Bit 2", "Port 3 Bit 3",
+	"Port 3 Bit 4", "Port 3 Bit 5", "Port 3 Bit 6", "Port 3 Bit 7",
+	"Port 4 Bit 0", "Port 4 Bit 1", "Port 4 Bit 2", "Port 4 Bit 3",
+	"Port 4 Bit 4", "Port 4 Bit 5", "Port 4 Bit 6", "Port 4 Bit 7",
+	"Port 5 Bit 0", "Port 5 Bit 1", "Port 5 Bit 2", "Port 5 Bit 3",
+	"Port 5 Bit 4", "Port 5 Bit 5", "Port 5 Bit 6", "Port 5 Bit 7"
+};
+
 static int ws16c48_probe(struct device *dev, unsigned int id)
 {
 	struct ws16c48_gpio *ws16c48gpio;
@@ -361,7 +377,8 @@ static int ws16c48_probe(struct device *dev, unsigned int id)
 	ws16c48gpio->chip.parent = dev;
 	ws16c48gpio->chip.owner = THIS_MODULE;
 	ws16c48gpio->chip.base = -1;
-	ws16c48gpio->chip.ngpio = 48;
+	ws16c48gpio->chip.ngpio = WS16C48_NGPIO;
+	ws16c48gpio->chip.names = ws16c48_names;
 	ws16c48gpio->chip.get_direction = ws16c48_gpio_get_direction;
 	ws16c48gpio->chip.direction_input = ws16c48_gpio_direction_input;
 	ws16c48gpio->chip.direction_output = ws16c48_gpio_direction_output;
-- 
2.11.0

