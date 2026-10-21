Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617487;
	b=m4mEA+d0H1ozqCfiTGvh6gxOuP4+aImlFO/rOjl0xToarZVrPYbvwqX4SSiDO9dp3ukN
	 w2Hxu4aZYSpOOiE09QHaTnMjpZfSgTGGyG5ea96ptabMr2orl9FqPp0q3jpCjUf6N40Rg
	 ALY+taEA4xijZcX+V12oIHKfcS81AbwqwI+1YP5vHRdaMN612e45rb8kZJVyWWJKM6uji
	 30bdNJwURS9FCc/xl9oEUbNGFxk2b805VHPjuTh59dsY/IhpskRgCJYy0SagG/Xc00y1J
	 P0znDSogRsmTYk0pYFOtLPa4D4GdJ1wHPJastbHNdGl6GoRwYeHD9EAbzEu3c6o059Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bLQEgj1URtmt26IcBLztvjUBYNIpMdnMK15TO8b3hVU=;
	b=pNBSqOzQ3tM6hV7Mp6mKDBLEBlDylxlowo2A9Xu5DXOcylmKp+YT0UuIGqSwkezomjTL
	 RJYexc8CaC7l9eSO4z/a0PMN5e0DwT2VEnWYjLQ7NKZrCUrXceR0B2/10WkLh2hQmppeV
	 WRY/4a6KCHeaBh0Tq1yjreLLNPXM6bUTqU/6hoXC8JqbaoYiM3Lie0xcLe4Y9C3LfryVl
	 kCEgBi8SHwb3YkZ+UdD8EvAeriuPoRO+i2GSMxST/pfgJaiw1hS+DqMmVG7OxJQ3ZQUJz
	 3fBcWuLBHc4oqY8l/F2nwQ2Ysvg1hjaCLT2lepPhEqRZWDJtemeTsXxMyRDoC3i23Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803BA606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 21:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 803BA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35c76e9614aso2128310eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 14:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617480; x=1793222280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bLQEgj1URtmt26IcBLztvjUBYNIpMdnMK15TO8b3hVU=;
        b=gua5QRVG+eG+KDaxF5mJg79GvcW5peFYWQ3JS9LKPHKVhUkoXODX0S4Jcbd2QfEeWs
         RPtmHW982AHXI6eYJ7Rv37pb8rUeq8ng22L1gr/p4vaGu5ldEPnOFxWSOZEs2JUSLMYr
         cqoWYLzVYS1vwJ5BRNm2fRosal6Ez2XKoecvGFZvHCxeef/Itsg56ht/K3I1AIJbxGHS
         VBtCw7Lrq2Ze1k6UrMoX76ByfBDHLTYERBi0RXXjdq2MJbboOlZ1u8I6KK0gGlqGE5Rk
         JoDdWJjY6Zhi89X297LDAvfBdt2RXNakhquT4LAMjGjC1jqcjlK8rGMueHcUXvwYWDL9
         z9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617480; x=1793222280;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLQEgj1URtmt26IcBLztvjUBYNIpMdnMK15TO8b3hVU=;
        b=efD+Uh2zIdiIrGYJ7OBlvoI2rahee/QSV6gHMDc/s8OdPiUzAtI7SnzvPAikhaCUyG
         y+H7UHZ5Btq4iw3Isb2FIBwJQrSWt6fGSoXrkSU+0+68ra7Lux/hJmf6ZXZ/pe1xQFWV
         ya68FHfxSy5tHH+cDDxQerlwEF2T+cmI4tv0djjAuqHgAPCC9P2x8cNEouNmTGewWDU1
         Ra33MW11sTvxTb5JHJ/Qs3hnqHvuCwRQi79e+QpeVP/sd4lRgQlAC0jz7cYrP0SjZ0CC
         1po1zWswO19dh2z+W11tnh0qknOqnFpzleUUAW9/A0zWL6VIiAyd8vUP18TxTkIKdLAF
         e3rw==
X-Forwarded-Encrypted: i=1; AKwUvBxt2Xr9bUEmrMwyqbLwVK9cr9NZFv8wKHp4K9LBFV4Cd3pvPSkClfVbDoSCPeNsDXEv+bzU672MZ6TF@vger.kernel.org
X-Gm-Message-State: AFq9FYIlSgwUM1xoMw5duOTKWEbztWDYpG1YpZw9GidHEXzJWrSw0ybI
	OmzaVjXbBO5uk/q8Wd5xrZukXjzjZnHdgHNn+g0YPuCvkPA0hbUpxUZF
X-Gm-Gg: AYBFou0VGJ5y1devGp04jR+uxDWIVJtb1aNCwQQrtuMW5jOU6FDOz7kpm4QPFDpMeIl
	DXL34pyjyo4vlS5PfukuE45Aw0uo3TlZWLJYhOY9FJqzwtlkrYG7/ElmJCZaml39XhGGHpFxWBI
	FlBs+6hhuEECjzNdSw+GFoZiHP7IJRNPNKv6Pm5fflN07AxGosO7BvTsNaBxei/ULQEy1xB+ZJZ
	cxpx4Da1vCkRe7xOQAAaLpdeag0EBi1fugBesQn1JzVB+0luWXJwwwFF4wEcZ9GRzNO7hgRJQNX
	MyLrHvw2nipJWvBlKuNqSnZM5Y+nA9TVHvGX1PhixZh3SKqsiUZRHTIJYr8o8BVvGnQC27wpIwn
	xEkN+HnF/Ec6fkVZbIMKV3WfHhvOZbzRFTDLAUcovdBlGJyaJbp1htq41e4Ktfh4yEf9WlfhxcT
	wdZGKuw10jFlmVl3/X7QwriPi6bnMUbmG20Lv8Ujn5mkHiWdM5YMpAKKfBmGP4yn5aPljOU8w7T
	u+oRgC00J85isRnyUiSyjXGjjGx2d/Nx5Yr4gBPHAUNwIb548C7exsZjkxaGLzq9uX5l3Pl04ji
	D1QCQQP+E/3Uyn8rNTyEdTnxvlfxX+zkI2mp8JPhIeE=
X-Received: by 2002:a05:7022:407:b0:16a:b995:dc7c with SMTP id a92af1059eb24-19140a1e191mr4304340c88.21.1792617479431;
        Wed, 21 Oct 2026 14:17:59 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-190e29381d9sm7244282c88.18.2026.10.21.14.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:17:58 -0700 (PDT)
Date: Wed, 21 Oct 2026 14:17:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] gpiolib: avoid krealloc() in gpiod_get_array()
Message-ID: <atkp9edGVHRWrJCa@google.com>
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
 <20261021190212.2237804-5-dmitry.torokhov@gmail.com>
 <atkTqWUn-2tzRw69@ashevche-desk.local>
 <ebd179ed9fd8af509ef3ecbea1c348c6@gmail.com>
 <atkmj6rxedA-XPf-@ashevche-desk.local>
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
In-Reply-To: <atkmj6rxedA-XPf-@ashevche-desk.local>

On Wed, Oct 21, 2026 at 11:54:39PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 01:39:49PM -0700, Dmitry Torokhov wrote:
> > On Wed, Oct 21, 2026 at 10:34:01PM +0300, Andy Shevchenko wrote:
> > > On Wed, Oct 21, 2026 at 12:02:10PM -0700, Dmitry Torokhov wrote:
> 
> ...
> 
> > > > +	bitmap_set(array_info->get_mask, 0, count);
> > > > +	bitmap_set(array_info->set_mask, 0, count);
> > >
> > > With the above being done, I would rather see bitmap_zalloc() for bitmaps.
> > 
> > struct gpio_array is defined with a flexible array member (invert_mask[])
> > specifically so that descs, array_info, and all three bitmaps live in a
> > single allocation. Switching to bitmap_zalloc() would turn one allocation
> > into four or five separate allocations and require freeing the bitmaps
> > both in gpiod_put_array() and when cancelling the fast path in
> > gpio_descs_check_fastpath(), so I would prefer to keep the single
> > contiguous allocation here.
> 
> Why? You can also allocate 3x bitmaps with bitmap_zalloc(). So I see only
> a single additional allocation.

So the proposal is to continue combining gpio_descs and gpio_array
allocation but split out bitmap allocations (still combining them into
one, so needing to round up nbits).

This looks like worst combination of all. Why do you prefer
bitmap_zalloc()?

> 
> ...
> 
> > > >  	count = gpiod_count(dev, con_id);
> > > > -	if (count < 0)
> > > > -		return ERR_PTR(count);
> > >
> > > Leave this and simply add
> > >
> > > > -	struct gpio_descs *descs __free(gpiod_put_array) =
> > > > -		kzalloc_flex(*descs, desc, count);
> > > > -	if (!descs)
> > > > -		return ERR_PTR(-ENOMEM);
> > > > +	if (count <= 0)
> > > > +		return ERR_PTR(count ?: -ENOENT);
> > >
> > > 	if (count == 0)
> > > 		return -ENOENT;
> > >
> > > The currently proposed code is less readable.
> > 
> > Looking closer at gpiod_count(), all of its real backends
> > (of_gpio_count(), acpi_gpio_count(), swnode_gpio_count(), and
> > platform_gpio_count()) return either a positive count or -ENOENT, and
> > the !CONFIG_GPIO_ACPI stub for acpi_gpio_count() returns -ENODEV. The
> > only outlier is the !CONFIG_OF_GPIO stub for of_gpio_count() in
> > drivers/gpio/gpiolib-of.h, which returns 0 (and also causes
> > gpiod_count() to skip the if (count < 0) fallback to
> > platform_gpio_count()).
> > 
> > Do we actually need to check for count == 0 in gpiod_get_array(), or can
> > we fix the !CONFIG_OF_GPIO stub of of_gpio_count() to return -ENOENT and
> > leave the count < 0 check in gpiod_get_array() untouched?
> 
> I would fix of_gpio_count() stub. But I haven't check its users for correctness
> of such a change. I think it would be weird for them to expect 0 when OF_GPIO=n.

OK, I can fix up the stub. The only user of of_gpio_count() is
gpiod_count().

> 
> ...
> 
> > > >  	for (i = 0; i < count; i++) {
> > > > -		desc = gpiod_get_index(dev, con_id, i, flags);
> > > > +		struct gpio_desc *desc __free(gpiod_put) =
> > > > +			gpiod_get_index(dev, con_id, i, flags);
> > > >  		if (IS_ERR(desc))
> > > >  			return ERR_CAST(desc);
> > > >  
> > > > +		if (i == 0) {
> > >
> > > This is almost invariant to the loop. Can we move it out?
> > >
> > > > +			descs = gpio_descs_alloc(count, desc);
> > > > +			if (!descs)
> > > >  				return ERR_PTR(-ENOMEM);
> > > >  		}
> > > >  
> > > > +		gpio_descs_check_fastpath(descs, desc);
> > > >  
> > > > +		descs->desc[descs->ndescs++] = no_free_ptr(desc);
> > > >  	}
> > 
> > gpio_descs_alloc() needs the first descriptor (desc at index 0, acquired
> > by gpiod_get_index() inside the loop) to check gpiod_hwgpio(desc) and
> > gdev->ngpio so it knows whether to allocate space for array_info and the
> > bitmaps up front instead of reallocating with krealloc(). Before the
> > loop we have not looked up the first descriptor yet.
> 
> That's why I put 'almost' which means we might need to duplicate a few calls
> outside as well.

Yeah, I think doing it inside the loop rather than duplication
gpiod_get_index() outside makes it cleaner.

Thanks.

-- 
Dmitry
