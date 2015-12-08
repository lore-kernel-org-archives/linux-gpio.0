From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [PATCH v3 9/9] ARM: config: Enable GPIO Led driver in stm32_defconfig
Date: Tue,  8 Dec 2015 13:45:11 +0100
Message-ID: <1449578711-6141-10-git-send-email-mcoquelin.stm32@gmail.com>
References: <1449578711-6141-1-git-send-email-mcoquelin.stm32@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35101 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932948AbbLHMpa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2015 07:45:30 -0500
In-Reply-To: <1449578711-6141-1-git-send-email-mcoquelin.stm32@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, afaerber@suse.de, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, bruherrera@gmail.com

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
---
 arch/arm/configs/stm32_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index 4725fab..92ade2e 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -52,6 +52,7 @@ CONFIG_SERIAL_STM32_CONSOLE=y
 # CONFIG_USB_SUPPORT is not set
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 # CONFIG_FILE_LOCKING is not set
-- 
1.9.1

