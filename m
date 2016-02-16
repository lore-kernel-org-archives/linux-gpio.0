From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 2/5] gpio: remove broken irq_to_gpio() interface
Date: Tue, 16 Feb 2016 16:40:35 +0100
Message-ID: <1455637261-2920972-2-git-send-email-arnd@arndb.de>
References: <455637086-2794174-1-git-send-email-arnd@arndb.de>
 <1455637261-2920972-1-git-send-email-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455637261-2920972-1-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
List-Id: linux-gpio@vger.kernel.org

gpiolib has removed the irq_to_gpio() API several years ago,
but the global header still provided a non-working stub.

To prevent new users of this broken function from showing
up, let's remove the stubs as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/gpio.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index d12b5d566e4b..6fc1c9e74854 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -70,11 +70,6 @@ static inline int gpio_to_irq(unsigned int gpio)
 	return __gpio_to_irq(gpio);
 }
 
-static inline int irq_to_gpio(unsigned int irq)
-{
-	return -EINVAL;
-}
-
 #endif /* ! CONFIG_ARCH_HAVE_CUSTOM_GPIO_H */
 
 /* CONFIG_GPIOLIB: bindings for managed devices that want to request gpios */
@@ -222,13 +217,6 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *chip,
 	WARN_ON(1);
 }
 
-static inline int irq_to_gpio(unsigned irq)
-{
-	/* irq can never have been returned from gpio_to_irq() */
-	WARN_ON(1);
-	return -EINVAL;
-}
-
 static inline int
 gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 		       unsigned int gpio_offset, unsigned int pin_offset,
-- 
2.7.0
