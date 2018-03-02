From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] gpio: raspberrypi-exp: explain Kconfig dependency
Date: Fri,  2 Mar 2018 11:47:01 +0200
Message-ID: <3c3b8755d186b1f762081ee18efb718886814e51.1519984021.git.baruch@tkos.co.il>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dave Stevenson <dave.stevenson@raspberrypi.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-gpio@vger.kernel.org

Commit 7ed915059c3001 (gpio: raspberrypi-ext: fix firmware dependency)
fixed the Kconfig dependency to ensure that gpio-raspberrypi-exp is not
built-in when the firmware is a module. But the Kconfig syntax for doing
so is cryptic. Add a comment to make it a little easier.

Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/gpio/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 52a8b0a6f4e1..1bb25c1ff2d8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -126,6 +126,8 @@ config GPIO_RASPBERRYPI_EXP
 	tristate "Raspberry Pi 3 GPIO Expander"
 	default RASPBERRYPI_FIRMWARE
 	depends on OF_GPIO
+	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
+	# happen when COMPILE_TEST=y, hence the added !RASPBERRYPI_FIRMWARE.
 	depends on (ARCH_BCM2835 && RASPBERRYPI_FIRMWARE) || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
 	help
 	  Turn on GPIO support for the expander on Raspberry Pi 3 boards, using
-- 
2.16.1
