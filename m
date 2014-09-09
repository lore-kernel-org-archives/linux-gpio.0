From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 04/26] gpio: msm-v1: use platform based module init
Date: Tue, 9 Sep 2014 15:59:29 +0530
Message-ID: <1410258591-28248-5-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:10155 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932389AbaIIK3x (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:29:53 -0400
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
 drivers/gpio/gpio-msm-v1.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-msm-v1.c b/drivers/gpio/gpio-msm-v1.c
index 73b7396..bec524e 100644
--- a/drivers/gpio/gpio-msm-v1.c
+++ b/drivers/gpio/gpio-msm-v1.c
@@ -706,10 +706,6 @@ static struct platform_driver gpio_msm_v1_driver = {
 	.probe = gpio_msm_v1_probe,
 	.id_table = gpio_msm_v1_device_ids,
 };
+module_platform_driver(gpio_msm_v1_driver);
 
-static int __init gpio_msm_v1_init(void)
-{
-	return platform_driver_register(&gpio_msm_v1_driver);
-}
-postcore_initcall(gpio_msm_v1_init);
 MODULE_LICENSE("GPL v2");
-- 
1.9.1

