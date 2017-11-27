From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 16/18] gpio: mockup: modify the return value check for devm_irq_sim_init()
Date: Mon, 27 Nov 2017 11:48:52 +0100
Message-ID: <20171127104854.333-17-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:45151 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752205AbdK0Kt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Nov 2017 05:49:26 -0500
Received: by mail-wm0-f66.google.com with SMTP id 9so33105597wme.4
        for <linux-gpio@vger.kernel.org>; Mon, 27 Nov 2017 02:49:26 -0800 (PST)
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

As discussed with Marc Zyngier: irq_sim_init() and its devres variant
should return the base of the allocated interrupt range on success
rather than 0. This will be modified later - first, change the way
users handle the return value of these routines.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index cbc823e43151..0abb53038ba8 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -297,7 +297,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	}
 
 	rv = devm_irq_sim_init(dev, &chip->irqsim, gc->ngpio);
-	if (rv)
+	if (rv < 0)
 		return rv;
 
 	rv = devm_gpiochip_add_data(dev, &chip->gc, chip);
-- 
2.15.0

