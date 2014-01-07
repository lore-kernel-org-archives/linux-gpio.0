From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH Resend] gpio: lp3943: Remove redundant of_match_ptr helper
Date: Tue,  7 Jan 2014 11:57:18 +0530
Message-ID: <1389076038-16730-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:38987 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751904AbaAGGbN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2014 01:31:13 -0500
Received: by mail-pd0-f171.google.com with SMTP id z10so19140976pdj.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2014 22:31:12 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: lee.jones@linaro.org, sachin.kamat@linaro.org

'lp3943_gpio_of_match' is always compiled in. Hence the
helper macro is not needed.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-lp3943.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-lp3943.c b/drivers/gpio/gpio-lp3943.c
index 7b8db88ebb7b..a0341c92bcb4 100644
--- a/drivers/gpio/gpio-lp3943.c
+++ b/drivers/gpio/gpio-lp3943.c
@@ -231,7 +231,7 @@ static struct platform_driver lp3943_gpio_driver = {
 	.driver = {
 		.name = "lp3943-gpio",
 		.owner = THIS_MODULE,
-		.of_match_table = of_match_ptr(lp3943_gpio_of_match),
+		.of_match_table = lp3943_gpio_of_match,
 	},
 };
 module_platform_driver(lp3943_gpio_driver);
-- 
1.7.9.5

