Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987758;
	b=1lQ31EQcOea2UcCjVxwokbDnGWYVe8PuHzen9QA8j4PBg/OSB9L8VXQgdxkxE3EPk5WL
	 eh4RcaTe2O/pE23GO1FlSh2U7nmAGppgqYUJ7qIL3KYHrSYDzbDiNTFzrSURmQ4VwLH34
	 xgR4jVklP3UtakN3VQWMrahOw58+s9t07GGOnqpS1AIab7DkVPxgvcY86CPc9q0hJ1cRM
	 Qv9wVbz4BrB9rK4xhjPCZbf8sB83ATh7tLnGsHzq21NsAdlpzI96J0iAmanlV/yuyiYo2
	 PPjE1lw5hUf1fF1A+TudS4pck7pLl7eGjWAD+UP1ZvnXIYHUHjnROA1R4NSg2KjB7Vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987758;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+BV2XxKdkCDmCph23X+rU19KYGP6JPt3AiobjVr4wX4=;
	b=PpwHBCVg7DeHQmAVGXzgz99A8ejd0v/KBA5ZEuSBsRiw7BwCo5nuWZU6tCKMwWu/S59F
	 X44J4eMdmdL4Xd3YGD9P6wGeVoVrmYziPjpd3lxgHDnlxHxbJZdUw4J5LfJ1w2jdG1Q1u
	 6ODvGxvWSp3iT5PaD4EvDQGr6e7yJm++Z2d3Oq2kNbXcOMh4VVt2hSIaNYJSJkGfvrMhj
	 AfdJbEHW9pRQLvD+PKt9EPOLxhdCjU2avXRB27ADkHgeeQRBUDqmvHFVrEACZxs8MeMDv
	 gJdcGeyGeEd+s002eOHrsiLBUcLhNNCZ0nMTJpOt9eOXaoS0FC27AwIEooFDw9C4TMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSm5jfAf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB52E60A2616;
	Wed, 18 Nov 2026 07:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSm5jfAf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794987758;
	b=uNAXsSmIHRKQvwZNFyPdAJW9aWVqvXiy7rdxGzA3n/GQ9oa+oX98tcG3QMwNW2s+QAVE
	 Sz6fo9crnqksqsvZvD4WOki6uxfQ3/Q8WzfuoeZUt8nfekeDyS11Q/7quODAXa9R8QADN
	 Mw/qBmqXXXnTeJAuyVg++T1q89hkgqh2UXG7OnV3QvD8a/nDO3Pmp/l9NDqx4Y7cekpYP
	 MBwVD9nZUXv8DKomfJMvIAimmHixdl2UOXK8jq0gL04/2TDnSAdLfOra0irOyOL1Mu9sC
	 9Zrx4SMTXV5dfQeS1KC71uBkXFYGdV2gsM/YTkxYvFRJ2c7SGwPZ8KNCI1z3dKOJ/tw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794987758;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+BV2XxKdkCDmCph23X+rU19KYGP6JPt3AiobjVr4wX4=;
	b=b81tvkcZ75ikFgd+z+Y6vNWsgt+T8ZcPHbDRuMEpJPNbCvkCuWmg0VUdcyQmWIoJyPyk
	 nqEoRuCB5JQyHjw1MO139or7a42GbQKQrdqqXv1GPnk2mjAIb3VcWsvzGrrZ+Eaw8OlJd
	 EVnfD3PFQDlJRXFjirjioOEtUrzvfFBhe9C03FK/ZcXzcF9PzQ9OZ7KsvUinUFzOS2IuS
	 uSh4s2BWgKNErbFOz2MzIZmLP02iJ1E5Nb6Kfk8HUq/AE4r7qDbM96YCFn7/QPq/nvF6u
	 j22nFfIX1WLia93JbxsH8BRyWZBoKNZNdMcKGqO38nB57NMG6FUHMpkV7V2gDpaYIdw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D05DD1F0092C;
	Wed, 18 Nov 2026 07:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987758;
	bh=+BV2XxKdkCDmCph23X+rU19KYGP6JPt3AiobjVr4wX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PSm5jfAf6eFmhHQJ3Q8dA51c2OnONsnG51bqwz4jybRTD0k4lgP+GTIYyawDF4zl4
	 unRDDtxHosYfSzss+jqiMmMIoa5V0aWLelnccc6gXUmdwKxyVn6ctAW5OP8KmJDdgz
	 +RVH+SPPds/r6IgDVm/exdnfaV9djnEngtElsUhtRn9GoR/DKNDYx2Df5CBGcB3IEI
	 t9RGZyb2K/Bln4zHf417iXnTONHke2QGMgkUsjT3jw488EVlJzG0XPt2USYQD3HXed
	 Uzr8V2vGjFlS395gTfAo5obmeUb2413yscqLFzA+86vFMjzaWUvkf0pqJH20HhLTA1
	 yB33aDIZJtBPQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1D9FD4AC6E;
	Wed, 18 Nov 2026 07:42:35 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Wed, 18 Nov 2026 15:42:24 +0800
Subject: [PATCH v15 07/14] gpio: pl061: use cleanup helpers for locks
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
Message-Id: <20261118-cv75-gpio-v15-7-e3c563673fe1@ambarella.com>
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
In-Reply-To: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987752; l=3548;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=e5A/nNp2mkLE1rfoTrTjsYU6GxM1J3kjTE+rcuksRMg=;
 b=DoM4qpsRVLmmIO4ERggHlgSNl2q+jCmxmKVP9mLM2DSqFqGUnwuH2PtpEklkgtfnZvME4Bnwl
 sKVm0UE6f7+D/ekdmocwn3Wj9Nk7JevczKmA2t5XYzPDw9rwxnybLcW
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


