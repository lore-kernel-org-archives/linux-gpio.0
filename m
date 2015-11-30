From: Barry Song <21cnbao@gmail.com>
Subject: [PATCH 2/5] pinctrl: altas7: add sd9 function mux support
Date: Mon, 30 Nov 2015 06:05:54 +0000
Message-ID: <1448863557-25352-2-git-send-email-21cnbao@gmail.com>
References: <1448863557-25352-1-git-send-email-21cnbao@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:34912 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752065AbbK3Fzp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 00:55:45 -0500
Received: by pacej9 with SMTP id ej9so173482489pac.2
        for <linux-gpio@vger.kernel.org>; Sun, 29 Nov 2015 21:55:44 -0800 (PST)
In-Reply-To: <1448863557-25352-1-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: workgroup.linux@csr.com, Yonghui Zhang <yonghui.zhang@csr.com>, Barry Song <Baohua.Song@csr.com>

From: Yonghui Zhang <yonghui.zhang@csr.com>

The sd9 pin mux with sd3 and it is selected by SYS2PCI_SDIO9SEL.
This makes the codes ugly since the register is not in pinctrl
module.

Signed-off-by: Yonghui Zhang <yonghui.zhang@csr.com>
Signed-off-by: Barry Song <Baohua.Song@csr.com>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 44 ++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 30db524..47c63c5 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -161,6 +161,9 @@ enum altas7_pad_type {
 #define IN_DISABLE_VAL_1_REG_SET	0x0A88
 #define IN_DISABLE_VAL_1_REG_CLR	0x0A8C
 
+/* Offset of the SDIO9SEL*/
+#define SYS2PCI_SDIO9SEL 0x14
+
 struct dt_params {
 	const char *property;
 	int value;
@@ -370,6 +373,7 @@ struct atlas7_pmx {
 	struct pinctrl_desc pctl_desc;
 	struct atlas7_pinctrl_data *pctl_data;
 	void __iomem *regs[ATLAS7_PINCTRL_REG_BANKS];
+	void __iomem *sys2pci_base;
 	u32 status_ds[NUM_OF_IN_DISABLE_REG];
 	u32 status_dsv[NUM_OF_IN_DISABLE_REG];
 	struct atlas7_pad_status sleep_data[ATLAS7_PINCTRL_TOTAL_PINS];
@@ -946,7 +950,7 @@ static const unsigned int sd2_cdb_pins0[] = { 124, };
 static const unsigned int sd2_cdb_pins1[] = { 161, };
 static const unsigned int sd2_wpb_pins0[] = { 123, };
 static const unsigned int sd2_wpb_pins1[] = { 163, };
-static const unsigned int sd3_pins[] = { 85, 86, 87, 88, 89, 90, };
+static const unsigned int sd3_9_pins[] = { 85, 86, 87, 88, 89, 90, };
 static const unsigned int sd5_pins[] = { 91, 92, 93, 94, 95, 96, };
 static const unsigned int sd6_pins0[] = { 79, 78, 74, 75, 76, 77, };
 static const unsigned int sd6_pins1[] = { 101, 99, 100, 110, 109, 111, };
@@ -1199,7 +1203,7 @@ struct atlas7_pin_group altas7_pin_groups[] = {
 	GROUP("sd2_cdb_grp1", sd2_cdb_pins1),
 	GROUP("sd2_wpb_grp0", sd2_wpb_pins0),
 	GROUP("sd2_wpb_grp1", sd2_wpb_pins1),
-	GROUP("sd3_grp", sd3_pins),
+	GROUP("sd3_9_grp", sd3_9_pins),
 	GROUP("sd5_grp", sd5_pins),
 	GROUP("sd6_grp0", sd6_pins0),
 	GROUP("sd6_grp1", sd6_pins1),
@@ -1482,7 +1486,7 @@ static const char * const sd2_cdb_grp0[] = { "sd2_cdb_grp0", };
 static const char * const sd2_cdb_grp1[] = { "sd2_cdb_grp1", };
 static const char * const sd2_wpb_grp0[] = { "sd2_wpb_grp0", };
 static const char * const sd2_wpb_grp1[] = { "sd2_wpb_grp1", };
-static const char * const sd3_grp[] = { "sd3_grp", };
+static const char * const sd3_9_grp[] = { "sd3_9_grp", };
 static const char * const sd5_grp[] = { "sd5_grp", };
 static const char * const sd6_grp0[] = { "sd6_grp0", };
 static const char * const sd6_grp1[] = { "sd6_grp1", };
@@ -3771,7 +3775,7 @@ static struct atlas7_grp_mux sd2_wpb_grp1_mux = {
 	.pad_mux_list = sd2_wpb_grp1_pad_mux,
 };
 
-static struct atlas7_pad_mux sd3_grp_pad_mux[] = {
+static struct atlas7_pad_mux sd3_9_grp_pad_mux[] = {
 	MUX(1, 85, 1, N, N, N, N),
 	MUX(1, 86, 1, N, N, N, N),
 	MUX(1, 87, 1, N, N, N, N),
@@ -3780,9 +3784,9 @@ static struct atlas7_pad_mux sd3_grp_pad_mux[] = {
 	MUX(1, 90, 1, N, N, N, N),
 };
 
-static struct atlas7_grp_mux sd3_grp_mux = {
-	.pad_mux_count = ARRAY_SIZE(sd3_grp_pad_mux),
-	.pad_mux_list = sd3_grp_pad_mux,
+static struct atlas7_grp_mux sd3_9_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(sd3_9_grp_pad_mux),
+	.pad_mux_list = sd3_9_grp_pad_mux,
 };
 
 static struct atlas7_pad_mux sd5_grp_pad_mux[] = {
@@ -4715,10 +4719,11 @@ static struct atlas7_pmx_func atlas7_pmx_functions[] = {
 	FUNCTION("sd2_cdb_m1", sd2_cdb_grp1, &sd2_cdb_grp1_mux),
 	FUNCTION("sd2_wpb_m0", sd2_wpb_grp0, &sd2_wpb_grp0_mux),
 	FUNCTION("sd2_wpb_m1", sd2_wpb_grp1, &sd2_wpb_grp1_mux),
-	FUNCTION("sd3", sd3_grp, &sd3_grp_mux),
+	FUNCTION("sd3", sd3_9_grp, &sd3_9_grp_mux),
 	FUNCTION("sd5", sd5_grp, &sd5_grp_mux),
 	FUNCTION("sd6_m0", sd6_grp0, &sd6_grp0_mux),
 	FUNCTION("sd6_m1", sd6_grp1, &sd6_grp1_mux),
+	FUNCTION("sd9", sd3_9_grp, &sd3_9_grp_mux),
 	FUNCTION("sp0_ext_ldo_on",
 			sp0_ext_ldo_on_grp,
 			&sp0_ext_ldo_on_grp_mux),
@@ -5126,6 +5131,14 @@ static int atlas7_pmx_set_mux(struct pinctrl_dev *pctldev,
 	pr_debug("PMX DUMP ### Function:[%s] Group:[%s] #### START >>>\n",
 			pmx_func->name, pin_grp->name);
 
+	/* the sd3 and sd9 pin select by SYS2PCI_SDIO9SEL register */
+	if (pin_grp->pins == (unsigned int *)&sd3_9_pins) {
+		if (!strcmp(pmx_func->name, "sd9"))
+			writel(1, pmx->sys2pci_base + SYS2PCI_SDIO9SEL);
+		else
+			writel(0, pmx->sys2pci_base + SYS2PCI_SDIO9SEL);
+	}
+
 	grp_mux = pmx_func->grpmux;
 
 	for (idx = 0; idx < grp_mux->pad_mux_count; idx++) {
@@ -5414,12 +5427,27 @@ static int atlas7_pinmux_probe(struct platform_device *pdev)
 	struct atlas7_pmx *pmx;
 	struct device_node *np = pdev->dev.of_node;
 	u32 banks = ATLAS7_PINCTRL_REG_BANKS;
+	struct device_node *sys2pci_np;
+	struct resource res;
 
 	/* Create state holders etc for this driver */
 	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
 	if (!pmx)
 		return -ENOMEM;
 
+	/* The sd3 and sd9 shared all pins, and the function select by
+	 * SYS2PCI_SDIO9SEL register
+	 */
+	sys2pci_np = of_find_node_by_name(NULL, "sys2pci");
+	if (!sys2pci_np)
+		return -EINVAL;
+	ret = of_address_to_resource(sys2pci_np, 0, &res);
+	if (ret)
+		return ret;
+	pmx->sys2pci_base = devm_ioremap_resource(&pdev->dev, &res);
+	if (IS_ERR(pmx->sys2pci_base))
+		return -ENOMEM;
+
 	pmx->dev = &pdev->dev;
 
 	pmx->pctl_data = &atlas7_ioc_data;
-- 
1.9.1

