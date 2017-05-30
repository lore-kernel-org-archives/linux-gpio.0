From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 3/7] gpio: mockup: refuse to accept an odd number of GPIO ranges
Date: Tue, 30 May 2017 10:58:36 +0200
Message-ID: <1496134720-5363-4-git-send-email-brgl@bgdev.pl>
References: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:36706 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751305AbdE3I6u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2017 04:58:50 -0400
Received: by mail-wm0-f44.google.com with SMTP id 7so82898030wmo.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2017 01:58:50 -0700 (PDT)
In-Reply-To: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

Currently we ignore the last odd range value, since each chip is
described by two values. Be more strict and require the user to
pass an even number of ranges.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index d78e8e0..d95d37a 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -334,7 +334,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	int ret, i, base, ngpio;
 	char *chip_name;
 
-	if (gpio_mockup_params_nr < 2)
+	if (gpio_mockup_params_nr < 2 || (gpio_mockup_params_nr % 2))
 		return -EINVAL;
 
 	chips = devm_kzalloc(dev,
-- 
2.9.3

