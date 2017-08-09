From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 1/8] gpio: mxc: disallow unbinding the driver
Date: Wed,  9 Aug 2017 14:25:00 +0200
Message-ID: <20170809122507.11149-2-brgl@bgdev.pl>
References: <20170809122507.11149-1-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f181.google.com ([209.85.128.181]:37305 "EHLO
        mail-wr0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752233AbdHIMZM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Aug 2017 08:25:12 -0400
Received: by mail-wr0-f181.google.com with SMTP id 33so23359299wrz.4
        for <linux-gpio@vger.kernel.org>; Wed, 09 Aug 2017 05:25:11 -0700 (PDT)
In-Reply-To: <20170809122507.11149-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

This driver is non-modular so explicitly disallow a driver unbind.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mxc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 92692251ade1..a4d4a3527a24 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -507,6 +507,7 @@ static struct platform_driver mxc_gpio_driver = {
 	.driver		= {
 		.name	= "gpio-mxc",
 		.of_match_table = mxc_gpio_dt_ids,
+		.suppress_bind_attrs = true,
 	},
 	.probe		= mxc_gpio_probe,
 	.id_table	= mxc_gpio_devtype,
-- 
2.13.2

