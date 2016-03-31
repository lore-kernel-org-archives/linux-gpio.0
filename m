From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] powerpc: ppc4xx: drop unused variable
Date: Thu, 31 Mar 2016 09:14:12 +0200
Message-ID: <1459408452-3483-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:35127 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751459AbcCaHOT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 03:14:19 -0400
Received: by mail-lb0-f169.google.com with SMTP id bc4so46602710lbc.2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 00:14:18 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org

commit 0d36fe65f58391712e11a6621075f373216e5f00
"powerpc: ppc4xx: use gpiochip data pointer"
made the mm_gc local variable in ppc4xx_gpio_set()
redundant, and when GCC treats warnings as errors this
happens:

arch/powerpc/sysdev/ppc4xx_gpio.c: In function 'ppc4xx_gpio_set':
arch/powerpc/sysdev/ppc4xx_gpio.c:93:26: error:
  unused variable 'mm_gc' [-Werror=unused-variable]
     struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
                             ^
   cc1: all warnings being treated as errors

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Cc: Anatolij Gustschin <agust@denx.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
I've applied this to the GPIO tree where the offending
commit is now merged.
---
 arch/powerpc/sysdev/ppc4xx_gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/sysdev/ppc4xx_gpio.c b/arch/powerpc/sysdev/ppc4xx_gpio.c
index 4ab83cd04785..5382d04dd872 100644
--- a/arch/powerpc/sysdev/ppc4xx_gpio.c
+++ b/arch/powerpc/sysdev/ppc4xx_gpio.c
@@ -90,7 +90,6 @@ __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 static void
 ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
-- 
2.4.3

