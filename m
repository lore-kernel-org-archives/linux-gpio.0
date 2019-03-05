From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH] drivers: x86: pcengines-apuv2: fix dependencies
Date: Tue,  5 Mar 2019 01:24:59 +0100
Message-ID: <1551745499-6687-1-git-send-email-info@metux.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, andy.shevchenko@gmail.com, arnd@arndb.de, rdunlap@infradead.org
List-Id: linux-gpio@vger.kernel.org

pcengines-apuv2 board driver needs to explicitly select LEDS_CLASS,
INPUT, INPUT_KEYBOARD, so these are automatically defined correctly
(eg. LEDS_CLASS=y if PCENGINES_APU2=y)

Cc: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org
Cc: andy.shevchenko@gmail.com
Cc: arnd@arndb.de
Cc: rdunlap@infradead.org
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: arnd@arndb.de
Reported-by: rdunlap@infradead.org
Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/platform/x86/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 851ea92..7d53380 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1307,7 +1307,10 @@ config PCENGINES_APU2
 	tristate "PC Engines APUv2/3 front button and LEDs driver"
 	select GPIO_AMD_FCH
 	select KEYBOARD_GPIO_POLLED
+	select LEDS_CLASS
 	select LEDS_GPIO
+	select INPUT
+	select INPUT_KEYBOARD
 	help
 	  This driver provides support for the front button and LEDs on
 	  PC Engines APUv2/APUv3 board.
-- 
1.9.1
