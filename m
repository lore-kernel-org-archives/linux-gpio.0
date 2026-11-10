Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794285170;
	b=dFd787gCR6VzPwndq9Ro6ZGII6Q8/eZr8VPQTz7eAWEr1nCkin6PCdrziSVouvwPKcPI
	 COoJRWkjnFQvNf0nCD4YxBYI5NiOb451Mm1/U0m2dqmn5Ykh9GhgHEdFl6wrXkFFH3CAt
	 YLbYtYcB1qwADNbbNv8k+fyNbtsOTJCqhI3UmM97JAei8GKcw/kLzdMLG/QDCOSrtgSqq
	 2wUblGaEP1FG/6NXztYzMa1yMZ4WUVfi49pxv9ETmqyk8QXlRJ8CXeUSdkc3Vw8YBu4vi
	 DupnRiS01AHTRW0vTEUI+grNK2z0Zr1KxwYL0miwMnaWS1SU7hdS5ZFQzOjYEEyoW5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285170;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+BV2XxKdkCDmCph23X+rU19KYGP6JPt3AiobjVr4wX4=;
	b=RmbJEqibcioRzkzHT/zIB59A4R22xA9+ItIEWU1pdixl3oLzPNd8pPWg6UE5jn0zC1m3
	 hf1L9Nvgib25nnOXtJuE48zJ9KDPmTjTl3vsRui5uZwPf3Cjn9CSEUcoqg8EJ2RVvJvwD
	 9FImxi/NefXKiF1VK59fR89OlF9HAQyCMYfobrOOWfwOWRICmMeR3G5McwP6X/xrlIpEw
	 QKQPcgQpj2P7mC0PVLG5/VApUou6H2vKSPslY/N+j3ZiZ6bgPMmoOt+yqQR/T0UUT94nN
	 5UOKbWcXsLccvU3/uyvmxNOSzxYiUlIvPlDS1uuHyfI08TOZHfMUnxdVR6sjZOmOdRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKiX4NHK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB15360A2635;
	Tue, 10 Nov 2026 04:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKiX4NHK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794285169;
	b=xuDFp/LFBgg567kk2eTcNf85JtWSMcPmtRDrbNVbK3gUQn48rwCSTh0keHpfCk1q837D
	 h6E34E23An9v77yreoAOIQltp5WiskTHWc5RVlpS+7ALLPGUTXC/km1uYDdfI1b5AKwXB
	 fkgA9WfiTdn6o73Lbr6xyywfe8cGYAl8RgAYnLeUvCyK/pXJ2/+Z8TBuRxQuvcn+ouWMv
	 exg8MbOGEcKSYz0bHMuKOTRpXep4m5lgIgbCFFgNoV3O01RRD9M8i5mToPZ0upe548A4T
	 52CbtoTOzhslLBSN2/CgEqCL3HPgzJrvoRCEYqeJ2nmqdEX+h4+KMXqyZbH6NybDpPQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794285169;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+BV2XxKdkCDmCph23X+rU19KYGP6JPt3AiobjVr4wX4=;
	b=JJQ8AuT9p9Jg2kMb4qTyJ/qURhu2jMQiy9W2BMsht0Ye0sImp+vZjwpicFZkhBUMiFej
	 sTVBQlfjcL0ejiqBE0kMHGvapeb+TZM++fqelSgtO9QMIAXhuE7YBVX2QDgs7sq8e0Em7
	 Aj+YCVEpQm2Nt5OlqDewqYR4QOGH9ylWZx8fLCPvShPq0oDoVWAYheoE1QJUph4hPEh/E
	 KhfW4L86XSKENPN6XrIVvN+BHD08vuh+yVEE5LaATKz7iMlNCxwjalEJikKfRt7NIeFdw
	 5mCgozKMYzC55SpOM+mlZIk/HToIF2KdFR1xjhjlJ1hSsg8aD7v27liGKQpSYt97Azg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E16D91F008BD;
	Tue, 10 Nov 2026 04:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285169;
	bh=+BV2XxKdkCDmCph23X+rU19KYGP6JPt3AiobjVr4wX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kKiX4NHK3S+8SdqiFMBrydgwa02cn7UHWt2kGJx7k8v0pNsWSZENfrezAYoGqFX7k
	 PAe++pSZ258arIrv+XOleMWpR3MqdSJGbXk7ZWkEa7kS9F22ZwyqielfVoz9XwWy9F
	 rAIcxahTcCnJAXyfd51YkSmN19Ao0JQIn72k3NBn478tAI4hyyqyiis0GjF6AykmLM
	 dmOah8WBR36/XixbW31HoYtjmD2V8bSOOUW/WEVtvc0M2RGYiFEKzMR/Iulu4fyHxn
	 AUIXindNovzFEGPtG2fiFp67G9qZuTMbC+V0UqB3qjDWOpEeTE/xfITjrlzye8FuE8
	 1zHxymtWLAJtQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0596C48869;
	Tue, 10 Nov 2026 04:32:45 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 10 Nov 2026 12:32:32 +0800
Subject: [PATCH v14 07/14] gpio: pl061: use cleanup helpers for locks
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
Message-Id: <20261110-cv75-gpio-v14-7-e586aad0467a@ambarella.com>
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
In-Reply-To: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794285162; l=3548;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=e5A/nNp2mkLE1rfoTrTjsYU6GxM1J3kjTE+rcuksRMg=;
 b=E2vJom5/XDoX3vH2IcVNPha/8D3rAQBJm1lh/7lMnSVVs9HLkFy3m0H2wtLa74hWy2qMV8I8j
 EpdyqGXlaqKDgkQON4DdZy8/eGFOkUTcsn1LdBwni9IDdUtUiQxOIdi
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


