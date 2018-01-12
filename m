From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/4] gpio-stmpe: Improve a size determination in
 stmpe_gpio_probe()
Date: Fri, 12 Jan 2018 21:02:39 +0100
Message-ID: <fdd3ba06-afb7-e36e-6e58-ac4e974d7720@users.sourceforge.net>
References: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:58677 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965128AbeALUCo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jan 2018 15:02:44 -0500
In-Reply-To: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 19:36:29 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpio/gpio-stmpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 79858c6ad31a..2cf30dcba82a 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -437,7 +437,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 
-	stmpe_gpio = kzalloc(sizeof(struct stmpe_gpio), GFP_KERNEL);
+	stmpe_gpio = kzalloc(sizeof(*stmpe_gpio), GFP_KERNEL);
 	if (!stmpe_gpio)
 		return -ENOMEM;
 
-- 
2.15.1

