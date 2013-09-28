From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/3] gpio: adnp: Remove redundant of_match_ptr
Date: Sat, 28 Sep 2013 17:34:07 +0530
Message-ID: <1380369849-1894-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:60890 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752148Ab3I1MER (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Sep 2013 08:04:17 -0400
Received: by mail-pd0-f178.google.com with SMTP id w10so3657687pde.23
        for <linux-gpio@vger.kernel.org>; Sat, 28 Sep 2013 05:04:17 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sachin.kamat@linaro.org

The data structure of_match_ptr() protects is always compiled in.
Hence of_match_ptr() is not needed.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/gpio/gpio-adnp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index c0f3fc4..6439e0e 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -594,7 +594,7 @@ static struct i2c_driver adnp_i2c_driver = {
 	.driver = {
 		.name = "gpio-adnp",
 		.owner = THIS_MODULE,
-		.of_match_table = of_match_ptr(adnp_of_match),
+		.of_match_table = adnp_of_match,
 	},
 	.probe = adnp_i2c_probe,
 	.remove = adnp_i2c_remove,
-- 
1.7.9.5

