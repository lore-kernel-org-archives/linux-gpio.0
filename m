Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793105757;
	b=IXmDr8R/YZIowlXJ82A/e/ndtVyTj3qMFIzNgQW+5aZFapCiHKIL6zMGaOmCtg7SW8pW
	 6ZbM/z58KvK6BBXtPfuYxxj58EGnSLQ/ctGZGV4zdZ3ei7IOu2YFrUK//hH3EbTtmzVed
	 GPh3mns3eUfGvLE+nnAzA+NRKAczUxN7//xNnSJjO2Jx2sqiw30Hw+X/GGkCBawVm/HJF
	 scYs5LZqp4lU8ZlHnUlhAtwTakSIsoTBWI7KvNA5FfjwfcEqTq6oVTvuXtTs0Rbn70BeF
	 EhO+yEQ+OaAURTDZZGTbY1Tj1czW1KdEtaqObl+3LphQ36gD3k4BJfPbNrz7B9nItpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105757;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=NUvJ3GF36bN209WRo6z37F31w8yWKDGZQuLsB+FTos8=;
	b=UYUsN7QVV1fD5nzqg3p7u71Ht0FTDywfg6E6vuB1j7+YnD2xUVa+R2UwXLxKGjbh65g4
	 WJvHT9CNHJIADqX5An8cJ0yJo9q0uSMGH6y7QhADLWGJwNXEu3XikF7TsJNhUviNR8LjG
	 rlRNKu6R68jitMhzecRyJ+3U2MzRtWylsLAhev9BSRCpjo4zWXASZbRFKSdTJ7DNDQNSa
	 l5b92WD9Rc6qmR2XAOHnedNSV5wll8gsCdQ+APr4HBhMk+Mo4VzflAevW5vCGEe3Lzprg
	 GFCBt+3AWOXP2GzH10eZgWxCnSBYKbRYxVBcCtd4+EPAAdx2f50L+YXIQC2XwOdVFwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=2MdXvrlq;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b="Mwl/FyGG";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.3
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0221606A31B;
	Tue, 27 Oct 2026 12:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0221606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=2MdXvrlq;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Mwl/FyGG
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-8v6p.prod.antispam.mailspamprotection.com; s=arckey; t=1793105755;
	 b=x5Bdw3RzX6L+0xxlTbdZ3PGlV+xKCAajGieGRlYKTFHW8JyNxmSGS+yK7+zVtfTtkMwXIzjW79
	  3/gEVUI2XNl8pk7IGVsm2u1H6OsWMz+y87m8ehzq7yFQyXN59QK6V6LlqI/nY9hCRyBc4XIvNw
	  tLqrmumefZJGZZxPdOh79t0ItT8BP6lnmqt7XkFQAmnSHfO7UFt8FOuYZXvvJFy7iyCg958Z6f
	  abNRlAEHeLYNTwe4ppPLbewHrpW+D8IavTKsmTdSqqu0nB4H2Xu9pfJEWPmtRzn1HUYV1Qv+6Z
	  rAsslzmHUz5C7+1T0X7GKspqcKT8c7Ro2gqJcLpqGhymtw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-8v6p.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-8v6p.prod.antispam.mailspamprotection.com; s=arckey; t=1793105755;
	bh=JJwrWqNQeqCeW8Tr+AOwLRCFkqBwP/40DqtliOwP7FA=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=WDEw7RUzWq3ClAfRXcJPIGUjJo/TbLs5bnoekRxwHkQCe04uhgj1h8ZVsYqWUsO5TQwfsZ79LG
	  KFc2cBhNrQED2b+kVpgkwbyKJcU74EsAG3wgwJLV3sCIfKb2SdNXPy0stq1SaCnYCEWtWMzIMp
	  BBOTzAKdjER2bCQKR6KTliRSPuzTNo70yMFQ7VWwvk8A80PXwoDPW76HF/ROMpGjSXfw7mLdaH
	  nQhMyoJAdFRLYixslrsXA62tiqMPBKGJi+m/zLWoZ+8K1xa5fhKSyv+7RlKUxvnH6kH8NS24VQ
	  w5Ra52wFj3qcqi5XZHa5hD+CunuyRRhZETzl+sZIuuL+oA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=NUvJ3GF36bN209WRo6z37F31w8yWKDGZQuLsB+FTos8=; b=2MdXvrlqPEJdNaIFwBd+k4+lcf
	XuAcG5EQ9p70pTXpLaRZ3erTk7zrFnWhX9iooR75Ibeb98cA8wpM3mLj+PiwXv95NX6DqKLz+s8g/
	Am/pbB6HZcdvFRZL6L84LK6Hr4xDFbeVDg+Lks1lD5bBRXIkkv5zBdCvKBmXeQPm0lZ4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-8v6p.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xLgiR-000000003tD-1Fc3;
	Tue, 27 Oct 2026 12:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=NUvJ3GF36bN209WRo6z37F31w8yWKDGZQuLsB+FTos8=; b=Mwl/FyGGVyUzGbe4ej+Ujxnjj+
	OioXRLb3X4a+RJbvmg/cQ0X/g0QJlyCdFN9V2gpPHMqBjwlm0VoHy0HPRK1gA/BfqF4GBM/redoNF
	yC49B2fEfwX2LFTqWvwrqduD46O3hPt/WHz1A+evIQCGaVaYhAGX0PatxaokKrTxnwxk=;
Received: from [87.16.26.129] (port=60466 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xLgiM-000000007jS-40sP;
	Tue, 27 Oct 2026 12:55:42 +0000
From: Francesco Valla <francesco@valla.it>
Date: Tue, 27 Oct 2026 13:55:24 +0100
Subject: [PATCH] gpio: virtio: convert to immutable irq_chip
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-virtio-gpio-irqchip-immutable-v1-1-f64ed13d4567@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWduEEgPiVYyLdhzgNwJ1WogJ4
 e5W3Lzk27yNoigk0rXYSGVFxDxl2FNBPLipF4NHNlVlVdvSXswKTZhNH3Kgbx4QDMZxSc6/xLS
 +bhvbsHdnpvwIKh0+x/92/zsu/imcflPa9y8+TTWJgQAAAA==
X-Change-ID: 20261018-virtio-gpio-irqchip-immutable-9b69717cba4c
To: "Enrico Weigelt, metux IT consult" <info@metux.net>, 
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3982; i=francesco@valla.it;
 h=from:subject:message-id; bh=JJwrWqNQeqCeW8Tr+AOwLRCFkqBwP/40DqtliOwP7FA=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkP5nvy1E7XsqpNfFSQ9V5IuvCiYAzTXqG390PLbR+Vn
 nCokP3TUcrCIMbFICumyBKy7sa9PXPNv6VtYHwEM4eVCWQIAxenAEzk4mWG//XTf5h93TMtV7Jo
 e0uelt5eX4N1dk0RguqtlW73OIW9dzAy3L8RL88+09sj3zZkXcyum29v3P18S641NeDt5EOHlga
 zMQEA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: bc732c2ebe1f2d72237be5a62c5d01ca
X-AntiAbuse: ID - bc732c2ebe1f2d72237be5a62c5d01ca
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xLgiR-000000003tD-1Fc3-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-8v6p.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The kernel has been warning about non-immutable irq_chips for quite some
time, printing messages such as the following one during initialization:

  gpio gpiochip6: (virtio2): not an immutable chip, please consider fixing it!

Convert the gpio-virtio irq_chip to immutable and add the relevant
helpers. The exposed name is kept the same as before through the
.irq_print_chip callback.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/gpio/gpio-virtio.c | 41 ++++++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index ed6e0e90fa8a..d443b8c0e813 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/virtio_config.h>
 #include <uapi/linux/virtio_gpio.h>
@@ -243,6 +244,8 @@ static void virtio_gpio_irq_enable(struct irq_data *d)
 	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
 	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
 
+	gpiochip_enable_irq(gc, d->hwirq);
+
 	raw_spin_lock(&vgpio->eventq_lock);
 	irq_line->disabled = false;
 	irq_line->masked = false;
@@ -265,6 +268,8 @@ static void virtio_gpio_irq_disable(struct irq_data *d)
 	raw_spin_unlock(&vgpio->eventq_lock);
 
 	irq_line->update_pending = true;
+
+	gpiochip_disable_irq(gc, d->hwirq);
 }
 
 static void virtio_gpio_irq_mask(struct irq_data *d)
@@ -532,11 +537,30 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio,
 	return names;
 }
 
+static void virtio_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	seq_puts(p, dev_name(gc->parent));
+}
+
+static const struct irq_chip virtio_gpio_irqchip = {
+	.irq_enable = virtio_gpio_irq_enable,
+	.irq_disable = virtio_gpio_irq_disable,
+	.irq_mask = virtio_gpio_irq_mask,
+	.irq_unmask = virtio_gpio_irq_unmask,
+	.irq_set_type = virtio_gpio_irq_set_type,
+	.irq_bus_lock = virtio_gpio_irq_bus_lock,
+	.irq_bus_sync_unlock = virtio_gpio_irq_bus_sync_unlock,
+	.irq_print_chip = virtio_gpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int virtio_gpio_probe(struct virtio_device *vdev)
 {
 	struct device *dev = &vdev->dev;
 	struct virtio_gpio *vgpio;
-	struct irq_chip *gpio_irq_chip;
 	u32 gpio_names_size;
 	u16 ngpio;
 	int ret, i;
@@ -588,26 +612,13 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 		if (!vgpio->irq_lines)
 			return -ENOMEM;
 
-		gpio_irq_chip = devm_kzalloc(dev, sizeof(*gpio_irq_chip), GFP_KERNEL);
-		if (!gpio_irq_chip)
-			return -ENOMEM;
-
-		gpio_irq_chip->name = dev_name(dev);
-		gpio_irq_chip->irq_enable = virtio_gpio_irq_enable;
-		gpio_irq_chip->irq_disable = virtio_gpio_irq_disable;
-		gpio_irq_chip->irq_mask = virtio_gpio_irq_mask;
-		gpio_irq_chip->irq_unmask = virtio_gpio_irq_unmask;
-		gpio_irq_chip->irq_set_type = virtio_gpio_irq_set_type;
-		gpio_irq_chip->irq_bus_lock = virtio_gpio_irq_bus_lock;
-		gpio_irq_chip->irq_bus_sync_unlock = virtio_gpio_irq_bus_sync_unlock;
-
 		/* The event comes from the outside so no parent handler */
 		vgpio->gc.irq.parent_handler	= NULL;
 		vgpio->gc.irq.num_parents	= 0;
 		vgpio->gc.irq.parents		= NULL;
 		vgpio->gc.irq.default_type	= IRQ_TYPE_NONE;
 		vgpio->gc.irq.handler		= handle_level_irq;
-		vgpio->gc.irq.chip		= gpio_irq_chip;
+		gpio_irq_chip_set_chip(&vgpio->gc.irq, &virtio_gpio_irqchip);
 
 		for (i = 0; i < ngpio; i++) {
 			vgpio->irq_lines[i].type = VIRTIO_GPIO_IRQ_TYPE_NONE;

---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261018-virtio-gpio-irqchip-immutable-9b69717cba4c

Best regards,
--  
Francesco Valla <francesco@valla.it>

