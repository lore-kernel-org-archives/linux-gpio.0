From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [PATCH 2/3] pinctrl: qcom: enable generic pinconf
Date: Fri, 30 Jan 2015 12:27:23 +0200
Message-ID: <1422613644-13060-3-git-send-email-svarbanov@mm-sol.com>
References: <1422613644-13060-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422613644-13060-1-git-send-email-svarbanov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Boyd <sboyd@codeaurora.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
List-Id: linux-gpio@vger.kernel.org

This makes the pinctrl driver to use the generic pinconf
interface. Mainly it gives us a way to use debugfs to dump
group configurations.

Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 49d3f4f..b66cd58 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -197,7 +197,6 @@ static int msm_config_reg(struct msm_pinctrl *pctrl,
 		*mask = 1;
 		break;
 	default:
-		dev_err(pctrl->dev, "Invalid config param %04x\n", param);
 		return -ENOTSUPP;
 	}
 
@@ -262,8 +261,6 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 		arg = !!(val & BIT(g->in_bit));
 		break;
 	default:
-		dev_err(pctrl->dev, "Unsupported config parameter: %x\n",
-			param);
 		return -EINVAL;
 	}
 
@@ -357,6 +354,7 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 }
 
 static const struct pinconf_ops msm_pinconf_ops = {
+	.is_generic		= true,
 	.pin_config_group_get	= msm_config_group_get,
 	.pin_config_group_set	= msm_config_group_set,
 };
-- 
1.7.0.4
