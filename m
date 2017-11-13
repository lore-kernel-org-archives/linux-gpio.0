From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: uniphier: merge fix for "Update irq_domain_ops.activate() signature"
Date: Mon, 13 Nov 2017 22:36:16 +0900
Message-ID: <1510580176-7483-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:36183 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752820AbdKMNg4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Nov 2017 08:36:56 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Walleij <linus.walleij@linaro.org>

From: Stephen Rothwell <sfr@canb.auug.org.au>

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---

Changes since Stephens's original post
  - Fix checkpatch.pl warning
    "CHECK: Alignment should match open parenthesis"
  - Stretch lines since it fits in 80-columns


 drivers/gpio/gpio-uniphier.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index d62cea4..71b768e 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -300,13 +300,15 @@ static int uniphier_gpio_irq_domain_alloc(struct irq_domain *domain,
 	return irq_domain_alloc_irqs_parent(domain, virq, 1, &parent_fwspec);
 }
 
-static void uniphier_gpio_irq_domain_activate(struct irq_domain *domain,
-					      struct irq_data *data)
+static int uniphier_gpio_irq_domain_activate(struct irq_domain *domain,
+					     struct irq_data *data, bool early)
 {
 	struct uniphier_gpio_priv *priv = domain->host_data;
 	struct gpio_chip *chip = &priv->chip;
 
 	gpiochip_lock_as_irq(chip, data->hwirq + UNIPHIER_GPIO_IRQ_OFFSET);
+
+	return 0;
 }
 
 static void uniphier_gpio_irq_domain_deactivate(struct irq_domain *domain,
-- 
2.7.4

