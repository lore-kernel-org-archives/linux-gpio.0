From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] gpio: tb10x: Remove redundant of_match_ptr helper
Date: Sat, 21 Dec 2013 15:57:41 +0530
Message-ID: <1387621661-22128-2-git-send-email-sachin.kamat@linaro.org>
References: <1387621661-22128-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:52861 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752324Ab3LUKbB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Dec 2013 05:31:01 -0500
Received: by mail-pb0-f53.google.com with SMTP id ma3so3604724pbc.12
        for <linux-gpio@vger.kernel.org>; Sat, 21 Dec 2013 02:31:01 -0800 (PST)
In-Reply-To: <1387621661-22128-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sachin.kamat@linaro.org

'tb10x_gpio_dt_ids' is always compiled in. Hence the
helper macro is not needed.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/gpio/gpio-tb10x.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 3162555ca1cb..07bce97647a6 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -318,7 +318,7 @@ static struct platform_driver tb10x_gpio_driver = {
 	.remove		= tb10x_gpio_remove,
 	.driver = {
 		.name	= "tb10x-gpio",
-		.of_match_table = of_match_ptr(tb10x_gpio_dt_ids),
+		.of_match_table = tb10x_gpio_dt_ids,
 		.owner	= THIS_MODULE,
 	}
 };
-- 
1.7.9.5

