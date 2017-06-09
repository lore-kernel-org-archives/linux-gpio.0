From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 6/8] gpio: mockup: improve the error message
Date: Fri,  9 Jun 2017 13:41:30 +0200
Message-ID: <1497008492-14907-7-git-send-email-brgl@bgdev.pl>
References: <1497008492-14907-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f180.google.com ([209.85.128.180]:35539 "EHLO
        mail-wr0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751755AbdFILls (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 07:41:48 -0400
Received: by mail-wr0-f180.google.com with SMTP id q97so30084848wrb.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2017 04:41:47 -0700 (PDT)
In-Reply-To: <1497008492-14907-1-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

Indicate the error number and make the message a bit more elaborate.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index ab2d38e..2f4fe41 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -373,8 +373,9 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 		}
 
 		if (ret) {
-			dev_err(dev, "gpio<%d..%d> add failed\n",
-				base, base < 0 ? ngpio : base + ngpio);
+			dev_err(dev,
+				"adding gpiochip failed: %d (base: %d, ngpio: %d)\n",
+				ret, base, base < 0 ? ngpio : base + ngpio);
 
 			return ret;
 		}
-- 
2.9.3

