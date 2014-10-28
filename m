From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH gpio v2 1/3] gpio: gpio-davinci: remove duplicate check on resource
Date: Tue, 28 Oct 2014 12:07:05 +0530
Message-ID: <1414478227-24674-2-git-send-email-varkab@cdac.in>
References: <1414478227-24674-1-git-send-email-varkab@cdac.in>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:40634 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933870AbaJ1GkO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Oct 2014 02:40:14 -0400
Received: by mail-pd0-f172.google.com with SMTP id r10so38415pdi.17
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2014 23:40:13 -0700 (PDT)
In-Reply-To: <1414478227-24674-1-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: gnurou@gmail.com, linus.walleij@linaro.org, Varka Bhadram <varkab@cdac.in>

Sanity check on resource happening with devm_ioremap_resource().

Signed-off-by: Varka Bhadram <varkab@cdac.in>
Acked-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpio-davinci.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 9f06825..3faf5f9 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -234,11 +234,6 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "Invalid memory resource\n");
-		return -EBUSY;
-	}
-
 	gpio_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(gpio_base))
 		return PTR_ERR(gpio_base);
-- 
1.7.9.5

