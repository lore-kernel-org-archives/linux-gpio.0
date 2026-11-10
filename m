Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794285167;
	b=B6ZSqeBp0U9wZyhrM+qyoAtonzf70ijCnPrQje4hkgvrxdYUuCt9K+USN4YV21bAh/jl
	 3FKSZtb5nGonW1cCeXSemoeFh/dYzHH0TJRdiJT/EXJtly+1SaiXBFgLScH4wtmUouV0d
	 f9LWr3gM0eqd4JqBrMry1idcSCmsMmIH5iB4bLe1sMcKRau3rqEt9CSQmpzkbKwqB8AWz
	 AyVpqdbThwEt3xURYqh8TEz93UNIxR7udPz8IJcjdXmUsnB5HbmvLqTBPt61PAuA/vRDl
	 H8hTEqNTIEQn1T5rcl2dSw79HkZnbsBGeyN+9aKKtNQv91EOJHCEMsZKQsXMkq+F6hA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285167;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mQHo+Pq1IJv6wRo06t/mpmrPiKGrNMyrY0EUw4RM8cA=;
	b=1nj6/6r1orsO20wqWxk52Bwh9a85GtjGwaQP+IBE5XSz321e22BbtxG1YrgpaGQTR2bf
	 yTr3dkm4CZLAA5VHF53PEj9Iyy8A1ondJV8FmGQJoV6703G7nfkaU+o7nVjRZeckQNORy
	 44ESeFD6ux5fY2YABN8vZWAB2CPsMAynCGuIVJNLkFb6tJkTYK9KZOHr17A8JNCAYyklj
	 y+4Q0hXngYS57n/npJV1dgwD8hLy2ZdHX6VaPfZWHJkI3o988tvilMcatHJfzNP0+H6RP
	 QatuYzaa3m57nlVMHMS7f6Bi9aoS+gH69MnKu8ouhtoSfRomfow7ovEcbWjPw3d9tUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mUmjn93F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689B6606A338;
	Tue, 10 Nov 2026 04:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mUmjn93F
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794285167;
	b=rVOyOhqbUl9cgdkJUvxaWFGpxeccCbZ8d3YgvAyyMXf81BWFd6Ye8yYNr8Ma6qdf/Gs9
	 zb433hmWXOmz2RxGtJRViUnZTJ2az93aILg0uZ+qaf2W1zd11KIUu1L3y4DxnENKYppYd
	 DLb0rGFCnIBc7+B12pUN6SraK2R8+0QBclDe3/6JDUIPt/+92dzGG/Ln1Rv/Dyy4iDT4q
	 CMpRvS/Rv4oGQo0dfj0oPNG2l8RfGc9AfkjBix3N1zG6Po7HTbOvWh8Jsfbq3qjzqALPr
	 +c4hh/cQMC93pzX1lvnizG0zvq5q7tmL01JaEBpJrnnDjMco0Jn8tqm63ECp8rxIoUg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794285167;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mQHo+Pq1IJv6wRo06t/mpmrPiKGrNMyrY0EUw4RM8cA=;
	b=m+PDAi1TQhqHdzwLW9W6fDn/bKh7TJFPdH9jXILtjI2vLtn46Z6Y39TGf3My1oXUgJyK
	 0kyRPJiz1G3m3Z8J/C9eYzV36L9ymSHmWEuG7DuF27zvCo0cSALmZIZSgbxEDvWcN6d4H
	 LsDPP5XxWmEPVsGvMlpYPSMTmyZiP+Doa1yJ2YCqTSA6COUuMRe1GJWUx8ukUibiaarKX
	 O5v7zNNAkB1TlPNi1siSdV47qM4lxgCopS4EI2Pce3QanN6uLYUjZErWlYh1U6WO9HI8/
	 yYq7v+BcnWKETnp25MBk/Czfa6B9Z/XEfyONLN9O1X6fvz+v6L9463U9DNK2Skx+19g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 33CD51F008A3;
	Tue, 10 Nov 2026 04:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285167;
	bh=mQHo+Pq1IJv6wRo06t/mpmrPiKGrNMyrY0EUw4RM8cA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mUmjn93F+mmb5trzt9NmmRN6/oyGx5fmwBBKxUD9wXEAy6gZ/ivShSIIOzvSFQ/pv
	 wFrIMqb+YVen007giDRSarVKONaSKxJXWF2P9EDog9mTKIjE0d9jsy/PfsTNj8uXjq
	 W6Sv6ZjO4dfWMsbMgeZrIL1V2d5SvxxE20rrPoGUFG9S/P8fb/KFsdddVgOm6rpOL8
	 0d8JsFQtxAav25OvJkfF90FhYAXiz+crJAI5+cb9OGNHmsfAwgcTcXKEd9fgVmpOc/
	 97GU6tZNmBnDjCqwkUI4epnWYCTU+CGoEkjtlsxYEk0rI4zqr915iJrbxzMyEinevo
	 2279nGKKaP90A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B318548859;
	Tue, 10 Nov 2026 04:32:44 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 10 Nov 2026 12:32:28 +0800
Subject: [PATCH v14 03/14] gpio: regmap: remove gpiochip before tearing
 down irqchip
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
Message-Id: <20261110-cv75-gpio-v14-3-e586aad0467a@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794285162; l=1280;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=hUOMd6dzhgSqIYRo/goV9ScP4Xfisuex5VCHYS0+NCE=;
 b=na1xyTOzbfzZEjqluTbwt9g6U6lD+ZUvJugRpIFG7dQTUdXuUo33Nw/FSIJc9N3AyBKldq0J2
 f6kmVe0CQOOAG02lWvmlU4GzDehd8DA4JXZzZYlWegd8smFsFIFSop3
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

gpiochip_remove() calls acpi_gpiochip_free_interrupts() and
gpiod_free_irqs(). Both still need the irq domain.
regmap_del_irq_chip() removes that domain, so remove the
gpiochip first.

Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-regmap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 0a44deae3d01..1bfdb00dad95 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -445,12 +445,19 @@ EXPORT_SYMBOL_GPL(gpio_regmap_register);
  */
 void gpio_regmap_unregister(struct gpio_regmap *gpio)
 {
+	/*
+	 * gpiochip_remove() runs acpi_gpiochip_free_interrupts() and
+	 * gpiod_free_irqs(). Both still need the irq domain.
+	 * regmap_del_irq_chip() removes that domain, so remove the
+	 * gpiochip first.
+	 */
+	gpiochip_remove(&gpio->gpio_chip);
+
 #ifdef CONFIG_REGMAP_IRQ
 	if (gpio->irq_chip_data)
 		regmap_del_irq_chip(gpio->regmap_irq_line, gpio->irq_chip_data);
 #endif
 
-	gpiochip_remove(&gpio->gpio_chip);
 	bitmap_free(gpio->fixed_direction_output);
 	bitmap_free(gpio->fixed_direction_mask);
 	kfree(gpio);

-- 
2.34.1


