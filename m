From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 4/4] gpio-stmpe: Delete an unnecessary variable initialisation
 in stmpe_gpio_probe()
Date: Fri, 12 Jan 2018 21:04:32 +0100
Message-ID: <245fffed-3b76-5265-25b1-9f9077518894@users.sourceforge.net>
References: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:52586 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965081AbeALUEf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jan 2018 15:04:35 -0500
In-Reply-To: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 20:48:40 +0100

The local variable "irq" will eventually be set to an appropriate value
a bit later. Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpio/gpio-stmpe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index d51e27eb1c59..d9f370bf460d 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -432,8 +432,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	struct stmpe *stmpe = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *np = pdev->dev.of_node;
 	struct stmpe_gpio *stmpe_gpio;
-	int ret;
-	int irq = 0;
+	int ret, irq;
 
 	stmpe_gpio = kzalloc(sizeof(*stmpe_gpio), GFP_KERNEL);
 	if (!stmpe_gpio)
-- 
2.15.1

