From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 4/5] pinctrl: rza1: Fix selector use for groups and functions
Date: Thu,  5 Jul 2018 02:10:17 -0700
Message-ID: <20180705091018.60524-5-tony@atomide.com>
References: <20180705091018.60524-1-tony@atomide.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180705091018.60524-1-tony@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Christ van Willegen <cvwillegen@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "H . Nikolaus Schaller" <hns@goldelico.com>, Paul Cercueil <paul@crapouillou.net>, Sean Wang <sean.wang@mediatek.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: linux-gpio@vger.kernel.org

We must use a mutex around the generic_add functions and save the
function and group selector in case we need to remove them. Otherwise
the selector use will be racy for deferred probe at least.

Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Christ van Willegen <cvwillegen@gmail.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Sean Wang <sean.wang@mediatek.com>
Acked-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/pinctrl/pinctrl-rza1.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -1006,6 +1006,7 @@ static int rza1_dt_node_to_map(struct pinctrl_dev *pctldev,
 	const char *grpname;
 	const char **fngrps;
 	int ret, npins;
+	int gsel, fsel;
 
 	npins = rza1_dt_node_pin_count(np);
 	if (npins < 0) {
@@ -1055,18 +1056,19 @@ static int rza1_dt_node_to_map(struct pinctrl_dev *pctldev,
 	fngrps[0] = grpname;
 
 	mutex_lock(&rza1_pctl->mutex);
-	ret = pinctrl_generic_add_group(pctldev, grpname, grpins, npins,
-					NULL);
-	if (ret) {
+	gsel = pinctrl_generic_add_group(pctldev, grpname, grpins, npins,
+					 NULL);
+	if (gsel < 0) {
 		mutex_unlock(&rza1_pctl->mutex);
-		return ret;
+		return gsel;
 	}
 
-	ret = pinmux_generic_add_function(pctldev, grpname, fngrps, 1,
-					  mux_confs);
-	if (ret)
+	fsel = pinmux_generic_add_function(pctldev, grpname, fngrps, 1,
+					   mux_confs);
+	if (fsel < 0) {
+		ret = fsel;
 		goto remove_group;
-	mutex_unlock(&rza1_pctl->mutex);
+	}
 
 	dev_info(rza1_pctl->dev, "Parsed function and group %s with %d pins\n",
 				 grpname, npins);
@@ -1083,15 +1085,15 @@ static int rza1_dt_node_to_map(struct pinctrl_dev *pctldev,
 	(*map)->data.mux.group = np->name;
 	(*map)->data.mux.function = np->name;
 	*num_maps = 1;
+	mutex_unlock(&rza1_pctl->mutex);
 
 	return 0;
 
 remove_function:
-	mutex_lock(&rza1_pctl->mutex);
-	pinmux_generic_remove_last_function(pctldev);
+	pinmux_generic_remove_function(pctldev, fsel);
 
 remove_group:
-	pinctrl_generic_remove_last_group(pctldev);
+	pinctrl_generic_remove_group(pctldev, gsel);
 	mutex_unlock(&rza1_pctl->mutex);
 
 	dev_info(rza1_pctl->dev, "Unable to parse function and group %s\n",
-- 
2.17.1
