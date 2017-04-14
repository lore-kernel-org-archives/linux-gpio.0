From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 03/10] pinctrl: imx: Return directly after a failed
 devm_kcalloc() in imx_pinctrl_parse_functions()
Date: Fri, 14 Apr 2017 11:11:31 +0200
Message-ID: <786ef7b5-f889-7951-7479-e9e1f901f041@users.sourceforge.net>
References: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:62250 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751159AbdDNJLr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Apr 2017 05:11:47 -0400
In-Reply-To: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Gary Bisson <gary.bisson@boundarydevices.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Apr 2017 15:12:20 +0200

Add a check for a null pointer and return an error code
after a memory allocation failure was detected.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 975ed40cb774..f835e8210ace 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -585,6 +585,8 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 					 func->num_group_names,
 					 sizeof(*func->group_names),
 					 GFP_KERNEL);
+	if (!func->group_names)
+		return -ENOMEM;
 
 	for_each_child_of_node(np, child) {
 		func->group_names[i] = child->name;
-- 
2.12.2

