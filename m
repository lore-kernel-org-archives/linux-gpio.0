From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [RFT PATCH] gpio: etraxfs: Fix devm_ioremap_resource return value check
Date: Thu,  9 Jul 2015 22:19:53 +0900
Message-ID: <1436447993-24630-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Value returned by devm_ioremap_resource() was checked for non-NULL but
devm_ioremap_resource() returns IOMEM_ERR_PTR, not NULL. In case of
error this could lead to dereference of ERR_PTR.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Fixes: d342571efea8 ("gpio: add ETRAXFS GPIO driver")
Cc: <stable@vger.kernel.org>

---

Patch only compile tested.
---
 drivers/gpio/gpio-etraxfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-etraxfs.c b/drivers/gpio/gpio-etraxfs.c
index 28071f4a5672..0e643140efde 100644
--- a/drivers/gpio/gpio-etraxfs.c
+++ b/drivers/gpio/gpio-etraxfs.c
@@ -117,8 +117,8 @@ static int etraxfs_gpio_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs = devm_ioremap_resource(dev, res);
-	if (!regs)
-		return -ENOMEM;
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	match = of_match_node(etraxfs_gpio_of_table, dev->of_node);
 	if (!match)
-- 
2.1.4
