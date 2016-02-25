From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] pinctrl: imx: attach iomuxc device to gpr syscon
Date: Thu, 25 Feb 2016 18:23:07 +0100
Message-ID: <1456420987-9883-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:41205 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1760733AbcBYRXW (ORCPT
	<rfc822;linux-gpio@vger.kernel.Org>);
	Thu, 25 Feb 2016 12:23:22 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Adrian Alonso <aalonso@freescale.com>, Robin Gong <b38343@freescale.com>, Stefan Agner <stefan@agner.ch>, Anson Huang <b20788@freescale.com>, Fabio Estevam <fabio.estevam@freescale.com>, Frank Li <Frank.Li@freescale.com>, linux-gpio@vger.kernel.org, kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>

Commit bdb0066df96e ("mfd: syscon: Decouple syscon interface from platform
devices") added the possibility to register syscon devices without
associated platform device. This also removed regmap debugfs facilities,
which don't work without a device. This patch associates the syscon regmap
that handles the IOMUX controller's general purpose registers with the
pinctrl device so that the GPR registers appear in the regmap debugfs
directory again. For example, on i.MX6Q the GPR registers now can be
read from /sys/kernel/debug/regmap/20e0000.iomuxc-gpr/registers.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/pinctrl/freescale/pinctrl-imx.c    | 10 ++++++++++
 drivers/pinctrl/freescale/pinctrl-imx.h    |  1 +
 drivers/pinctrl/freescale/pinctrl-imx50.c  |  1 +
 drivers/pinctrl/freescale/pinctrl-imx53.c  |  1 +
 drivers/pinctrl/freescale/pinctrl-imx6dl.c |  1 +
 drivers/pinctrl/freescale/pinctrl-imx6q.c  |  1 +
 drivers/pinctrl/freescale/pinctrl-imx6sl.c |  1 +
 drivers/pinctrl/freescale/pinctrl-imx6sx.c |  1 +
 drivers/pinctrl/freescale/pinctrl-imx6ul.c |  1 +
 drivers/pinctrl/freescale/pinctrl-imx7d.c  |  1 +
 10 files changed, 19 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index a5bb939..0306ac0 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -15,6 +15,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -24,6 +25,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/slab.h>
+#include <linux/regmap.h>
 
 #include "../core.h"
 #include "pinctrl-imx.h"
@@ -692,10 +694,12 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 int imx_pinctrl_probe(struct platform_device *pdev,
 		      struct imx_pinctrl_soc_info *info)
 {
+	struct regmap_config config = { .name = "gpr" };
 	struct device_node *dev_np = pdev->dev.of_node;
 	struct device_node *np;
 	struct imx_pinctrl *ipctl;
 	struct resource *res;
+	struct regmap *gpr;
 	int ret, i;
 
 	if (!info || !info->pins || !info->npins) {
@@ -704,6 +708,12 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 	}
 	info->dev = &pdev->dev;
 
+	if (info->gpr_compatible) {
+		gpr = syscon_regmap_lookup_by_compatible(info->gpr_compatible);
+		if (!IS_ERR(gpr))
+			regmap_attach_dev(&pdev->dev, gpr, &config);
+	}
+
 	/* Create state holders etc for this driver */
 	ipctl = devm_kzalloc(&pdev->dev, sizeof(*ipctl), GFP_KERNEL);
 	if (!ipctl)
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
index 2a592f6..3b8bd81a 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -82,6 +82,7 @@ struct imx_pinctrl_soc_info {
 	struct imx_pmx_func *functions;
 	unsigned int nfunctions;
 	unsigned int flags;
+	const char *gpr_compatible;
 };
 
 #define SHARE_MUX_CONF_REG	0x1
diff --git a/drivers/pinctrl/freescale/pinctrl-imx50.c b/drivers/pinctrl/freescale/pinctrl-imx50.c
index 51b31df..8acc4d96 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx50.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx50.c
@@ -389,6 +389,7 @@ static const struct pinctrl_pin_desc imx50_pinctrl_pads[] = {
 static struct imx_pinctrl_soc_info imx50_pinctrl_info = {
 	.pins = imx50_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx50_pinctrl_pads),
+	.gpr_compatible = "fsl,imx50-iomuxc-gpr",
 };
 
 static const struct of_device_id imx50_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/freescale/pinctrl-imx53.c b/drivers/pinctrl/freescale/pinctrl-imx53.c
index 7344d34..d39dfd6 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx53.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx53.c
@@ -452,6 +452,7 @@ static const struct pinctrl_pin_desc imx53_pinctrl_pads[] = {
 static struct imx_pinctrl_soc_info imx53_pinctrl_info = {
 	.pins = imx53_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx53_pinctrl_pads),
+	.gpr_compatible = "fsl,imx53-iomuxc-gpr",
 };
 
 static const struct of_device_id imx53_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6dl.c b/drivers/pinctrl/freescale/pinctrl-imx6dl.c
index 6805c67..5a2cdb0 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6dl.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6dl.c
@@ -458,6 +458,7 @@ static const struct pinctrl_pin_desc imx6dl_pinctrl_pads[] = {
 static struct imx_pinctrl_soc_info imx6dl_pinctrl_info = {
 	.pins = imx6dl_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx6dl_pinctrl_pads),
+	.gpr_compatible = "fsl,imx6q-iomuxc-gpr",
 };
 
 static const struct of_device_id imx6dl_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6q.c b/drivers/pinctrl/freescale/pinctrl-imx6q.c
index 4d1fcb8..7d50a36 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6q.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6q.c
@@ -464,6 +464,7 @@ static const struct pinctrl_pin_desc imx6q_pinctrl_pads[] = {
 static struct imx_pinctrl_soc_info imx6q_pinctrl_info = {
 	.pins = imx6q_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx6q_pinctrl_pads),
+	.gpr_compatible = "fsl,imx6q-iomuxc-gpr",
 };
 
 static const struct of_device_id imx6q_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6sl.c b/drivers/pinctrl/freescale/pinctrl-imx6sl.c
index 83fa5f1..e27d17f 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6sl.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6sl.c
@@ -364,6 +364,7 @@ static const struct pinctrl_pin_desc imx6sl_pinctrl_pads[] = {
 static struct imx_pinctrl_soc_info imx6sl_pinctrl_info = {
 	.pins = imx6sl_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx6sl_pinctrl_pads),
+	.gpr_compatible = "fsl,imx6sl-iomuxc-gpr",
 };
 
 static const struct of_device_id imx6sl_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6sx.c b/drivers/pinctrl/freescale/pinctrl-imx6sx.c
index 0d78fe6..117180c 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6sx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6sx.c
@@ -368,6 +368,7 @@ static const struct pinctrl_pin_desc imx6sx_pinctrl_pads[] = {
 static struct imx_pinctrl_soc_info imx6sx_pinctrl_info = {
 	.pins = imx6sx_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx6sx_pinctrl_pads),
+	.gpr_compatible = "fsl,imx6sx-iomuxc-gpr",
 };
 
 static const struct of_device_id imx6sx_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6ul.c b/drivers/pinctrl/freescale/pinctrl-imx6ul.c
index 08e7576..78627c7 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6ul.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6ul.c
@@ -284,6 +284,7 @@ static const struct pinctrl_pin_desc imx6ul_pinctrl_pads[] = {
 static struct imx_pinctrl_soc_info imx6ul_pinctrl_info = {
 	.pins = imx6ul_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx6ul_pinctrl_pads),
+	.gpr_compatible = "fsl,imx6ul-iomuxc-gpr",
 };
 
 static struct of_device_id imx6ul_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/freescale/pinctrl-imx7d.c b/drivers/pinctrl/freescale/pinctrl-imx7d.c
index 16dc925..1c89613 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx7d.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx7d.c
@@ -359,6 +359,7 @@ static const struct pinctrl_pin_desc imx7d_lpsr_pinctrl_pads[] = {
 static struct imx_pinctrl_soc_info imx7d_pinctrl_info = {
 	.pins = imx7d_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx7d_pinctrl_pads),
+	.gpr_compatible = "fsl,imx7d-iomuxc-gpr",
 };
 
 static struct imx_pinctrl_soc_info imx7d_lpsr_pinctrl_info = {
-- 
2.7.0

