From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH v2 3/5] gpio: 104-idio-16: Add support for GPIO names
Date: Mon, 30 Jan 2017 13:33:21 -0500
Message-ID: <5ab304050d7a9b849bd2585df8718f6d16aa6096.1485800977.git.vilhelm.gray@gmail.com>
References: <cover.1485800977.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1485800977.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>
List-Id: linux-gpio@vger.kernel.org

This patch sets the gpio_chip names option with an array of GPIO line
names that match the manual documentation for the ACCES 104-IDIO-16.
This should make it easier for users to identify which GPIO line
corresponds to a respective GPIO pin on the device.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-idio-16.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 01a091e17614..96e740551976 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -210,6 +210,14 @@ static irqreturn_t idio_16_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+#define IDIO_16_NGPIO 32
+static const char *idio_16_names[IDIO_16_NGPIO] = {
+	"OUT0", "OUT1", "OUT2", "OUT3", "OUT4", "OUT5", "OUT6", "OUT7",
+	"OUT8", "OUT9", "OUT10", "OUT11", "OUT12", "OUT13", "OUT14", "OUT15",
+	"IIN0", "IIN1", "IIN2", "IIN3", "IIN4", "IIN5", "IIN6", "IIN7",
+	"IIN8", "IIN9", "IIN10", "IIN11", "IIN12", "IIN13", "IIN14", "IIN15"
+};
+
 static int idio_16_probe(struct device *dev, unsigned int id)
 {
 	struct idio_16_gpio *idio16gpio;
@@ -230,7 +238,8 @@ static int idio_16_probe(struct device *dev, unsigned int id)
 	idio16gpio->chip.parent = dev;
 	idio16gpio->chip.owner = THIS_MODULE;
 	idio16gpio->chip.base = -1;
-	idio16gpio->chip.ngpio = 32;
+	idio16gpio->chip.ngpio = IDIO_16_NGPIO;
+	idio16gpio->chip.names = idio_16_names;
 	idio16gpio->chip.get_direction = idio_16_gpio_get_direction;
 	idio16gpio->chip.direction_input = idio_16_gpio_direction_input;
 	idio16gpio->chip.direction_output = idio_16_gpio_direction_output;
-- 
2.11.0
