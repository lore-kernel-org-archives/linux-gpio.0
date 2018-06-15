From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 2/5] pinctrl: pinmux: Return selector to the pinctrl driver
Date: Fri, 15 Jun 2018 04:11:38 -0700
Message-ID: <20180615111141.37184-3-tony@atomide.com>
References: <20180615111141.37184-1-tony@atomide.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180615111141.37184-1-tony@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Paul Cercueil <paul@crapouillou.net>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

We must return the selector from pinmux_generic_add_function() so
pin controller device drivers can remove the right group if needed
for deferred probe for example.

Note that fixes are also needed for the pin controller drivers to
use the selector value.

Fixes: a76edc89b100 ("pinctrl: core: Add generic pinctrl functions for
managing groups")
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/pinctrl/pinmux.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -775,6 +775,7 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				void *data)
 {
 	struct function_desc *function;
+	int selector = pctldev->num_functions;
 
 	function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
 	if (!function)
@@ -785,12 +786,12 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 	function->num_group_names = num_groups;
 	function->data = data;
 
-	radix_tree_insert(&pctldev->pin_function_tree, pctldev->num_functions,
+	radix_tree_insert(&pctldev->pin_function_tree, selector,
 			  function);
 
 	pctldev->num_functions++;
 
-	return 0;
+	return selector;
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_add_function);
 
-- 
2.17.1
