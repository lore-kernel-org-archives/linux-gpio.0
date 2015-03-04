From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [PATCH v2 1/2] pinctrl: qcom: enable generic pinconf
Date: Wed,  4 Mar 2015 12:41:56 +0200
Message-ID: <1425465717-27747-2-git-send-email-svarbanov@mm-sol.com>
References: <1425465717-27747-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425465717-27747-1-git-send-email-svarbanov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

This makes the pinctrl driver to use the generic pinconf
interface. Mainly it gives us a way to use debugfs to dump
group configurations.

Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index a535f9c..d36e511 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -197,7 +197,6 @@ static int msm_config_reg(struct msm_pinctrl *pctrl,
 		*mask = 1;
 		break;
 	default:
-		dev_err(pctrl->dev, "Invalid config param %04x\n", param);
 		return -ENOTSUPP;
 	}
 
@@ -262,9 +261,7 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 		arg = !!(val & BIT(g->in_bit));
 		break;
 	default:
-		dev_err(pctrl->dev, "Unsupported config parameter: %x\n",
-			param);
-		return -EINVAL;
+		return -ENOTSUPP;
 	}
 
 	*config = pinconf_to_config_packed(param, arg);
@@ -357,6 +354,7 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 }
 
 static const struct pinconf_ops msm_pinconf_ops = {
+	.is_generic		= true,
 	.pin_config_group_get	= msm_config_group_get,
 	.pin_config_group_set	= msm_config_group_set,
 };
-- 
1.7.0.4
