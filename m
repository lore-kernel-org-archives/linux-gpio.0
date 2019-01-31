From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] pinctrl: qcom: qcs404: Correct SDC tile
Date: Thu, 31 Jan 2019 09:29:53 -0800
Message-ID: <20190131172953.27339-1-bjorn.andersson@linaro.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The SDC controls live in the south tile, not the north one. Correct this
so that we program the right registers.

Cc: stable@vger.kernel.org
Fixes: 22eb8301dbc1 ("pinctrl: qcom: Add qcs404 pinctrl driver")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-qcs404.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs404.c b/drivers/pinctrl/qcom/pinctrl-qcs404.c
index 7aae52a09ff0..4ffd56ff809e 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs404.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs404.c
@@ -79,7 +79,7 @@ enum {
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
 		.intr_target_reg = 0,			\
-		.tile = NORTH,				\
+		.tile = SOUTH,				\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
-- 
2.18.0
