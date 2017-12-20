From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/2] pinctrl: adi2: Delete an error message for a failed
 memory allocation in two functions
Date: Wed, 20 Dec 2017 13:01:52 +0100
Message-ID: <43b12b78-51a4-d590-9f61-e1ec61e291bc@users.sourceforge.net>
References: <3d620bed-db19-aacd-0ea5-4c64aee104d1@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3d620bed-db19-aacd-0ea5-4c64aee104d1@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sonic Zhang <sonic.zhang@analog.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Dec 2017 12:32:10 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-adi2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-adi2.c b/drivers/pinctrl/pinctrl-adi2.c
index 56aa181084ac..aefaf5855089 100644
--- a/drivers/pinctrl/pinctrl-adi2.c
+++ b/drivers/pinctrl/pinctrl-adi2.c
@@ -830,10 +830,8 @@ static int adi_gpio_pint_probe(struct platform_device *pdev)
 	struct gpio_pint *pint;
 
 	pint = devm_kzalloc(dev, sizeof(struct gpio_pint), GFP_KERNEL);
-	if (!pint) {
-		dev_err(dev, "Memory alloc failed\n");
+	if (!pint)
 		return -ENOMEM;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	pint->base = devm_ioremap_resource(dev, res);
@@ -946,10 +944,8 @@ static int adi_gpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	port = devm_kzalloc(dev, sizeof(struct gpio_port), GFP_KERNEL);
-	if (!port) {
-		dev_err(dev, "Memory alloc failed\n");
+	if (!port)
 		return -ENOMEM;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	port->base = devm_ioremap_resource(dev, res);
-- 
2.15.1
