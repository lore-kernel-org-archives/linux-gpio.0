Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946631;
	b=I0x6oORfSr7RtP3KjzyoBgUSZMxUOr+fdA8ZjZZkTgzc7cLK5pCXDcvg9Jyl+XqmisR8
	 LMerq0Uwq2AilYqblxFIUYB7JyshqYrpWj0wzjH+la2ubx0rbI6gU0RcDjkpv6qqch0xT
	 8x8qES4PKdFCYMUXV2swemX0jquIM/33xqyiytVudxfhlNvhfCAGJvYGTpeXmEPgxEOJD
	 lpA+fIc8L2OJIc7GOewQVPchPsKLMggM2zro2p99z8nQAMN+fYbr9kU9QShzlcroIxWZi
	 KK+3eXz2ylLxQBogubKVQfDlzVcHO2p3vLEva9oPpVS/iNHTVuJ555dY5ND8SSUE3uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2zCRGzfG+Ckfc0bCbMljQtIJ9n2GQ4v9sJtGrTP+bls=;
	b=P8bh7OppBQIt+0YI0aO/vidNWDPAPC6DDSLhLeQZrkhABJgW6ccmtesUrubOwMvCqxDG
	 9iFjwWGuirNg5ldeko+6KpBNHADLrPg7QEWKBwinAWbIc4STXfUThmjyZ7bFiow+Y3JDt
	 +O5thdJWfgeb0CwABHHpcRKqaJTpASyHKfe+vz0fgi6OLuhBeP0JeKrNtfXZsqwQMDXdn
	 71mQGO9xuFgILuNQjIVz5KrWRfEC5Y4PjtwXpsXDDmfvtrU2TzRsyriJOSyQCiFySvve5
	 mhoa16Pf1aV9OgvQ516pp23SbjYYDKutCWrc+NOrC+U5ViJmCIil6KX5P4ym6Qw3knQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dTB3SqR2;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7121A606D805
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 06:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7121A606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dTB3SqR2
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2761c69fbso833311c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 22:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946630; x=1794551430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zCRGzfG+Ckfc0bCbMljQtIJ9n2GQ4v9sJtGrTP+bls=;
        b=dTB3SqR23D5Y18ThNKRO5vlLJEd6T9f/x7exgebEjwcwUkFC0vYuwo14XWJ+Jdcbom
         4ULi0Y0MGdeVQlKRK6/SsO9fFwAM+0JprLzRgMvdpIENAGL+CjdbD1LbV6lSJwSUbFNn
         k4CpdTDb1oMrtWxdWFkv3MVjAulHbUf01Xm0QONiUXt6kVmdDmyjfW8SCcrVvd/ypE/H
         KOdSBsHxrbRO9LOq6ib12qOi4y9M9eGgtIyH1S1G6NfYVPUMJHj9/Hhn0cUxXXc5bXmy
         8kfhzJnkkv0qDozJjKUXzDABzZELI7ITKuHmVtKy5aBWdjH49ARKZ4TSZSHdeCflfseV
         LYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946630; x=1794551430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zCRGzfG+Ckfc0bCbMljQtIJ9n2GQ4v9sJtGrTP+bls=;
        b=i+NVK9M3G0SyTlIWv5oHDAzeZJRODMq5iT0gUo7Y4tdbUGdEbRrGSGWeKq1jrZ0dZJ
         VZzHgNECIZLE9KenjkXiQ0peBy8afpfK/EpEHEVnGEjHodpebz07uQCQVB2O5jstHHYP
         8A+wrI7azBr5bPbaiyMEJA4jEoZkmDdi1UJ6Ld4Dot+9Dz7Mf8rhvhLX8l1UqHGghHdF
         fb9YRGpINQwBQcnOrtKnNoHEm/fgGsvSzNjdxg7tudwZjHINKHBkPSaAS4b7DTNje12O
         x8LSgUwQf/t1D/6yPq0f4CtLgeAe9lOMNbJRqQbOsM9ESfeH+oSwqrMsIFn3/fjBNU0C
         8vjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpwNTP14shd2USe8AUiToiekgwVvj+zYMdy5tUSwQDIYNuEJMNsnuu3AQPJzcUAyaqF1CBQs9TI71W@vger.kernel.org
X-Gm-Message-State: APuU4Z9Zig8RroDtORG8d5fsg3sCJHK6oxfxSrHoG5xG4ZkcJ4iFygRk
	f5C5IPgJ0HDwATk5OnnIyFj/XOnN5NKydQbZ7QD5EhHWNYCtSFNr5oOQ
X-Gm-Gg: AYBFou21loLppDcn+oIt/SlYKRqYsPOju+fDuZk1w/16mmcmnASfwQIBzDT2LDALUN5
	3dIp5IaUG4mNeSFa82o4aL+NiCbMfAvP5EwUeBgFp3O8KkaUsFgVBkVhWQ1Ydl542F9G97x8Yom
	duN4G8QbJu5gQ/5c/IeWRSNNtrXNRv1M81RLLAli5gjTMr4paIB/3eYzR4vcefmq6VYWWKbZYDN
	wZVsN4CiQKdziGt3RDpCFCFU6wCjNxp0a4zXED+DBTgFMFrX1yfZb2yqcC71UeSUaHMf6tpGvhV
	mpWWTSH9qdrYJ2mnmUt5myCmuDjstakj6B0Ysf2o294wKn4j0vYcx8bbgl4JiMbSmz06FoRJm/Z
	eu8End+rqdsBhIx7CNbmhfIQRl9WGbXGq8k9BpqzRQJN5x+Sf3YCoJJn5JGPFDal3f7f/ceF3AN
	difYw7B8cGuJPbGVKRTzTSQuZgYdzeV5V81a/gxoPK/GOiOL4RkF/goBH3HFQ48e7t8Nk1HDGP/
	+uGACrmCIr6NCLADET7g4nrHHmNtg8yLr2E9uj9PRxjngbdnItlPqu/2SzjTK5D7KkA+lYyc1Uk
	tH8718koIQFDfO1DztrTGqFEdpDV3gf0HK6BMcSmIm0ojXtL1UPsUxhXssiNuc1GDLYB9pkqxk4
	vwd6j4mErb5HHAFOn3oMxRxphTFLWxL+y2ImfIw==
X-Received: by 2002:a05:7022:ea8c:b0:177:9a5b:a89 with SMTP id a92af1059eb24-1b25d337bb3mr1727437c88.29.1793946630334;
        Thu, 05 Nov 2026 22:30:30 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:29 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:20 -0800
Subject: [PATCH v3 6/8] gpiolib: avoid krealloc() in gpiod_get_array()
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
Message-Id: <20261105-b4-gpiolib-free-v3-6-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Instead of allocating descs before the loop and reallocating it via
krealloc() when candidate hardware array matching is detected on the
first iteration, defer allocation of descs until the first descriptor
is retrieved.

Factor descriptor allocation and fast-path validation into helper
functions gpio_descs_alloc() and gpio_descs_check_fastpath(). Inside
the loop, acquire the descriptor using __free(gpiod_put), allocate
descs once on the first iteration, check fast-path candidate
suitability, and transfer descriptor ownership using no_free_ptr().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 179 +++++++++++++++++++++++++++----------------------
 1 file changed, 98 insertions(+), 81 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1da91e52e51c..9b5024d30060 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5208,6 +5208,91 @@ static void gpiochip_free_hogs(struct gpio_chip *gc)
 		gpiochip_free_own_desc(desc);
 }
 
+static struct gpio_descs *gpio_descs_alloc(unsigned int count, struct gpio_desc *first_desc)
+{
+	struct gpio_device *gdev = gpiod_to_gpio_device(first_desc);
+	struct gpio_array *array_info;
+	struct gpio_descs *descs;
+	size_t descs_size, alloc_size;
+	unsigned int bitmap_size;
+
+	/*
+	 * If pin hardware number of array member 0 is also 0, select
+	 * its chip as a candidate for fast bitmap processing path.
+	 */
+	if (gpiod_hwgpio(first_desc) != 0)
+		return kzalloc_flex(*descs, desc, count);
+
+	descs_size = struct_size(descs, desc, count);
+	bitmap_size = BITS_TO_LONGS(max(gdev->ngpio, count));
+	alloc_size = descs_size + struct_size(array_info, invert_mask, 3 * bitmap_size);
+
+	descs = kzalloc(alloc_size, GFP_KERNEL);
+	if (!descs)
+		return NULL;
+
+	array_info = (void *)descs + descs_size;
+	array_info->get_mask = array_info->invert_mask + bitmap_size;
+	array_info->set_mask = array_info->get_mask + bitmap_size;
+
+	array_info->desc = descs->desc;
+	array_info->size = count;
+	array_info->gdev = gdev;
+	bitmap_set(array_info->get_mask, 0, count);
+	bitmap_set(array_info->set_mask, 0, count);
+	descs->info = array_info;
+
+	return descs;
+}
+
+static void gpio_descs_check_fastpath(struct gpio_descs *descs,
+				      struct gpio_desc *desc)
+{
+	unsigned int idx = descs->ndescs;
+	struct gpio_array *array_info;
+	unsigned long dflags;
+
+	array_info = descs->info;
+	if (!array_info)
+		return;
+
+	/* Unmark array members which don't belong to the 'fast' chip */
+	if (array_info->gdev != gpiod_to_gpio_device(desc)) {
+		__clear_bit(idx, array_info->get_mask);
+		__clear_bit(idx, array_info->set_mask);
+		return;
+	}
+
+	/*
+	 * Detect array members which belong to the 'fast' chip
+	 * but their pins are not in hardware order.
+	 */
+	if (gpiod_hwgpio(desc) != idx) {
+		/*
+		 * Don't use fast path if all array members processed so
+		 * far belong to the same chip as this one but its pin
+		 * hardware number is different from its array index.
+		 */
+		if (bitmap_full(array_info->get_mask, idx)) {
+			descs->info = NULL;
+		} else {
+			__clear_bit(idx, array_info->get_mask);
+			__clear_bit(idx, array_info->set_mask);
+		}
+		return;
+	}
+
+	dflags = READ_ONCE(desc->flags);
+	/* Exclude open drain or open source from fast output */
+	if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &dflags) ||
+	    test_bit(GPIOD_FLAG_OPEN_SOURCE, &dflags))
+		__clear_bit(idx, array_info->set_mask);
+
+	/* Identify 'fast' pins which require invertion */
+	if (gpiod_is_active_low(desc))
+		__set_bit(idx, array_info->invert_mask);
+}
+
 /**
  * gpiod_get_array - obtain multiple GPIOs from a multi-index GPIO function
  * @dev:	GPIO consumer, can be NULL for system-global GPIOs
@@ -5226,104 +5311,36 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 						const char *con_id,
 						enum gpiod_flags flags)
 {
-	struct gpio_desc *desc;
-	struct gpio_device *gdev;
-	struct gpio_array *array_info = NULL;
-	int count, bitmap_size;
-	unsigned long dflags;
+	int count;
 
 	count = gpiod_count(dev, con_id);
 	if (count < 0)
 		return ERR_PTR(count);
 
-	struct gpio_descs *descs __free(gpiod_put_array) = kzalloc_flex(*descs, desc, count);
-	if (!descs)
-		return ERR_PTR(-ENOMEM);
+	struct gpio_descs *descs __free(gpiod_put_array) = NULL;
 
 	for (int i = 0; i < count; i++) {
-		desc = gpiod_get_index(dev, con_id, i, flags);
+		struct gpio_desc *desc __free(gpiod_put) =
+			gpiod_get_index(dev, con_id, i, flags);
 		if (IS_ERR(desc))
 			return ERR_CAST(desc);
 
-		descs->desc[descs->ndescs++] = desc;
-
-		gdev = gpiod_to_gpio_device(desc);
-		/*
-		 * If pin hardware number of array member 0 is also 0, select
-		 * its chip as a candidate for fast bitmap processing path.
-		 */
-		if (i == 0 && gpiod_hwgpio(desc) == 0) {
-			size_t descs_size = struct_size(descs, desc, count);
-			struct gpio_descs *array;
-
-			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
-						    gdev->ngpio : count);
-
-			array = krealloc(descs, descs_size +
-					 struct_size(array_info, invert_mask, 3 * bitmap_size),
-					 GFP_KERNEL | __GFP_ZERO);
-			if (!array)
+		if (i == 0) {
+			descs = gpio_descs_alloc(count, desc);
+			if (!descs)
 				return ERR_PTR(-ENOMEM);
-
-			descs = array;
-
-			array_info = (void *)descs + descs_size;
-			array_info->get_mask = array_info->invert_mask +
-						  bitmap_size;
-			array_info->set_mask = array_info->get_mask +
-						  bitmap_size;
-
-			array_info->desc = descs->desc;
-			array_info->size = count;
-			array_info->gdev = gdev;
-			bitmap_set(array_info->get_mask, 0, count);
-			bitmap_set(array_info->set_mask, 0, count);
-			descs->info = array_info;
 		}
 
-		/* If there is no cache for fast bitmap processing path, continue */
-		if (!array_info)
-			continue;
+		gpio_descs_check_fastpath(descs, desc);
 
-		/* Unmark array members which don't belong to the 'fast' chip */
-		if (array_info->gdev != gdev) {
-			__clear_bit(i, array_info->get_mask);
-			__clear_bit(i, array_info->set_mask);
-		}
-		/*
-		 * Detect array members which belong to the 'fast' chip
-		 * but their pins are not in hardware order.
-		 */
-		else if (gpiod_hwgpio(desc) != i) {
-			/*
-			 * Don't use fast path if all array members processed so
-			 * far belong to the same chip as this one but its pin
-			 * hardware number is different from its array index.
-			 */
-			if (bitmap_full(array_info->get_mask, i)) {
-				descs->info = NULL;
-				array_info = NULL;
-			} else {
-				__clear_bit(i, array_info->get_mask);
-				__clear_bit(i, array_info->set_mask);
-			}
-		} else {
-			dflags = READ_ONCE(desc->flags);
-			/* Exclude open drain or open source from fast output */
-			if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &dflags) ||
-			    test_bit(GPIOD_FLAG_OPEN_SOURCE, &dflags))
-				__clear_bit(i, array_info->set_mask);
-			/* Identify 'fast' pins which require invertion */
-			if (gpiod_is_active_low(desc))
-				__set_bit(i, array_info->invert_mask);
-		}
+		descs->desc[descs->ndescs++] = no_free_ptr(desc);
 	}
-	if (array_info)
+	if (descs->info)
 		dev_dbg(dev,
 			"GPIO array info: chip=%s, size=%d, get_mask=%lx, set_mask=%lx, invert_mask=%lx\n",
-			array_info->gdev->label, array_info->size,
-			*array_info->get_mask, *array_info->set_mask,
-			*array_info->invert_mask);
+			descs->info->gdev->label, descs->info->size,
+			*descs->info->get_mask, *descs->info->set_mask,
+			*descs->info->invert_mask);
 	return_ptr(descs);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_array);

-- 
2.56.0.506.g506a7eabc5-goog

