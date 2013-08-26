From: Chen Gang <gang.chen@asianux.com>
Subject: [PATCH] include/asm-generic/gpio.h: remove the call for __gpio_get_value()
 and __gpio_set_value() when GPIOLIB disabled
Date: Mon, 26 Aug 2013 18:08:23 +0800
Message-ID: <521B2917.6040908@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
Sender: linux-arch-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

When GPIOLIB disabled, __gpio_get_value() and __gpio_set_value() will
not implement, so need remove them, or compiling fails.

e.g. (allmodconfig for h8300)

    CC      arch/h8300/kernel/h8300_ksyms.o
  In file included from arch/h8300/include/generated/asm/gpio.h:1:0,
                   from arch/h8300/kernel/h8300_ksyms.c:17:
  include/asm-generic/gpio.h: In function 'gpio_get_value_cansleep':
  include/asm-generic/gpio.h:270:2: error: implicit declaration of function '__gpio_get_value' [-Werror=implicit-function-declaration]
    return __gpio_get_value(gpio);
    ^

For __gpio_get_value(), according to its implementation, it is enough
to use "return 0" instead of, and for __gpio_set_value(), just remove
directly.


Signed-off-by: Chen Gang <gang.chen@asianux.com>
---
 include/asm-generic/gpio.h |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index bde6469..10a2853 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -267,13 +267,12 @@ static inline int gpio_cansleep(unsigned gpio)
 static inline int gpio_get_value_cansleep(unsigned gpio)
 {
 	might_sleep();
-	return __gpio_get_value(gpio);
+	return 0;
 }
 
 static inline void gpio_set_value_cansleep(unsigned gpio, int value)
 {
 	might_sleep();
-	__gpio_set_value(gpio, value);
 }
 
 #endif /* !CONFIG_GPIOLIB */
-- 
1.7.7.6
