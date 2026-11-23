Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433602;
	b=n5XQJjqh5YuPFDITXma+yfNyV5Gb3iX2Zc2AA4qzwx2d4s1ekd4zPdgJx4oZxuSLeOkd
	 KeeDsoHsjFfW078ea2E9wLm0tQOImaNf1wpZkJXhKhOyYcHwkvi5kFAm7odGPUbKMzUi5
	 c/sLkINNTDem2Fd7+tK5G61oVQzPkpAoF5unzTw80AfckNe6EWiGdpt12cFJ97ZLCfXbV
	 tapiWyi9sqfmuGRQZyXRNuxM71Bpm8i57Mx2YnK+GkNaK57XZ6srNHmhtV71aYHo/MMFd
	 SNWCKpZXXmFZpG3n9ATVrPjiRwJDHU1zQyt6hbH/u/+9Yn//G+zXnT3MgHGp2pkrsBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j8dmhSrkGCES4x7Qt63skZcMI+cXFvorwNPaLXIPs1c=;
	b=elQFEEWIKVy7aBn3nK5uFVTYYVKKTk323y9ZRlrqj/ganehCJ+z/IvRl1nSNcXik34W2
	 A2Z7bkkKTjD4j+NUVCr8V4Q0m89HGC7hdIFxWWM3CqAUtgAGkmJwx/42fs7dYSoYL2/Kx
	 eQ/63ab6PCHgOGI0lkI6PxawHZfuHuB6fm4TA8RdG0Q9J32IUZEHUvhs8Si9/tX8FjcyJ
	 5AsX2AmfyAZmNZ7MU6WC1XFpeRFfFBEtqxKx2MNcvwRQQMd11atrmpWcYpAdTtocvcGD4
	 JAr39OTg09wWNwSDibMcCItsOf5XjP5KDef7+u4lzCf8g8kPU7oucZFcXp6lRe0oXlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fmTxrgAi;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973A8606A331
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 973A8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fmTxrgAi
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso7815128a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433600; x=1796038400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8dmhSrkGCES4x7Qt63skZcMI+cXFvorwNPaLXIPs1c=;
        b=fmTxrgAi19NlM/nagOSThSEsXx3HQCWjOI3Ino/ZQ/UwhUHpA28uz6ZmnB2pvrWs0o
         ZSVMRB6+YCfPly7Wo25AeqxpiweUpWEuxZUoWFuE0DjpEnmPGYBH+40DRa2srDlV+tcm
         C6B+iCXUVS0nP1ymXEoPny6Z53vKStqyDhh4S2QdGa/LwqGcnLXrEoXDksjMe0Cknewt
         6u9rWqKygaqxm81dWVfR5SAytHLSLCyd64+RVW8yopFYLzEqp+GgznjCoDJHALcy+fQK
         Em39iz7JBojPDdNICBf3YU+bQbpxZHJ4sUamiqVnPz17ITAQWg0mPxCfYOIKMnWSKl/t
         tPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433600; x=1796038400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j8dmhSrkGCES4x7Qt63skZcMI+cXFvorwNPaLXIPs1c=;
        b=tXl9YGXVNETsxHCPYj4k6r3VZ2W/uC4jTOOARi5vrcv3RvZSypm5X85aRKHLISrXRh
         LQ5FS16Mhc0g6Wd7bwXV+nhGDUaD8TyzC0zUhaQmTRkHNDI2AxAp4I7r64VNdthmddt+
         8oAueBzxylLdtAHWoBzE/wb9vNW/V84BZsu2zdhLSaJb5dn0hoD81KrN4nSttl+6KxbY
         UScrbE2quQYREUL63zlMI+4wFdww3dydB9bZYTixwQlUeW0LEioWSyWxbctZaCdMkJva
         R2/PAZjJHirMQAiLNf7DHTb7aum/QXTX7ZGq5KwguOBzsYK2SH3Scc0oMIoIJSMmF3yG
         6VlA==
X-Gm-Message-State: APuU4Z9Ks9tdteb69KZTe40dy08dbqFmZ9MTeqPjxEb0CthuaMXNcMkc
	xNnOarKOgMcin06kUPviOpJIvz6dev1bLr5+c/BVOlMTPam3/ysCtf3/svJIPbO/pCs=
X-Gm-Gg: AZFdTZexuVOvj/GZAb4WJUVCDBl1sDYqgQAbT+T46SngXPkS+nK/WZo/kWXK+A84f6j
	pzm0QYSMN67IYme2alWoDTC4+BRzxp5HxgnTMAJXt2/QMU0WcvzR+RCgXS5rYtq37d6wPFhEMFa
	/Z0IFDMRNMeSDBUoksveCv0NiQyaHYvnoWId1bF+ydf9NXYPccq/laJjzuEZr5mMjsf/ZMe7FLY
	6ZJYGr8eSdFWQGBEjK1anLJ5QxRboeyvQALWW7xNBRKVckndotAibYvh8L0OYZaepWpEfgPKd8H
	JyMMfbd/6rOpKJ5HtS6aEHDNfY3dIZDR2qwL1jp8h8AHih+mhGD9p3r86A1aS6fNiD/ULvG76Ju
	hUfNRZYnOAFwwUJYss9VC0/aT4ymgir4vl8GbVbEcA8as2fcyn7gtopi9ayduBvMKPTpx8kaC1e
	7o7sHNMKorAHglugIJLzQBgqein/MgzhwMVzOiSThbGmuGUngd9y2HsaGx82TLmUqpuQy0C9vO/
	+1IYXLfzMoy7MI5JYL4/mAShv0cmsEUthQpo36lATJ7SbK53C6bjY1pPALmzwg8PAx/Moc+Uyb+
	WMdXSa86PC7iBmqxFExs9H2bIOyN3v03xJ01KKDygiFgLoxi3g==
X-Received: by 2002:a17:906:ad8:b0:c2e:4397:7c82 with SMTP id a640c23a62f3a-c513a5e6a7fmr686236666b.6.1795433599873;
        Mon, 23 Nov 2026 03:33:19 -0800 (PST)
Received: from lin-mg ([178.226.61.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afca58asm382625566b.65.2026.11.23.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:33:19 -0800 (PST)
From: Maria Garcia <mariagarcia7293@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guy Morand <guy.morand@bytesatwork.ch>,
	=?UTF-8?q?Theo=20L=C3=A9brun?= <theo.lebrun@bootlin.com>,
	Maria Garcia <mariagarcia7293@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpio: pca953x: Fix TCA6418 interrupt handling
Date: Mon, 23 Nov 2026 12:32:34 +0100
Message-ID: <20261123113234.197852-3-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261123113234.197852-1-mariagarcia7293@gmail.com>
References: <20261123113234.197852-1-mariagarcia7293@gmail.com>
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

Unlike standard PCA953x expanders, the TCA6418E has dedicated interrupt
control and status registers:
- GPIO_INT_EN (0x1a..0x1c) to enable or mask per-pin interrupts
- GPIO_INT_LVL (0x26..0x28) to select rising (1) or falling (0) edge
- GPIO_INT_STAT (0x11..0x13) for clear-on-read per-pin status
- INT_STAT (0x02), where GPI_INT (BIT(1)) must be cleared via W1C

Update pca953x_irq_bus_sync_unlock(), pca953x_irq_pending(), and
pca953x_irq_setup() to program and acknowledge these registers. Also
reject IRQ_TYPE_EDGE_BOTH as the hardware only supports a single edge
polarity per pin at a time.

Fixes: 6c99a046edfa ("gpio: pca953x: Add support for TI TCA6418")
Reported-by: Guy Morand <guy.morand@bytesatwork.ch>
Closes: https://lore.kernel.org/linux-gpio/CAFOBSkSHt5nwdqsf=V0esBh23oTkOzy--9-vBQFPBoroGK3-HA@mail.gmail.com/
Tested-by: Guy Morand <guy.morand@bytesatwork.ch>
Signed-off-by: Maria Garcia <mariagarcia7293@gmail.com>
---
 drivers/gpio/gpio-pca953x.c | 79 +++++++++++++++++++++++++++++++------
 1 file changed, 66 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 10a6fbdcb64d..c771ecf65071 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -910,6 +910,12 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 
 		/* Unmask enabled interrupts */
 		pca953x_write_regs(chip, PCAL953X_INT_MASK, irq_mask);
+	} else if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE) {
+		/* 0 = falling edge, 1 = rising edge */
+		pca953x_write_regs(chip, TCA6418_GPIO_INT_LVL, chip->irq_trig_raise);
+
+		/* Unmask enabled interrupts */
+		pca953x_write_regs(chip, TCA6418_GPIO_INT_EN, chip->irq_mask);
 	}
 
 	/* Switch direction to input if needed */
@@ -936,7 +942,15 @@ static int pca953x_irq_set_type(struct irq_data *d, unsigned int type)
 	struct device *dev = &chip->client->dev;
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	if (!(type & IRQ_TYPE_SENSE_MASK)) {
+	/* TCA6418 only supports either rising or falling edge at a time (per pin) */
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE) {
+		if (type != IRQ_TYPE_EDGE_RISING &&
+		    type != IRQ_TYPE_EDGE_FALLING) {
+			dev_err(dev, "irq %d: unsupported type %d\n", d->irq,
+				type);
+			return -EINVAL;
+		}
+	} else if (!(type & IRQ_TYPE_SENSE_MASK)) {
 		dev_err(dev, "irq %d: unsupported type %d\n", d->irq, type);
 		return -EINVAL;
 	}
@@ -1002,6 +1016,28 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 			return false;
 	}
 
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE) {
+		unsigned int stat;
+
+		ret = regmap_read(chip->regmap, TCA6418_INT_STAT, &stat);
+		if (ret || !(stat & TCA6418_INT_STAT_GPI))
+			return false;
+
+		ret = pca953x_read_regs(chip, TCA6418_GPIO_INT_STAT, pending);
+		if (ret)
+			return false;
+
+		/* Clear GPI_INT in INT_STAT */
+		ret = regmap_write(chip->regmap, TCA6418_INT_STAT,
+				   TCA6418_INT_STAT_GPI);
+
+		if (ret)
+			return false;
+
+		bitmap_and(pending, pending, chip->irq_mask, gc->ngpio);
+		return !bitmap_empty(pending, gc->ngpio);
+	}
+
 	ret = pca953x_read_regs(chip, chip->regs->input, cur_stat);
 	if (ret)
 		return false;
@@ -1113,19 +1149,36 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 	if (!(chip->driver_data & PCA_INT))
 		return 0;
 
-	ret = pca953x_read_regs(chip, chip->regs->input, irq_stat);
-	if (ret)
-		return ret;
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE) {
+		/* Ensure all interrupts are masked and stale flags cleared */
+		bitmap_zero(irq_stat, gc->ngpio);
+		ret = pca953x_write_regs(chip, TCA6418_GPIO_INT_EN, irq_stat);
+		if (ret)
+			return ret;
+		ret = pca953x_read_regs(chip, TCA6418_GPIO_INT_STAT, irq_stat);
+		if (ret)
+			return ret;
 
-	/*
-	 * There is no way to know which GPIO line generated the
-	 * interrupt.  We have to rely on the previous read for
-	 * this purpose.
-	 */
-	ret = pca953x_read_regs(chip, chip->regs->direction, reg_direction);
-	if (ret)
-		return ret;
-	bitmap_and(chip->irq_stat, irq_stat, reg_direction, gc->ngpio);
+		/* Clear TCA6418_INT_STAT */
+		ret = regmap_write(chip->regmap, TCA6418_INT_STAT,
+				   TCA6418_INT_STAT_GPI);
+		if (ret)
+			return ret;
+	} else {
+		ret = pca953x_read_regs(chip, chip->regs->input, irq_stat);
+		if (ret)
+			return ret;
+
+		/*
+		 * There is no way to know which GPIO line generated the
+		 * interrupt.  We have to rely on the previous read for
+		 * this purpose.
+		 */
+		ret = pca953x_read_regs(chip, chip->regs->direction, reg_direction);
+		if (ret)
+			return ret;
+		bitmap_and(chip->irq_stat, irq_stat, reg_direction, gc->ngpio);
+	}
 	mutex_init(&chip->irq_lock);
 
 	girq = &chip->gpio_chip.irq;
-- 
2.52.0

