From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/2] gpio: timberdale: Improve a size determination in
 timbgpio_probe()
Date: Sat, 10 Feb 2018 21:33:50 +0100
Message-ID: <df13123f-5c90-03e0-edb6-0ab9751b7aa2@users.sourceforge.net>
References: <da77f86c-a366-0a0f-10fd-9b7cfd879391@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:51725 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752222AbeBJUdy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 10 Feb 2018 15:33:54 -0500
In-Reply-To: <da77f86c-a366-0a0f-10fd-9b7cfd879391@users.sourceforge.net>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Feb 2018 21:13:28 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpio/gpio-timberdale.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index ff155e437210..6520a8475910 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -238,7 +238,7 @@ static int timbgpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	tgpio = devm_kzalloc(dev, sizeof(struct timbgpio), GFP_KERNEL);
+	tgpio = devm_kzalloc(dev, sizeof(*tgpio), GFP_KERNEL);
 	if (!tgpio)
 		return -EINVAL;
 
-- 
2.16.1

