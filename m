From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: tegra186: Remove tegra186_gpio_lock_class
Date: Fri, 10 Nov 2017 14:10:55 +0800
Message-ID: <20171110061055.12431-1-axel.lin@ingics.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:56262 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750802AbdKJGLI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Nov 2017 01:11:08 -0500
Received: by mail-pg0-f66.google.com with SMTP id 207so3884581pgc.12
        for <linux-gpio@vger.kernel.org>; Thu, 09 Nov 2017 22:11:08 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, Axel Lin <axel.lin@ingics.com>

This is no longer required after commit 959bc7b22bd2
("gpio: Automatically add lockdep keys")

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-tegra186.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index b55b5ca882c7..7f1aa4c21e0d 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -404,8 +404,6 @@ static const struct irq_domain_ops tegra186_gpio_irq_domain_ops = {
 	.xlate = tegra186_gpio_irq_domain_xlate,
 };
 
-static struct lock_class_key tegra186_gpio_lock_class;
-
 static int tegra186_gpio_probe(struct platform_device *pdev)
 {
 	unsigned int i, j, offset;
@@ -496,7 +494,6 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	irq->chip = &gpio->intc;
 	irq->domain_ops = &tegra186_gpio_irq_domain_ops;
 	irq->handler = handle_simple_irq;
-	irq->lock_key = &tegra186_gpio_lock_class;
 	irq->default_type = IRQ_TYPE_NONE;
 	irq->parent_handler = tegra186_gpio_irq;
 	irq->parent_handler_data = gpio;
-- 
2.11.0

