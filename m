From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH gpio] gpio-arizona: drop owner assignment from platform_drivers
Date: Mon, 12 Jan 2015 15:22:26 +0530
Message-ID: <1421056346-20238-1-git-send-email-varkab@cdac.in>
References: <No>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:44696 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751969AbbALJ4s (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jan 2015 04:56:48 -0500
Received: by mail-pa0-f45.google.com with SMTP id lf10so31170432pab.4
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2015 01:56:48 -0800 (PST)
In-Reply-To: <No>
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
index cd28ab66..eb5a0ce 100644
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

