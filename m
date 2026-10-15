Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5461A6808;
	Thu, 15 Oct 2026 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061672; cv=none; b=Jyg1Oojip4mvmlvkSn9UxIeK1rhZ5jPPcVGETJIp9u/G5rq/p5UHZNAz1/sqaEVQ3H01XDzyirmN4pOm9xMjNXsFLsxspIwIkWb2JwLeXazet4dfxK4MI19BGXnqhzAFLU8BFuFM3xskOXb7RASm8p3+jxpBJfeG8TZYEKvDCvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061672; c=relaxed/simple;
	bh=XnBqo5KK1FbSG3AyKIGTKrozlFujcTdv2js0zbZAoqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPzc7Ws29j83fRERLsLsMs7NcA3Pi9Q5PCcyt7WkQMoWkUbPpdmcuE2fD6F9dJ2Txkwz09QcOTSCpunMo1et5/ELIgxOcAIf1agA8Qe3aer4+e70Aowflard4Sx40MaBxktX0FT/BDk4mBrqJduIscqRSNjRbFq+rnlJzcyUIzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSbdiHG3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSbdiHG3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 591F5C4AF0C;
	Thu, 15 Oct 2026 10:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792061672;
	bh=XnBqo5KK1FbSG3AyKIGTKrozlFujcTdv2js0zbZAoqc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RSbdiHG38g6EtkMpqFmi0SaKAgJCHlZ4Fgm/Sh0elNyVrGnwbKonqzjE0OJ17Wnhc
	 Nz9RS1LiYb+Y/0l5FnA2tI7PiPhQeSR2X1NpT4NsMVvFVplqf0PQODKt0OoY2QfqJQ
	 dndydmT9CljLYx9ibhMcQwUxUXMCC1rIa4tYKuFrrPF/ZPOxOIe4Wkb+SJC/1/avCu
	 qCk966fXqfzzz46MCOHib6CVyEoDyBKfk1+9qPRcFKt8P8eETs/CGJzqje3qW2j4E8
	 puG6JnfoJkjQbGAuG0+7RyNxXv68nmUUybWUlqEaWIqDaX0gK44gj+qUMXgg+d0u1Z
	 dwQyUSTF+8Efw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A7ACC6B33;
	Thu, 15 Oct 2026 10:54:32 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 15 Oct 2026 18:53:33 +0800
Subject: [PATCH v10 6/8] gpio: pl061: use cleanup helpers for locks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-cv75-gpio-v10-6-3fe3eb315a55@ambarella.com>
References: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com>
In-Reply-To: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061669; l=3457;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=XQJyY0aHFk39z5/tEjscrBfUNuKA3uLfYN69iEwDoKE=;
 b=xiQsxHpOyv7AKSdoN/0W417bACM0jkLh8aRc+iEW16G/t8u8rCsna9TQvc1uZw4pUMTo2yL9u
 LEp/W72/aVaBsakYf5rmlxX5ya6kdYP5XxXh4mW9XfQPEEbEUKo2I4Z
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Convert raw_spinlock critical sections to guard() from cleanup.h.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 8f431d08573d..5c6d4209dc8e 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -10,6 +10,7 @@
  */
 #include <linux/amba/bus.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
@@ -105,11 +106,10 @@ static int pl061_get_direction(struct gpio_chip *gc, unsigned offset)
 static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&pl061->lock, flags);
+	guard(raw_spinlock_irqsave)(&pl061->lock);
+
 	regmap_clear_bits(pl061->regmap, GPIODIR, BIT(offset));
-	raw_spin_unlock_irqrestore(&pl061->lock, flags);
 
 	return 0;
 }
@@ -118,10 +118,10 @@ static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
 		int value)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
-	unsigned long flags;
 	unsigned int mask = BIT(offset);
 
-	raw_spin_lock_irqsave(&pl061->lock, flags);
+	guard(raw_spinlock_irqsave)(&pl061->lock);
+
 	regmap_assign_bits(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
 			   BIT(offset), value);
 	regmap_set_bits(pl061->regmap, GPIODIR, mask);
@@ -132,7 +132,6 @@ static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
 	 */
 	regmap_assign_bits(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
 			   BIT(offset), value);
-	raw_spin_unlock_irqrestore(&pl061->lock, flags);
 
 	return 0;
 }
@@ -161,7 +160,6 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 	int offset = irqd_to_hwirq(d);
-	unsigned long flags;
 	unsigned int gpioiev = 0;
 	unsigned int gpioibe = 0;
 	unsigned int gpiois = 0;
@@ -178,8 +176,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		return -EINVAL;
 	}
 
-
-	raw_spin_lock_irqsave(&pl061->lock, flags);
+	guard(raw_spinlock_irqsave)(&pl061->lock);
 
 	regmap_read(pl061->regmap, GPIOIEV, &gpioiev);
 	regmap_read(pl061->regmap, GPIOIS, &gpiois);
@@ -239,8 +236,6 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	regmap_write(pl061->regmap, GPIOIBE, gpioibe);
 	regmap_write(pl061->regmap, GPIOIEV, gpioiev);
 
-	raw_spin_unlock_irqrestore(&pl061->lock, flags);
-
 	return 0;
 }
 
@@ -270,9 +265,9 @@ static void pl061_irq_mask(struct irq_data *d)
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
 
-	raw_spin_lock(&pl061->lock);
+	guard(raw_spinlock)(&pl061->lock);
+
 	regmap_clear_bits(pl061->regmap, GPIOIE, mask);
-	raw_spin_unlock(&pl061->lock);
 
 	gpiochip_disable_irq(gc, d->hwirq);
 }
@@ -285,9 +280,9 @@ static void pl061_irq_unmask(struct irq_data *d)
 
 	gpiochip_enable_irq(gc, d->hwirq);
 
-	raw_spin_lock(&pl061->lock);
+	guard(raw_spinlock)(&pl061->lock);
+
 	regmap_set_bits(pl061->regmap, GPIOIE, mask);
-	raw_spin_unlock(&pl061->lock);
 }
 
 /**

-- 
2.34.1


