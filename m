From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 2/5] pinctrl: pinmux: Return selector to the pinctrl driver
Date: Tue, 19 Jun 2018 02:31:23 -0700
Message-ID: <20180619093126.74060-3-tony@atomide.com>
References: <20180619093126.74060-1-tony@atomide.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619093126.74060-1-tony@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Christ van Willegen <cvwillegen@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Paul Cercueil <paul@crapouillou.net>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

We must return the selector from pinmux_generic_add_function() so
pin controller device drivers can remove the right group if needed
for deferred probe for example. And we now must make sure that a
proper name is passed so we can use it to check if the entry already
exists.

Note that fixes are also needed for the pin controller drivers to
use the selector value.

Fixes: a76edc89b100 ("pinctrl: core: Add generic pinctrl functions for
managing groups")
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Christ van Willegen <cvwillegen@gmail.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/pinctrl/pinmux.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -308,7 +308,6 @@ static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
 		selector++;
 	}
 
-	dev_err(pctldev->dev, "function '%s' not supported\n", function);
 	return -EINVAL;
 }
 
@@ -775,6 +774,16 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				void *data)
 {
 	struct function_desc *function;
+	int selector;
+
+	if (!name)
+		return -EINVAL;
+
+	selector = pinmux_func_name_to_selector(pctldev, name);
+	if (selector >= 0)
+		return selector;
+
+	selector = pctldev->num_functions;
 
 	function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
 	if (!function)
@@ -785,12 +794,11 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 	function->num_group_names = num_groups;
 	function->data = data;
 
-	radix_tree_insert(&pctldev->pin_function_tree, pctldev->num_functions,
-			  function);
+	radix_tree_insert(&pctldev->pin_function_tree, selector, function);
 
 	pctldev->num_functions++;
 
-	return 0;
+	return selector;
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_add_function);
 
-- 
2.17.1
