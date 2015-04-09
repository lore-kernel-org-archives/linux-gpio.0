From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH 3/3] pinctrl: qcom-spmi-mpp: Fix input value report
Date: Thu,  9 Apr 2015 18:18:37 +0300
Message-ID: <1428592717-21706-3-git-send-email-ivan.ivanov@linaro.org>
References: <1428592717-21706-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428592717-21706-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Fix interpretation of the pmic_mpp_read() return code,
negative value means an error.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 8f36c5f..8f6c7be 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -576,10 +576,11 @@ static void pmic_mpp_config_dbg_show(struct pinctrl_dev *pctldev,

 		if (pad->input_enabled) {
 			ret = pmic_mpp_read(state, pad, PMIC_MPP_REG_RT_STS);
-			if (!ret) {
-				ret &= PMIC_MPP_REG_RT_STS_VAL_MASK;
-				pad->out_value = ret;
-			}
+			if (ret < 0)
+				return;
+
+			ret &= PMIC_MPP_REG_RT_STS_VAL_MASK;
+			pad->out_value = ret;
 		}

 		seq_printf(s, " %-4s", pad->output_enabled ? "out" : "in");
--
1.9.1
