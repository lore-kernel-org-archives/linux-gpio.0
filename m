From: Axel Lin <axel.lin@ingics.com>
Subject: [RFT][PATCH] gpio: sama5d2-piobu: Set proper output level for
 direction_output
Date: Mon, 31 Dec 2018 17:52:56 +0800
Message-ID: <20181231095256.14814-1-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Axel Lin <axel.lin@ingics.com>, Andrei Stefanescu <andrei.stefanescu@microchip.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Set proper output level base on the argument of direction_output.
Also remove sama5d2_piobu_set_direction() as there is only one caller
now.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi Andrei,
I don't have this h/w, so please test if this patch works.

BTW, I think this change is better than just adding 
sama5d2_piobu_set(chip, pin, value); call in sama5d2_piobu_direction_output
becasue only write register once for setting direction_output.

Thanks,
Axel

 drivers/gpio/gpio-sama5d2-piobu.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-piobu.c
index 03a000659fa1..7d718557092e 100644
--- a/drivers/gpio/gpio-sama5d2-piobu.c
+++ b/drivers/gpio/gpio-sama5d2-piobu.c
@@ -108,16 +108,6 @@ static int sama5d2_piobu_read_value(struct gpio_chip *chip, unsigned int pin,
 	return val & mask;
 }
 
-/**
- * sama5d2_piobu_set_direction() - mark pin as input or output
- */
-static int sama5d2_piobu_set_direction(struct gpio_chip *chip,
-				       unsigned int direction,
-				       unsigned int pin)
-{
-	return sama5d2_piobu_write_value(chip, pin, PIOBU_DIRECTION, direction);
-}
-
 /**
  * sama5d2_piobu_get_direction() - gpiochip get_direction
  */
@@ -138,7 +128,7 @@ static int sama5d2_piobu_get_direction(struct gpio_chip *chip,
 static int sama5d2_piobu_direction_input(struct gpio_chip *chip,
 					 unsigned int pin)
 {
-	return sama5d2_piobu_set_direction(chip, PIOBU_IN, pin);
+	return sama5d2_piobu_write_value(chip, pin, PIOBU_DIRECTION, PIOBU_IN);
 }
 
 /**
@@ -147,7 +137,13 @@ static int sama5d2_piobu_direction_input(struct gpio_chip *chip,
 static int sama5d2_piobu_direction_output(struct gpio_chip *chip,
 					  unsigned int pin, int value)
 {
-	return sama5d2_piobu_set_direction(chip, PIOBU_OUT, pin);
+	unsigned int val = PIOBU_OUT;
+
+	if (value)
+		val |= PIOBU_HIGH;
+
+	return sama5d2_piobu_write_value(chip, pin, PIOBU_DIRECTION | PIOBU_SOD,
+					 val);
 }
 
 /**
-- 
2.17.1
