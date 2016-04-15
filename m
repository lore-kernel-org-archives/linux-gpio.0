From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] gpio: brcmstb: missing error code
Date: Fri, 15 Apr 2016 17:45:28 +0300
Message-ID: <20160415144528.GC8953@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:22244 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751075AbcDOOpq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Apr 2016 10:45:46 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

We should set the error code before returning here.  Otherwise "err"
could be uninitialized or zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
