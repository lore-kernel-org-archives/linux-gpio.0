From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 2/2] gpio: arizona: Tidy up probe error path
Date: Fri, 25 Nov 2016 13:48:30 +0000
Message-ID: <1480081710-27305-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1480081710-27305-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:38850 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753881AbcKYNsH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Nov 2016 08:48:07 -0500
In-Reply-To: <1480081710-27305-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, patches@opensource.wolfsonmicro.com

There is some unnecessary complexity in the error path which now things
are converted to devm is actually very simple. This patch simplifies
things.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/gpio/gpio-arizona.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index ed41537..1f91557 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -137,13 +137,10 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n",
 			ret);
-		goto err;
+		return ret;
 	}
 
-	return ret;
-
-err:
-	return ret;
+	return 0;
 }
 
 static struct platform_driver arizona_gpio_driver = {
-- 
2.1.4

