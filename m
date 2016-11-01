From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 10/14] pinctrl-sx150x: Improve oscio GPIO functions
Date: Tue,  1 Nov 2016 08:57:44 -0700
Message-ID: <1478015868-10309-11-git-send-email-andrew.smirnov@gmail.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Move actual code that configures oscio pin into a separate function and
use it instead of calling sx150x_gpio_set to avoid calling
sx150x_pin_is_oscio twice and correctly propagte error code in
sx150x_gpio_direction_output.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 8d0fd4b..d2e2b13 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -371,15 +371,21 @@ static int __sx150x_gpio_set(struct sx150x_pinctrl *pctl, unsigned int offset,
 				 BIT(offset), value ? BIT(offset) : 0);
 }
 
+static int sx150x_gpio_oscio_set(struct sx150x_pinctrl *pctl,
+				 int value)
+{
+	return regmap_write(pctl->regmap,
+			    pctl->data->pri.x789.reg_clock,
+			    (value ? 0x1f : 0x10));
+}
+
 static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			       int value)
 {
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
 
 	if (sx150x_pin_is_oscio(pctl, offset))
-		regmap_write(pctl->regmap,
-			     pctl->data->pri.x789.reg_clock,
-			     (value ? 0x1f : 0x10));
+		sx150x_gpio_oscio_set(pctl, value);
 	else
 		__sx150x_gpio_set(pctl, offset, value);
 
@@ -404,10 +410,8 @@ static int sx150x_gpio_direction_output(struct gpio_chip *chip,
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
 	int ret;
 
-	if (sx150x_pin_is_oscio(pctl, offset)) {
-		sx150x_gpio_set(chip, offset, value);
-		return 0;
-	}
+	if (sx150x_pin_is_oscio(pctl, offset))
+		return sx150x_gpio_oscio_set(pctl, value);
 
 	ret = __sx150x_gpio_set(pctl, offset, value);
 	if (ret < 0)
-- 
2.5.5
