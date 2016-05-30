From: Peng Fan <van.freenix@gmail.com>
Subject: Re: [PATCH] pinctrl: imx: fix initialization of imx_pinctrl_desc
Date: Mon, 30 May 2016 20:58:04 +0800
Message-ID: <20160530125802.GA2800@linux-7smt.suse>
References: <1463563919-4144-1-git-send-email-van.freenix@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:34356 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754790AbcE3M6Q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 May 2016 08:58:16 -0400
Content-Disposition: inline
In-Reply-To: <1463563919-4144-1-git-send-email-van.freenix@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, shawnguo@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Vladimir Zapolskiy <vz@mleia.com>

Hi Linus, Shawn

Kindly ping.. Do you have any comments on this patch?

Thanks,
Peng.
On Wed, May 18, 2016 at 05:31:59PM +0800, Peng Fan wrote:
>To i.MX7D, there are two iomux controllers, iomuxc and iomuxc_lpsr.
>They should not share one pin controller descriptor, otherwise
>the value filled into imx_pinctrl_desc when probing the first
>iomux controller will be overridden when probing the second one.
>
>In this patch, discard the static allcoated imx_pinctrl_desc and
>switch to dynamically allcate pin controller descriptor for each
>iomux controller.
>
>Signed-off-by: Peng Fan <van.freenix@gmail.com>
>Cc: Linus Walleij <linus.walleij@linaro.org>
>Cc: Shawn Guo <shawnguo@kernel.org>
>Cc: Philipp Zabel <p.zabel@pengutronix.de>
>Cc: Stefan Agner <stefan@agner.ch>
>Cc: Vladimir Zapolskiy <vz@mleia.com>
>---
> drivers/pinctrl/freescale/pinctrl-imx.c | 25 ++++++++++++++-----------
> 1 file changed, 14 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
>index 9cfa544..40fe939 100644
>--- a/drivers/pinctrl/freescale/pinctrl-imx.c
>+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
>@@ -513,13 +513,6 @@ static const struct pinconf_ops imx_pinconf_ops = {
> 	.pin_config_group_dbg_show = imx_pinconf_group_dbg_show,
> };
> 
>-static struct pinctrl_desc imx_pinctrl_desc = {
>-	.pctlops = &imx_pctrl_ops,
>-	.pmxops = &imx_pmx_ops,
>-	.confops = &imx_pinconf_ops,
>-	.owner = THIS_MODULE,
>-};
>-
> /*
>  * Each pin represented in fsl,pins consists of 5 u32 PIN_FUNC_ID and
>  * 1 u32 CONFIG, so 24 types in total for each pin.
>@@ -722,6 +715,7 @@ int imx_pinctrl_probe(struct platform_device *pdev,
> {
> 	struct regmap_config config = { .name = "gpr" };
> 	struct device_node *dev_np = pdev->dev.of_node;
>+	struct pinctrl_desc *imx_pinctrl_desc;
> 	struct device_node *np;
> 	struct imx_pinctrl *ipctl;
> 	struct resource *res;
>@@ -776,9 +770,18 @@ int imx_pinctrl_probe(struct platform_device *pdev,
> 		}
> 	}
> 
>-	imx_pinctrl_desc.name = dev_name(&pdev->dev);
>-	imx_pinctrl_desc.pins = info->pins;
>-	imx_pinctrl_desc.npins = info->npins;
>+	imx_pinctrl_desc = devm_kzalloc(&pdev->dev, sizeof(*imx_pinctrl_desc),
>+					GFP_KERNEL);
>+	if (!imx_pinctrl_desc)
>+		return -ENOMEM;
>+
>+	imx_pinctrl_desc->name = dev_name(&pdev->dev);
>+	imx_pinctrl_desc->pins = info->pins;
>+	imx_pinctrl_desc->npins = info->npins;
>+	imx_pinctrl_desc->pctlops = &imx_pctrl_ops,
>+	imx_pinctrl_desc->pmxops = &imx_pmx_ops,
>+	imx_pinctrl_desc->confops = &imx_pinconf_ops,
>+	imx_pinctrl_desc->owner = THIS_MODULE,
> 
> 	ret = imx_pinctrl_probe_dt(pdev, info);
> 	if (ret) {
>@@ -789,7 +792,7 @@ int imx_pinctrl_probe(struct platform_device *pdev,
> 	ipctl->info = info;
> 	ipctl->dev = info->dev;
> 	platform_set_drvdata(pdev, ipctl);
>-	ipctl->pctl = pinctrl_register(&imx_pinctrl_desc, &pdev->dev, ipctl);
>+	ipctl->pctl = pinctrl_register(imx_pinctrl_desc, &pdev->dev, ipctl);
> 	if (IS_ERR(ipctl->pctl)) {
> 		dev_err(&pdev->dev, "could not register IMX pinctrl driver\n");
> 		return PTR_ERR(ipctl->pctl);
>-- 
>2.6.2
>
