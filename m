From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH gpio 3/4] gpio-arizona: drop owner assignment from platform_drivers
Date: Tue, 31 Mar 2015 09:49:10 +0530
Message-ID: <1427775551-6908-4-git-send-email-varkab@cdac.in>
References: <1427775551-6908-1-git-send-email-varkab@cdac.in>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:34937 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750783AbbCaETu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2015 00:19:50 -0400
Received: by pddn5 with SMTP id n5so7494810pdd.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2015 21:19:49 -0700 (PDT)
In-Reply-To: <1427775551-6908-1-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, Varka Bhadram <varkab@cdac.in>

This driver no need to set the owner field, it will be populated
by driver core.

Signed-off-by: Varka Bhadram <varkab@cdac.in>
---
 drivers/gpio/gpio-arizona.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index fe369f5..ab35038 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -155,7 +155,6 @@ static int arizona_gpio_remove(struct platform_device *pdev)
 
 static struct platform_driver arizona_gpio_driver = {
 	.driver.name	= "arizona-gpio",
-	.driver.owner	= THIS_MODULE,
 	.probe		= arizona_gpio_probe,
 	.remove		= arizona_gpio_remove,
 };
-- 
1.7.9.5

