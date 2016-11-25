From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 1/2] gpio: arizona: Remove pointless set of platform drvdata
Date: Fri, 25 Nov 2016 13:48:29 +0000
Message-ID: <1480081710-27305-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:38851 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754060AbcKYNsH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Nov 2016 08:48:07 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, patches@opensource.wolfsonmicro.com

We use the gpio chip private data in all the callbacks so remove this
redundant line of code.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/gpio/gpio-arizona.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index 4824628..ed41537 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -140,8 +140,6 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	platform_set_drvdata(pdev, arizona_gpio);
-
 	return ret;
 
 err:
-- 
2.1.4

