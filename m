From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a7796: Fix GPSR definitions for SDHI2/3
Date: Mon, 24 Oct 2016 10:22:41 +0200
Message-ID: <1477297361-28197-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Fix off-by-one (row and/or register) errors in links to Peripheral
Function Select Register bitfields from GPIO/Peripheral Function Select
Register 4 macros for SDHI2 and SDHI3 pins.

Based on rev. 0.52E of the R-Car Gen3 User's Manual.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested. Thanks for testing!

 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index dd23198492b547e3..57ddd394f8c5e7b8 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -122,22 +122,22 @@
 #define GPSR3_0		F_(SD0_CLK,		IP7_19_16)
 
 /* GPSR4 */
-#define GPSR4_17	F_(SD3_DS,		IP11_11_8)
-#define GPSR4_16	F_(SD3_DAT7,		IP10_7_4)
-#define GPSR4_15	F_(SD3_DAT6,		IP10_3_0)
-#define GPSR4_14	F_(SD3_DAT5,		IP9_31_28)
-#define GPSR4_13	F_(SD3_DAT4,		IP9_27_24)
+#define GPSR4_17	F_(SD3_DS,		IP11_7_4)
+#define GPSR4_16	F_(SD3_DAT7,		IP11_3_0)
+#define GPSR4_15	F_(SD3_DAT6,		IP10_31_28)
+#define GPSR4_14	F_(SD3_DAT5,		IP10_27_24)
+#define GPSR4_13	F_(SD3_DAT4,		IP10_23_20)
 #define GPSR4_12	F_(SD3_DAT3,		IP10_19_16)
 #define GPSR4_11	F_(SD3_DAT2,		IP10_15_12)
 #define GPSR4_10	F_(SD3_DAT1,		IP10_11_8)
 #define GPSR4_9		F_(SD3_DAT0,		IP10_7_4)
 #define GPSR4_8		F_(SD3_CMD,		IP10_3_0)
 #define GPSR4_7		F_(SD3_CLK,		IP9_31_28)
-#define GPSR4_6		F_(SD2_DS,		IP9_23_20)
-#define GPSR4_5		F_(SD2_DAT3,		IP9_19_16)
-#define GPSR4_4		F_(SD2_DAT2,		IP9_15_12)
-#define GPSR4_3		F_(SD2_DAT1,		IP9_11_8)
-#define GPSR4_2		F_(SD2_DAT0,		IP9_7_4)
+#define GPSR4_6		F_(SD2_DS,		IP9_27_24)
+#define GPSR4_5		F_(SD2_DAT3,		IP9_23_20)
+#define GPSR4_4		F_(SD2_DAT2,		IP9_19_16)
+#define GPSR4_3		F_(SD2_DAT1,		IP9_15_12)
+#define GPSR4_2		F_(SD2_DAT0,		IP9_11_8)
 #define GPSR4_1		F_(SD2_CMD,		IP9_7_4)
 #define GPSR4_0		F_(SD2_CLK,		IP9_3_0)
 
-- 
1.9.1
