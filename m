From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] pinctrl: sh-pfc: fix warnings by include core.h
Date: Tue,  7 Jun 2016 18:33:06 +0100
Message-ID: <1465320786-10333-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 82-70-136-246.dsl.in-addr.zen.co.uk ([82.70.136.246]:36890 "EHLO
	rainbowdash.ducie.codethink.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755428AbcFGRdN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jun 2016 13:33:13 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@lists.codethink.co.uk
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Linus Walleij <linus.walleij@linaro.org>, Alessandro Rubini <rubini@unipv.it>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

Fix warnings about emev2_pinmux_info and r8a7779_pinmux_info
by using core.h instead of sh_pfc.h in these files. This gives
the declarations of the two structures and removes the following
warnings:

drivers/pinctrl/sh-pfc/pfc-emev2.c:1695:30: warning: symbol 'emev2_pinmux_info' was not declared. Should it be static?
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:3888:30: warning: symbol 'r8a7779_pinmux_info' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alessandro Rubini <rubini@unipv.it>
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/sh-pfc/pfc-emev2.c   | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-emev2.c b/drivers/pinctrl/sh-pfc/pfc-emev2.c
index 1cbbe04..f943854 100644
--- a/drivers/pinctrl/sh-pfc/pfc-emev2.c
+++ b/drivers/pinctrl/sh-pfc/pfc-emev2.c
@@ -10,7 +10,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 
-#include "sh_pfc.h"
+#include "core.h"
 
 #define CPU_ALL_PORT(fn, pfx, sfx)					\
 	PORT_10(0,  fn, pfx, sfx),	PORT_90(0,  fn, pfx, sfx),	\
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7779.c b/drivers/pinctrl/sh-pfc/pfc-r8a7779.c
index 5bef934..098d01e 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7779.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7779.c
@@ -21,7 +21,7 @@
 
 #include <linux/kernel.h>
 
-#include "sh_pfc.h"
+#include "core.h"
 
 #define CPU_ALL_PORT(fn, sfx)						\
 	PORT_GP_32(0, fn, sfx),						\
-- 
2.8.1

