From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 04/10] pinctrl: imx: Improve another size determination in
 imx_pinctrl_parse_functions()
Date: Fri, 14 Apr 2017 11:14:13 +0200
Message-ID: <d9923862-efac-949d-9915-de19d3f13fa5@users.sourceforge.net>
References: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
Content-Language: en-GB
Sender: kernel-janitors-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Gary Bisson <gary.bisson@boundarydevices.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Apr 2017 15:20:43 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index f835e8210ace..44dbf6e38d79 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -590,9 +590,7 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 
 	for_each_child_of_node(np, child) {
 		func->group_names[i] = child->name;
-
-		grp = devm_kzalloc(info->dev, sizeof(struct group_desc),
-				   GFP_KERNEL);
+		grp = devm_kzalloc(info->dev, sizeof(*grp), GFP_KERNEL);
 		if (!grp)
 			return -ENOMEM;
 
-- 
2.12.2

