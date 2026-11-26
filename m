Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707434;
	b=3UNu9TsBijoUS8xMPnMQhrBFESI1UrDfPUz2JtU2Pw+L1h8o6tXSg8duyRcivQ2f4se3
	 7AsBaCY0ynBU68sTAj3PZiG8uvMM9p2oogj4pfW2/IEdFKl1Es+8y8efrOa1N8rf2j5PT
	 p8txt2cYc/1mWQp/2uNYscQkPR3Tcmqmza2nOfTskLuZScFyiEU5N45unzOiipIUUOQPK
	 hKFSQAmUu7yeMX38OWbtWoJupWdJfJ+UqCwObs93SsfZl607fFX8rlpDX5AoWZeGus3PX
	 Or+OEgftofLEobDhnFoHjCZH6XiXqIhUbvhDAdXsr/YCjr5PCRiasV3UDqNl8Utb9Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707434;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7pfVJR/ORfrWn6dyVrVVUDAmhIsxgWK2t2vjt2P4vmU=;
	b=3/I71tHz2AhrdUiZHfiq8dbOPjl/P/jfJ6jZMqSW1CyOOZ+1j2Fa9jPBKH5dw3fCcKxT
	 ngpwAPBv2fhC7x9Urfe3pwumfbVr5KyrgeU7Va+Ald+gGIE3rP8rpJAIEn3s0bQHDA+wl
	 wWp4vyIkRoT+tI8GJSDmJe8UM4thvJ+mOgN00R7EiIQehjEuT48EArWHCTDX8HQv4c/yz
	 dkmPFvQz9RdMQjVvMCFRQi9XHA+jVYXmSNsChZHqsCDMeSvUPpox6tOa6vCnAXdCGieil
	 p5+PVWTNBOF1HxmueMS9lNBN8jfyCGR3n5rmt9Xay2hIOnK87u6gHEJdYW6oJzGosEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=odsnZZ7W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F951606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=odsnZZ7W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809101F000D3;
	Thu, 26 Nov 2026 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707433;
	bh=7pfVJR/ORfrWn6dyVrVVUDAmhIsxgWK2t2vjt2P4vmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=odsnZZ7WLS2/JATgA6fFV4Ii2CHwZ8i6ifmc4eA41XTtkSxMgpCJyvUiClR6cGr4C
	 zTef7zhxbPI60nshxZy5TfsMP/hoH+FVBcaR7aoKKWth46B7gZxCqlVVbYtzfaFi/W
	 sKcQbCuXydUUOhm296wPpcLxn8zLQjZ2FDwTHwBZuNQSdPH5KwL+zxzimDoNn0ovvq
	 gJ8byL8bRqxAjBInGbK5xZiYzidURSwm8U+q21kqWLJkTZVQvJ4Ioo9APa3Kq6CmNG
	 YmbfOVPhonWVon5oTwQ+d5TMILpA71fyhG4RIswp0MRWXFSqQQPrRs742NB36eFwQ/
	 O3YMN12U8Ocsw==
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
Subject: [RFT PATCH 02/13] gpio: regmap: add a callback to create the IRQ domain
Date: Thu, 26 Nov 2026 16:35:13 +0100
Message-ID: <20261126153600.299724-3-mwalle@kernel.org>
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

At the moment, the an IRQ domain is attached via config->irg_domain.
This means, that it has to be created before the gpio_regmap_register()
call. The callbacks of the IRQ domain might use the gpio_regmap_*_irq()
functions. Consumers can already use the domain as soon as it is
created and this creates a small window where the callbacks dereference
a NULL pointer.

To fix this, create a new create_irq_domain() callback, that is called
after the gpio_chip is added.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-regmap.c  | 21 +++++++++++++++++++--
 include/linux/gpio/regmap.h | 10 +++++++++-
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 10cf946dbfc4..e8c13434ea5b 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -454,6 +454,14 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	if (config->reg_dir_out_base && config->reg_dir_in_base)
 		return ERR_PTR(-EINVAL);
 
+	/* there is only one way to provide an IRQ domain */
+	if (config->create_irq_domain && config->irq_domain)
+		return ERR_PTR(-EINVAL);
+#ifdef CONFIG_REGMAP_IRQ
+	if (config->create_irq_domain && config->regmap_irq_chip)
+		return ERR_PTR(-EINVAL);
+#endif
+
 	gpio = kzalloc_obj(*gpio);
 	if (!gpio)
 		return ERR_PTR(-ENOMEM);
@@ -545,6 +553,16 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	if (ret < 0)
 		goto err_free_bitmap_output;
 
+	irq_domain = config->irq_domain;
+
+	if (config->create_irq_domain) {
+		irq_domain = config->create_irq_domain(gpio);
+		if (IS_ERR(irq_domain)) {
+			ret = PTR_ERR(irq_domain);
+			goto err_remove_gpiochip;
+		}
+	}
+
 #ifdef CONFIG_REGMAP_IRQ
 	if (config->regmap_irq_chip) {
 		gpio->regmap_irq_line = config->regmap_irq_line;
@@ -558,9 +576,8 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 			goto err_remove_gpiochip;
 
 		irq_domain = regmap_irq_get_domain(gpio->irq_chip_data);
-	} else
+	}
 #endif
-	irq_domain = config->irq_domain;
 
 	if (irq_domain) {
 		ret = gpiochip_irqchip_add_domain(chip, irq_domain);
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 6fe0877717cb..eba0620c63d6 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -62,7 +62,14 @@ enum gpio_regmap_operation {
  *			same type, dat, set, etc) are not consecutive.
  * @ngpio_per_reg:	(Optional) Number of GPIOs per register
  * @irq_domain:		(Optional) IRQ domain if the controller is
- *			interrupt-capable
+ *			interrupt-capable. Cannot be used together with the
+ *			gpio_regmap_*_irq() callbacks. Use @create_irq_domain
+ *			instead.
+ * @create_irq_domain:	(Optional) Callback to create the IRQ domain in the
+ *			controller driver. Called after the gpio_chip is added
+ *			so the gpio_regmap_*_irq() have a valid gpio_regmap
+ *			pointer.
+ *			Mutually exclusive with @irq_domain and @regmap_irq_chip.
  * @fixed_direction_mask:
  *			(Optional) Bitmap representing the GPIO lines that
  *			make use of the @fixed_direction_output list to
@@ -133,6 +140,7 @@ struct gpio_regmap_config {
 	int reg_stride;
 	int ngpio_per_reg;
 	struct irq_domain *irq_domain;
+	struct irq_domain *(*create_irq_domain)(struct gpio_regmap *gpio);
 	unsigned long *fixed_direction_mask;
 	unsigned long *fixed_direction_output;
 
-- 
2.47.3

