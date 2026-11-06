Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946630;
	b=mj4bDDqsgVVDf99zfVhvOYjqUYGyUjrbyvz+gOlnU3vsuLzFN7VBTwTRF6BlgutWmaPH
	 Af+xGcLtgNOrOJzAlLs7sugy5TjJnNYI2eqmoilXEMcOW801BINtTIGgdlDAijU1wq/xI
	 7/GCwr/BI6PBQNQLCDry5f0FhpWiFuQeK+I788lHoQmCENu3DGpM41nz37H6iP5PDDC70
	 nZlDN4r9He0/3UcKURBHbW1PZeA7BAjcL8d3zASc1U2vXr0D8mT5mP4lIvungTuuIH38v
	 EOs4sLmUi4L/lBy38S9DLsohg/rve6/SVHmqr47hrQuCN+35HZpKPHcNW0l0sOTgKyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nAL496ri9VKdSWQizRCEdUiIjbSCELQxYIrRBVTfu5s=;
	b=tHO+pdZ2Au9BHVJGlNlLOInN32yu/6/rH+4mE5joYyNGXnTWam2dipmJXkPK7Mb2VTvA
	 FYb+QVmU5s6ER/y9Vi2uk3qPbQTosRQjp5N/x/ASsLR4zjFHNf/vJGe5edwoScKJSYp9R
	 274yggCKAbaNb/0y6L3cVOVlWu5YUfg8JD0u1RjKqW9kxmUwDeD+TLpZfIgahqOHJpQbj
	 XIYwx16/3BJ/MAMyb7XqrcDzSEmJG3+mLH2Y1Q6589WbgzIDVUtl8GwCIYP55SUOhAkc3
	 dbyib20RhsaIi76gkXBfn9fD7b0EmW/3D3JJaFr8sAnHoSJWK120OsxUmvwQYMnTvQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nOInwOCq;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F400F606A33F
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 06:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F400F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nOInwOCq
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2761c69fbso833282c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 22:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946629; x=1794551429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAL496ri9VKdSWQizRCEdUiIjbSCELQxYIrRBVTfu5s=;
        b=nOInwOCqxsijnO9GyE7LMiIoj/e36C3BUOX+c8uRoGsxBIx3DyKpXZ8NuF0v4+8wIR
         fCfxStUwZV9xfKUlezs91+r7n+SQ5GGoZLDiXJkMd4sCqj61/JjnrxAOnKkJmCrc6acw
         4Wwh+A85Suybe09PK2RKn+AyGCvmmeN4NpH+F3vuD7qLLEyWimihK9u0PpwNPipP/HVD
         4kuibfYI+w1Bbw/DOcavOiXo/tPJLyMrZxWsYKlqfpAvsF/2IUAuGR0s/0Y0VA9ofpcR
         AYDMLUX3PqpPztr71br9K4tnyBg4k8yl2SYFn1mUYxKZjC6KcAwHQJff6ZAuGzmUZIA2
         8MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946629; x=1794551429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAL496ri9VKdSWQizRCEdUiIjbSCELQxYIrRBVTfu5s=;
        b=Uuf6MpwsuL93WYt8gSmytqPZJOUOI40ET6aDAeL+MgXZB/K3l0K7eh3zuuHCViUvaw
         RhBJML4HcDeEjoGKpKKxGupojOfomncMhIWdxK9g4XMK9qCY1ZfvUYGka8fQ45UmeVyN
         t+huQtZ64kiRWmEMdcc67avb+FQyD6I3MrHTTGkzK5f8r2gTfJllIb3Vw6aiMWfgtJ0b
         vVKUZsA9y+vpsJvcNmNBn+CTXNSK0etWba4mrunajXjItEKvyu9fHqS/Ceuulbh+2N6E
         fpi6lOJCte6YukWGtI2mZjDQjLB4nMA7NE0N1CK46zjIykYIg1KXsGDG9sLzOk4jhLxn
         eZ2g==
X-Forwarded-Encrypted: i=1; AKwUvBwekTX3EiL7XPtegC1uVP1p4MY+SdrCB04cdNdw5oYG6NnYZ4OAOMOdVrgit95pFLpqxAg6iANOFcrg@vger.kernel.org
X-Gm-Message-State: APuU4Z8z4pfr8Rw4J3msYwl8vlWHEbp5xMBJrU0/1orjPKpHsabSjosm
	X2nAizvabdeSxRjm99mM97fuow5I3zrncQiO5IQF2dmN2OTrhWUcFT0/KK7ROg==
X-Gm-Gg: AYBFou3xGcuDjmmVdxrOK/pGFrxq8mTn/3GKkznLNRcYqO+r2ASwS/bgEO6QdibtYT+
	JbSdMqkIzZwvRVZrYPbSrx0kdy0Z7zkzaF2im5WRmBLfvD4Ej9MF1tb6B3ZmJ9MYnuVJYP4DxNA
	g1meOrbLVqhV8v4LtvluUF9AMv2aKvatEma+6l2IN1CyuORB5kLDmqOy5m/0ak9qoQSP3oec8e0
	EFp6AUODoXwXhtNzXJRZr44hLI/TXGXTfCmz8NiQirDoNYWCXCDVHQ1OMCs7NeyR+6r2aldNu3J
	+NvnmliZdba5Zg427EnZQ0pweSOMEjuB1mzPAjRfWcHxI6LpACt/g+tOuJse/7NTtFLefFyAs1e
	YT//otKZ3bVsWhOPSVYI2M1QakUlIRDqW0YF0Sjq5n2xChc7BBzHscszb5+NidybuLX97aoGjle
	yPJAWY2/ow584RXguccHZpAzmGQGIMZ4SlMKijYw7snMUJ5jDtzuT3IS8C4xX1X8+U6epAYcb+m
	1ZPOiYOD+O+YtVTxAoRty1pb5K03xJuhkSgxq9jY8uiheXSvtzIvajiH/+EigbLdSzSGXsr9tz2
	19RysqnjniFvyHpKSxbGaT94RDoK7AydTA1VqHpX770gxD3ib3YbpuTGVbOMIV483TGVgqvw2VP
	FIGVrDUfayMmYCnb1LQ==
X-Received: by 2002:a05:701b:4647:b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b25d31faaamr1677445c88.21.1793946628976;
        Thu, 05 Nov 2026 22:30:28 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:28 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:19 -0800
Subject: [PATCH v3 5/8] gpiolib: use __free(gpiod_put_array) in
 gpiod_get_array()
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
Message-Id: <20261105-b4-gpiolib-free-v3-5-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.17-dev-e56a4

Switch to using __free(gpiod_put_array) scope-based cleanup facility
in gpiod_get_array(), simplifying error unwinding and eliminating manual
gpiod_put_array() calls.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e095aaef0a09..1da91e52e51c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5227,28 +5227,23 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 						enum gpiod_flags flags)
 {
 	struct gpio_desc *desc;
-	struct gpio_descs *descs;
 	struct gpio_device *gdev;
 	struct gpio_array *array_info = NULL;
 	int count, bitmap_size;
 	unsigned long dflags;
-	size_t descs_size;
 
 	count = gpiod_count(dev, con_id);
 	if (count < 0)
 		return ERR_PTR(count);
 
-	descs_size = struct_size(descs, desc, count);
-	descs = kzalloc(descs_size, GFP_KERNEL);
+	struct gpio_descs *descs __free(gpiod_put_array) = kzalloc_flex(*descs, desc, count);
 	if (!descs)
 		return ERR_PTR(-ENOMEM);
 
 	for (int i = 0; i < count; i++) {
 		desc = gpiod_get_index(dev, con_id, i, flags);
-		if (IS_ERR(desc)) {
-			gpiod_put_array(descs);
+		if (IS_ERR(desc))
 			return ERR_CAST(desc);
-		}
 
 		descs->desc[descs->ndescs++] = desc;
 
@@ -5258,6 +5253,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		 * its chip as a candidate for fast bitmap processing path.
 		 */
 		if (i == 0 && gpiod_hwgpio(desc) == 0) {
+			size_t descs_size = struct_size(descs, desc, count);
 			struct gpio_descs *array;
 
 			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
@@ -5266,10 +5262,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			array = krealloc(descs, descs_size +
 					 struct_size(array_info, invert_mask, 3 * bitmap_size),
 					 GFP_KERNEL | __GFP_ZERO);
-			if (!array) {
-				gpiod_put_array(descs);
+			if (!array)
 				return ERR_PTR(-ENOMEM);
-			}
 
 			descs = array;
 
@@ -5330,7 +5324,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			array_info->gdev->label, array_info->size,
 			*array_info->get_mask, *array_info->set_mask,
 			*array_info->invert_mask);
-	return descs;
+	return_ptr(descs);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_array);
 

-- 
2.56.0.506.g506a7eabc5-goog

