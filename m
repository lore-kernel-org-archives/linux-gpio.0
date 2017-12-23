From: Yisheng Xie <xieyisheng1@huawei.com>
Subject: [PATCH v3 06/27] gpio: replace devm_ioremap_nocache with devm_ioremap
Date: Sat, 23 Dec 2017 18:58:10 +0800
Message-ID: <1514026690-32863-1-git-send-email-xieyisheng1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga04-in.huawei.com ([45.249.212.190]:2720 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1757088AbdLWLG6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 23 Dec 2017 06:06:58 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Cc: ysxie@foxmail.com, Yisheng Xie <xieyisheng1@huawei.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

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
 drivers/gpio/gpio-ath79.c     | 3 +--
 drivers/gpio/gpio-em.c        | 6 ++----
 drivers/gpio/gpio-htc-egpio.c | 4 ++--
 drivers/gpio/gpio-xgene.c     | 3 +--
 4 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 5fad89d..7af2457 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -258,8 +258,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctrl->base = devm_ioremap_nocache(
-		&pdev->dev, res->start, resource_size(res));
+	ctrl->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
 	if (!ctrl->base)
 		return -ENOMEM;
 
diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index b86e09e..8797da8 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -300,16 +300,14 @@ static int em_gio_probe(struct platform_device *pdev)
 		goto err0;
 	}
 
-	p->base0 = devm_ioremap_nocache(&pdev->dev, io[0]->start,
-					resource_size(io[0]));
+	p->base0 = devm_ioremap(&pdev->dev, io[0]->start, resource_size(io[0]));
 	if (!p->base0) {
 		dev_err(&pdev->dev, "failed to remap low I/O memory\n");
 		ret = -ENXIO;
 		goto err0;
 	}
 
-	p->base1 = devm_ioremap_nocache(&pdev->dev, io[1]->start,
-				   resource_size(io[1]));
+	p->base1 = devm_ioremap(&pdev->dev, io[1]->start, resource_size(io[1]));
 	if (!p->base1) {
 		dev_err(&pdev->dev, "failed to remap high I/O memory\n");
 		ret = -ENXIO;
diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 271356e..ea3a2ee 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -299,8 +299,8 @@ static int __init egpio_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		goto fail;
-	ei->base_addr = devm_ioremap_nocache(&pdev->dev, res->start,
-					     resource_size(res));
+	ei->base_addr = devm_ioremap(&pdev->dev, res->start,
+				     resource_size(res));
 	if (!ei->base_addr)
 		goto fail;
 	pr_debug("EGPIO phys=%08x virt=%p\n", (u32)res->start, ei->base_addr);
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index f1c6ec1..9898c83 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -182,8 +182,7 @@ static int xgene_gpio_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	gpio->base = devm_ioremap_nocache(&pdev->dev, res->start,
-							resource_size(res));
+	gpio->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
 	if (!gpio->base) {
 		err = -ENOMEM;
 		goto err;
-- 
1.8.3.1

