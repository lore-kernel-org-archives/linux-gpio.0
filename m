From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [PATCH 3/3] pinctrl: qcom: handle input-enable pinconf property
Date: Fri, 30 Jan 2015 12:27:24 +0200
Message-ID: <1422613644-13060-4-git-send-email-svarbanov@mm-sol.com>
References: <1422613644-13060-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422613644-13060-1-git-send-email-svarbanov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Boyd <sboyd@codeaurora.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
List-Id: linux-gpio@vger.kernel.org

This enables support of 'input-enable' pinconf generic property in
the pinctrl driver.

Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index b66cd58..55a64ea 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -193,6 +193,7 @@ static int msm_config_reg(struct msm_pinctrl *pctrl,
 		*mask = 7;
 		break;
 	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_INPUT_ENABLE:
 		*bit = g->oe_bit;
 		*mask = 1;
 		break;
@@ -260,6 +261,12 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 		val = readl(pctrl->regs + g->io_reg);
 		arg = !!(val & BIT(g->in_bit));
 		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		/* Pin is output */
+		if (arg)
+			return -EINVAL;
+		arg = 1;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -330,6 +337,10 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 			/* enable output */
 			arg = 1;
 			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			/* disable output */
+			arg = 0;
+			break;
 		default:
 			dev_err(pctrl->dev, "Unsupported config parameter: %x\n",
 				param);
-- 
1.7.0.4
