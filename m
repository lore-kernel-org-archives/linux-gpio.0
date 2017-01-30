From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH v2 1/5] gpio: 104-dio-48e: Add support for GPIO names
Date: Mon, 30 Jan 2017 13:32:58 -0500
Message-ID: <b375422dc97206145d69f2773799bb090c6ede71.1485800977.git.vilhelm.gray@gmail.com>
References: <cover.1485800977.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f194.google.com ([209.85.213.194]:35198 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753918AbdA3SdI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 13:33:08 -0500
In-Reply-To: <cover.1485800977.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>

This patch sets the gpio_chip names option with an array of GPIO line
names that match the manual documentation for the ACCES 104-DIO-48E.
This should make it easier for users to identify which GPIO line
corresponds to a respective GPIO pin on the device.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-dio-48e.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 221243f17d4e..84e529b4f5d8 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -338,6 +338,26 @@ static irqreturn_t dio48e_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+#define DIO48E_NGPIO 48
+static const char *dio48e_names[DIO48E_NGPIO] = {
+	"PPI Group 0 Port A 0", "PPI Group 0 Port A 1", "PPI Group 0 Port A 2",
+	"PPI Group 0 Port A 3", "PPI Group 0 Port A 4", "PPI Group 0 Port A 5",
+	"PPI Group 0 Port A 6", "PPI Group 0 Port A 7",	"PPI Group 0 Port B 0",
+	"PPI Group 0 Port B 1", "PPI Group 0 Port B 2", "PPI Group 0 Port B 3",
+	"PPI Group 0 Port B 4", "PPI Group 0 Port B 5", "PPI Group 0 Port B 6",
+	"PPI Group 0 Port B 7", "PPI Group 0 Port C 0", "PPI Group 0 Port C 1",
+	"PPI Group 0 Port C 2", "PPI Group 0 Port C 3", "PPI Group 0 Port C 4",
+	"PPI Group 0 Port C 5", "PPI Group 0 Port C 6", "PPI Group 0 Port C 7",
+	"PPI Group 1 Port A 0", "PPI Group 1 Port A 1", "PPI Group 1 Port A 2",
+	"PPI Group 1 Port A 3", "PPI Group 1 Port A 4", "PPI Group 1 Port A 5",
+	"PPI Group 1 Port A 6", "PPI Group 1 Port A 7",	"PPI Group 1 Port B 0",
+	"PPI Group 1 Port B 1", "PPI Group 1 Port B 2", "PPI Group 1 Port B 3",
+	"PPI Group 1 Port B 4", "PPI Group 1 Port B 5", "PPI Group 1 Port B 6",
+	"PPI Group 1 Port B 7", "PPI Group 1 Port C 0", "PPI Group 1 Port C 1",
+	"PPI Group 1 Port C 2", "PPI Group 1 Port C 3", "PPI Group 1 Port C 4",
+	"PPI Group 1 Port C 5", "PPI Group 1 Port C 6", "PPI Group 1 Port C 7"
+};
+
 static int dio48e_probe(struct device *dev, unsigned int id)
 {
 	struct dio48e_gpio *dio48egpio;
@@ -358,7 +378,8 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 	dio48egpio->chip.parent = dev;
 	dio48egpio->chip.owner = THIS_MODULE;
 	dio48egpio->chip.base = -1;
-	dio48egpio->chip.ngpio = 48;
+	dio48egpio->chip.ngpio = DIO48E_NGPIO;
+	dio48egpio->chip.names = dio48e_names;
 	dio48egpio->chip.get_direction = dio48e_gpio_get_direction;
 	dio48egpio->chip.direction_input = dio48e_gpio_direction_input;
 	dio48egpio->chip.direction_output = dio48e_gpio_direction_output;
-- 
2.11.0

