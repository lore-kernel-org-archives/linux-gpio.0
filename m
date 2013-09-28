From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/3] gpio: twl4030: Remove redundant of_match_ptr
Date: Sat, 28 Sep 2013 17:34:09 +0530
Message-ID: <1380369849-1894-3-git-send-email-sachin.kamat@linaro.org>
References: <1380369849-1894-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:62574 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752802Ab3I1MEW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Sep 2013 08:04:22 -0400
Received: by mail-pb0-f51.google.com with SMTP id jt11so3612393pbb.24
        for <linux-gpio@vger.kernel.org>; Sat, 28 Sep 2013 05:04:21 -0700 (PDT)
In-Reply-To: <1380369849-1894-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sachin.kamat@linaro.org

The data structure of_match_ptr() protects is always compiled in.
Hence of_match_ptr() is not needed.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/gpio/gpio-twl4030.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index d8e4f6e..0c7e891 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -594,7 +594,7 @@ static struct platform_driver gpio_twl4030_driver = {
 	.driver = {
 		.name	= "twl4030_gpio",
 		.owner	= THIS_MODULE,
-		.of_match_table = of_match_ptr(twl_gpio_match),
+		.of_match_table = twl_gpio_match,
 	},
 	.probe		= gpio_twl4030_probe,
 	.remove		= gpio_twl4030_remove,
-- 
1.7.9.5

