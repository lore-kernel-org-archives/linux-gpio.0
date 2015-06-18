From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 2/8] pinctrl: qcom: spmi-mpp: Fixes related to enable handling
Date: Wed, 17 Jun 2015 23:47:26 -0700
Message-ID: <1434610052-602-3-git-send-email-bjorn.andersson@sonymobile.com>
References: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

There's currently no way to re-enable a mpp block once you've entered a state
that disables the state, this patch makes it possible to leave the
bias-high-impedance state.

Also read the enable state from the hardware on probe.

With this in place the is_enabled variable is accurately tracking the state of
the hardware and we can use that for the debug output as well.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index b247a17bc2af..6d9abeea810d 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -354,6 +354,9 @@ static int pmic_mpp_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 
 	pad = pctldev->desc->pins[pin].drv_data;
 
+	/* Make it possible to enable the pin, by not setting high impedance */
+	pad->is_enabled = true;
+
 	for (i = 0; i < nconfs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 		arg = pinconf_to_config_argument(configs[i]);
@@ -445,7 +448,13 @@ static int pmic_mpp_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	val |= pad->function << PMIC_MPP_REG_MODE_FUNCTION_SHIFT;
 	val |= pad->out_value & PMIC_MPP_REG_MODE_VALUE_MASK;
 
-	return pmic_mpp_write(state, pad, PMIC_MPP_REG_MODE_CTL, val);
+	ret = pmic_mpp_write(state, pad, PMIC_MPP_REG_MODE_CTL, val);
+	if (ret < 0)
+		return ret;
+
+	val = pad->is_enabled << PMIC_MPP_REG_MASTER_EN_SHIFT;
+
+	return pmic_mpp_write(state, pad, PMIC_MPP_REG_EN_CTL, val);
 }
 
 static void pmic_mpp_config_dbg_show(struct pinctrl_dev *pctldev,
@@ -453,7 +462,7 @@ static void pmic_mpp_config_dbg_show(struct pinctrl_dev *pctldev,
 {
 	struct pmic_mpp_state *state = pinctrl_dev_get_drvdata(pctldev);
 	struct pmic_mpp_pad *pad;
-	int ret, val;
+	int ret;
 
 	static const char *const biases[] = {
 		"0.6kOhm", "10kOhm", "30kOhm", "Disabled"
@@ -464,9 +473,7 @@ static void pmic_mpp_config_dbg_show(struct pinctrl_dev *pctldev,
 
 	seq_printf(s, " mpp%-2d:", pin + PMIC_MPP_PHYSICAL_OFFSET);
 
-	val = pmic_mpp_read(state, pad, PMIC_MPP_REG_EN_CTL);
-
-	if (val < 0 || !(val >> PMIC_MPP_REG_MASTER_EN_SHIFT)) {
+	if (!pad->is_enabled) {
 		seq_puts(s, " ---");
 	} else {
 
@@ -706,8 +713,12 @@ static int pmic_mpp_populate(struct pmic_mpp_state *state,
 	pad->amux_input = val >> PMIC_MPP_REG_AIN_ROUTE_SHIFT;
 	pad->amux_input &= PMIC_MPP_REG_AIN_ROUTE_MASK;
 
-	/* Pin could be disabled with PIN_CONFIG_BIAS_HIGH_IMPEDANCE */
-	pad->is_enabled = true;
+	val = pmic_mpp_read(state, pad, PMIC_MPP_REG_EN_CTL);
+	if (val < 0)
+		return val;
+
+	pad->is_enabled = !!val;
+
 	return 0;
 }
 
-- 
1.8.2.2
