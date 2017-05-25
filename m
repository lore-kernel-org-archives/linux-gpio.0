From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 03/10] gpio: mockup: be quiet unless something goes wrong
Date: Thu, 25 May 2017 10:33:40 +0200
Message-ID: <1495701227-28809-4-git-send-email-brgl@bgdev.pl>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:38530 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935944AbdEYId7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2017 04:33:59 -0400
Received: by mail-wm0-f49.google.com with SMTP id e127so95409141wmg.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2017 01:33:58 -0700 (PDT)
In-Reply-To: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

When inserting and removing the module repeatedly (e.g. when running
the libgpiod test-suite) the kernel log gets clobbered with messages
reporting successful creation of dummy gpiochips.

Remove this message and only emit logs when something bad happens.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index b1ee45c..c17578e 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -364,9 +364,6 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 
 			return ret;
 		}
-
-		dev_info(dev, "gpio<%d..%d> add successful!",
-			 base, base + ngpio);
 	}
 
 	return 0;
-- 
2.9.3

