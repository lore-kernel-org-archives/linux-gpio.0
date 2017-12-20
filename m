From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/2] pinctrl: adi2: Improve a size determination in two
 functions
Date: Wed, 20 Dec 2017 13:02:54 +0100
Message-ID: <528bd747-ad86-8480-f4f7-b8689448b336@users.sourceforge.net>
References: <3d620bed-db19-aacd-0ea5-4c64aee104d1@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:54732 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755060AbdLTMDB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Dec 2017 07:03:01 -0500
In-Reply-To: <3d620bed-db19-aacd-0ea5-4c64aee104d1@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sonic Zhang <sonic.zhang@analog.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Dec 2017 12:38:53 +0100

Replace the specification of data structures by variable references
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-adi2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-adi2.c b/drivers/pinctrl/pinctrl-adi2.c
index aefaf5855089..094a451db2a2 100644
--- a/drivers/pinctrl/pinctrl-adi2.c
+++ b/drivers/pinctrl/pinctrl-adi2.c
@@ -827,9 +827,8 @@ static int adi_gpio_pint_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct resource *res;
-	struct gpio_pint *pint;
+	struct gpio_pint *pint = devm_kzalloc(dev, sizeof(*pint), GFP_KERNEL);
 
-	pint = devm_kzalloc(dev, sizeof(struct gpio_pint), GFP_KERNEL);
 	if (!pint)
 		return -ENOMEM;
 
@@ -943,7 +942,7 @@ static int adi_gpio_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -EINVAL;
 
-	port = devm_kzalloc(dev, sizeof(struct gpio_port), GFP_KERNEL);
+	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
 
-- 
2.15.1

