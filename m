Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812422;
	b=cbbcz0wjfSGnSX2WuEkDPlXiqsFYeils1vLcg1F0R+qGaKmkbv1xkdTIkGYXvIoqthRp
	 gXsHN9tj5NfZLT/c/G9GQGBK0ELOUmAojRp32fov3vS3ciWY0GzRke3UVWkRAExk545gM
	 1WMS/X1bQTf0fO7VuHNwjjuc99CFqyue+9JCI61Zvt27Atlm7yfxQCOgqsplKskmFyz0Q
	 HF+F1Ze7m9j8jwSmXYfoJfJxcSziejJUV2CnrSGgDkFnFGLEaIDqTXtCiY73Bd5vlm1wz
	 loOUzMlr7u0RpFhwTQ6cKsy2AIA2fESKxL/I558/VThsk2XW9OgOyXlf44k2cJPOqIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Mo6MQgSQwly5/Nd50C4GzzMt65d3gXpbq7S61K6m7jk=;
	b=3Pz2x4wJI8LzNQg654nusZV4ozBrrGf4DdGG+Nc74WPAMpbZbY4zOeXWnoAdQBPGUTn6
	 vT2z1noC+UQ0SMDr7Mi//X1SFAQGQOwvTBuTiJU8yEwWoEvXk7V27WI+rcWrqb+q1nxlm
	 wtoaS0E82BYMT4AiwmyhK2X/9Xo8iB27VXBEDVACfAynkqEQKVK1xLpOSZAgu3ovxRZL7
	 VUSIOJtnYmkenn3J4c+Tc63rH0u6lNE8bV4W+i1gWuM99Y1+34JsMoUDqWss0sVtLrBCz
	 Eu4zWfS43MCB0dIZnuItVnkfj7ZMkdr3CcsbGwkxglMoRu8PxQqiX+LBzf6SOB+7n4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lKWJY5Ne;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399C7606A329
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 17:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399C7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lKWJY5Ne
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b1ce85287aso864127c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 09:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793812421; x=1794417221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mo6MQgSQwly5/Nd50C4GzzMt65d3gXpbq7S61K6m7jk=;
        b=lKWJY5Ne+YISueLkvjHTSkvPcct3R2zv2Ql9mqX8h3ez2vb34Q91XqDIm/+ioyss/Z
         IJIw0atgdYPkjOHlJEHr67FwnGtFeoRPtfSOlQKbhLkujtcgc7qRCgkfGB4wbUHSiuPM
         8vZZoM0nErBLav2TBhehR1t20wCmGvKLLqghBYRIzeEze9apMoTOKWbkuPGW2tXSzCLD
         9qhfjXMoDvWS1B/cQ46HnDDxj1Nyi0zjD9grdEMXa+W1htAgQNV5EBA103CHDT5BaULK
         SY7Q+NQ5+KoPqbVTOHed1UxOTNVHm+5W8OIj39G56HsqWGOk6FgCML50qHmYZPUTPBvl
         5sqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812421; x=1794417221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mo6MQgSQwly5/Nd50C4GzzMt65d3gXpbq7S61K6m7jk=;
        b=rTdiu1OK80VygVfBsSEBPMn8IakSgbe1xECZWguYuxB5/tS6Khvd27GvO9xilwp5H0
         OkjYwqpd38HnvyGdUWAwimJJWjp+pTX08KWh23FjWnoru3B19JyJCIvC6XfzVoPCQKH/
         W2mlc4b6ZiBGVZR5shBSnH2BkWzWryZ/ROBC6SqhmJI43o5yb7JRJJqScayr1NyBV5c6
         arYQQfGW3IYledDkYI+GajAyaDKbo9MsKdbVmbYHvv2P0TaaSiBNCZ1PwNEAz+nmyCFz
         v2VHkUpxS4o0hitGRdI1+trV2aFmo1+DCrLUcDOGUR7wKkgi4w/Y81A2pr79qYPInnq5
         eF7w==
X-Forwarded-Encrypted: i=1; AKwUvBxspoXLFWTIhF+QuSVMsFgueHvh19oTawJeJWyFMxN0AMG//avowRAQWRzE0CzDQPoyakOB5qbF9Oji@vger.kernel.org
X-Gm-Message-State: APuU4Z/AX7v1LljQCi5dl/xG2HFwDxPPdd+8exRqszHRdnXQeipHlQVh
	0MVMzzRnXHk4r0+G5j10XhMESBWDYjQd8Nt4eaEZKr6wyKzuG4+A3udm0fWw8kU1
X-Gm-Gg: AYBFou2ouzwvu01ARSWY/65XOAyBRfq7S4hy9eobMEy84Xob478J6PsByGmj4LE7jtb
	T9li6VuwzOgxH6zp39oLFcj+BotIkm3IX7v0zjSeuhUvWPifgfgN/YOiG40dzPNEBHVvl3lqXz9
	4Ky9tdVWRPejsVNQrrzT5m7x2Kpqf2PM8rmz4OxIAcqHH2kYNHnO+e9j3BogFheEfECfPZXUTrk
	ntVwgCIdTmNINmn8z76EuJvmhSJq0Jbpm2vFVYe4AC5baRtBnjTVTLI8tU2BSYLVDlUHM/+t5dh
	Guer0WLcngp1il98xil+ic46lfKnz1rgZwYpBImWFiDiJrXCfiQDqQX0c6wp+U2fAH191cbksY2
	CPGpNY57X9socAFYzBgNDEDjDtxnLiBAX1A2ZxdcUf/0DV6r7Z/xynmGUagbRUD4OMYrFIIpCiK
	64JdsOYfoxiSat7R/ANK2mcittEHnOIwbqFGwsgrcKg17I+4tJy/bSHyCrTXmK+SMnXb44bWuOk
	KtFe8WTtO2RhSfoPqG0HjtvpDTpphZ4eQK+aj/JDnsViy8c6hQR1Kv9McdTPYi4shP16QutR0r+
	NYMmN58bOfvU23mjy6vK5Mu17QDJsJ7LXIiQtjfOiGjwWlNReruxQVYtVTEqGEzxQ2Ws
X-Received: by 2002:a05:7022:b05a:b0:19c:c396:37aa with SMTP id a92af1059eb24-1ac5d1d058amr24439664c88.22.1793812420949;
        Wed, 04 Nov 2026 09:13:40 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1bcedsm9021788c88.7.2026.11.04.09.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:13:40 -0800 (PST)
Date: Wed, 4 Nov 2026 09:13:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 6/7] gpiolib: avoid krealloc() in gpiod_get_array()
Message-ID: <autm__StHhgBMcdd@google.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com>
 <sashiko-outbox-196636@kernel.org>
 <atiydn7hetz4pfgpgybjfcdcwugp3rnqqbovtm6h45kaeh5bov@tqkc4qqm5zbx>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atiydn7hetz4pfgpgybjfcdcwugp3rnqqbovtm6h45kaeh5bov@tqkc4qqm5zbx>

On Wed, Nov 04, 2026 at 03:23:26PM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 04, 2026 at 03:48:34AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] gpiolib: delayed initialization of __free() variable in gpiod_get_array()
> > --
> > 
> > commit ab11568406b8d4aa5255ce95e09509f3e6c86285
> > Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > gpiolib: avoid krealloc() in gpiod_get_array()
> > 
> > This commit defers allocating the gpio_descs structure in gpiod_get_array()
> > until the first GPIO descriptor is retrieved so that it can be allocated in
> > a single pass without needing krealloc(). It also factors descriptor
> > allocation and fast-path checks into helper functions.
> >
> 
> ...
> 
> > > +			descs = gpio_descs_alloc(count, desc);
> > > +			if (!descs)
> > >  				return ERR_PTR(-ENOMEM);
> > > -
> > > -			descs = array;
> > > -
> > > -			array_info = (void *)descs + descs_size;
> > > -			array_info->get_mask = array_info->invert_mask +
> > > -						  bitmap_size;
> > > -			array_info->set_mask = array_info->get_mask +
> > > -						  bitmap_size;
> > > -
> > > -			array_info->desc = descs->desc;
> > > -			array_info->size = count;
> > > -			array_info->gdev = gdev;
> > > -			bitmap_set(array_info->get_mask, 0, count);
> > > -			bitmap_set(array_info->set_mask, 0, count);
> > > -			descs->info = array_info;
> > >  		}
> > 
> > [Severity: Low]
> > This isn't a bug, but in gpiod_get_array(), descs is declared at the top of
> > the function with __free(gpiod_put_array) = NULL and then assigned later
> > inside the loop when i == 0.
> > 
> > The cleanup.h conventions ask that __free() variables be defined and
> > initialized in a single statement at the point of resource acquisition
> > rather than initialized to NULL at the top of the function and assigned
> > later. Could the first descriptor be fetched before the loop, or the
> > allocation structured so that descs is defined and initialized in one
> > statement?
> >
> 
> Hi Dmitry, please follow the cleanup.h conventions here and in the
> subsequent patch.

Hi Bart,

The convention (combining declaration with allocation) will not work
here because that would make the allocation have wrong scope.

If you want I can move declaration + NULL initialization just before the
loop. The topic of pulling allocation out of the loop was discussed with
Andy, it would result in duplicating the code and making the result much
worse.

Thanks.

-- 
Dmitry
