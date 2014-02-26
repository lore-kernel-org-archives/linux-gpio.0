From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] gpio: gpio-pl061: Use %pa to print 'resource_size_t'
Date: Wed, 26 Feb 2014 08:12:37 -0300
Message-ID: <1393413157-29667-1-git-send-email-festevam@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yh0-f42.google.com ([209.85.213.42]:60050 "EHLO
	mail-yh0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750913AbaBZLMs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Feb 2014 06:12:48 -0500
Received: by mail-yh0-f42.google.com with SMTP id a41so711878yho.29
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2014 03:12:47 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>

From: Fabio Estevam <fabio.estevam@freescale.com>

The following build warning is generated when building multi_v7_defconfig with
LPAE option selected:

drivers/gpio/gpio-pl061.c:358:2: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'resource_size_t' [-Wformat=]

Fix it by using %pa to print 'resource_size_t'.

Reported-by: Olof's autobuilder <build@lixom.net>
Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/gpio/gpio-pl061.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index e528cb2..391766e 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -355,8 +355,8 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	}
 
 	amba_set_drvdata(adev, chip);
-	dev_info(&adev->dev, "PL061 GPIO chip @%08x registered\n",
-		adev->res.start);
+	dev_info(&adev->dev, "PL061 GPIO chip @%pa registered\n",
+		 &adev->res.start);
 
 	return 0;
 }
-- 
1.8.1.2

