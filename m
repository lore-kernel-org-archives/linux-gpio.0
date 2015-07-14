From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/4] pinctrl: sh-pfc: r8a7740: Remove obsolete multi-platform check
Date: Tue, 14 Jul 2015 13:56:54 +0200
Message-ID: <1436875015-13706-4-git-send-email-geert+renesas@glider.be>
References: <1436875015-13706-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:39312 "EHLO
	laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752042AbbGNL47 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 07:56:59 -0400
In-Reply-To: <1436875015-13706-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Since the removal of the r8a7740 legacy SoC code in commit
44d88c754e57a6d9 ("ARM: shmobile: Remove legacy SoC code for R-Mobile
A1"), r8a7740 is only supported in generic ARM multi-platform builds.
Hence CONFIG_ARCH_MULTIPLATFORM is always set, and the check can be
removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
The commit mentioned above is in -next, destined for v4.3. Please apply.

v2:
  - Add Acked-by.
---
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7740.c b/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
index d0bb1459783a16d2..82ef1862dd1ba808 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
@@ -22,10 +22,6 @@
 #include <linux/kernel.h>
 #include <linux/pinctrl/pinconf-generic.h>
 
-#ifndef CONFIG_ARCH_MULTIPLATFORM
-#include <mach/irqs.h>
-#endif
-
 #include "core.h"
 #include "sh_pfc.h"
 
-- 
1.9.1

