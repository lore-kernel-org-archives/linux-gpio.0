From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl: Delete an error message for a failed memory
 allocation in two functions
Date: Sat, 26 Aug 2017 20:33:11 +0200
Message-ID: <eb8e1ba3-f9f3-a780-73cc-4be7eb7145e6@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Aug 2017 20:30:04 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/devicetree.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 0e5c9f14a706..8ca8925b685d 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -83,7 +83,6 @@ static int dt_remember_or_free_map(struct pinctrl *p, const char *statename,
 	/* Remember the converted mapping table entries */
 	dt_map = kzalloc(sizeof(*dt_map), GFP_KERNEL);
 	if (!dt_map) {
-		dev_err(p->dev, "failed to alloc struct pinctrl_dt_map\n");
 		dt_free_map(pctldev, map, num_maps);
 		return -ENOMEM;
 	}
@@ -158,10 +157,8 @@ static int dt_remember_dummy_state(struct pinctrl *p, const char *statename)
 	struct pinctrl_map *map;
 
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
-	if (!map) {
-		dev_err(p->dev, "failed to alloc struct pinctrl_map\n");
+	if (!map)
 		return -ENOMEM;
-	}
 
 	/* There is no pctldev for PIN_MAP_TYPE_DUMMY_STATE */
 	map->type = PIN_MAP_TYPE_DUMMY_STATE;
-- 
2.14.0
