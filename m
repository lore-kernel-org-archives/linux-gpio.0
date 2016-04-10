From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: brcmstb: Return proper error if bank width is invalid
Date: Sun, 10 Apr 2016 18:15:15 +0800
Message-ID: <1460283315.10702.5.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:36464 "EHLO
	mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752083AbcDJKPU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 10 Apr 2016 06:15:20 -0400
Received: by mail-pf0-f179.google.com with SMTP id e128so104459436pfe.3
        for <linux-gpio@vger.kernel.org>; Sun, 10 Apr 2016 03:15:19 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org

Return proper error in brcmstb_gpio_probe if bank width is invalid.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-brcmstb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 42d51c5..e648914 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -461,6 +461,7 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 		bank->id = num_banks;
 		if (bank_width <= 0 || bank_width > MAX_GPIO_PER_BANK) {
 			dev_err(dev, "Invalid bank width %d\n", bank_width);
+			err = -EINVAL;
 			goto fail;
 		} else {
 			bank->width = bank_width;
-- 
2.5.0

