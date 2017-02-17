From: Daniel Gonzalez Cabanelas <dgcbueu@gmail.com>
Subject: [PATCH 2/2] gpio: ath79: set ngpio from platform data
Date: Fri, 17 Feb 2017 16:07:38 +0100
Message-ID: <2597502.p1XNpkbSeF@tool>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36438 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934206AbdBQPHq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Feb 2017 10:07:46 -0500
Received: by mail-wr0-f194.google.com with SMTP id z61so4788988wrc.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Feb 2017 07:07:45 -0800 (PST)
Received: from tool.localnet ([188.86.75.31])
        by smtp.googlemail.com with ESMTPSA id l140sm2029597wmg.12.2017.02.17.07.07.39
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Feb 2017 07:07:39 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

The number of GPIOs defaults to 32 for all ath79 platforms spite the 
code is checking the number of GPIOs from platform data. 
Set ngpio to the number of GPIOs obtained previously.

Signed-off-by: Daniel Gonzalez Cabanelas <dgcbueu@gmail.com>
diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 5a189b4..0edce15 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -274,6 +274,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	}
 	/* Use base 0 to stay compatible with legacy platforms */
 	ctrl->gc.base = 0;
+	ctrl->gc.ngpio = ath79_gpio_count;
 
 	err = gpiochip_add_data(&ctrl->gc, ctrl);
 	if (err) {

