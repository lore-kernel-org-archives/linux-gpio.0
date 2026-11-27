Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791168;
	b=KWuhPoH+zy6+mHPvi6aLXbCyohmj+pqoT9QNSHftcjbnY97BQTZl5nkSqxKHsQnnxmT7
	 D8EHjUtZgDEN79ksu8o9c+EzOfIkd3j0zWOGpBqrjLrdb9s9ICiEB4sQ+guXkNmzUApl6
	 PtizioIsEo+jOLdOLnKv1k6WoVh5rf/I2IlzUSap4HxCR77bB+Og2NvZswSemvagmutA7
	 4b1cL9MJ6DIvkCM3NdRfJGx4APVZQhmdMM9ushjKddzmN+dDwirJpOQmtR0YcEo4HDNrw
	 +r7mDTkCEoriML2p+mfdM51+I5oEwUAKbqy6CnCsmKDweCLZh3xF61LZcIpYizW52ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791168;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mM+nlrhKbK4WC6Y/6cYKALQYZxBYN1UNsFQbvT8nqEE=;
	b=A4goF+csVk6kGlur+HDCM1fU9BE0Q/JaJudPQqgR/z853tupXRk9G2d1s+OccpW/Prms
	 AubQBQk4hS0YsTh79r5H6peouw30sslUZkfaGBGWIx4EsZ26VbdDd2M5CzubFxzJI9VXt
	 gULiv7sPjmrNa+B13UBsF83QiBEFAmCOpjT3It6w1eUlj61rt1iChmQV09Ce88YK9e774
	 Q8bC7gRl/kWUDp+JI+k5knyeW/rObspABj680TjC5y7kb3Qp+BTTZ3WwObhNlGEVwvGsQ
	 zq2lVJ1dDLWWVrBqwP+GLwHohVayL4ZSMLQtlP1mIwNvXCU54YaDRLInA85T0GiDR4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gihniDC1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4AA606A31E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 14:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gihniDC1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918B11F0089A;
	Fri, 27 Nov 2026 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791167;
	bh=mM+nlrhKbK4WC6Y/6cYKALQYZxBYN1UNsFQbvT8nqEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gihniDC1lmZypNC8Y/eiRa2wq6wsHAkzMRItNiA5EnTIjX6EBSyPeJRmzXNUXBJiJ
	 jk7TaRWQRPDs5y/4NeWndSS30nDjJOPza4+Z03xMJ93On49w82HtG/3k4vO8YRfGI2
	 XyGIwa9/EYpoJVg8LOUiI+2blmVSZ3YYrXbP3TkbcXiWtXuTU9IqHYhOh9OKmrvdzU
	 Te2vZPqLXJ/oQpdOxUXmQZNeEwSzq/8hcxRWXx39Fqy46OhVHrVLcAMyfZ9o1I0HXQ
	 /bjPFYUWFxMvZxbFhne+xSJbRo0scUTCRibo+8r2XdvxYcNFwmyVxNwq0ymxdjhTFx
	 skhxThoqZA2fw==
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
Subject: [RFT PATCH v2 02/14] gpio: regmap: remove gpiochip before tearing down irqchip
Date: Fri, 27 Nov 2026 15:52:19 +0100
Message-ID: <20261127145232.814492-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127145232.814492-1-mwalle@kernel.org>
References: <20261127145232.814492-1-mwalle@kernel.org>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-regmap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 65e87177baf0..c04b79da5cdb 100644
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

