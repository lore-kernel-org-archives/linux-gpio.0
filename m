From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/4] ARM: delete old reference to ARM_GPIOLIB_COMPLEX
Date: Wed,  4 Jun 2014 15:33:58 +0200
Message-ID: <1401888838-3126-5-git-send-email-linus.walleij@linaro.org>
References: <1401888838-3126-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:63143 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753479AbaFDNec (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Jun 2014 09:34:32 -0400
Received: by mail-we0-f180.google.com with SMTP id q58so8426933wes.25
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2014 06:34:31 -0700 (PDT)
In-Reply-To: <1401888838-3126-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

This inclusion guard became pointless after commit
40ca061b1bb8827609d39679ddde6705551cb031
"ARM: 7841/1: sa1100: remove complex GPIO interface"
which removed the last complex gpiolib interface.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/gpio.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/include/asm/gpio.h b/arch/arm/include/asm/gpio.h
index 5e1742ea36b7..504dcddebfcc 100644
--- a/arch/arm/include/asm/gpio.h
+++ b/arch/arm/include/asm/gpio.h
@@ -5,7 +5,6 @@
 #define ARCH_NR_GPIOS CONFIG_ARCH_NR_GPIO
 #endif
 
-#ifndef __ARM_GPIOLIB_COMPLEX
 /* Note: this may rely upon the value of ARCH_NR_GPIOS set in mach/gpio.h */
 #include <asm-generic/gpio.h>
 
@@ -13,7 +12,6 @@
 #define gpio_get_value  __gpio_get_value
 #define gpio_set_value  __gpio_set_value
 #define gpio_cansleep   __gpio_cansleep
-#endif
 
 /*
  * Provide a default gpio_to_irq() which should satisfy every case.
-- 
1.9.3

