From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [RFC v2 1/3] pinctrl: imx: remove const qualifier of imx_pinctrl_soc_info
Date: Fri,  2 Dec 2016 17:35:18 +0100
Message-ID: <20161202163520.22927-2-gary.bisson@boundarydevices.com>
References: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
 <20161202163520.22927-1-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wj0-f175.google.com ([209.85.210.175]:36066 "EHLO
        mail-wj0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752854AbcLBQfa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Dec 2016 11:35:30 -0500
Received: by mail-wj0-f175.google.com with SMTP id qp4so236728916wjc.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Dec 2016 08:35:29 -0800 (PST)
In-Reply-To: <20161202163520.22927-1-gary.bisson@boundarydevices.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, fabio.estevam@nxp.com
Cc: shawnguo@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, pantelis.antoniou@konsulko.com, vladimir_zapolskiy@mentor.com, Gary Bisson <gary.bisson@boundarydevices.com>

Otherwise can't dynamically update fields such as ngroups which can
change over time (with a dt-overlay for instance).

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

If this patch isn't applied the compiler gives errors like:
error: increment of member ‘nfunctions’ in read-only object

Regards,
Gary
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 34 ++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 5ef7e87..8697c1b 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -42,11 +42,11 @@ struct imx_pinctrl {
 	struct pinctrl_dev *pctl;
 	void __iomem *base;
 	void __iomem *input_sel_base;
-	const struct imx_pinctrl_soc_info *info;
+	struct imx_pinctrl_soc_info *info;
 };
 
 static inline const struct imx_pin_group *imx_pinctrl_find_group_by_name(
-				const struct imx_pinctrl_soc_info *info,
+				struct imx_pinctrl_soc_info *info,
 				const char *name)
 {
 	const struct imx_pin_group *grp = NULL;
@@ -65,7 +65,7 @@ static inline const struct imx_pin_group *imx_pinctrl_find_group_by_name(
 static int imx_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 
 	return info->ngroups;
 }
@@ -74,7 +74,7 @@ static const char *imx_get_group_name(struct pinctrl_dev *pctldev,
 				       unsigned selector)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 
 	return info->groups[selector].name;
 }
@@ -84,7 +84,7 @@ static int imx_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
 			       unsigned *npins)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 
 	if (selector >= info->ngroups)
 		return -EINVAL;
@@ -106,7 +106,7 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 			struct pinctrl_map **map, unsigned *num_maps)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 	const struct imx_pin_group *grp;
 	struct pinctrl_map *new_map;
 	struct device_node *parent;
@@ -186,7 +186,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 		       unsigned group)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 	const struct imx_pin_reg *pin_reg;
 	unsigned int npins, pin_id;
 	int i;
@@ -275,7 +275,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 static int imx_pmx_get_funcs_count(struct pinctrl_dev *pctldev)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 
 	return info->nfunctions;
 }
@@ -284,7 +284,7 @@ static const char *imx_pmx_get_func_name(struct pinctrl_dev *pctldev,
 					  unsigned selector)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 
 	return info->functions[selector].name;
 }
@@ -294,7 +294,7 @@ static int imx_pmx_get_groups(struct pinctrl_dev *pctldev, unsigned selector,
 			       unsigned * const num_groups)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 
 	*groups = info->functions[selector].groups;
 	*num_groups = info->functions[selector].num_groups;
@@ -306,7 +306,7 @@ static int imx_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
 			struct pinctrl_gpio_range *range, unsigned offset)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 	const struct imx_pin_reg *pin_reg;
 	struct imx_pin_group *grp;
 	struct imx_pin *imx_pin;
@@ -346,7 +346,7 @@ static void imx_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
 			struct pinctrl_gpio_range *range, unsigned offset)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 	const struct imx_pin_reg *pin_reg;
 	u32 reg;
 
@@ -371,7 +371,7 @@ static int imx_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	   struct pinctrl_gpio_range *range, unsigned offset, bool input)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 	const struct imx_pin_reg *pin_reg;
 	u32 reg;
 
@@ -411,7 +411,7 @@ static int imx_pinconf_get(struct pinctrl_dev *pctldev,
 			     unsigned pin_id, unsigned long *config)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 	const struct imx_pin_reg *pin_reg = &info->pin_regs[pin_id];
 
 	if (pin_reg->conf_reg == -1) {
@@ -433,7 +433,7 @@ static int imx_pinconf_set(struct pinctrl_dev *pctldev,
 			     unsigned num_configs)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 	const struct imx_pin_reg *pin_reg = &info->pin_regs[pin_id];
 	int i;
 
@@ -467,7 +467,7 @@ static void imx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 				   struct seq_file *s, unsigned pin_id)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 	const struct imx_pin_reg *pin_reg = &info->pin_regs[pin_id];
 	unsigned long config;
 
@@ -484,7 +484,7 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 					 struct seq_file *s, unsigned group)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 	struct imx_pin_group *grp;
 	unsigned long config;
 	const char *name;
-- 
2.9.3

