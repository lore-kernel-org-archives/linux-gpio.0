From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 08/10] gpio: mockup: don't return magic numbers from probe()
Date: Thu, 25 May 2017 10:33:45 +0200
Message-ID: <1495701227-28809-9-git-send-email-brgl@bgdev.pl>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37817 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937750AbdEYIeF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2017 04:34:05 -0400
Received: by mail-wm0-f46.google.com with SMTP id d127so88787077wmf.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2017 01:34:04 -0700 (PDT)
In-Reply-To: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

When the requested number of GPIO lines is 0, return -EINVAL, not
-1 which is -EPERM.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index f6efa97..3ffc3ce 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -381,7 +381,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 			ret = gpio_mockup_add(dev, &chips[i],
 					      chip_name, base, ngpio);
 		} else {
-			ret = -1;
+			ret = -EINVAL;
 		}
 
 		if (ret) {
-- 
2.9.3

