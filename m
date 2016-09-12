From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/8] gpio: palmas: fix implicit assumption module.h is present
Date: Mon, 12 Sep 2016 18:16:24 -0400
Message-ID: <20160912221631.15812-2-paul.gortmaker@windriver.com>
References: <20160912221631.15812-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:55386 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751234AbcILWQu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 18:16:50 -0400
In-Reply-To: <20160912221631.15812-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

This file is currently getting module.h from a global gpio header
and it will fail to build once we remove module.h from that.

However, the driver is controlled with the following Kconfig:

drivers/gpio/Kconfig:config GPIO_PALMAS
drivers/gpio/Kconfig:   bool "TI PALMAS series PMICs GPIO"

and hence the line of MODULE_DEVICE_TABLE is a no-op that can simply
be deleted.  In fact it should have been removed in an earlier commit
that did demodularization, however the unseen include prevented my
build testing from detecting it.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-palmas.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index 839474430229..3d818195e351 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -152,7 +152,6 @@ static const struct of_device_id of_palmas_gpio_match[] = {
 	{ .compatible = "ti,tps80036-gpio", .data = &tps80036_dev_data,},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, of_palmas_gpio_match);
 
 static int palmas_gpio_probe(struct platform_device *pdev)
 {
-- 
2.8.4

