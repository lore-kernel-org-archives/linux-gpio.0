Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793074770;
	b=YE1kZ+5frF8MyKn9z6q9NRfUZ7MMGBih5PROW5gEIIhGNFMCco0/brXlOY+kpjbEmZaH
	 oqf99oTPDf7pWCXNU9xEG+Hh4lo3py+K6ZiXYoZLzAnj0NbP1gib0cteAw2qErbN2fj/1
	 LlRQf0DyhTPqMTGw+6CAqw/04OgCSbfoEilqVIPXEui9AVdehkaGOMDnP+ctnUbltf82x
	 h4ZqsHjfv0PlEJrp3ZXEsQo+Nj111kxnyiFtWTL5Zg10Z++4aw8qzsEDn4AXUFlUPqLDB
	 5HWDMxJQX/3N/+D/zy6yGm4RXJDxeRHP+6qCptMq58TYEAV7CooGT3ukwgEpvLdkz7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074770;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+BV2XxKdkCDmCph23X+rU19KYGP6JPt3AiobjVr4wX4=;
	b=vVa6kjgro4xwZFXMGZOC2n82bOuK/KkphahZ4UDNWSPW7ScH6zd0ZylEnUzFTUd8Eii/
	 KAMLanSVkvBuw7Hq5zD96/TIQnP9wYe794eg5pXfdIPaWwjSUneveiRU2T31vpexoUDz1
	 BqNi5fmf1M3CA6SXU8aitpV524nVYMrFh1lhmRnjGOIlMXUvBT13ur5BgMo2uIBbiyuh9
	 fBVJ7Zp8bo50Ev4zC7xUcG8gS2D5nS/gdMgINIpqDl5yH1lyozzYXfLHOTwbXwfreWDWH
	 lrSrHRo0i7Ztts9iDLVW8IbfV3S5sTa5p/m/c/9M25IVlWytIt7/JNM0J79ysk9jYXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gsl3ngS3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD14D606A333;
	Tue, 27 Oct 2026 04:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gsl3ngS3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793074769;
	b=LaHIrpS/gpR6MMXstlbkWzYfTB0oPUCZWQcXRNuh4qMVHmMDIyTBQ0pAEnrYvq40JRTh
	 lNLK23VwlgodXLu8X7sMgB6UPvscu/HnEG9G3EhDo93FFgL/ESWa/XMM+4yU3F65MU/wV
	 +U6qr5jhCstc3zFq4voP9+jOtQAOK6kj5rZ7z9fKb9GDJkTLLl5C9HL+mlQ/l55J49NFv
	 SwxhsrEXZt7oLm/KZaVSp8ZHNKS6pz3I06tuCO4nf+Yw+NVEdFWFapyaPbHkyqN8NeqfJ
	 JDpcpOgx9KsPT0vHZqPKm8FT9oxknZcaipqBvAaEZpP474d/8pGxEi/4YOUM3W+9hlQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793074769;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+BV2XxKdkCDmCph23X+rU19KYGP6JPt3AiobjVr4wX4=;
	b=AUCqDdYQXb6wKfGzB+4T0smPSYp/3Pd5/2790sf0CQCZVYge6Cb9eUKeB9pGdMxhH+Xs
	 sB4OYNYZBxSBm/guRw7C0hPwa4JIkB+I4dH0idJfCpKjhk6KkH7DI/cPZ5EJTnGjfvIjL
	 cJv7LPETgkUBL4cv1T1klTZkcubrxFrmeV/PIfUGu3x6iSeTAF/UT7QYo5VJaeBZpc0St
	 ZUszxFAPw96jhOQJSw5vPtC4ob85Rf9ihdZ1s50kmcd0UsxdY07pe30hiKt7Uf0LdLYtP
	 8xzc04OLT4YSMG8/wBhByqpzdLDenUXitzVr7pUd5KTaodFN6UX5H9jPvcJTuBjtZYg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 829121F031E4;
	Tue, 27 Oct 2026 04:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793074769;
	bh=+BV2XxKdkCDmCph23X+rU19KYGP6JPt3AiobjVr4wX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Gsl3ngS3zAqSzI9fyfyI2yr75xroiTqgGdH6xPP6To+f56VKQ3uxk1zY84eGzk0+b
	 UAp3Sr19UOj9113tw5Yct+rpSp29EHDKrNgM4vxRXp1ny9153P+jU7m1L37lHK+Ps5
	 ak3CfFKIYcURXAuhBGBrl0+hQMFPlMpJ+7cSFBGDFBwWsy26L4y/4az6Xmf7HwzRPx
	 7FNAJOR/8aSgv7MY9DdWmGfMbUaEVCTulk55cdNfnMhttjQw2y1f82weGDL1pN8zkQ
	 nSAFreF1oMDtKMzFdibscREoeRGNZfAbgDvjP5unnXqnkM6z66ofv3WZgML/h/OgEg
	 b6aGYcpEFLjOg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D7AC044F94;
	Tue, 27 Oct 2026 04:19:26 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 27 Oct 2026 12:18:53 +0800
Subject: [PATCH v12 06/11] gpio: pl061: use cleanup helpers for locks
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-cv75-gpio-v12-6-c22555400e18@ambarella.com>
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
In-Reply-To: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793074764; l=3548;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=e5A/nNp2mkLE1rfoTrTjsYU6GxM1J3kjTE+rcuksRMg=;
 b=mcPLOijAXlO+UG5Vo9BosWoQv2BAIGeOaVK4NJSF5CVseFqRZbk0ChSd4w4+thz6Z4ukXPPsZ
 FbeQScbF57OBcA2tqyQcw1hjm9SJpCPVIUmAMIi3L8RMBkz4D6OsARA
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Convert raw_spinlock critical sections to guard()() from cleanup.h.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index e0ac8335bae4..a232b63fbc0b 100644
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
@@ -119,9 +119,9 @@ static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 	unsigned int mask = BIT(offset);
-	unsigned long flags;
 
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
@@ -162,7 +161,6 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	unsigned int gpioiev = 0;
 	unsigned int gpioibe = 0;
 	unsigned int gpiois = 0;
-	unsigned long flags;
 
 	if (offset < 0 || offset >= PL061_GPIO_NR)
 		return -EINVAL;
@@ -175,8 +173,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		return -EINVAL;
 	}
 
-
-	raw_spin_lock_irqsave(&pl061->lock, flags);
+	guard(raw_spinlock_irqsave)(&pl061->lock);
 
 	regmap_read(pl061->regmap, GPIOIEV, &gpioiev);
 	regmap_read(pl061->regmap, GPIOIS, &gpiois);
@@ -236,8 +233,6 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	regmap_write(pl061->regmap, GPIOIBE, gpioibe);
 	regmap_write(pl061->regmap, GPIOIEV, gpioiev);
 
-	raw_spin_unlock_irqrestore(&pl061->lock, flags);
-
 	return 0;
 }
 
@@ -266,9 +261,8 @@ static void pl061_irq_mask(struct irq_data *d)
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
 
-	raw_spin_lock(&pl061->lock);
-	regmap_clear_bits(pl061->regmap, GPIOIE, mask);
-	raw_spin_unlock(&pl061->lock);
+	scoped_guard(raw_spinlock, &pl061->lock)
+		regmap_clear_bits(pl061->regmap, GPIOIE, mask);
 
 	gpiochip_disable_irq(gc, d->hwirq);
 }
@@ -281,9 +275,8 @@ static void pl061_irq_unmask(struct irq_data *d)
 
 	gpiochip_enable_irq(gc, d->hwirq);
 
-	raw_spin_lock(&pl061->lock);
-	regmap_set_bits(pl061->regmap, GPIOIE, mask);
-	raw_spin_unlock(&pl061->lock);
+	scoped_guard(raw_spinlock, &pl061->lock)
+		regmap_set_bits(pl061->regmap, GPIOIE, mask);
 }
 
 /**

-- 
2.34.1


