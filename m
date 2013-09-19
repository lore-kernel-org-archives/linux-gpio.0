From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] gpio: gpio-74x164: Remove redundant of_match_ptr
Date: Thu, 19 Sep 2013 17:28:08 +0530
Message-ID: <1379591888-8834-2-git-send-email-sachin.kamat@linaro.org>
References: <1379591888-8834-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:51049 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752183Ab3ISL56 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Sep 2013 07:57:58 -0400
Received: by mail-pd0-f173.google.com with SMTP id p10so8333044pdj.32
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2013 04:57:57 -0700 (PDT)
In-Reply-To: <1379591888-8834-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sachin.kamat@linaro.org

'gen_74x164_dt_ids' is always compiled in. Hence the macro is not
necessary.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/gpio/gpio-74x164.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index a51e893..1e04bf9 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -209,7 +209,7 @@ static struct spi_driver gen_74x164_driver = {
 	.driver = {
 		.name		= "74x164",
 		.owner		= THIS_MODULE,
-		.of_match_table	= of_match_ptr(gen_74x164_dt_ids),
+		.of_match_table	= gen_74x164_dt_ids,
 	},
 	.probe		= gen_74x164_probe,
 	.remove		= gen_74x164_remove,
-- 
1.7.9.5

