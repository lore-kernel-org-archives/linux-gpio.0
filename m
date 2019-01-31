From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] pinctrl: qcom: qcs404: Drop unused UFS_RESET macro
Date: Thu, 31 Jan 2019 09:38:53 -0800
Message-ID: <20190131173853.27706-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The UFS_RESET macro serves no purpose on QCS404, remove it.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-qcs404.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs404.c b/drivers/pinctrl/qcom/pinctrl-qcs404.c
index 4ffd56ff809e..1c6ba978c69f 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs404.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs404.c
@@ -95,31 +95,6 @@ enum {
 		.intr_detection_width = -1,		\
 	}
 
-#define UFS_RESET(pg_name, offset)				\
-	{						\
-		.name = #pg_name,			\
-		.pins = pg_name##_pins,			\
-		.npins = (unsigned int)ARRAY_SIZE(pg_name##_pins),	\
-		.ctl_reg = offset,			\
-		.io_reg = offset + 0x4,			\
-		.intr_cfg_reg = 0,			\
-		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
-		.tile = NORTH,				\
-		.mux_bit = -1,				\
-		.pull_bit = 3,				\
-		.drv_bit = 0,				\
-		.oe_bit = -1,				\
-		.in_bit = -1,				\
-		.out_bit = 0,				\
-		.intr_enable_bit = -1,			\
-		.intr_status_bit = -1,			\
-		.intr_target_bit = -1,			\
-		.intr_raw_status_bit = -1,		\
-		.intr_polarity_bit = -1,		\
-		.intr_detection_bit = -1,		\
-		.intr_detection_width = -1,		\
-	}
 static const struct pinctrl_pin_desc qcs404_pins[] = {
 	PINCTRL_PIN(0, "GPIO_0"),
 	PINCTRL_PIN(1, "GPIO_1"),
-- 
2.18.0
