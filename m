From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/4] pinctrl: sh-pfc: sh73a0: Remove obsolete multi-platform check
Date: Tue, 14 Jul 2015 13:56:52 +0200
Message-ID: <1436875015-13706-2-git-send-email-geert+renesas@glider.be>
References: <1436875015-13706-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:35439 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752046AbbGNL47 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 07:56:59 -0400
In-Reply-To: <1436875015-13706-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Since the removal of the sh73a0 legacy SoC code in commit
9a9863987bf7307f ("ARM: shmobile: Remove legacy SoC code for SH-Mobile
AG5"), sh73a0 is only supported in generic ARM multi-platform builds.
Hence CONFIG_ARCH_MULTIPLATFORM is always set, and the check can be
removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
The commit mentioned above is in -next, destined for v4.3.

v2:
  - Add Acked-by.
---
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-sh73a0.c b/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
index d2efbfb776ac57d6..097526576f88181f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
@@ -26,10 +26,6 @@
 #include <linux/regulator/machine.h>
 #include <linux/slab.h>
 
-#ifndef CONFIG_ARCH_MULTIPLATFORM
-#include <mach/irqs.h>
-#endif
-
 #include "core.h"
 #include "sh_pfc.h"
 
-- 
1.9.1

