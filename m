From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH gpio v2 2/3] gpio: gpio-stp-xway: remove duplicate check on resource
Date: Tue, 28 Oct 2014 12:07:06 +0530
Message-ID: <1414478227-24674-3-git-send-email-varkab@cdac.in>
References: <1414478227-24674-1-git-send-email-varkab@cdac.in>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:55732 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933889AbaJ1GkR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Oct 2014 02:40:17 -0400
Received: by mail-pd0-f177.google.com with SMTP id v10so34287pde.22
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2014 23:40:17 -0700 (PDT)
In-Reply-To: <1414478227-24674-1-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: gnurou@gmail.com, linus.walleij@linaro.org, Varka Bhadram <varkab@cdac.in>

Sanity check on resource happening with devm_ioremap_resource().

Signed-off-by: Varka Bhadram <varkab@cdac.in>
Acked-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpio-stp-xway.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 7e359b7..7892e0f 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -199,21 +199,17 @@ static int xway_stp_hw_init(struct xway_stp *chip)
 
 static int xway_stp_probe(struct platform_device *pdev)
 {
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	struct resource *res;
 	const __be32 *shadow, *groups, *dsl, *phy;
 	struct xway_stp *chip;
 	struct clk *clk;
 	int ret = 0;
 
-	if (!res) {
-		dev_err(&pdev->dev, "failed to request STP resource\n");
-		return -ENOENT;
-	}
-
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	chip->virt = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(chip->virt))
 		return PTR_ERR(chip->virt);
-- 
1.7.9.5

