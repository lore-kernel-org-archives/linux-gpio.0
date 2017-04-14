From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 09/10] pinctrl: mxs: Use devm_kcalloc() in two functions
Date: Fri, 14 Apr 2017 11:22:24 +0200
Message-ID: <6b3abc7c-7fae-ce75-585c-8944153a9627@users.sourceforge.net>
References: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:53073 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753030AbdDNJWk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Apr 2017 05:22:40 -0400
In-Reply-To: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Gary Bisson <gary.bisson@boundarydevices.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Apr 2017 16:28:48 +0200

Multiplications for the size determination of memory allocations
indicated that array data structures should be processed.
Thus use the corresponding function "devm_kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/freescale/pinctrl-mxs.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.c b/drivers/pinctrl/freescale/pinctrl-mxs.c
index 41b5b07d5a2b..9e6dc0038c35 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.c
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.c
@@ -369,12 +369,12 @@ static int mxs_pinctrl_parse_group(struct platform_device *pdev,
 		return -EINVAL;
 	g->npins = length / sizeof(u32);
 
-	g->pins = devm_kzalloc(&pdev->dev, g->npins * sizeof(*g->pins),
+	g->pins = devm_kcalloc(&pdev->dev, g->npins, sizeof(*g->pins),
 			       GFP_KERNEL);
 	if (!g->pins)
 		return -ENOMEM;
 
-	g->muxsel = devm_kzalloc(&pdev->dev, g->npins * sizeof(*g->muxsel),
+	g->muxsel = devm_kcalloc(&pdev->dev, g->npins, sizeof(*g->muxsel),
 				 GFP_KERNEL);
 	if (!g->muxsel)
 		return -ENOMEM;
@@ -425,12 +425,12 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 		}
 	}
 
-	soc->functions = devm_kzalloc(&pdev->dev, soc->nfunctions *
+	soc->functions = devm_kcalloc(&pdev->dev, soc->nfunctions,
 				      sizeof(*soc->functions), GFP_KERNEL);
 	if (!soc->functions)
 		return -ENOMEM;
 
-	soc->groups = devm_kzalloc(&pdev->dev, soc->ngroups *
+	soc->groups = devm_kcalloc(&pdev->dev, soc->ngroups,
 				   sizeof(*soc->groups), GFP_KERNEL);
 	if (!soc->groups)
 		return -ENOMEM;
@@ -491,7 +491,8 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 
 		if (strcmp(fn, child->name)) {
 			f = &soc->functions[idxf++];
-			f->groups = devm_kzalloc(&pdev->dev, f->ngroups *
+			f->groups = devm_kcalloc(&pdev->dev,
+						 f->ngroups,
 						 sizeof(*f->groups),
 						 GFP_KERNEL);
 			if (!f->groups)
-- 
2.12.2

