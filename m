From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH] pinctrl: qcom: spmi-mpp: Fix drive strength setting
Date: Thu, 30 Aug 2018 17:58:52 -0700
Message-ID: <20180831005852.156465-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

It looks like we parse the drive strength setting here, but never
actually write it into the hardware to update it. Parse the setting and
then write it at the end of the pinconf setting function so that it
actually sticks in the hardware.

Fixes: 0e948042c420 ("pinctrl: qcom: spmi-mpp: Implement support for sink mode")
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 6556dbeae65e..1793a4d05e15 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -455,7 +455,7 @@ static int pmic_mpp_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			pad->dtest = arg;
 			break;
 		case PIN_CONFIG_DRIVE_STRENGTH:
-			arg = pad->drive_strength;
+			pad->drive_strength = arg;
 			break;
 		case PMIC_MPP_CONF_AMUX_ROUTE:
 			if (arg >= PMIC_MPP_AMUX_ROUTE_ABUS4)
@@ -502,6 +502,10 @@ static int pmic_mpp_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	if (ret < 0)
 		return ret;
 
+	ret = pmic_mpp_write(state, pad, PMIC_MPP_REG_SINK_CTL, pad->drive_strength);
+	if (ret < 0)
+		return ret;
+
 	val = pad->is_enabled << PMIC_MPP_REG_MASTER_EN_SHIFT;
 
 	return pmic_mpp_write(state, pad, PMIC_MPP_REG_EN_CTL, val);
-- 
Sent by a computer through tubes
