From: Yisheng Xie <xieyisheng1@huawei.com>
Subject: [PATCH v3 18/27] pinctrl: replace devm_ioremap_nocache with devm_ioremap
Date: Sat, 23 Dec 2017 19:00:53 +0800
Message-ID: <1514026853-33422-1-git-send-email-xieyisheng1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Cc: ysxie@foxmail.com, Yisheng Xie <xieyisheng1@huawei.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Default ioremap is ioremap_nocache, so devm_ioremap has the same
function with devm_ioremap_nocache, which can just be killed to
save the size of devres.o

This patch is to use use devm_ioremap instead of devm_ioremap_nocache,
which should not have any function change but prepare for killing
devm_ioremap_nocache.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Yisheng Xie <xieyisheng1@huawei.com>
---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c         | 2 +-
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c         | 4 ++--
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 2 +-
 drivers/pinctrl/pinctrl-amd.c                 | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 4b5cf0e..e2676fbe 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -1048,7 +1048,7 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 		return PTR_ERR(pinctrl->base0);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	pinctrl->base1 = devm_ioremap_nocache(&pdev->dev, res->start,
+	pinctrl->base1 = devm_ioremap(&pdev->dev, res->start,
 					resource_size(res));
 	if (!pinctrl->base1) {
 		dev_err(&pdev->dev, "unable to map I/O space\n");
diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
index 35c1765..df82e52 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
@@ -577,8 +577,8 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 		return PTR_ERR(pinctrl->base0);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	pinctrl->base1 = devm_ioremap_nocache(&pdev->dev, res->start,
-					      resource_size(res));
+	pinctrl->base1 = devm_ioremap(&pdev->dev, res->start,
+				      resource_size(res));
 	if (!pinctrl->base1) {
 		dev_err(&pdev->dev, "unable to map I/O space\n");
 		return -ENOMEM;
diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index a4e9f43..1f192e6 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -615,7 +615,7 @@ int imx1_pinctrl_core_probe(struct platform_device *pdev,
 	if (!res)
 		return -ENOENT;
 
-	ipctl->base = devm_ioremap_nocache(&pdev->dev, res->start,
+	ipctl->base = devm_ioremap(&pdev->dev, res->start,
 			resource_size(res));
 	if (!ipctl->base)
 		return -ENOMEM;
diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 61d830c..79de76c 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -825,8 +825,8 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	gpio_dev->base = devm_ioremap_nocache(&pdev->dev, res->start,
-						resource_size(res));
+	gpio_dev->base = devm_ioremap(&pdev->dev, res->start,
+					resource_size(res));
 	if (!gpio_dev->base)
 		return -ENOMEM;
 
-- 
1.8.3.1
