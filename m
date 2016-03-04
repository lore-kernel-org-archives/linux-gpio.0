From: Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH] gpio: xgene: Fix kconfig for standby GIPO contoller
Date: Fri,  4 Mar 2016 11:59:58 +0100
Message-ID: <1457089198-27171-1-git-send-email-mbrugger@suse.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: qnguyen@apm.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>
List-Id: linux-gpio@vger.kernel.org

The standby GPIO controller can be used as a interrupt controller.
Select GPIOLIB_IRQCHIP when compiling this driver. Otherwise we get
a compilation error:

drivers/gpio/gpio-xgene-sb.c: In function 'xgene_gpio_sb_probe':
drivers/gpio/gpio-xgene-sb.c:312:10: error: 'struct gpio_chip' has no member named 'irqdomain'
  priv->gc.irqdomain = priv->irq_domain;
          ^
scripts/Makefile.build:295: recipe for target 'drivers/gpio/gpio-xgene-sb.o' failed
make[2]: *** [drivers/gpio/gpio-xgene-sb.o] Error 1

Fixes: 1013fc41 "gpio: xgene: Enable X-Gene standby GPIO as interrupt controller"
Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 619767b..d9d6cfe 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -452,6 +452,7 @@ config GPIO_XGENE_SB
 	tristate "APM X-Gene GPIO standby controller support"
 	depends on ARCH_XGENE && OF_GPIO
 	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
 	help
 	  This driver supports the GPIO block within the APM X-Gene
 	  Standby Domain. Say yes here to enable the GPIO functionality.
-- 
2.6.2
