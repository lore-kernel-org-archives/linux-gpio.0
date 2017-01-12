From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/5] pinctrl: mvebu: Delete an error message for a failed
 memory allocation in three functions
Date: Thu, 12 Jan 2017 17:33:32 +0100
Message-ID: <556cc243-6bd0-8da1-8c17-c1d6d6206735@users.sourceforge.net>
References: <12880bc6-1695-074a-788b-dd936f6f795a@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <12880bc6-1695-074a-788b-dd936f6f795a@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Jan 2017 16:15:34 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: Possible unnecessary 'out of memory' message

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/mvebu/pinctrl-mvebu.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
index c2f74572ac01..0618311e75dc 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
@@ -399,12 +399,8 @@ static int mvebu_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	*map = kmalloc_array(nmaps, sizeof(**map), GFP_KERNEL);
-	if (*map == NULL) {
-		dev_err(pctl->dev,
-			"cannot allocate pinctrl_map memory for %s\n",
-			np->name);
+	if (!*map)
 		return -ENOMEM;
-	}
 
 	n = 0;
 	of_property_for_each_string(np, "marvell,pins", prop, group) {
@@ -563,10 +559,8 @@ int mvebu_pinctrl_probe(struct platform_device *pdev)
 
 	pctl = devm_kzalloc(&pdev->dev, sizeof(struct mvebu_pinctrl),
 			GFP_KERNEL);
-	if (!pctl) {
-		dev_err(&pdev->dev, "unable to alloc driver\n");
+	if (!pctl)
 		return -ENOMEM;
-	}
 
 	pctl->desc.name = dev_name(&pdev->dev);
 	pctl->desc.owner = THIS_MODULE;
@@ -604,10 +598,8 @@ int mvebu_pinctrl_probe(struct platform_device *pdev)
 
 	pdesc = devm_kzalloc(&pdev->dev, pctl->desc.npins *
 			     sizeof(struct pinctrl_pin_desc), GFP_KERNEL);
-	if (!pdesc) {
-		dev_err(&pdev->dev, "failed to alloc pinctrl pins\n");
+	if (!pdesc)
 		return -ENOMEM;
-	}
 
 	for (n = 0; n < pctl->desc.npins; n++)
 		pdesc[n].number = n;
-- 
2.11.0
