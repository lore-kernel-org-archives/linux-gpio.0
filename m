Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812493;
	b=vypBIGmca6AzrAFRhP92DP4UNt1yOkl5c9KRT4YwGigqdy1ZcpycbrikrqhSoSFVPZNT
	 q2VW3iYf68GQPB49HRgL9ZhYplzWhAArkEWNucsT0v2nFb4OMoQnQT1hK2nE1qtYcRkQ4
	 2OgMPFekullFDdhZJ/gVYqd3QZ8NaWF4ASXU1MNX7QFridg8p15lK1n6bPa4NFpf90BxP
	 zjQWPIstD6GIOgTJ/9b4FLUlkcB/+IL8j/5zgayJp1CDdS+Q9FqN08z3PxeP6vdoDpzYP
	 P9WwkUHssKR5a6uyqSZ6TfbN4IzKxP6eTc91NAhJdj5GMLzh24Db9MotMPkjhfhoRwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8Tk9o6IieBArsy5b1SnzwwFbc9EAPjVVFMVTbmTMARw=;
	b=fOhtFopG4PLJaQlbs5tvwEpjhsK5Pq2lFSBa4uPF3aE20RWUetcZrK4zcd4qess05Mg4
	 9qfZaRFb1i7/9k9u2F4YX2QhLC1k54oOBD6gfcP75miXWvEBPDuLJYJ/x5iqYSme5NwMl
	 VJJILkhrTI/HtZV6bqD8KEU05X6e/7VU6BELUUgjX6KGlMvgpNlvMPRYHarbmfes4Pfyj
	 QbfdJOvaJIYjDyNCTeKXzdZjsj2mwjhTsP789NjyQ/6HSudSzx0HvsqE/PiUVxnfrLi+8
	 1R/JMzFZJIyr2/GLK981ggSHGSNXixcm6TJ1kNy7EhkGTTn6BVRo4UroXUUXpmeA1nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7vgpPhs;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90551606A32E
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 17:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90551606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7vgpPhs
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36661f953e4so1288931eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 09:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793812492; x=1794417292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Tk9o6IieBArsy5b1SnzwwFbc9EAPjVVFMVTbmTMARw=;
        b=r7vgpPhsfXAD/eDPoPKBJqp1NbMGEOh2HtYg0QWMZEFRUPoL5MZOt0/rA7A/b3+bdq
         3Vrn2f8D878xf7rGv8HmJKYUF7DJU5HUguZVjAdTOshEJ1zWRLyxyU82dwaKs6SS9Hgs
         d61TnuDUB+c/xryTWy02US4gteRh6RaDNHvG7xLtw1cKimjKBgon61kB1ITpsjiGsNzL
         gVb3PE5OBe86S6vIWvrgrbsYD7lpmgjBAVbD4wTI1GBtfmJX5rWZbMtUNrXtaUe+mNpP
         +QV2B4Qlg9oxjOGGEU4O9TdQLpVbE0HiDy2GCt40uAjXDM1d8tyd7TwQmKCF3oZMqlmC
         8C2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812492; x=1794417292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Tk9o6IieBArsy5b1SnzwwFbc9EAPjVVFMVTbmTMARw=;
        b=LcmTCOQBFBiE6UhxUkZdgEJ58HOm7IuMauvj7CRG8PHeUjrSTJvg8M5Wgw3B4lOcTB
         DQZLv55nn2aLBq+cjKtTcusMTEbFhY3/XX5a+iqpZrhPjWWZm/vaUSo33Zrh/S6XQOZR
         0BMiNVGqmPu4UWfh+vHdi90t81qq7r5kA9B/eOJCtbnsBI3R9enp3YOcf8xyK0VwhnRu
         eAeeKuPoOVQhqeOf9QGS/b8/ihv9BoZrr4jfAAorwGpg38Ycg0hjJ8enW5/NkfiGpRVF
         zTQ11Cy7/fLgQOoTvuYHJRNwrS34qnv0+5SbyZkp3OjQCt6H64vg7hS53zoloMHzBViI
         eODw==
X-Gm-Message-State: APuU4Z/sDlJZ1sJDJIV3cOC+dHlWDe2a+DCwWlghQBYDFHiY4vqQW4M4
	OOmVD/jexiw3Q9fe1zSkIt3oFGSMz4PRACJ61QaPc26vo3EzJlbq6g9f
X-Gm-Gg: AYBFou26ly3UMFpNNChT0vCcU5LTYTRCpoadiPNvVZBUghwJtWRDISBXgw+Rfkje7mg
	E/vu3JuMKxgjSPfUVA7u25/hpV/dFkLBONy4uAhqFcQuPBxz8pcjrTsM9ow29zCH5/OKeM1ru4r
	+2mJKS5Vzn7NT2mSAI7FW/qAKLPYhU0+fCA2RAJmv7vgZkt5w/iXz96kMhdbSIusMrlITLmtkQM
	lw8Kn7eHKFxDuhHxPEiyenzD9O+alP1g9tOAAefWJTplRqo6Wg7ytudU5FfutgvPTmgpKpjsPYs
	I0OhE5DL90lQXwLo3wL9V+DMXSNBI7khzRK5tKO7RJ9ftuG2+8KxRNvzeVZp4qJltZDGiJ+d2li
	X7RgqyannZxChnQP1UYXoR5Hc3EeVFSBY8lKaoYHdDQcwd2KMxXBvz4cTHPsbL7YPRwc+SyN9Wv
	kP2ZX+2O5aeQJ1/pD1CFBfpOIWJxjstmHd/ugDyFYYsnIGD0EAtRmiElHZVb15s2D5ES3BDOC4g
	3zTnySiBqKRXdS7lddDK7sqtE3hYsBqBlaniag7b9Bblgnv8nLPzZ8C+CaZ9F9voA1FAs5FUiKn
	kxW63+JmMiCpI0Sypvtc6U4+WpCBI22lS8D4JsytU3Utus7jQEZz9PWaVSTKaTr+AWo3
X-Received: by 2002:a05:693c:8803:20b0:361:6884:78b1 with SMTP id 5a478bee46e88-36a423bf728mr26348620eec.28.1793812491370;
        Wed, 04 Nov 2026 09:14:51 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9116582eec.13.2026.11.04.09.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:14:50 -0800 (PST)
Date: Wed, 4 Nov 2026 09:14:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 7/7] gpiolib: use bitmap_zalloc() for fastpath bitmaps
Message-ID: <autn9QXRkZuYFD-1@google.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-7-ea46767c9cf8@gmail.com>
 <sashiko-outbox-196638@kernel.org>
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
In-Reply-To: <sashiko-outbox-196638@kernel.org>

On Wed, Nov 04, 2026 at 03:50:46AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] gpiolib: define and initialize __free() variable in gpio_descs_alloc()
> --
> 
> commit 014858138dec2ff00e5cb0fd3fa050587447ef44
> Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> gpiolib: use bitmap_zalloc() for fastpath bitmaps
> 
> This commit converts invert_mask in struct gpio_array to a pointer and
> allocates the get_mask, set_mask, and invert_mask fastpath bitmaps
> individually via bitmap_zalloc() instead of a single combined kzalloc()
> with manual pointer arithmetic.
> 
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index cf311c1a707c9..bba4e5bb125f9 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -5208,13 +5208,28 @@ static void gpiochip_free_hogs(struct gpio_chip *gc)
> 
> [ ... ]
> 
> > +static struct gpio_descs *gpio_descs_alloc(unsigned int count,
> > +					   struct gpio_desc *first_desc)
> >  {
> >  	struct gpio_device *gdev = gpiod_to_gpio_device(first_desc);
> > +	struct gpio_descs *descs __free(gpiod_put_array) = NULL;
> >  	struct gpio_array *array_info;
> > -	struct gpio_descs *descs;
> >  	size_t descs_size, alloc_size;
> > -	unsigned int bitmap_size;
> > +	unsigned int nbits;
> >  
> >  	/*
> >  	 * If pin hardware number of array member 0 is also 0, select
> > @@ -5224,25 +5239,36 @@ static struct gpio_descs *gpio_descs_alloc(unsigned int count, struct gpio_desc
> >  		return kzalloc_flex(*descs, desc, count);
> >  
> >  	descs_size = struct_size(descs, desc, count);
> > -	bitmap_size = BITS_TO_LONGS(max(gdev->ngpio, count));
> > -	alloc_size = descs_size + struct_size(array_info, invert_mask, 3 * bitmap_size);
> > +	alloc_size = descs_size + sizeof(*array_info);
> >  
> >  	descs = kzalloc(alloc_size, GFP_KERNEL);
> 
> [Severity: Low]
> This isn't a bug, but cleanup.h conventions prefer defining and initializing
> __free() variables in a single statement rather than declaring them as NULL
> at the top of the function and assigning them later.
> 
> In gpio_descs_alloc(), could descs be defined and initialized directly at the
> kzalloc() call site after computing descs_size (using struct_size_t(struct
> gpio_descs, desc, count)) and alloc_size?
> 

Yeah, will fix.

-- 
Dmitry
