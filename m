From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH] pinctrl: lpc18xx: add the missing group function map
Date: Thu, 14 May 2015 14:45:58 +0200
Message-ID: <1431607558-26887-1-git-send-email-manabian@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:34549 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932420AbbENMq2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2015 08:46:28 -0400
Received: by laat2 with SMTP id t2so65746026laa.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2015 05:46:26 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, Joachim Eastwood <manabian@gmail.com>

Add the required group function map and fill it at probe using
the pin capabilities information already present in the driver.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
---

Hi Linus,

Seems like the implementation of the group function map was missing
from the pinctrl driver. The lpc18xx_pmx_get_func_groups function
was actually returning uninitlized pointers, but it seems like this,
for some reason, "works" on my nommu platform(!). This is the reason
why it took me a while to notice it.

After this patch the pinmux-functions debugfs file starts to work and
the displayed result looks correct. Small snippet below.

Patch based on your pintrl devel branch.

...
function: i2c0, groups = [ i2c0_scl i2c0_sda ]
function: i2c1, groups = [ p2_3 p2_4 pe_13 pe_15 ]
function: i2s0_rx_mclk, groups = [ p1_19 p3_0 p6_0 ]
function: i2s0_rx_sck, groups = [ p3_0 p6_0 pf_4 ]
function: i2s0_rx_sda, groups = [ p3_2 p6_2 ]
...
function: spi, groups = [ p3_3 p3_6 p3_7 p3_8 ]
function: spifi, groups = [ p3_3 p3_4 p3_5 p3_6 p3_7 p3_8 ]
function: ssp0, groups = [ p1_0 p1_1 p1_2 p3_0 p3_3 p3_6 p3_7 p3_8 p9_0 p9_1 p9_2 pf_0 pf_1 pf_2 pf_3 ]
...


 drivers/pinctrl/pinctrl-lpc18xx.c | 83 +++++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
index 0facb7e64fef..a8bc1ad4e73f 100644
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ b/drivers/pinctrl/pinctrl-lpc18xx.c
@@ -46,12 +46,6 @@
 
 #define LPC18XX_SCU_FUNC_PER_PIN	8
 
-struct lpc18xx_scu_data {
-	struct pinctrl_dev *pctl;
-	void __iomem *base;
-	struct clk *clk;
-};
-
 /* LPC18xx pin types */
 enum {
 	TYPE_ND,	/* Normal-drive */
@@ -113,10 +107,11 @@ enum {
 	FUNC_UART3,
 	FUNC_USB0,
 	FUNC_USB1,
+	FUNC_MAX
 };
 
 static const char *const lpc18xx_function_names[] = {
-	[FUNC_R]		= "",
+	[FUNC_R]		= "reserved",
 	[FUNC_ADC]		= "adc",
 	[FUNC_ADCTRIG]		= "adctrig",
 	[FUNC_CAN0]		= "can0",
@@ -168,6 +163,18 @@ static const char *const lpc18xx_function_names[] = {
 	[FUNC_USB1]		= "usb1",
 };
 
+struct lpc18xx_pmx_func {
+	const char **groups;
+	unsigned ngroups;
+};
+
+struct lpc18xx_scu_data {
+	struct pinctrl_dev *pctl;
+	void __iomem *base;
+	struct clk *clk;
+	struct lpc18xx_pmx_func func[FUNC_MAX];
+};
+
 struct lpc18xx_pin_caps {
 	unsigned int offset;
 	unsigned char functions[LPC18XX_SCU_FUNC_PER_PIN];
@@ -962,6 +969,11 @@ static int lpc18xx_pmx_get_func_groups(struct pinctrl_dev *pctldev,
 				       const char *const **groups,
 				       unsigned *const num_groups)
 {
+	struct lpc18xx_scu_data *scu = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups  = scu->func[function].groups;
+	*num_groups = scu->func[function].ngroups;
+
 	return 0;
 }
 
@@ -1081,6 +1093,57 @@ static struct pinctrl_desc lpc18xx_scu_desc = {
 	.owner = THIS_MODULE,
 };
 
+static bool lpc18xx_valid_pin_function(unsigned pin, unsigned function)
+{
+	struct lpc18xx_pin_caps *p = lpc18xx_pins[pin].drv_data;
+	int i;
+
+	if (function == FUNC_DAC && p->analog == DAC)
+		return true;
+
+	if (function == FUNC_ADC && p->analog)
+		return true;
+
+	if (function == FUNC_I2C0 && p->type == TYPE_I2C0)
+		return true;
+
+	if (function == FUNC_USB1 && p->type == TYPE_USB1)
+		return true;
+
+	for (i = 0; i < LPC18XX_SCU_FUNC_PER_PIN; i++) {
+		if (function == p->functions[i])
+			return true;
+	}
+
+	return false;
+}
+
+static int lpc18xx_create_group_func_map(struct device *dev,
+					 struct lpc18xx_scu_data *scu)
+{
+	u16 pins[ARRAY_SIZE(lpc18xx_pins)];
+	int func, ngroups, i;
+
+	for (func = 0; func < FUNC_MAX; ngroups = 0, func++) {
+
+		for (i = 0; i < ARRAY_SIZE(lpc18xx_pins); i++) {
+			if (lpc18xx_valid_pin_function(i, func))
+				pins[ngroups++] = i;
+		}
+
+		scu->func[func].ngroups = ngroups;
+		scu->func[func].groups = devm_kzalloc(dev, ngroups *
+						      sizeof(char *), GFP_KERNEL);
+		if (!scu->func[func].groups)
+			return -ENOMEM;
+
+		for (i = 0; i < ngroups; i++)
+			scu->func[func].groups[i] = lpc18xx_pins[pins[i]].name;
+	}
+
+	return 0;
+}
+
 static int lpc18xx_scu_probe(struct platform_device *pdev)
 {
 	struct lpc18xx_scu_data *scu;
@@ -1102,6 +1165,12 @@ static int lpc18xx_scu_probe(struct platform_device *pdev)
 		return PTR_ERR(scu->clk);
 	}
 
+	ret = lpc18xx_create_group_func_map(&pdev->dev, scu);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to create group func map.\n");
+		return ret;
+	}
+
 	ret = clk_prepare_enable(scu->clk);
 	if (ret) {
 		dev_err(&pdev->dev, "Unable to enable clock.\n");
-- 
1.8.0

