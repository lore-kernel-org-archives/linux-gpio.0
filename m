From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: replace __maybe_unused in gpiolib.h with static inline
Date: Tue, 11 Jul 2017 23:41:43 +0900
Message-ID: <1499784103-1538-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

In header files, static inline is more commonly used.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpiolib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index a8be286eff86..d003ccb12781 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -219,7 +219,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 /*
  * Return the GPIO number of the passed descriptor relative to its chip
  */
-static int __maybe_unused gpio_chip_hwgpio(const struct gpio_desc *desc)
+static inline int gpio_chip_hwgpio(const struct gpio_desc *desc)
 {
 	return desc - &desc->gdev->descs[0];
 }
-- 
2.7.4
