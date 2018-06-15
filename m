From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 1/5] pinctrl: core: Return selector to the pinctrl driver
Date: Fri, 15 Jun 2018 04:11:37 -0700
Message-ID: <20180615111141.37184-2-tony@atomide.com>
References: <20180615111141.37184-1-tony@atomide.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180615111141.37184-1-tony@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Paul Cercueil <paul@crapouillou.net>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

We must return the selector from pinctrl_generic_add_group() so
pin controller device drivers can remove the right group if needed
for deferred probe for example.

Note that fixes are also needed for the pin controller drivers to
use the selector value.

Fixes: c7059c5ac70a ("pinctrl: core: Add generic pinctrl functions
for managing groups")
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/pinctrl/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -631,6 +631,7 @@ int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
 			      int *pins, int num_pins, void *data)
 {
 	struct group_desc *group;
+	int selector = pctldev->num_groups;
 
 	group = devm_kzalloc(pctldev->dev, sizeof(*group), GFP_KERNEL);
 	if (!group)
@@ -641,12 +642,12 @@ int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
 	group->num_pins = num_pins;
 	group->data = data;
 
-	radix_tree_insert(&pctldev->pin_group_tree, pctldev->num_groups,
+	radix_tree_insert(&pctldev->pin_group_tree, selector,
 			  group);
 
 	pctldev->num_groups++;
 
-	return 0;
+	return selector;
 }
 EXPORT_SYMBOL_GPL(pinctrl_generic_add_group);
 
-- 
2.17.1
