From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 21/26] gpio: lantiq: use platform based module init
Date: Tue, 9 Sep 2014 15:59:46 +0530
Message-ID: <1410258591-28248-22-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:24220 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756319AbaIIKad (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:30:33 -0400
In-Reply-To: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Kamlakant Patel <kamlakant.patel@linaro.org>, linux-gpio@vger.kernel.org

From: Kamlakant Patel <kamlakant.patel@linaro.org>

Convert *_initcall based probing of GPIO drivers to regular
module_init based probe.

Signed-off-by: Kamlakant Patel <kamlakant.patel@linaro.org>
---
 drivers/gpio/gpio-mm-lantiq.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index 2983dfb..142f638 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -149,10 +149,4 @@ static struct platform_driver ltq_mm_driver = {
 		.of_match_table = ltq_mm_match,
 	},
 };
-
-static int __init ltq_mm_init(void)
-{
-	return platform_driver_register(&ltq_mm_driver);
-}
-
-subsys_initcall(ltq_mm_init);
+module_platform_driver(ltq_mm_driver);
-- 
1.9.1

