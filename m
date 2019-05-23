From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] gpio: fix gpio-adp5588 build errors
Date: Thu, 23 May 2019 15:00:41 -0700
Message-ID: <8054bec0-ea24-8590-738b-bae58c0be3b4@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: kbuild test robot <lkp@intel.com>, Michael Hennerich <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

The gpio-adp5588 driver uses interfaces that are provided by
GPIOLIB_IRQCHIP, so select that symbol in its Kconfig entry.

Fixes these build errors:

../drivers/gpio/gpio-adp5588.c: In function ‘adp5588_irq_handler’:
../drivers/gpio/gpio-adp5588.c:266:26: error: ‘struct gpio_chip’ has no member named ‘irq’
            dev->gpio_chip.irq.domain, gpio));
                          ^
../drivers/gpio/gpio-adp5588.c: In function ‘adp5588_irq_setup’:
../drivers/gpio/gpio-adp5588.c:298:2: error: implicit declaration of function ‘gpiochip_irqchip_add_nested’ [-Werror=implicit-function-declaration]
  ret = gpiochip_irqchip_add_nested(&dev->gpio_chip,
  ^
../drivers/gpio/gpio-adp5588.c:307:2: error: implicit declaration of function ‘gpiochip_set_nested_irqchip’ [-Werror=implicit-function-declaration]
  gpiochip_set_nested_irqchip(&dev->gpio_chip,
  ^

Fixes: 459773ae8dbb ("gpio: adp5588-gpio: support interrupt controller")

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- lnx-52-rc1.orig/drivers/gpio/Kconfig
+++ lnx-52-rc1/drivers/gpio/Kconfig
@@ -822,6 +822,7 @@ config GPIO_ADP5588
 config GPIO_ADP5588_IRQ
 	bool "Interrupt controller support for ADP5588"
 	depends on GPIO_ADP5588=y
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to enable the adp5588 to be used as an interrupt
 	  controller. It requires the driver to be built in the kernel.
