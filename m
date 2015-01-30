From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [PATCH 1/3] pinctrl: qcom: delete pin_config_get/set pinconf operations
Date: Fri, 30 Jan 2015 12:27:22 +0200
Message-ID: <1422613644-13060-2-git-send-email-svarbanov@mm-sol.com>
References: <1422613644-13060-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422613644-13060-1-git-send-email-svarbanov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Boyd <sboyd@codeaurora.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
List-Id: linux-gpio@vger.kernel.org

The .pin_config_get/set operation are not supported in qcom pinctrl
driver. As the pinconf core is smart enough it doesn't complain
about that.

Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c |   17 -----------------
 1 files changed, 0 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index e730935..49d3f4f 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -204,21 +204,6 @@ static int msm_config_reg(struct msm_pinctrl *pctrl,
 	return 0;
 }
 
-static int msm_config_get(struct pinctrl_dev *pctldev,
-			  unsigned int pin,
-			  unsigned long *config)
-{
-	dev_err(pctldev->dev, "pin_config_set op not supported\n");
-	return -ENOTSUPP;
-}
-
-static int msm_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
-				unsigned long *configs, unsigned num_configs)
-{
-	dev_err(pctldev->dev, "pin_config_set op not supported\n");
-	return -ENOTSUPP;
-}
-
 #define MSM_NO_PULL	0
 #define MSM_PULL_DOWN	1
 #define MSM_KEEPER	2
@@ -372,8 +357,6 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 }
 
 static const struct pinconf_ops msm_pinconf_ops = {
-	.pin_config_get		= msm_config_get,
-	.pin_config_set		= msm_config_set,
 	.pin_config_group_get	= msm_config_group_get,
 	.pin_config_group_set	= msm_config_group_set,
 };
-- 
1.7.0.4
