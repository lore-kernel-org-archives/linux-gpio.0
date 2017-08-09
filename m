From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 3/8] gpio: sta2x11: disallow unbinding the driver
Date: Wed,  9 Aug 2017 14:25:02 +0200
Message-ID: <20170809122507.11149-4-brgl@bgdev.pl>
References: <20170809122507.11149-1-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:34206 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752716AbdHIMZN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Aug 2017 08:25:13 -0400
Received: by mail-wm0-f47.google.com with SMTP id t138so13484531wmt.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Aug 2017 05:25:13 -0700 (PDT)
In-Reply-To: <20170809122507.11149-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

This driver is non-modular so explicitly disallow a driver unbind.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-sta2x11.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sta2x11.c b/drivers/gpio/gpio-sta2x11.c
index 9e705162da8d..56beb31c03db 100644
--- a/drivers/gpio/gpio-sta2x11.c
+++ b/drivers/gpio/gpio-sta2x11.c
@@ -432,6 +432,7 @@ static int gsta_probe(struct platform_device *dev)
 static struct platform_driver sta2x11_gpio_platform_driver = {
 	.driver = {
 		.name	= "sta2x11-gpio",
+		.suppress_bind_attrs = true,
 	},
 	.probe = gsta_probe,
 };
-- 
2.13.2

