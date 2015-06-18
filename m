From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 3/8] pinctrl: qcom: spmi-mpp: Introduce defines for MODE_CTL
Date: Wed, 17 Jun 2015 23:47:27 -0700
Message-ID: <1434610052-602-4-git-send-email-bjorn.andersson@sonymobile.com>
References: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 6d9abeea810d..745c37dea7d0 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -85,6 +85,14 @@
 #define PMIC_MPP_REG_AIN_ROUTE_SHIFT		0
 #define PMIC_MPP_REG_AIN_ROUTE_MASK		0x7
 
+#define PMIC_MPP_MODE_DIGITAL_INPUT		0
+#define PMIC_MPP_MODE_DIGITAL_OUTPUT		1
+#define PMIC_MPP_MODE_DIGITAL_BIDIR		2
+#define PMIC_MPP_MODE_ANALOG_BIDIR		3
+#define PMIC_MPP_MODE_ANALOG_INPUT		4
+#define PMIC_MPP_MODE_ANALOG_OUTPUT		5
+#define PMIC_MPP_MODE_CURRENT_SINK		6
+
 #define PMIC_MPP_PHYSICAL_OFFSET		1
 
 /* Qualcomm specific pin configurations */
@@ -248,20 +256,20 @@ static int pmic_mpp_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 	pad->function = function;
 
 	if (!pad->analog_mode) {
-		val = 0;	/* just digital input */
+		val = PMIC_MPP_MODE_DIGITAL_INPUT;
 		if (pad->output_enabled) {
 			if (pad->input_enabled)
-				val = 2; /* digital input and output */
+				val = PMIC_MPP_MODE_DIGITAL_BIDIR;
 			else
-				val = 1; /* just digital output */
+				val = PMIC_MPP_MODE_DIGITAL_OUTPUT;
 		}
 	} else {
-		val = 4;	/* just analog input */
+		val = PMIC_MPP_MODE_ANALOG_INPUT;
 		if (pad->output_enabled) {
 			if (pad->input_enabled)
-				val = 3; /* analog input and output */
+				val = PMIC_MPP_MODE_ANALOG_BIDIR;
 			else
-				val = 5; /* just analog output */
+				val = PMIC_MPP_MODE_ANALOG_OUTPUT;
 		}
 	}
 
@@ -654,32 +662,32 @@ static int pmic_mpp_populate(struct pmic_mpp_state *state,
 	dir &= PMIC_MPP_REG_MODE_DIR_MASK;
 
 	switch (dir) {
-	case 0:
+	case PMIC_MPP_MODE_DIGITAL_INPUT:
 		pad->input_enabled = true;
 		pad->output_enabled = false;
 		pad->analog_mode = false;
 		break;
-	case 1:
+	case PMIC_MPP_MODE_DIGITAL_OUTPUT:
 		pad->input_enabled = false;
 		pad->output_enabled = true;
 		pad->analog_mode = false;
 		break;
-	case 2:
+	case PMIC_MPP_MODE_DIGITAL_BIDIR:
 		pad->input_enabled = true;
 		pad->output_enabled = true;
 		pad->analog_mode = false;
 		break;
-	case 3:
+	case PMIC_MPP_MODE_ANALOG_BIDIR:
 		pad->input_enabled = true;
 		pad->output_enabled = true;
 		pad->analog_mode = true;
 		break;
-	case 4:
+	case PMIC_MPP_MODE_ANALOG_INPUT:
 		pad->input_enabled = true;
 		pad->output_enabled = false;
 		pad->analog_mode = true;
 		break;
-	case 5:
+	case PMIC_MPP_MODE_ANALOG_OUTPUT:
 		pad->input_enabled = false;
 		pad->output_enabled = true;
 		pad->analog_mode = true;
-- 
1.8.2.2
