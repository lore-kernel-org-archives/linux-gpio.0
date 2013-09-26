From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] ARM: pxa: delete the custom GPIO header
Date: Thu, 26 Sep 2013 10:11:17 +0200
Message-ID: <1380183077-27407-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ea0-f177.google.com ([209.85.215.177]:52128 "EHLO
	mail-ea0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755574Ab3IZILZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Sep 2013 04:11:25 -0400
Received: by mail-ea0-f177.google.com with SMTP id f15so339280eak.8
        for <linux-gpio@vger.kernel.org>; Thu, 26 Sep 2013 01:11:24 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Haojian Zhuang <haojian.zhuang@marvell.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Eric Miao <eric.y.miao@gmail.com>, Russell King <linux@arm.linux.org.uk>

The PXA sub-architecture appears to have a custom <mach/gpio.h>
for no reason whatsoever. The file became completely empty
after Haojian removed the remaining content in
commit 157d2644cb0c1e71a18baaffca56d2b1d0ebf10f
"ARM: pxa: change gpio to platform device".

That commit added these two lines:

However it seems like deleting the file has no effect
whatsoever on the kernel compilation.

Cc: Haojian Zhuang <haojian.zhuang@marvell.com>
Cc: Eric Miao <eric.y.miao@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Haojian et al, I'm seeking an ACK for this patch so I can take it
through the GPIO tree.
---
 arch/arm/Kconfig                      |  1 -
 arch/arm/mach-pxa/include/mach/gpio.h | 32 --------------------------------
 2 files changed, 33 deletions(-)
 delete mode 100644 arch/arm/mach-pxa/include/mach/gpio.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 3950a12..1ced444 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -621,7 +621,6 @@ config ARCH_PXA
 	select GPIO_PXA
 	select HAVE_IDE
 	select MULTI_IRQ_HANDLER
-	select NEED_MACH_GPIO_H
 	select PLAT_PXA
 	select SPARSE_IRQ
 	help
diff --git a/arch/arm/mach-pxa/include/mach/gpio.h b/arch/arm/mach-pxa/include/mach/gpio.h
deleted file mode 100644
index 0248e43..0000000
--- a/arch/arm/mach-pxa/include/mach/gpio.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/*
- * arch/arm/mach-pxa/include/mach/gpio.h
- *
- * PXA GPIO wrappers for arch-neutral GPIO calls
- *
- * Written by Philipp Zabel <philipp.zabel@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
- *
- */
-
-#ifndef __ASM_ARCH_PXA_GPIO_H
-#define __ASM_ARCH_PXA_GPIO_H
-
-#include <asm-generic/gpio.h>
-
-#include <mach/irqs.h>
-#include <mach/hardware.h>
-
-#endif
-- 
1.8.3.1

