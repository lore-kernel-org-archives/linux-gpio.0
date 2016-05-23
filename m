From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: of: add missing of_node_put() to of_gpiochip_add_pin_range()
Date: Mon, 23 May 2016 10:52:09 +0900
Message-ID: <1463968329-9530-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

As the comment block of of_parse_phandle_with_fixed_args() says,
the caller is responsible to call of_node_put() on the returned
node when done.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpiolib-of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index d22dcc3..d8c36c1 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -409,6 +409,7 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 			break;
 
 		pctldev = of_pinctrl_get(pinspec.np);
+		of_node_put(pinspec.np);
 		if (!pctldev)
 			return -EPROBE_DEFER;
 
-- 
1.9.1
