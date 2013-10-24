From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: sa1100: fix simpad compilation warning
Date: Thu, 24 Oct 2013 17:04:34 +0200
Message-ID: <1382627074-23228-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:45577 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754131Ab3JXPEr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2013 11:04:47 -0400
Received: by mail-wi0-f178.google.com with SMTP id hn9so2697205wib.11
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2013 08:04:46 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Kevin Hilman <khilman@linaro.org>

When removing the complex GPIO interface from the SA1100 machines,
we also removed the implicit #includes for a few header files
that was included by <linux/gpio.h> thru <mach/gpio.h>, causing
a compile warning on the simpad boardfile, as <asm/irq.h> was no
longer #included, as follows:

./../arch/arm/include/asm/irq.h:9:0: warning: "NR_IRQS" redefined
[enabled by default]
 #define NR_IRQS NR_IRQS_LEGACY
 ^
In file included from ../../arch/arm/mach-sa1100/simpad.c:29:0:
../../arch/arm/mach-sa1100/include/mach/irqs.h:87:0: note: this is the
location of the previous definition
 #define NR_IRQS (IRQ_BOARD_START + NR_IRQS_LOCOMO)

This resolves the problem by explicitly including <asm/irq.h>
into the simpad boardfile.

Reported-by: Olof Johansson <olof@lixom.net>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Cc: Kevin Hilman <khilman@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-sa1100/simpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-sa1100/simpad.c b/arch/arm/mach-sa1100/simpad.c
index bcbc94540e45..41e476e571d7 100644
--- a/arch/arm/mach-sa1100/simpad.c
+++ b/arch/arm/mach-sa1100/simpad.c
@@ -19,6 +19,7 @@
 
 #include <mach/hardware.h>
 #include <asm/setup.h>
+#include <asm/irq.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
-- 
1.8.3.1

