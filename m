From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] pinctrl: imx: Check for memory allocation failure
Date: Sat,  6 May 2017 10:23:59 +0200
Message-ID: <20170506082359.6736-1-christophe.jaillet@wanadoo.fr>
Return-path: <kernel-janitors-owner@vger.kernel.org>
Sender: kernel-janitors-owner@vger.kernel.org
To: linus.walleij@linaro.org, gary.bisson@boundarydevices.com, vladimir_zapolskiy@mentor.com, tony@atomide.com, vivien.didelot@savoirfairelinux.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
List-Id: linux-gpio@vger.kernel.org

If 'devm_kzalloc' fails, a NULL pointer will be dereferenced.
Return -ENOMEM instead, as done for the other memory allocation just a
few lines below.
BTW, change the 'devm_kzalloc' into a 'devm_kcalloc'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 74bd90dfd7b1..90a946c028ff 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -581,9 +581,10 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 		dev_err(info->dev, "no groups defined in %s\n", np->full_name);
 		return -EINVAL;
 	}
-	func->group_names = devm_kzalloc(info->dev,
-					 func->num_group_names *
+	func->group_names = devm_kcalloc(info->dev, func->num_group_names,
 					 sizeof(char *), GFP_KERNEL);
+	if (!func->group_names)
+		return -ENOMEM;
 
 	for_each_child_of_node(np, child) {
 		func->group_names[i] = child->name;
-- 
2.11.0

