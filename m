From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/5] ARM: gemini: select pin controller
Date: Sat, 15 Jul 2017 19:50:55 +0200
Message-ID: <20170715175056.13040-4-linus.walleij@linaro.org>
References: <20170715175056.13040-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33843 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751105AbdGORv3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jul 2017 13:51:29 -0400
Received: by mail-lf0-f48.google.com with SMTP id t72so67905220lff.1
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jul 2017 10:51:28 -0700 (PDT)
In-Reply-To: <20170715175056.13040-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>

The Gemini needs its pin controller for the platform to work properly.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-gemini/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-gemini/Kconfig b/arch/arm/mach-gemini/Kconfig
index 42399af1ab60..70106b67631c 100644
--- a/arch/arm/mach-gemini/Kconfig
+++ b/arch/arm/mach-gemini/Kconfig
@@ -9,6 +9,8 @@ menuconfig ARCH_GEMINI
 	select FTTMR010_TIMER
 	select GPIO_FTGPIO010
 	select GPIOLIB
+	select PINCTRL
+	select PINCTRL_GEMINI
 	select POWER_RESET
 	select POWER_RESET_GEMINI_POWEROFF
 	select POWER_RESET_SYSCON
-- 
2.9.4

