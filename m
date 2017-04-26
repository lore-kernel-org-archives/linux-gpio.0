From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] gpio: f7188x: Add a missing break
Date: Wed, 26 Apr 2017 22:08:15 +0300
Message-ID: <20170426190815.vi2v3ef4j7ruspkg@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:48429 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965725AbdDZTI1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Apr 2017 15:08:27 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Marty Plummer <netz.kernel@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

A break statement was obviously intended here.

Fixes: d69843e416d3 ("gpio: f7188x: Add F71889A GPIO support.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index c013ff5deb70..13350c9d7f5e 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -398,6 +398,7 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 	case f71889a:
 		data->nr_bank = ARRAY_SIZE(f71889a_gpio_bank);
 		data->bank = f71889a_gpio_bank;
+		break;
 	case f71889f:
 		data->nr_bank = ARRAY_SIZE(f71889_gpio_bank);
 		data->bank = f71889_gpio_bank;
