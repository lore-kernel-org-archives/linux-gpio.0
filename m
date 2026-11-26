Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707430;
	b=ZpgugA8COhUm/88gLmMXANxxR7tJdudKhTD9GtR5j/ZmepKoW8Mf2Qz5qJ3OD764ctQh
	 A9i/i2qW0pvAd+hdQVVJLn3aZIKbRv0eekQ2y0UI5g2evUnfCCVcB0ZeOxiMr6tAoUlru
	 k5JVKk87v0zAh+S76PSXI2XgONzOAvRP4JB/nGWWr0lu/zcqxEel6mEXB/EFfnYPZvVMd
	 Qp/Gc5C5XPLYdMO7wOkIzGDWKdePKk1nX79n5+z4wKm5gD1y2xcfDKLBAfYjiLWH62iHk
	 NTEIdik0lxYy8juIOAP8CKEFFoCzgh/kDJldO4vJx7yQ9JAKbm2Vq0PfLE5AkgRaljQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707430;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=oeKlwJIRyKhwYBLWO4hNkFuUvVyK9PxO+nhoY8VAMJc=;
	b=KYNNNlk/x2ALNA7mj4ywThkoaFoHL0pZ/PzdPThU5/mWuq7rIDHm8fhNBhLTGZGdFTuU
	 2CJwvpqiZsC3quxbQZCk0e/bM8j84j3wfAgxYE/M74n+xY6ERN7r6nM9DlETKrc02V4V5
	 IV4u+nDaozt6CSMXtnSJ03rPuC8jOcC61Sozple97oTlMbpaRPS+XAQM4AML0PIP9GiOy
	 oo3D9gvx7zpx7ZfhDtfxPT4Hdad1C+2s1hxVCAUfP3337U+VoJC1aKWUDhura7anzNL3g
	 BmsxCC8RkvVQ7t0+wktl2cbGiLtS4nbLbfoyhhXN+7j/8PXqkyEQLgnZCn6Uu2mGJHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i4+ZSzic;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5086606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i4+ZSzic
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FA01F000C0;
	Thu, 26 Nov 2026 15:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707429;
	bh=oeKlwJIRyKhwYBLWO4hNkFuUvVyK9PxO+nhoY8VAMJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i4+ZSzic9metO9ODpII8FslgNXztbYhBr+Y8tAskYrCIyeMrr858KPcBkbVeF7a/1
	 Lsev9hxwETKk0mr6iEMjadtG979GKJ6mPWfiYs3TVEJk8NShyLHTlMHfA19pk3zkg4
	 Jh1JnAn6ni+/yQZBYG6hT+FFuXqPDlZBKp+nM70BqYM5EgRHp7oIQAOw8bJF/ob65G
	 VY1++4M/WykfdifiIEq2GoYSa1/U32OcZ5xkeuKJ9s0VElAmAoKf4WUfa6Ds7QLkWJ
	 jQxl4efCcJKw+kkPx1+BQh7tuvE/d+nB8mOqxP4He72OlVDjqt1ZsEXV/+l290ZZnB
	 SKGcXjA7kbsAA==
From: Michael Walle <mwalle@kernel.org>
To: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	Joseph Telaak <joseph@telaak.dev>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFT PATCH 01/13] gpio: regmap: remove gpiochip before tearing down irqchip
Date: Thu, 26 Nov 2026 16:35:12 +0100
Message-ID: <20261126153600.299724-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126153600.299724-1-mwalle@kernel.org>
References: <20261126153600.299724-1-mwalle@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Long Zhao <longzhao@ambarella.com>

gpiochip_remove() calls acpi_gpiochip_free_interrupts() and
gpiod_free_irqs(). Both still need the irq domain.
regmap_del_irq_chip() removes that domain, so remove the
gpiochip first.

Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")
Signed-off-by: Long Zhao <longzhao@ambarella.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-regmap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index ac6ad56f4479..10cf946dbfc4 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -593,12 +593,19 @@ EXPORT_SYMBOL_GPL(gpio_regmap_register);
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
2.47.3

