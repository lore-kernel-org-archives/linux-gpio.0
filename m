From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] gpio: altera: use of_mm_gpiochip_remove() to fix memory leak
Date: Wed, 17 Jun 2015 20:59:42 +0900
Message-ID: <1434542383-21314-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, Tien Hock Loh <thloh@altera.com>
List-Id: linux-gpio@vger.kernel.org

This driver calls of_mm_gpiochip_add() to add a memory mapped gpio
chip.  So, of_mm_gpiochip_remove() should be used when removing it.

The direct call of gpiochip_remove() misses unmapping the register
and freeing the label.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpio-altera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 449fb46..c653c83 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -337,7 +337,7 @@ static int altera_gpio_remove(struct platform_device *pdev)
 {
 	struct altera_gpio_chip *altera_gc = platform_get_drvdata(pdev);
 
-	gpiochip_remove(&altera_gc->mmchip.gc);
+	of_mm_gpiochip_remove(&altera_gc->mmchip);
 
 	return -EIO;
 }
-- 
1.9.1
