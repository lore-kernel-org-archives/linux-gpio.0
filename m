From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 26/50] pinctrl: spear: Use devm_pinctrl_register() for pinctrl
 registration
Date: Wed, 24 Feb 2016 18:45:51 +0530
Message-ID: <1456319775-3216-27-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, spear-devel@list.st.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Use devm_pinctrl_register() for pin control registration and remove
need of .remove callback.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Viresh Kumar <vireshk@kernel.org>
Cc: spear-devel@list.st.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pinctrl/spear/pinctrl-spear.c     | 11 +----------
 drivers/pinctrl/spear/pinctrl-spear.h     |  1 -
 drivers/pinctrl/spear/pinctrl-spear1310.c |  6 ------
 drivers/pinctrl/spear/pinctrl-spear1340.c |  6 ------
 drivers/pinctrl/spear/pinctrl-spear300.c  |  6 ------
 drivers/pinctrl/spear/pinctrl-spear310.c  |  6 ------
 drivers/pinctrl/spear/pinctrl-spear320.c  |  6 ------
 7 files changed, 1 insertion(+), 41 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-spear.c b/drivers/pinctrl/spear/pinctrl-spear.c
index 0afaf79..4db52ba 100644
--- a/drivers/pinctrl/spear/pinctrl-spear.c
+++ b/drivers/pinctrl/spear/pinctrl-spear.c
@@ -395,7 +395,7 @@ int spear_pinctrl_probe(struct platform_device *pdev,
 	spear_pinctrl_desc.pins = machdata->pins;
 	spear_pinctrl_desc.npins = machdata->npins;
 
-	pmx->pctl = pinctrl_register(&spear_pinctrl_desc, &pdev->dev, pmx);
+	pmx->pctl = devm_pinctrl_register(&pdev->dev, &spear_pinctrl_desc, pmx);
 	if (IS_ERR(pmx->pctl)) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
 		return PTR_ERR(pmx->pctl);
@@ -403,12 +403,3 @@ int spear_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
-
-int spear_pinctrl_remove(struct platform_device *pdev)
-{
-	struct spear_pmx *pmx = platform_get_drvdata(pdev);
-
-	pinctrl_unregister(pmx->pctl);
-
-	return 0;
-}
diff --git a/drivers/pinctrl/spear/pinctrl-spear.h b/drivers/pinctrl/spear/pinctrl-spear.h
index 27c2cc8..aa5cf70 100644
--- a/drivers/pinctrl/spear/pinctrl-spear.h
+++ b/drivers/pinctrl/spear/pinctrl-spear.h
@@ -197,7 +197,6 @@ void pmx_init_gpio_pingroup_addr(struct spear_gpio_pingroup *gpio_pingroup,
 				 unsigned count, u16 reg);
 int spear_pinctrl_probe(struct platform_device *pdev,
 			struct spear_pinctrl_machdata *machdata);
-int spear_pinctrl_remove(struct platform_device *pdev);
 
 #define SPEAR_PIN_0_TO_101		\
 	PINCTRL_PIN(0, "PLGPIO0"),	\
diff --git a/drivers/pinctrl/spear/pinctrl-spear1310.c b/drivers/pinctrl/spear/pinctrl-spear1310.c
index 92611bb..1821068 100644
--- a/drivers/pinctrl/spear/pinctrl-spear1310.c
+++ b/drivers/pinctrl/spear/pinctrl-spear1310.c
@@ -2704,18 +2704,12 @@ static int spear1310_pinctrl_probe(struct platform_device *pdev)
 	return spear_pinctrl_probe(pdev, &spear1310_machdata);
 }
 
-static int spear1310_pinctrl_remove(struct platform_device *pdev)
-{
-	return spear_pinctrl_remove(pdev);
-}
-
 static struct platform_driver spear1310_pinctrl_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = spear1310_pinctrl_of_match,
 	},
 	.probe = spear1310_pinctrl_probe,
-	.remove = spear1310_pinctrl_remove,
 };
 
 static int __init spear1310_pinctrl_init(void)
diff --git a/drivers/pinctrl/spear/pinctrl-spear1340.c b/drivers/pinctrl/spear/pinctrl-spear1340.c
index f842e9d..c01fb23 100644
--- a/drivers/pinctrl/spear/pinctrl-spear1340.c
+++ b/drivers/pinctrl/spear/pinctrl-spear1340.c
@@ -2020,18 +2020,12 @@ static int spear1340_pinctrl_probe(struct platform_device *pdev)
 	return spear_pinctrl_probe(pdev, &spear1340_machdata);
 }
 
-static int spear1340_pinctrl_remove(struct platform_device *pdev)
-{
-	return spear_pinctrl_remove(pdev);
-}
-
 static struct platform_driver spear1340_pinctrl_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = spear1340_pinctrl_of_match,
 	},
 	.probe = spear1340_pinctrl_probe,
-	.remove = spear1340_pinctrl_remove,
 };
 
 static int __init spear1340_pinctrl_init(void)
diff --git a/drivers/pinctrl/spear/pinctrl-spear300.c b/drivers/pinctrl/spear/pinctrl-spear300.c
index d998a2c..111148d 100644
--- a/drivers/pinctrl/spear/pinctrl-spear300.c
+++ b/drivers/pinctrl/spear/pinctrl-spear300.c
@@ -677,18 +677,12 @@ static int spear300_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int spear300_pinctrl_remove(struct platform_device *pdev)
-{
-	return spear_pinctrl_remove(pdev);
-}
-
 static struct platform_driver spear300_pinctrl_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = spear300_pinctrl_of_match,
 	},
 	.probe = spear300_pinctrl_probe,
-	.remove = spear300_pinctrl_remove,
 };
 
 static int __init spear300_pinctrl_init(void)
diff --git a/drivers/pinctrl/spear/pinctrl-spear310.c b/drivers/pinctrl/spear/pinctrl-spear310.c
index 609b18a..a7b0000 100644
--- a/drivers/pinctrl/spear/pinctrl-spear310.c
+++ b/drivers/pinctrl/spear/pinctrl-spear310.c
@@ -400,18 +400,12 @@ static int spear310_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int spear310_pinctrl_remove(struct platform_device *pdev)
-{
-	return spear_pinctrl_remove(pdev);
-}
-
 static struct platform_driver spear310_pinctrl_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = spear310_pinctrl_of_match,
 	},
 	.probe = spear310_pinctrl_probe,
-	.remove = spear310_pinctrl_remove,
 };
 
 static int __init spear310_pinctrl_init(void)
diff --git a/drivers/pinctrl/spear/pinctrl-spear320.c b/drivers/pinctrl/spear/pinctrl-spear320.c
index c071144..e2b3817 100644
--- a/drivers/pinctrl/spear/pinctrl-spear320.c
+++ b/drivers/pinctrl/spear/pinctrl-spear320.c
@@ -3441,18 +3441,12 @@ static int spear320_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int spear320_pinctrl_remove(struct platform_device *pdev)
-{
-	return spear_pinctrl_remove(pdev);
-}
-
 static struct platform_driver spear320_pinctrl_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = spear320_pinctrl_of_match,
 	},
 	.probe = spear320_pinctrl_probe,
-	.remove = spear320_pinctrl_remove,
 };
 
 static int __init spear320_pinctrl_init(void)
-- 
2.1.4
