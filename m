From: Johannes Thumshirn <jthumshirn@suse.de>
Subject: [PATCH 3/3] pinctrl: sunxi: Don't leak memory in case krealloc() failes
Date: Fri, 30 Sep 2016 14:14:13 +0200
Message-ID: <1475237653-15164-1-git-send-email-jthumshirn@suse.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Thumshirn <jthumshirn@suse.de>
List-Id: linux-gpio@vger.kernel.org

If krealloc() fails there's no way of freeing the memory previously allocated
for pctl->functions as it is overwritten by krealloc()'s return value. Fix
this by assigning the return value to a temporary variable first so we can do
error handling (which we didn't do at all before).

Signed-off-by: Johannes Thumshirn <jthumshirn@suse.de>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 54455af..57dd09b 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -787,6 +787,7 @@ static int sunxi_pinctrl_add_function(struct sunxi_pinctrl *pctl,
 static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 {
 	struct sunxi_pinctrl *pctl = platform_get_drvdata(pdev);
+	struct sunxi_pinctrl_function *functions;
 	int i;
 
 	pctl->ngroups = pctl->desc->npins;
@@ -833,9 +834,14 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 		}
 	}
 
-	pctl->functions = krealloc(pctl->functions,
-				pctl->nfunctions * sizeof(*pctl->functions),
-				GFP_KERNEL);
+	functions = krealloc(pctl->functions,
+			     pctl->nfunctions * sizeof(*pctl->functions),
+			     GFP_KERNEL);
+	if (!functions) {
+		kfree(pctl->functions);
+		return -ENOMEM;
+	}
+	pctl->functions = functions;
 
 	for (i = 0; i < pctl->desc->npins; i++) {
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
-- 
1.8.5.6
