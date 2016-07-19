From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: Correct header from R-Car Gen3 to R8A7795
Date: Tue, 19 Jul 2016 09:29:34 +0200
Message-ID: <1468913374-32065-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

This source file handles r8a7795 only, which is not the sole member of
the R-Car Gen3 family.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued up in sh-pfc-for-v4.9.

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 0f1a111447c30732..1b35ad9b538de544 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1,5 +1,5 @@
 /*
- * R-Car Gen3 processor support - PFC hardware block.
+ * R8A7795 processor support - PFC hardware block.
  *
  * Copyright (C) 2015  Renesas Electronics Corporation
  *
-- 
1.9.1
