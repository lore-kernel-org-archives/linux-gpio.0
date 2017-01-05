From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] pinctrl: Drop error prints on kzalloc() failure
Date: Thu,  5 Jan 2017 08:07:55 -0800
Message-ID: <20170105160755.29254-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Upon failing kzalloc() will print an error message in the log, so
there's no need for additional printouts. Also standardizes the "!ptr"
vs "ptr == NULL" while I'm touching those lines.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Hope you don't find this too OCD-ish.

 drivers/pinctrl/core.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index d311d73852a0..e7fc461f471c 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -237,10 +237,8 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
 	}
 
 	pindesc = kzalloc(sizeof(*pindesc), GFP_KERNEL);
-	if (pindesc == NULL) {
-		dev_err(pctldev->dev, "failed to alloc struct pin_desc\n");
+	if (!pindesc)
 		return -ENOMEM;
-	}
 
 	/* Set owner */
 	pindesc->pctldev = pctldev;
@@ -882,11 +880,8 @@ static struct pinctrl_state *create_state(struct pinctrl *p,
 	struct pinctrl_state *state;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (state == NULL) {
-		dev_err(p->dev,
-			"failed to alloc struct pinctrl_state\n");
+	if (!state)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	state->name = name;
 	INIT_LIST_HEAD(&state->settings);
@@ -913,11 +908,8 @@ static int add_setting(struct pinctrl *p, struct pinctrl_dev *pctldev,
 		return 0;
 
 	setting = kzalloc(sizeof(*setting), GFP_KERNEL);
-	if (setting == NULL) {
-		dev_err(p->dev,
-			"failed to alloc struct pinctrl_setting\n");
+	if (!setting)
 		return -ENOMEM;
-	}
 
 	setting->type = map->type;
 
@@ -997,10 +989,8 @@ static struct pinctrl *create_pinctrl(struct device *dev,
 	 * a pin control handle with pinctrl_get()
 	 */
 	p = kzalloc(sizeof(*p), GFP_KERNEL);
-	if (p == NULL) {
-		dev_err(dev, "failed to alloc struct pinctrl\n");
+	if (!p)
 		return ERR_PTR(-ENOMEM);
-	}
 	p->dev = dev;
 	INIT_LIST_HEAD(&p->states);
 	INIT_LIST_HEAD(&p->dt_maps);
@@ -1357,10 +1347,8 @@ int pinctrl_register_map(struct pinctrl_map const *maps, unsigned num_maps,
 	}
 
 	maps_node = kzalloc(sizeof(*maps_node), GFP_KERNEL);
-	if (!maps_node) {
-		pr_err("failed to alloc struct pinctrl_maps\n");
+	if (!maps_node)
 		return -ENOMEM;
-	}
 
 	maps_node->num_maps = num_maps;
 	if (dup) {
@@ -1983,10 +1971,8 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 		return ERR_PTR(-EINVAL);
 
 	pctldev = kzalloc(sizeof(*pctldev), GFP_KERNEL);
-	if (pctldev == NULL) {
-		dev_err(dev, "failed to alloc struct pinctrl_dev\n");
+	if (!pctldev)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	/* Initialize pin control device struct */
 	pctldev->owner = pctldesc->owner;
-- 
2.11.0
