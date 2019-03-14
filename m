From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/2] gpio: mockup: drop unneeded dependencies from Kconfig
Date: Thu, 14 Mar 2019 16:07:49 +0100
Message-ID: <20190314150750.9371-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The testing module doesn't need GPIO irqchip nor does it depend on
sysfs. Remove unnecessary dependencies from Kconfig.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3f50526a771f..e9473e968d9a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -332,9 +332,7 @@ config GPIO_MM_LANTIQ
 
 config GPIO_MOCKUP
 	tristate "GPIO Testing Driver"
-	depends on GPIOLIB && SYSFS
-	select GPIO_SYSFS
-	select GPIOLIB_IRQCHIP
+	depends on GPIOLIB
 	select IRQ_SIM
 	help
 	  This enables GPIO Testing driver, which provides a way to test GPIO
-- 
2.20.1
