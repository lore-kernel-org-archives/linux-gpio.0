From: Craig Tatlor <ctatlor97@gmail.com>
Subject: [PATCH] pinctrl: sdm660: Set tile property for pingroups
Date: Mon, 12 Nov 2018 20:25:53 +0000
Message-ID: <20181112202553.1410-1-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: ctatlor97@gmail.com, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This was missed when tiles support was added in a revison and
causes the driver to fail to load.

Fixes: 9cf0c526bc58 ("pinctrl: qcom: Add sdm660 pinctrl driver")
Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-sdm660.c | 28 ++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660.c b/drivers/pinctrl/qcom/pinctrl-sdm660.c
index 6838b38555a1..1bfb0ae6b387 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm660.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660.c
@@ -33,7 +33,7 @@ enum {
 	}
 
 
-#define PINGROUP(id, base, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
+#define PINGROUP(id, _tile, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
 	{					        \
 		.name = "gpio" #id,			\
 		.pins = gpio##id##_pins,		\
@@ -51,11 +51,12 @@ enum {
 			msm_mux_##f9			\
 		},				        \
 		.nfuncs = 10,				\
-		.ctl_reg = base + REG_SIZE * id,	\
-		.io_reg = base + 0x4 + REG_SIZE * id,		\
-		.intr_cfg_reg = base + 0x8 + REG_SIZE * id,		\
-		.intr_status_reg = base + 0xc + REG_SIZE * id,	\
-		.intr_target_reg = base + 0x8 + REG_SIZE * id,	\
+		.ctl_reg = REG_SIZE * id,		\
+		.io_reg = 0x4 + REG_SIZE * id,		\
+		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
+		.intr_status_reg = 0xc + REG_SIZE * id,	\
+		.intr_target_reg = 0x8 + REG_SIZE * id,	\
+		.tile = _tile,			\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -82,6 +83,7 @@ enum {
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
 		.intr_target_reg = 0,			\
+		.tile = NORTH,				\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -1397,13 +1399,13 @@ static const struct msm_pingroup sdm660_groups[] = {
 	PINGROUP(111, SOUTH, _, _, _, _, _, _, _, _, _),
 	PINGROUP(112, SOUTH, _, _, _, _, _, _, _, _, _),
 	PINGROUP(113, SOUTH, _, _, _, _, _, _, _, _, _),
-	SDC_QDSD_PINGROUP(sdc1_clk, 0x99a000, 13, 6),
-	SDC_QDSD_PINGROUP(sdc1_cmd, 0x99a000, 11, 3),
-	SDC_QDSD_PINGROUP(sdc1_data, 0x99a000, 9, 0),
-	SDC_QDSD_PINGROUP(sdc2_clk, 0x99b000, 14, 6),
-	SDC_QDSD_PINGROUP(sdc2_cmd, 0x99b000, 11, 3),
-	SDC_QDSD_PINGROUP(sdc2_data, 0x99b000, 9, 0),
-	SDC_QDSD_PINGROUP(sdc1_rclk, 0x99a000, 15, 0),
+	SDC_QDSD_PINGROUP(sdc1_clk, 0x9a000, 13, 6),
+	SDC_QDSD_PINGROUP(sdc1_cmd, 0x9a000, 11, 3),
+	SDC_QDSD_PINGROUP(sdc1_data, 0x9a000, 9, 0),
+	SDC_QDSD_PINGROUP(sdc2_clk, 0x9b000, 14, 6),
+	SDC_QDSD_PINGROUP(sdc2_cmd, 0x9b000, 11, 3),
+	SDC_QDSD_PINGROUP(sdc2_data, 0x9b000, 9, 0),
+	SDC_QDSD_PINGROUP(sdc1_rclk, 0x9a000, 15, 0),
 };
 
 static const struct msm_pinctrl_soc_data sdm660_pinctrl = {
-- 
2.19.1
