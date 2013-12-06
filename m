From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] gpio: tegra: add missing error handling to probe
Date: Fri,  6 Dec 2013 13:36:11 -0700
Message-ID: <1386362171-29311-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:32864 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751294Ab3LFUgR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2013 15:36:17 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>

From: Stephen Warren <swarren@nvidia.com>

The call to gpiochip_add() is not currently error-checked. Add the
missing checking.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
Perhaps this should be Cc: stable since Greg wants more stable patches,
but it's not a bug that's likely to be hit...
---
 drivers/gpio/gpio-tegra.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index cfd3b9037bc7..2b49f878b56c 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -425,6 +425,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	struct tegra_gpio_soc_config *config;
 	struct resource *res;
 	struct tegra_gpio_bank *bank;
+	int ret;
 	int gpio;
 	int i;
 	int j;
@@ -494,7 +495,11 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 
 	tegra_gpio_chip.of_node = pdev->dev.of_node;
 
-	gpiochip_add(&tegra_gpio_chip);
+	ret = gpiochip_add(&tegra_gpio_chip);
+	if (ret < 0) {
+		irq_domain_remove(irq_domain);
+		return ret;
+	}
 
 	for (gpio = 0; gpio < tegra_gpio_chip.ngpio; gpio++) {
 		int irq = irq_create_mapping(irq_domain, gpio);
-- 
1.8.1.5

