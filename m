From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/3] gpio: clps711x: Remove redundant of_match_ptr
Date: Sat, 28 Sep 2013 17:34:08 +0530
Message-ID: <1380369849-1894-2-git-send-email-sachin.kamat@linaro.org>
References: <1380369849-1894-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:47755 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752802Ab3I1MET (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Sep 2013 08:04:19 -0400
Received: by mail-pd0-f173.google.com with SMTP id p10so3692686pdj.18
        for <linux-gpio@vger.kernel.org>; Sat, 28 Sep 2013 05:04:19 -0700 (PDT)
In-Reply-To: <1380369849-1894-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sachin.kamat@linaro.org

The data structure of_match_ptr() protects is always compiled in.
Hence of_match_ptr() is not needed.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/gpio/gpio-clps711x.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index 0edaf2c..0924f20 100644
--- a/drivers/gpio/gpio-clps711x.c
+++ b/drivers/gpio/gpio-clps711x.c
@@ -87,7 +87,7 @@ static struct platform_driver clps711x_gpio_driver = {
 	.driver	= {
 		.name		= "clps711x-gpio",
 		.owner		= THIS_MODULE,
-		.of_match_table	= of_match_ptr(clps711x_gpio_ids),
+		.of_match_table	= clps711x_gpio_ids,
 	},
 	.probe	= clps711x_gpio_probe,
 	.remove	= clps711x_gpio_remove,
-- 
1.7.9.5

