From: Johannes Thumshirn <jthumshirn@suse.de>
Subject: [PATCH 2/3] pinctrl: berlin: Don't leak memory if krealloc() fails
Date: Fri, 30 Sep 2016 14:13:56 +0200
Message-ID: <1475237636-15109-1-git-send-email-jthumshirn@suse.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Thumshirn <jthumshirn@suse.de>
List-Id: linux-gpio@vger.kernel.org

We're directly assigning krealoc()'s return value to pctrl->functions instead
of using a temporary value to handle error checking. This leaks memory in case
krealloc() failes. While we're at it, implement error handling for failed
allocations at all.

Signed-off-by: Johannes Thumshirn <jthumshirn@suse.de>
---
 drivers/pinctrl/berlin/berlin.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index 8f0dc02..76281c8 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -208,6 +208,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 	struct berlin_pinctrl *pctrl = platform_get_drvdata(pdev);
 	struct berlin_desc_group const *desc_group;
 	struct berlin_desc_function const *desc_function;
+	struct berlin_pinctrl_function *functions;
 	int i, max_functions = 0;
 
 	pctrl->nfunctions = 0;
@@ -236,9 +237,14 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 		}
 	}
 
-	pctrl->functions = krealloc(pctrl->functions,
-				    pctrl->nfunctions * sizeof(*pctrl->functions),
-				    GFP_KERNEL);
+	functions = krealloc(pctrl->functions,
+			     pctrl->nfunctions * sizeof(*pctrl->functions),
+			     GFP_KERNEL);
+	if (!functions) {
+		kfree(pctrl->functions);
+		return -ENOMEM;
+	}
+	pctrl->functions = functions;
 
 	/* map functions to theirs groups */
 	for (i = 0; i < pctrl->desc->ngroups; i++) {
-- 
1.8.5.6
