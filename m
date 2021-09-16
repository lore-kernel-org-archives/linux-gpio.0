Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C08C433EF
	for <linux-gpio@archiver.kernel.org>; Thu, 16 Sep 2021 11:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D6BC61130
	for <linux-gpio@archiver.kernel.org>; Thu, 16 Sep 2021 11:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237706AbhIPLVK (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 16 Sep 2021 07:21:10 -0400
Received: from mx.socionext.com ([202.248.49.38]:27922 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235686AbhIPLVJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Sep 2021 07:21:09 -0400
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 16 Sep 2021 20:19:48 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id C9F6D2021820;
        Thu, 16 Sep 2021 20:19:48 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Thu, 16 Sep 2021 20:19:48 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id 70B4EAB192;
        Thu, 16 Sep 2021 20:19:48 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 2/3] gpio: uniphier: Use helper function to get IRQ hardware number
Date:   Thu, 16 Sep 2021 20:19:36 +0900
Message-Id: <1631791177-27229-3-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631791177-27229-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1631791177-27229-1-git-send-email-hayashi.kunihiko@socionext.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use helper function to get IRQ hardware number instead of direct access.
No functional changes intended.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/gpio/gpio-uniphier.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index 39dca14..dca96f5 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -180,7 +180,7 @@ static int uniphier_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 static void uniphier_gpio_irq_mask(struct irq_data *data)
 {
 	struct uniphier_gpio_priv *priv = data->chip_data;
-	u32 mask = BIT(data->hwirq);
+	u32 mask = BIT(irqd_to_hwirq(data));
 
 	uniphier_gpio_reg_update(priv, UNIPHIER_GPIO_IRQ_EN, mask, 0);
 
@@ -190,7 +190,7 @@ static void uniphier_gpio_irq_mask(struct irq_data *data)
 static void uniphier_gpio_irq_unmask(struct irq_data *data)
 {
 	struct uniphier_gpio_priv *priv = data->chip_data;
-	u32 mask = BIT(data->hwirq);
+	u32 mask = BIT(irqd_to_hwirq(data));
 
 	uniphier_gpio_reg_update(priv, UNIPHIER_GPIO_IRQ_EN, mask, mask);
 
@@ -200,7 +200,7 @@ static void uniphier_gpio_irq_unmask(struct irq_data *data)
 static int uniphier_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct uniphier_gpio_priv *priv = data->chip_data;
-	u32 mask = BIT(data->hwirq);
+	u32 mask = BIT(irqd_to_hwirq(data));
 	u32 val = 0;
 
 	if (type == IRQ_TYPE_EDGE_BOTH) {
@@ -297,7 +297,8 @@ static int uniphier_gpio_irq_domain_activate(struct irq_domain *domain,
 	struct uniphier_gpio_priv *priv = domain->host_data;
 	struct gpio_chip *chip = &priv->chip;
 
-	return gpiochip_lock_as_irq(chip, data->hwirq + UNIPHIER_GPIO_IRQ_OFFSET);
+	return gpiochip_lock_as_irq(chip,
+			irqd_to_hwirq(data) + UNIPHIER_GPIO_IRQ_OFFSET);
 }
 
 static void uniphier_gpio_irq_domain_deactivate(struct irq_domain *domain,
@@ -306,7 +307,8 @@ static void uniphier_gpio_irq_domain_deactivate(struct irq_domain *domain,
 	struct uniphier_gpio_priv *priv = domain->host_data;
 	struct gpio_chip *chip = &priv->chip;
 
-	gpiochip_unlock_as_irq(chip, data->hwirq + UNIPHIER_GPIO_IRQ_OFFSET);
+	gpiochip_unlock_as_irq(chip,
+			irqd_to_hwirq(data) + UNIPHIER_GPIO_IRQ_OFFSET);
 }
 
 static const struct irq_domain_ops uniphier_gpio_irq_domain_ops = {
-- 
2.7.4

