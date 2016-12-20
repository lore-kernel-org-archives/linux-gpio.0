From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/3] gpio: mockup: make pins_name_start static
Date: Tue, 20 Dec 2016 12:28:18 +0100
Message-ID: <1482233300-20078-2-git-send-email-bgolaszewski@baylibre.com>
References: <1482233300-20078-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wj0-f176.google.com ([209.85.210.176]:35302 "EHLO
        mail-wj0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762151AbcLTL2f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Dec 2016 06:28:35 -0500
Received: by mail-wj0-f176.google.com with SMTP id v7so173982741wjy.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Dec 2016 03:28:34 -0800 (PST)
In-Reply-To: <1482233300-20078-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>

This variable is not used outside this module. Make it static.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 1ef85b0..af0c1e8 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -43,7 +43,7 @@ static int gpio_mockup_ranges[MAX_GC << 1];
 static int gpio_mockup_params_nr;
 module_param_array(gpio_mockup_ranges, int, &gpio_mockup_params_nr, 0400);
 
-const char pins_name_start = 'A';
+static const char pins_name_start = 'A';
 
 static int mockup_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
-- 
2.9.3

