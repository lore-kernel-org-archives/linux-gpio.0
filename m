Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716206;
	b=GOLkI2Oo1qB9XAztLlH7+qozpydbfZZWxsYne8wQbYhUPDLRfp9YaeCltH/a4RVWcH/R
	 isXSaKTsjZ1GqhYFAQlcaQV3tL+7xLG3OFIiYE65oEHMfHmZthvMgY7cRyFr6U7g1l83i
	 pr/GLY7NQmPZMUW1itOW/9ZWusI1qYCKiGS8gHjL+Tp5V0Lglyj3fRIwUSR/iUE6Ir6XG
	 ydJxa9mF89DbdFw7X/xRIbbtZQDxnORKRWXJQVjOQoxy9yG6cT4Hh+lYtnC1TG1gfb1OP
	 CGukgC0S1IYKwSkUJj1vEKquOQvzlzxs3+29/LA1ZCC+4ZE8tYGNmXL3Isvo3J+69rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LmCDPWjrupqURISIQ2o3XzZ15fkxpkvR1tEng3naGzY=;
	b=fXV2NWs790wUpyt1y/fQZO3yqv7sF6ZvscTxQpZRXm3dU+G/1e1QFAN0rjOFF3sFgG3p
	 /C16iLsIY4/+Q/e5gM3z0XQcLD/Ens6hYUg8UXTi91sI2/ZKHMm4xvZ0hTdnS9lEuYDlM
	 pAoqK60bIK+1cyaA6Cl2AJt4WvOxZe5ZqYC60k8deKL3fdxrzXqXC6GdqSXozEDZ0dduv
	 cavtvEnSesT+MXvPOR/VKbXsrul4QmrFFY+yze+pLUtP0z31qIJ+MXFFz247XUa8ryq7/
	 ut2KWMlzihBinnxfNkjAr30bvdXcQBlrKiuHXiFnM2PJV3Bjk07Hu+tp8ihlTShMkZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGGVAdVL;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058E3606A321
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 18:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 058E3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGGVAdVL
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso4204340f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716204; x=1796321004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LmCDPWjrupqURISIQ2o3XzZ15fkxpkvR1tEng3naGzY=;
        b=DGGVAdVLWwih4xQPhZ2nnJebAZpgbfU4u502n00NfGcvLwApQNQ3BYmAbvcGaZiX7j
         HLkHsUi2Onuu5nwO+TjosgxIveO06TBLS5DPcgUiGRrIDJIttnf9oWO610xi83/czv8f
         6IppHNWJAG6baCilpfrBQMH2hfGK+A7sEo1K3CC/m+f6ccIq7Hm8p5X8WUKMgYX/RxtK
         Y8XXduL56beknK1frfxBkUOyX6JeshUDeSlsCnLVgoq0isvWAsDJjtD16MZJw7gQwBII
         8tqRUPAM/sd0362h1C3yjcvm7eMEM8TY0gPQyY0X+hiiWyy0OEl4GmE2S33uOnvVEsVc
         2TRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716204; x=1796321004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LmCDPWjrupqURISIQ2o3XzZ15fkxpkvR1tEng3naGzY=;
        b=FSjjEsnzRmOKS8E7WYtxR8oQ8IdcgQ8uAdQR9mzZp0QKJhjzMnH3+eW0fe4HgytNSE
         vGQw4k7z3826phQB4A1tbdb+hLaKxn5MqkVU/VlXhtxgDzDPuBJgD+BD5OB5WSacgj5H
         8Qokn05LL2MBeyJKRAoyxI3Vcxmb2NfmevhLXNgW80JjJpVnfF92XrEfq2I6cOdzkYMO
         HnZDOZv3lq3ge3JrxeOClTCDWmtqz7nrI8//l3mlFxkVAqxWBLLCf+jjxBbZj21vbylF
         90zMtOyQ8gp5BIbhudTc9TuuBodTen0dgHGu7ydIOa5r04rxzsv1DxPZdVfKcS03Aw3a
         VXgw==
X-Forwarded-Encrypted: i=1; AL+hErFHBE1cZEHR0/gyPQhJn1ov44HXkvlCEaI/ckx6NFFAaYGfowKyZhK8VTbKEtkLH9qF0M1E3g6brsjs@vger.kernel.org
X-Gm-Message-State: APuU4Z/rXCun4G+3o8D+8UMIkqvJ8Sd8mSlNAbwFyFS+Yvekeute7AFd
	S9n3JJuCoPEUu2EWh+/3n1XeNjxWywSjPjtidyUvWWpOH3TO4ofG5Ts=
X-Gm-Gg: AZFdTZefgfs9lh4RHiPgc3PrE5LNVFjbbpgHRszu7vKeCK/oEPZctuxKtCKHgfhgU0Y
	7nSb+142Wa1Ehq1KUh+Mj8ARCTkkrwQMAj6T1o8ScVBoZ2MSp1bhWmJ1rgzeOZHQqd4C+k0yv8B
	a9ZqnPvzj3CXPTs8KjP0yTCu1Qj/faTf7RTuJZA+S51Zf0p9UhOkrU5FFvMws3za0LEZ1EbFWFx
	6Xp66S8ZBY11qQyWg+WNPNEdiUz+NnZty9E0fyiZpwHPMJcdcZjUHs+NoF7O6TEE2xACNKX44ql
	Bo6PLrCs/wiKzD78lwTU2BZbucks2r5Sozek2eEPbSTRxur8QLfnFnZ9iwdjt5G23IQNh6iEPX2
	9cSdRW7BXJnM3iJM+vphr+yt5n4Tb//z4OwzwOkJ6tjyX42wsuCB3ZHspneoasNp+759g3ba/2c
	tScRsUZuuaVOziKCCfPWDwI8MiKOtkIZIQb7QiOHZjg79Jpz8alWFcG0GQ1KwS9BxYEd1LmBn1B
	EcDgWOaJ+FzhbQJvLY6UpkpNj71yleBwPluQEH2PNToVZxZkZJPffPnAIDAIo1m2rYgCcUVUyBu
	7AlkXuoEfFBMMpBjP2cJWYBQ1CS/crxr/EMnDYHka3w8nIGmjXGZU2rgKXA61XgnWvBGHAc+Q0U
	VllJSWKXSeKZNZw1rM0O2QKfqyUycsVIpcdYiornLMtd2NivxT/JSQBQvH4Q=
X-Received: by 2002:a05:6000:288c:b0:4b4:2ce4:6dc1 with SMTP id ffacd0b85a97d-4b42ce46e7cmr24569293f8f.44.1795716204212;
        Thu, 26 Nov 2026 10:03:24 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:23 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 5/5] gpio: fxl6408: Add interrupt controller support
Date: Thu, 26 Nov 2026 19:03:15 +0100
Message-Id: <20261126180315.98034-6-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
References: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
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

The FXL6408 and PI4IOE5V6408 GPIO expanders feature an open-drain
active-low interrupt output asserted when an unmasked input transitions
away from the state programmed in INPUT_DEFAULT_STATE (register 0x09).
Reading INT_STS (register 0x13) clears all latched interrupt status bits
and releases the INT line, requiring the input to return to its default
state before another interrupt is generated.

Wire up interrupt controller support via regmap-irq and gpio-regmap for
rising and falling edge triggers, mark the clear-on-read registers
(DEVICE_ID and INT_STS) as precious, and clear RST_INT on system resume
in case power was lost during suspend.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpio/Kconfig        |   2 +
 drivers/gpio/gpio-fxl6408.c | 101 ++++++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0e197fd2bd6d2..a622cee9df1bd 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1204,8 +1204,10 @@ config GPIO_ADNP
 
 config GPIO_FXL6408
 	tristate "FXL6408 I2C GPIO expander"
+	select GPIOLIB_IRQCHIP
 	select GPIO_REGMAP
 	select REGMAP_I2C
+	select REGMAP_IRQ
 	help
 	  GPIO driver for Fairchild Semiconductor FXL6408 GPIO expander.
 
diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index ae9003fc513a1..d503383fb119b 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -13,11 +13,14 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/regmap.h>
 #include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/slab.h>
 
 #define FXL6408_REG_DEVICE_ID		0x01
 #define FXL6408_MF_FAIRCHILD		0b101
@@ -35,6 +38,12 @@
 /* Bits here make the output High-Z, instead of the OUTPUT value. */
 #define FXL6408_REG_OUTPUT_HIGH_Z	0x07
 
+/*
+ * Bits here define the expected input state of the GPIO.
+ * INT_STS bits are set when the input transitions away from this value.
+ */
+#define FXL6408_REG_INPUT_DEFAULT_STATE	0x09
+
 /* Bits here enable either pull-up or pull-down according to FXL6408_REG_PULL_UP. */
 #define FXL6408_REG_PULL_ENABLE		0x0b
 
@@ -44,6 +53,9 @@
 /* Returns the current status (1 = HIGH) of the input pins. */
 #define FXL6408_REG_INPUT_STATUS	0x0f
 
+/* Bits set here mask (disable) interrupts from the corresponding input pins. */
+#define FXL6408_REG_INT_MASK		0x11
+
 /*
  * Return the current interrupt status
  * This bit is HIGH if input GPIO != default state (register 09h).
@@ -59,9 +71,12 @@ static const struct regmap_range rd_range[] = {
 	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
 	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
 	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
+	{ FXL6408_REG_INPUT_DEFAULT_STATE, FXL6408_REG_INPUT_DEFAULT_STATE },
 	{ FXL6408_REG_PULL_ENABLE, FXL6408_REG_PULL_ENABLE },
 	{ FXL6408_REG_PULL_UP, FXL6408_REG_PULL_UP },
 	{ FXL6408_REG_INPUT_STATUS, FXL6408_REG_INPUT_STATUS },
+	{ FXL6408_REG_INT_MASK, FXL6408_REG_INT_MASK },
+	{ FXL6408_REG_INT_STS, FXL6408_REG_INT_STS },
 };
 
 static const struct regmap_range wr_range[] = {
@@ -69,13 +84,21 @@ static const struct regmap_range wr_range[] = {
 	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
 	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
 	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
+	{ FXL6408_REG_INPUT_DEFAULT_STATE, FXL6408_REG_INPUT_DEFAULT_STATE },
 	{ FXL6408_REG_PULL_ENABLE, FXL6408_REG_PULL_ENABLE },
 	{ FXL6408_REG_PULL_UP, FXL6408_REG_PULL_UP },
+	{ FXL6408_REG_INT_MASK, FXL6408_REG_INT_MASK },
 };
 
 static const struct regmap_range volatile_range[] = {
 	{ FXL6408_REG_DEVICE_ID, FXL6408_REG_DEVICE_ID },
 	{ FXL6408_REG_INPUT_STATUS, FXL6408_REG_INPUT_STATUS },
+	{ FXL6408_REG_INT_STS, FXL6408_REG_INT_STS },
+};
+
+static const struct regmap_range precious_range[] = {
+	{ FXL6408_REG_DEVICE_ID, FXL6408_REG_DEVICE_ID },
+	{ FXL6408_REG_INT_STS, FXL6408_REG_INT_STS },
 };
 
 static const struct regmap_access_table rd_table = {
@@ -93,6 +116,11 @@ static const struct regmap_access_table volatile_table = {
 	.n_yes_ranges = ARRAY_SIZE(volatile_range),
 };
 
+static const struct regmap_access_table precious_table = {
+	.yes_ranges = precious_range,
+	.n_yes_ranges = ARRAY_SIZE(precious_range),
+};
+
 static const struct regmap_config regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -103,11 +131,53 @@ static const struct regmap_config regmap = {
 	.wr_table = &wr_table,
 	.rd_table = &rd_table,
 	.volatile_table = &volatile_table,
+	.precious_table = &precious_table,
 
 	.cache_type = REGCACHE_MAPLE,
 	.num_reg_defaults_raw = FXL6408_REG_INT_STS + 1,
 };
 
+static const unsigned int fxl6408_irq_config_base[] = {
+	FXL6408_REG_INPUT_DEFAULT_STATE,
+};
+
+#define FXL6408_REGMAP_IRQ(_n)						\
+	[_n] = {							\
+		.mask = BIT(_n),					\
+		.type = {						\
+			.types_supported = IRQ_TYPE_SENSE_MASK,		\
+		},							\
+	}
+
+static const struct regmap_irq fxl6408_regmap_irqs[FXL6408_NGPIO] = {
+	FXL6408_REGMAP_IRQ(0),
+	FXL6408_REGMAP_IRQ(1),
+	FXL6408_REGMAP_IRQ(2),
+	FXL6408_REGMAP_IRQ(3),
+	FXL6408_REGMAP_IRQ(4),
+	FXL6408_REGMAP_IRQ(5),
+	FXL6408_REGMAP_IRQ(6),
+	FXL6408_REGMAP_IRQ(7),
+};
+
+static int fxl6408_irq_set_type_config(unsigned int **buf, unsigned int type,
+				       const struct regmap_irq *irq_data,
+				       int idx, void *irq_drv_data)
+{
+	switch (type) {
+	case IRQ_TYPE_EDGE_FALLING:
+		buf[0][idx] |= irq_data->mask;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		buf[0][idx] &= ~irq_data->mask;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int fxl6408_gpio_set_config(struct gpio_regmap *gpio,
 				   struct gpio_chip *chip,
 				   unsigned int offset, unsigned long config)
@@ -206,12 +276,43 @@ static int fxl6408_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to write 'output high Z' register\n");
 
+	if (client->irq > 0) {
+		struct regmap_irq_chip *irq_chip;
+
+		irq_chip = devm_kzalloc_obj(dev, *irq_chip);
+		if (!irq_chip)
+			return -ENOMEM;
+
+		irq_chip->name = dev_name(dev);
+		irq_chip->status_base = FXL6408_REG_INT_STS;
+		irq_chip->mask_base = FXL6408_REG_INT_MASK;
+		irq_chip->config_base = fxl6408_irq_config_base;
+		irq_chip->num_config_bases = ARRAY_SIZE(fxl6408_irq_config_base);
+		irq_chip->num_config_regs = 1;
+		irq_chip->num_regs = 1;
+		irq_chip->irqs = fxl6408_regmap_irqs;
+		irq_chip->num_irqs = ARRAY_SIZE(fxl6408_regmap_irqs);
+		irq_chip->init_ack_masked = true;
+		irq_chip->clear_on_unmask = true;
+		irq_chip->set_type_config = fxl6408_irq_set_type_config;
+
+		gpio_config.regmap_irq_chip = irq_chip;
+		gpio_config.regmap_irq_line = client->irq;
+		gpio_config.regmap_irq_flags = IRQF_ONESHOT | IRQF_SHARED;
+	}
+
 	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
 }
 
 static int fxl6408_resume(struct device *dev)
 {
 	struct regmap *regmap = dev_get_drvdata(dev);
+	int val, ret;
+
+	/* Clear RST_INT in case power was lost during suspend. */
+	ret = regmap_read(regmap, FXL6408_REG_DEVICE_ID, &val);
+	if (ret)
+		return ret;
 
 	regcache_mark_dirty(regmap);
 	return regcache_sync(regmap);
-- 
2.25.1

