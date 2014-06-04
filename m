From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/4] ARM: kill CONFIG_NEED_MACH_GPIO_H
Date: Wed,  4 Jun 2014 15:33:57 +0200
Message-ID: <1401888838-3126-4-git-send-email-linus.walleij@linaro.org>
References: <1401888838-3126-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:36958 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752977AbaFDNea (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Jun 2014 09:34:30 -0400
Received: by mail-wg0-f44.google.com with SMTP id a1so8335151wgh.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2014 06:34:28 -0700 (PDT)
In-Reply-To: <1401888838-3126-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

The long pain of maintaining the legacy <mach/gpio.h> include
ladder is now gone with S5P as the last user being deleted. Cut
this Kconfig option and remove the inclusion directive in
<asm/gpio.h> for good.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/Kconfig            | 7 -------
 arch/arm/include/asm/gpio.h | 5 -----
 2 files changed, 12 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 72f74f67bf72..625919888fc9 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -247,13 +247,6 @@ config ARM_PATCH_PHYS_VIRT
 	  this feature (eg, building a kernel for a single machine) and
 	  you need to shrink the kernel to the minimal size.
 
-config NEED_MACH_GPIO_H
-	bool
-	help
-	  Select this when mach/gpio.h is required to provide special
-	  definitions for this platform. The need for mach/gpio.h should
-	  be avoided when possible.
-
 config NEED_MACH_IO_H
 	bool
 	help
diff --git a/arch/arm/include/asm/gpio.h b/arch/arm/include/asm/gpio.h
index 477e0206e016..5e1742ea36b7 100644
--- a/arch/arm/include/asm/gpio.h
+++ b/arch/arm/include/asm/gpio.h
@@ -5,11 +5,6 @@
 #define ARCH_NR_GPIOS CONFIG_ARCH_NR_GPIO
 #endif
 
-/* not all ARM platforms necessarily support this API ... */
-#ifdef CONFIG_NEED_MACH_GPIO_H
-#include <mach/gpio.h>
-#endif
-
 #ifndef __ARM_GPIOLIB_COMPLEX
 /* Note: this may rely upon the value of ARCH_NR_GPIOS set in mach/gpio.h */
 #include <asm-generic/gpio.h>
-- 
1.9.3

