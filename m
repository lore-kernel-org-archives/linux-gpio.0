From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/3] x86: apuv2: fix input dependencies
Date: Mon,  4 Mar 2019 21:19:20 +0100
Message-ID: <20190304201930.1622839-2-arnd@arndb.de>
References: <20190304201930.1622839-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304201930.1622839-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Linus Walleij <linusw@kernel.org>, Enrico Weigelt <info@metux.net>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

We cannot select KEYBOARD_GPIO_POLLED if CONFIG_INPUT or CONFIG_INPUT_KEYBOARD
are disabled:

WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
  Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=n] && GPIOLIB [=y]
  Selected by [y]:
  - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y]

This could be fixed using either a dependency or a 'select' statement.
I'm chosen 'depends on' here since it is simpler has a lower risk of
introducing circular dependencies.

Fixes: f8eb0235f659 ("x86: pcengines apuv2 gpio/leds/keys platform driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 851ea921a58d..4d65d37b0c86 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1305,6 +1305,7 @@ config HUAWEI_WMI
 
 config PCENGINES_APU2
 	tristate "PC Engines APUv2/3 front button and LEDs driver"
+	depends on INPUT && INPUT_KEYBOARD
 	select GPIO_AMD_FCH
 	select KEYBOARD_GPIO_POLLED
 	select LEDS_GPIO
-- 
2.20.0
