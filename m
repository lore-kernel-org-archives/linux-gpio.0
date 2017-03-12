From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 6/6] ARM: gemini: select the right GPIO block
Date: Mon, 13 Mar 2017 00:28:18 +0100
Message-ID: <20170312232818.26304-6-linus.walleij@linaro.org>
References: <20170312232818.26304-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:35827 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933311AbdCLX2p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Mar 2017 19:28:45 -0400
Received: by mail-lf0-f50.google.com with SMTP id j90so57567940lfk.2
        for <linux-gpio@vger.kernel.org>; Sun, 12 Mar 2017 16:28:43 -0700 (PDT)
In-Reply-To: <20170312232818.26304-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, openwrt-devel@openwrt.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

We want to select the GPIO_FTGPIO010 symbol for the generic
Faraday FTGPIO010 driver, not the old driver.

Cc: Jonas Jensen <jonas.jensen@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-gemini/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-gemini/Kconfig b/arch/arm/mach-gemini/Kconfig
index 2dd8bc720089..eaae82637da3 100644
--- a/arch/arm/mach-gemini/Kconfig
+++ b/arch/arm/mach-gemini/Kconfig
@@ -4,7 +4,7 @@ menuconfig ARCH_GEMINI
 	select ARM_APPENDED_DTB # Old Redboot bootloaders deployed
 	select FARADAY_FTINTC010
 	select FTTMR010_TIMER
-	select GPIO_GEMINI
+	select GPIO_FTGPIO010
 	select GPIOLIB
 	select POWER_RESET
 	select POWER_RESET_GEMINI_POWEROFF
-- 
2.9.3

