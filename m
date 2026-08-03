Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33DC3515D3
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 22:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796552; cv=none; b=bqUksnWSsbodbhFLljUv+nC9u1shG4awjkHX0KftSjmHQ8/NMTx/AbGbkuaY/6OTQjwiivBp9ekSKuGLUeaNcBXtSCxhcNlYizpIr+QNv9ieya16qoIqdPMJ3zH1Fjg4xZ2fEfaAuqQ/ACW6C6/x+MhT+STo9FP6Vz1o/66PS3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796552; c=relaxed/simple;
	bh=kEO3N3J207VZCRKoE+kP8efpZmFtkmO8EQsconk79m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAYTatHgQvqS1W6Kj1wYp/PrPa/5C2PVMa4qTqiGW9j/Ic2cZhrXf0p7DzzCv6JvdgP/HhgZddxXQxadi10Ys5FmrNjxeAO5OBCgIGwUQoUVQgI+c4Z8SoKhk8WTi1lk5rgRbZHPEpyDYXPd4ZxpJPSx6NcxMt2Zn1G81eq+mDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoBgPi/8; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoBgPi/8"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbb7926836eso2579543a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 15:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785796550; x=1786401350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0envxAJkQN4/YeFdWq4QWO2p31D3mPwUrWMJUSBwUzE=;
        b=SoBgPi/8dVREvnDGyBSDvx+mX9S1Ev70Qj7O1HN2VVS7YK/CgTCJpW4678gyUTV3Vr
         jAw6vn9FFV7yg6c4oQg3ucF5/7XvLVC9/sXVSDC5GUmxN2vCUq5yX/rQJkLxS6xxWXP3
         crPULjAoy69TWUE6WoYaXk9Tk+9FDXjzN97YXzPpAFr2LLt3o34PJeVzq6rz3I/eR+Uq
         69ZAoFJFrRPTVuzL435RXi5+DZkO3wrtYQ6rF4dc41q/ahD4yyvxhGKxkh/egvoBNLOg
         56t0DmMzkXZeXV6n4On1hduSVrwFSCfVKhufbMNxRALG7/9SrFaOZSKMHQbnpfG+sFhv
         Viug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785796550; x=1786401350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0envxAJkQN4/YeFdWq4QWO2p31D3mPwUrWMJUSBwUzE=;
        b=L0+dCDecPFgBfzKmx5Or8KElONglbhnLVImI6RFSMJrGSG5m6xKBuTT69F7/iOisCM
         OkhkpMz29u1Dq0Qz7xmhXg5+gDl7MSYpZSSY6p1bNkG7NaHEZfh0X7mbAZj5Aguzn2qm
         BtDgRziQUPxE/47X0aW6cvd5u5v3i7vyaQkRgkQg4whhh9/ZxFYkYMP/JhVf2B5Dv+CY
         PGlXTe2OjfGDv84NMi48sSpgne+J13GZr4xbk45R9V8ojP2FYxQnpFWKezeG5FtOdaBh
         p+YYK/y/IWbnmynJOrfFQr6UPxq38gEfg0BQ1G3htRvA651zVVfNonhy7tn4k4KbSUcO
         dy/A==
X-Gm-Message-State: AOJu0YyfQG+DPcAygkVaGpXCq65inLndW88Io8T2EhRphUu0MfUXrGTG
	lK8m8lFZjd2Wx8kG/NtdJrM7c1T2W35wn3fqq1+R/JSN0mmwZhAL7Et3S1BmpQ==
X-Gm-Gg: AR+sD10xig7ylV7ViHDEVx5CniLv7TBFcFTPe6dC3gYgS07MtFc32WS9h96dOJmNPud
	zRAT21IQhzGsHMKYURCvmsGaxPEys+2Y58AoiNVHo02aVvET96Hpgd7yY8M9kpe8UV/8wRhHtpo
	KOWjqrTAjehRDE3m5CzmtRInJ6Rrnu49d7rKkc+Oi4p1lIcDF3jhsFkTgKlz2p5Gmg1T+iAauL7
	BbkjHF+KU0Ku+mPj+QM+AYC8lokK0oN5Q1p8CA1BAUakSAVVjFJeOSGL7rOKVypg6WVPN8alyb9
	phQ8EHR4GbCXFtQg3fSE6O0pPc29Dzxd/I6uoC7HEGVoyG+TLuf0rN2f/+wf69QAzVh2EGYZh0E
	ZvMT0elAN4Saresb2i98VVh7kdzGSsr6e6ul95rmZv+whzt+H/RrZLI9XalvEpfYY2J+wjNHTKd
	7/vA2lnH5qBq4y9t1fUlXIREazkYvcRMEsMp1RcLgWJnemPQxPFbxzbMI7/ILgfs6IEvi4RmZXE
	FDno3E28UUEiGrhoc7F0fQt0dhMZA39lAmK+P0Eh4brfZPujeLlU4Kp0WqK6Z3rA7USNo0tPHlw
	ZH1EKeShP41rXQiChn0AukurJ/tQAyWH26+avQ==
X-Received: by 2002:a05:6a00:8d1:b0:842:2419:6c0b with SMTP id d2e1a72fcca58-84ee481474dmr9123901b3a.10.1785796549925;
        Mon, 03 Aug 2026 15:35:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d4473sm4186790b3a.40.2026.08.03.15.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:35:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 5/8] gpio: ppc44x: Convert GPIO to generic MMIO
Date: Mon,  3 Aug 2026 15:35:36 -0700
Message-ID: <20260803223539.86303-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803223539.86303-1-rosenp@gmail.com>
References: <20260803223539.86303-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use gpio_generic_chip_init() to set up the PPC44x GPIO chip
instead of open-coding the basic get, set, locking and state handling.

Keep the PPC44x-specific direction callbacks because they still need to
program ODR and the OSR/TSR registers around the generic data and
direction registers.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 75 +++++++++++++++-----------------------
 1 file changed, 29 insertions(+), 46 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 5db5217c0225..d9048452162a 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -11,10 +11,9 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
-#include <linux/spinlock.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
@@ -45,9 +44,8 @@ struct ppc44x_gpio {
 };
 
 struct ppc44x_gpio_chip {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *regs;
-	spinlock_t lock;
 };
 
 /*
@@ -56,55 +54,34 @@ struct ppc44x_gpio_chip {
  * There are a maximum of 32 gpios in each gpio controller.
  */
 
-static int ppc44x_gpio_get(struct gpio_chip *gc, unsigned int gpio)
-{
-	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
-	struct ppc44x_gpio __iomem *regs = chip->regs;
-
-	return !!(in_be32(&regs->ir) & GPIO_MASK(gpio));
-}
-
 static inline void
 __ppc44x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
-	struct ppc44x_gpio __iomem *regs = chip->regs;
+	struct gpio_generic_chip *gen_gc = &chip->chip;
 
 	if (val)
-		setbits32(&regs->or, GPIO_MASK(gpio));
+		gen_gc->sdata |= GPIO_MASK(gpio);
 	else
-		clrbits32(&regs->or, GPIO_MASK(gpio));
-}
-
-static int ppc44x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
-{
-	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
-	unsigned long flags;
+		gen_gc->sdata &= ~GPIO_MASK(gpio);
 
-	spin_lock_irqsave(&chip->lock, flags);
-
-	__ppc44x_gpio_set(gc, gpio, val);
-
-	spin_unlock_irqrestore(&chip->lock, flags);
-
-	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
-
-	return 0;
+	gpio_generic_write_reg(gen_gc, gen_gc->reg_set, gen_gc->sdata);
 }
 
 static int ppc44x_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
+	struct gpio_generic_chip *gen_gc = &chip->chip;
 	struct ppc44x_gpio __iomem *regs = chip->regs;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(gpio_generic_lock_irqsave)(gen_gc);
 
 	/* Disable open-drain function */
 	clrbits32(&regs->odr, GPIO_MASK(gpio));
 
 	/* Float the pin */
 	clrbits32(&regs->tcr, GPIO_MASK(gpio));
+	gen_gc->sdir &= ~GPIO_MASK(gpio);
 
 	/* Bits 0-15 use TSRL/OSRL, bits 16-31 use TSRH/OSRH */
 	if (gpio < 16) {
@@ -115,8 +92,6 @@ static int ppc44x_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 		clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
 	}
 
-	spin_unlock_irqrestore(&chip->lock, flags);
-
 	return 0;
 }
 
@@ -124,10 +99,10 @@ static int
 ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
+	struct gpio_generic_chip *gen_gc = &chip->chip;
 	struct ppc44x_gpio __iomem *regs = chip->regs;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(gpio_generic_lock_irqsave)(gen_gc);
 
 	/* First set initial value */
 	__ppc44x_gpio_set(gc, gpio, val);
@@ -137,6 +112,7 @@ ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	/* Drive the pin */
 	setbits32(&regs->tcr, GPIO_MASK(gpio));
+	gen_gc->sdir |= GPIO_MASK(gpio);
 
 	/* Bits 0-15 use TSRL, bits 16-31 use TSRH */
 	if (gpio < 16) {
@@ -147,8 +123,6 @@ ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 		clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
 	}
 
-	spin_unlock_irqrestore(&chip->lock, flags);
-
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
 
 	return 0;
@@ -160,7 +134,9 @@ static int ppc44x_gpio_probe(struct platform_device *ofdev)
 	struct device_node *np = dev->of_node;
 	struct ppc44x_gpio __iomem *regs;
 	struct ppc44x_gpio_chip *chip;
+	struct gpio_generic_chip_config config;
 	struct gpio_chip *gc;
+	int ret;
 
 	regs = devm_platform_ioremap_resource(ofdev, 0);
 	if (IS_ERR(regs))
@@ -172,17 +148,24 @@ static int ppc44x_gpio_probe(struct platform_device *ofdev)
 
 	chip->regs = regs;
 
-	spin_lock_init(&chip->lock);
-
-	gc = &chip->gc;
-
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = 4,
+		.dat = &regs->ir,
+		.set = &regs->or,
+		.dirout = &regs->tcr,
+		.flags = GPIO_GENERIC_BIG_ENDIAN |
+			 GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER,
+	};
+
+	ret = gpio_generic_chip_init(&chip->chip, &config);
+	if (ret)
+		return ret;
+
+	gc = &chip->chip.gc;
 	gc->parent = dev;
-	gc->base = -1;
-	gc->ngpio = 32;
 	gc->direction_input = ppc44x_gpio_dir_in;
 	gc->direction_output = ppc44x_gpio_dir_out;
-	gc->get = ppc44x_gpio_get;
-	gc->set = ppc44x_gpio_set;
 
 	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
 	if (!gc->label)
-- 
2.55.0

