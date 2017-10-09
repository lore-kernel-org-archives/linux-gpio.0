From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a7795: fix trivial typo in comment
Date: Mon,  9 Oct 2017 10:35:15 +0200
Message-ID: <20171009083516.6220-1-wsa+renesas@sang-engineering.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa@the-dreams.de>
List-Id: linux-gpio@vger.kernel.org

From: Wolfram Sang <wsa@the-dreams.de>

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 8fc5d659e2dc01..8ca59b35595068 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1508,7 +1508,7 @@ static const u16 pinmux_data[] = {
 };
 
 /*
- * R8A7795 has 8 banks with 32 PGIOS in each => 256 GPIOs.
+ * R8A7795 has 8 banks with 32 GPIOs IN EACH => 256 GPIOs.
  * Physical layout rows: A - AW, cols: 1 - 39.
  */
 #define ROW_GROUP_A(r) ('Z' - 'A' + 1 + (r))
-- 
2.11.0
