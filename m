Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63248374E57
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 22:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773442183; cv=none; b=j2NIVdGKP6t7+tjEtllxoynb7Q5swItyxp5xJJ8p0GfTKBjLjJ2jJHdIiC8yVa/t6a5dtk+nlqgQ5VuNulrHsytlrpY+D8EACPXSqp+7lIM6FLP2bIs06WVG+W/ckKnz70xMyy6tUQgMiCnAiCFVsFj54xvgCVsjlCVijgPVDdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773442183; c=relaxed/simple;
	bh=N5DyIqE87l1b5JvRYFHXJWGdsiu/nraLJ9saFE430kg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wwfu24I9oZ6b8yholJx9lHjHELOUdqwKc1jFADE8y4c8t+yQC4Tssh1k4GPOf/DfxF1QCbBOnQ2xfIRxKMH49MH2EVQcS10UHCY+WUgX4tIRoqBM/p1kcXKTJOjSiJavynWKTIrxz37VYrSsX50P/5DwBSToD7LDU8yi0ZUpN/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJevIg9n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJevIg9n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5739BC19423;
	Fri, 13 Mar 2026 22:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773442183;
	bh=N5DyIqE87l1b5JvRYFHXJWGdsiu/nraLJ9saFE430kg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LJevIg9n+c38IltyxrfwBYpm44tB8HbOa32wMuRUHKwleaBC4LUtrGR8RGBjAzKYi
	 u6HezYtqLSFTbj1S3UW0VwEu7lg5c/WwOa3TixLCWKa1LZ6mgQJ+8e1GFUencG4Vkm
	 zZGjToeyMNioJ6OawKcBMYS50tz9JkDtkmxkzE/TzkOGT+guEKk7qMpkSNOIdepKbB
	 Vwzabqs4htkK8HZyCh573kJyp4k/mjS+hUKwiWIz3qwMDGj+yEq95dZRl/0KLb6su2
	 iki9IyT8UVe7fP1CDP0ZIXd6fuRqI0Aulpib/j0j0SoT+0hn7MGQ1Q+X0mCgehIxLg
	 b+sjsnyiZBhNQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Mar 2026 23:49:38 +0100
Subject: [PATCH v2 2/3] gpio: altera: User gc helper variable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-gpio-mmio-more-v2-2-0f777b63105a@kernel.org>
References: <20260313-gpio-mmio-more-v2-0-0f777b63105a@kernel.org>
In-Reply-To: <20260313-gpio-mmio-more-v2-0-0f777b63105a@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Mun Yew Tham <mun.yew.tham@intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Make the code easier to read by adding a local gpio_chip *gc
variable.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-altera.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 9508d764cce4..cb04700c8ccd 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -234,6 +234,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int reg, ret;
 	struct altera_gpio_chip *altera_gc;
+	struct gpio_chip *gc;
 	struct gpio_irq_chip *girq;
 	int mapped_irq;
 
@@ -243,29 +244,31 @@ static int altera_gpio_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&altera_gc->gpio_lock);
 
+	gc = &altera_gc->gc;
+
 	if (device_property_read_u32(dev, "altr,ngpio", &reg))
 		/* By default assume maximum ngpio */
-		altera_gc->gc.ngpio = ALTERA_GPIO_MAX_NGPIO;
+		gc->ngpio = ALTERA_GPIO_MAX_NGPIO;
 	else
-		altera_gc->gc.ngpio = reg;
+		gc->ngpio = reg;
 
-	if (altera_gc->gc.ngpio > ALTERA_GPIO_MAX_NGPIO) {
+	if (gc->ngpio > ALTERA_GPIO_MAX_NGPIO) {
 		dev_warn(&pdev->dev,
 			"ngpio is greater than %d, defaulting to %d\n",
 			ALTERA_GPIO_MAX_NGPIO, ALTERA_GPIO_MAX_NGPIO);
-		altera_gc->gc.ngpio = ALTERA_GPIO_MAX_NGPIO;
+		gc->ngpio = ALTERA_GPIO_MAX_NGPIO;
 	}
 
-	altera_gc->gc.direction_input	= altera_gpio_direction_input;
-	altera_gc->gc.direction_output	= altera_gpio_direction_output;
-	altera_gc->gc.get		= altera_gpio_get;
-	altera_gc->gc.set		= altera_gpio_set;
-	altera_gc->gc.owner		= THIS_MODULE;
-	altera_gc->gc.parent		= &pdev->dev;
-	altera_gc->gc.base		= -1;
+	gc->direction_input	= altera_gpio_direction_input;
+	gc->direction_output	= altera_gpio_direction_output;
+	gc->get		= altera_gpio_get;
+	gc->set		= altera_gpio_set;
+	gc->owner		= THIS_MODULE;
+	gc->parent		= &pdev->dev;
+	gc->base		= -1;
 
-	altera_gc->gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", dev_fwnode(dev));
-	if (!altera_gc->gc.label)
+	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", dev_fwnode(dev));
+	if (!gc->label)
 		return -ENOMEM;
 
 	altera_gc->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -283,7 +286,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	}
 	altera_gc->interrupt_trigger = reg;
 
-	girq = &altera_gc->gc.irq;
+	girq = &gc->irq;
 	gpio_irq_chip_set_chip(girq, &altera_gpio_irq_chip);
 
 	if (altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH)

-- 
2.53.0

