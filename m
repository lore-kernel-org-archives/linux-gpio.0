From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 35/50] pinctrl: as3722: Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 24 Feb 2016 18:46:00 +0530
Message-ID: <1456319775-3216-36-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3448 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757836AbcBXNcZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Feb 2016 08:32:25 -0500
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Laxman Dewangan <ldewangan@nvidia.com>

Use devm_pinctrl_register() for pin control registration and clean
error path.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/pinctrl/pinctrl-as3722.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index e844fdc..0808569 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -569,8 +569,8 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 	as3722_pinctrl_desc.name = dev_name(&pdev->dev);
 	as3722_pinctrl_desc.pins = as3722_pins_desc;
 	as3722_pinctrl_desc.npins = ARRAY_SIZE(as3722_pins_desc);
-	as_pci->pctl = pinctrl_register(&as3722_pinctrl_desc,
-					&pdev->dev, as_pci);
+	as_pci->pctl = devm_pinctrl_register(&pdev->dev, &as3722_pinctrl_desc,
+					     as_pci);
 	if (IS_ERR(as_pci->pctl)) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
 		return PTR_ERR(as_pci->pctl);
@@ -582,7 +582,7 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 	ret = gpiochip_add_data(&as_pci->gpio_chip, as_pci);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Couldn't register gpiochip, %d\n", ret);
-		goto fail_chip_add;
+		return ret;
 	}
 
 	ret = gpiochip_add_pin_range(&as_pci->gpio_chip, dev_name(&pdev->dev),
@@ -596,8 +596,6 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 
 fail_range_add:
 	gpiochip_remove(&as_pci->gpio_chip);
-fail_chip_add:
-	pinctrl_unregister(as_pci->pctl);
 	return ret;
 }
 
@@ -606,7 +604,6 @@ static int as3722_pinctrl_remove(struct platform_device *pdev)
 	struct as3722_pctrl_info *as_pci = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&as_pci->gpio_chip);
-	pinctrl_unregister(as_pci->pctl);
 	return 0;
 }
 
-- 
2.1.4

