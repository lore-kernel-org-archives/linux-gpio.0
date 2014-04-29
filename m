From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 14/17] gpio: tegra: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:44:14 +0900
Message-ID: <003f01cf6387$33045350$990cf9f0$%han@samsung.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17477 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755311AbaD2IoP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:44:15 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S000GOAXQWJ80@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:44:14 +0900 (KST)
In-reply-to: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Thierry Reding' <treding@nvidia.com>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-tegra.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 2b49f87..c6bdc2e 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -458,10 +458,8 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	tegra_gpio_banks = devm_kzalloc(&pdev->dev,
 			tegra_gpio_bank_count * sizeof(*tegra_gpio_banks),
 			GFP_KERNEL);
-	if (!tegra_gpio_banks) {
-		dev_err(&pdev->dev, "Couldn't allocate bank structure\n");
+	if (!tegra_gpio_banks)
 		return -ENODEV;
-	}
 
 	irq_domain = irq_domain_add_linear(pdev->dev.of_node,
 					   tegra_gpio_chip.ngpio,
-- 
1.7.10.4


