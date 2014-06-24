From: =?UTF-8?q?J=C3=BCrg=20Billeter?= <j@bitron.ch>
Subject: [PATCH] gpio: rcar: clamp returned value to [0,1]
Date: Tue, 24 Jun 2014 04:19:50 +0200
Message-ID: <1403576390-28381-1-git-send-email-j@bitron.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Magnus Damm <damm@opensource.se>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?J=C3=BCrg=20Billeter?= <j@bitron.ch>
List-Id: linux-gpio@vger.kernel.org

While it will be clamped to bool by gpiolib, let's make this sane
in the driver as well.

Signed-off-by: J=C3=BCrg Billeter <j@bitron.ch>
---
 drivers/gpio/gpio-rcar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 0c9f803..7c62121 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -240,9 +240,9 @@ static int gpio_rcar_get(struct gpio_chip *chip, un=
signed offset)
 	/* testing on r8a7790 shows that INDT does not show correct pin state
 	 * when configured as output, so use OUTDT in case of output pins */
 	if (gpio_rcar_read(gpio_to_priv(chip), INOUTSEL) & bit)
-		return (int)(gpio_rcar_read(gpio_to_priv(chip), OUTDT) & bit);
+		return !!(gpio_rcar_read(gpio_to_priv(chip), OUTDT) & bit);
 	else
-		return (int)(gpio_rcar_read(gpio_to_priv(chip), INDT) & bit);
+		return !!(gpio_rcar_read(gpio_to_priv(chip), INDT) & bit);
 }
=20
 static void gpio_rcar_set(struct gpio_chip *chip, unsigned offset, int=
 value)
--=20
2.0.0
