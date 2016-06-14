From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/5] gpio: of: move chip->of_gpio_n_cells checking to of_gpiochip_add()
Date: Tue, 14 Jun 2016 19:07:05 +0900
Message-ID: <1465898827-2229-4-git-send-email-yamada.masahiro@socionext.com>
References: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Do this sanity check only once when the gpio_chip is added
rather than every time gpio-hog is handled.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpiolib-of.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 27b1729..a5a5bc7 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -156,7 +156,7 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (tmp > MAX_PHANDLE_ARGS || tmp != chip->of_gpio_n_cells)
+	if (tmp != chip->of_gpio_n_cells)
 		return ERR_PTR(-EINVAL);
 
 	gpiospec.np = chip_np;
@@ -487,6 +487,9 @@ int of_gpiochip_add(struct gpio_chip *chip)
 		chip->of_xlate = of_gpio_simple_xlate;
 	}
 
+	if (chip->of_gpio_n_cells > MAX_PHANDLE_ARGS)
+		return -EINVAL;
+
 	status = of_gpiochip_add_pin_range(chip);
 	if (status)
 		return status;
-- 
1.9.1
