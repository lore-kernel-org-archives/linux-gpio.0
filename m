Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C5C6DD1D
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711709810; cv=none; b=PyjIWoQONzTMaZTCfC6Fpe1XlIyQJ1XjcsZfMNHgvX4JMJ5c/Oou272HiSj5hvh8d2QqOIvByAlE4UfztUm01teqALd5HqEyldkFu7YQVthSFizbnya3UXlTbLtqzHqlYvddlJt9ncUgNJxcVruGjXL7ospUM6gpR+ouSW3hAtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711709810; c=relaxed/simple;
	bh=GI3pmjFDTQrAB0t+CrsgeVXfRQwlTIx8MloFcQOk+1Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9jnkP7Uw1hUk4wB0ijckFVzWA2n8BxSnbfnZfn0vum36VSh9X3jVDEY1QvSv1kM9EXq0KuCFjGu4g23MvDo58aGwrH6Cz4UZfnCYkFezBqZKCKSMU1UyiMgCtcpAHyHfz19Nmf3KlbS8JVJ+2FbTtTH5Co92z8JWvdO6rm+84Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 0663c7c8-edbb-11ee-b3cf-005056bd6ce9;
	Fri, 29 Mar 2024 12:56:41 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/11] pinctrl: aw9523: Use temporary variable for HW IRQ number
Date: Fri, 29 Mar 2024 12:55:19 +0200
Message-ID: <20240329105634.712457-6-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329105634.712457-1-andy.shevchenko@gmail.com>
References: <20240329105634.712457-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two different ways on how to get HW IRQ number in some functions.
Unify that by using temporary variable and irqd_to_hwirq() call.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 7db901216a94c..0f3361fa9ed88 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -428,12 +428,12 @@ static int aw9523_gpio_irq_type(struct irq_data *d, unsigned int type)
 static void aw9523_irq_mask(struct irq_data *d)
 {
 	struct aw9523 *awi = gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int n = d->hwirq % AW9523_PINS_PER_PORT;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	unsigned int n = hwirq % AW9523_PINS_PER_PORT;
 
-	regmap_update_bits(awi->regmap,
-			   AW9523_REG_INTR_DIS(d->hwirq),
+	regmap_update_bits(awi->regmap, AW9523_REG_INTR_DIS(hwirq),
 			   BIT(n), BIT(n));
-	gpiochip_disable_irq(&awi->gpio, irqd_to_hwirq(d));
+	gpiochip_disable_irq(&awi->gpio, hwirq);
 }
 
 /*
@@ -446,11 +446,11 @@ static void aw9523_irq_mask(struct irq_data *d)
 static void aw9523_irq_unmask(struct irq_data *d)
 {
 	struct aw9523 *awi = gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int n = d->hwirq % AW9523_PINS_PER_PORT;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	unsigned int n = hwirq % AW9523_PINS_PER_PORT;
 
-	gpiochip_enable_irq(&awi->gpio, irqd_to_hwirq(d));
-	regmap_update_bits(awi->regmap,
-			   AW9523_REG_INTR_DIS(d->hwirq),
+	gpiochip_enable_irq(&awi->gpio, hwirq);
+	regmap_update_bits(awi->regmap, AW9523_REG_INTR_DIS(hwirq),
 			   BIT(n), 0);
 }
 
-- 
2.44.0

