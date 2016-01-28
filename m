From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 1/2] gpio: davinci: Add the missing of-node pointer in the irq_domain_add_legacy function call
Date: Thu, 28 Jan 2016 19:08:50 +0530
Message-ID: <1453988331-17111-2-git-send-email-j-keerthy@ti.com>
References: <1453988331-17111-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:38513 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755242AbcA1Njk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2016 08:39:40 -0500
In-Reply-To: <1453988331-17111-1-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, j-keerthy@ti.com

Currently the first parameter of irq_domain_add_legacy is NULL.
irq_find_host function returns NULL when we do not populate the of_node
and hence irq_of_parse_and_map call fails whenever we want to request a
gpio irq. This fixes the request_irq failures for gpio interrupts.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/gpio/gpio-davinci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index ec58f42..c889f31 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -511,7 +511,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 			return irq;
 		}
 
-		irq_domain = irq_domain_add_legacy(NULL, ngpio, irq, 0,
+		irq_domain = irq_domain_add_legacy(dev->of_node, ngpio, irq, 0,
 							&davinci_gpio_irq_ops,
 							chips);
 		if (!irq_domain) {
-- 
1.9.1

