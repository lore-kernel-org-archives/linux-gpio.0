Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615199;
	b=l/3AqChmUkLuS2J1Q4hYEznyJR7OTS0gE/+2yeKLuIUuj0A3Cg+LKRpYC2qBvSf+QubR
	 lw9skPSyx+ZtzD1eRUxeKaEno2PJhUkLMqYZfbCsBuwGAO6X13Pru0yZGhr+nc0cCOxsW
	 Oz2C81z5bM6rlxtj0pNRgpnuEhOmawibtPF+qV4dTaHOGD4rO6DCLC78irnpI7NN86feD
	 euIaFioVXxUkHF8bBjVg1eumd8EVt59rmIyI3rGrvR/B/X0q9X84egiMXfBIQhvsdFjPi
	 T1qLH6Xkgi3yxMcD1uVHtVAdgh0SLk3iJf5fs7XtYC7NBKcI1e6MsVSGOs1CuLX0i1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=X/T5dYcGvVFYEEIO1PI96NGToosSCPyok7jWSISleC4=;
	b=fLXxMKLoQ1sUHoKlJ/jMrFgSDcuxtzxb0OJpQgLDgXWHK0WULT8JZwh4fZq8NRTFbeGY
	 Xpe0NhUNMvg09L3nY+x+YpyhkMoyc5UEZXECcf+c8DfkFO2EwrL/C5Wqbzq2piAfDz7ot
	 BxdRBul2RfbQzusX34bvBZiTLnGreLbWjDS7Tsjkeo3YJU1VcbF2KwEO9LJgVOY4PJVCr
	 zvjHlfnmuXddqQdF2DvrZAv0coslnebVto5tsPB6r39UzyEOubdUmbyd7W8iquz5CNDBE
	 va5let0HlRMM6L/Nn58wrAoLJ4fqhLdxiCtlfPDB6pKHaGK9oCPfsg355+vVAUoyjew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967E6606A319
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 20:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967E6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35c76e9614aso2074413eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 13:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792615194; x=1793219994; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/T5dYcGvVFYEEIO1PI96NGToosSCPyok7jWSISleC4=;
        b=Ive130vhLibR/y/CmdR4VJVEfTjilCH91XXWk9jt8BFxMy3fDJw5Rlc6lQogBcNCil
         FIjgGsbKZ3fYbYxu3tDtZZZkIV2iQM9a9Yd8wHlklBO98lhFct6rYaixpHynrkTKuLTa
         gxJBOFWju0gG29nF1gwH5knzYdVfvOAamSM3SdOiPEK4Gqmjvrb+f0ywmHwaPFEZtRpB
         pw5qY7Y1ht4dapiAe7vYIpu/2cKLIIYYrdQqS3aYrmPLm3dyppFfJJfvEZtUXbuP5J9h
         4VFyFGYqGRSr1wC0+WQobRr/+HiBCU0Ya5SS83iyrSBNUsNr/1tsNjUhBK9PTNqhD2pk
         kSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615194; x=1793219994;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X/T5dYcGvVFYEEIO1PI96NGToosSCPyok7jWSISleC4=;
        b=XdJ2lWHNPyPNZOFif5kQNXSR7ue6H7HXBJsHMdzWZbdeW4HZjMnvl4ZQ3xCRWmUfpi
         B4WjQAMnmcS3MNVyxr1w7z09uT2WbjTqa048TjD2JD5DrVjol/Fz1+DANB/9CSe5P2vw
         hogBRHQB3IiXMfIrBC2WGJaRnxkMG+QBZyMzZL7KhWMyjcmj3ZCLNHb+XzMDn+5Wionm
         gcms71MoE60+s2iIPq5i3FjynS7VhgYNmNWD+0ABt7OoLmj+jOIHJW+0Cew4R6x3u254
         qxLqb80M6oe8WOw2dJyZns0ByZGOZwH0I485zsSkkU9g13xxWGPoN0JanTfEcmXmSxJo
         AvAA==
X-Forwarded-Encrypted: i=1; AKwUvBxTEVUA8uh7kdmEZidafmVYpaLnWTB+gCrxPfgmfm3k96tqoF/+RHgN7N/jK9qT5pYbjc7L/I5XdY9J@vger.kernel.org
X-Gm-Message-State: AFq9FYKBoMyIxxgu7neQdL0u3qXUxtIfhrS+4fajoFUL+yfWVaYjjkfH
	4ArtdqYuQBW6i9lp4d6BfTDupKlOhoFycNuLcZa+UigN/YLbWfwM+jfx
X-Gm-Gg: AYBFou3lI2l5gJXM8LAFTDJPlK8Z5Op2qJ6QIxc2vc7ORBtAxlVLDfQLKKBscwbLt2/
	jZyzy/7jiCXRVGIVQF3zRp9CR2mvKMJVMP+moN+0Wm91yFZrJg/zb4tqXeZxptas5BBRNaYYHM4
	OeDSL0X/r68JMlGKhTm9WlSoANXKnRCqYJgovJlfxzqtj9YDr0V3+H9Jf4/nNfXzniWBS/msOt+
	Uc1zF6h9TPICAnlE1ghtVdwP0Knld7gkrMAZrhfxcT3VBApQfYaNTc8qC68U0xNAqI/v91ePNk1
	/2B4ru/gLp6jb7CT9gs2AmeCIeY/OdiLNuhj/mJxDbnOmRFZFoOaLe137ZEhVOStG/dxlhg8QRu
	sJhjr8GsR0SXQHYWsSwrsgwl5WcjqTQt2nKqjsRwVeBdc0Emq6y5gSrvJDLYM/cP/mj2jEcdnBz
	NEFwDJQerx6s2rjZkpqnNQQ3lrfwM6BC27Pp70WWykoZTg2/30trpk5hd1cv8k9gthDI3fyfZ36
	GcySjSQKLZgj7luGIJyhzUg11M8guM1EWTDbKAyhZdMkQ+pEwJcr/aDohdnY8u4+uhwTzWc6Y6P
	XT2uqC7yzDcIdZTWdZD3
X-Received: by 2002:a05:693c:4144:10b0:365:9e3c:4ab2 with SMTP id 5a478bee46e88-3674f411e7fmr4859225eec.41.1792615192586;
        Wed, 21 Oct 2026 13:39:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca323effsm382788eec.7.2026.10.21.13.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:39:50 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:39:49 -0700
Message-ID: <ebd179ed9fd8af509ef3ecbea1c348c6@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] gpiolib: avoid krealloc() in gpiod_get_array()
In-Reply-To: <atkTqWUn-2tzRw69@ashevche-desk.local>
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com> <20261021190212.2237804-5-dmitry.torokhov@gmail.com> <atkTqWUn-2tzRw69@ashevche-desk.local>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Andy,

On Wed, Oct 21, 2026 at 10:34:01PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 12:02:10PM -0700, Dmitry Torokhov wrote:
> > +static struct gpio_descs *gpio_descs_alloc(unsigned int count, struct gpio_desc *first_desc)
> > +{
> > +	struct gpio_device *gdev = gpiod_to_gpio_device(first_desc);
> > +	struct gpio_array *array_info;
> > +	struct gpio_descs *descs;
> > +	size_t descs_size, alloc_size;
> > +	unsigned int bitmap_size;
> > +
> > +	/*
> > +	 * If pin hardware number of array member 0 is also 0, select
> > +	 * its chip as a candidate for fast bitmap processing path.
> > +	 */
> > +	if (gpiod_hwgpio(first_desc) != 0)
> > +		return kzalloc_flex(*descs, desc, count);
> > +
> > +	descs_size = struct_size(descs, desc, count);
> > +	bitmap_size = BITS_TO_LONGS(max(gdev->ngpio, count));
> > +	alloc_size = descs_size + struct_size(array_info, invert_mask, 3 * bitmap_size);
> > +
> > +	descs = kzalloc(alloc_size, GFP_KERNEL);
> > +	if (!descs)
> > +		return NULL;
> > +
> > +	array_info = (void *)descs + descs_size;
>
> > +	array_info->get_mask = array_info->invert_mask + bitmap_size;
> > +	array_info->set_mask = array_info->get_mask + bitmap_size;
>
> > +	array_info->desc = descs->desc;
> > +	array_info->size = count;
> > +	array_info->gdev = gdev;
> > +	bitmap_set(array_info->get_mask, 0, count);
> > +	bitmap_set(array_info->set_mask, 0, count);
>
> With the above being done, I would rather see bitmap_zalloc() for bitmaps.

struct gpio_array is defined with a flexible array member (invert_mask[])
specifically so that descs, array_info, and all three bitmaps live in a
single allocation. Switching to bitmap_zalloc() would turn one allocation
into four or five separate allocations and require freeing the bitmaps
both in gpiod_put_array() and when cancelling the fast path in
gpio_descs_check_fastpath(), so I would prefer to keep the single
contiguous allocation here.

> >  	count = gpiod_count(dev, con_id);
> > -	if (count < 0)
> > -		return ERR_PTR(count);
>
> Leave this and simply add
>
> > -	struct gpio_descs *descs __free(gpiod_put_array) =
> > -		kzalloc_flex(*descs, desc, count);
> > -	if (!descs)
> > -		return ERR_PTR(-ENOMEM);
> > +	if (count <= 0)
> > +		return ERR_PTR(count ?: -ENOENT);
>
> 	if (count == 0)
> 		return -ENOENT;
>
> The currently proposed code is less readable.

Looking closer at gpiod_count(), all of its real backends
(of_gpio_count(), acpi_gpio_count(), swnode_gpio_count(), and
platform_gpio_count()) return either a positive count or -ENOENT, and
the !CONFIG_GPIO_ACPI stub for acpi_gpio_count() returns -ENODEV. The
only outlier is the !CONFIG_OF_GPIO stub for of_gpio_count() in
drivers/gpio/gpiolib-of.h, which returns 0 (and also causes
gpiod_count() to skip the if (count < 0) fallback to
platform_gpio_count()).

Do we actually need to check for count == 0 in gpiod_get_array(), or can
we fix the !CONFIG_OF_GPIO stub of of_gpio_count() to return -ENOENT and
leave the count < 0 check in gpiod_get_array() untouched?

> >  	for (i = 0; i < count; i++) {
> > -		desc = gpiod_get_index(dev, con_id, i, flags);
> > +		struct gpio_desc *desc __free(gpiod_put) =
> > +			gpiod_get_index(dev, con_id, i, flags);
> >  		if (IS_ERR(desc))
> >  			return ERR_CAST(desc);
> >  
> > +		if (i == 0) {
>
> This is almost invariant to the loop. Can we move it out?
>
> > +			descs = gpio_descs_alloc(count, desc);
> > +			if (!descs)
> >  				return ERR_PTR(-ENOMEM);
> >  		}
> >  
> > +		gpio_descs_check_fastpath(descs, desc);
> >  
> > +		descs->desc[descs->ndescs++] = no_free_ptr(desc);
> >  	}

gpio_descs_alloc() needs the first descriptor (desc at index 0, acquired
by gpiod_get_index() inside the loop) to check gpiod_hwgpio(desc) and
gdev->ngpio so it knows whether to allocate space for array_info and the
bitmaps up front instead of reallocating with krealloc(). Before the
loop we have not looked up the first descriptor yet.

Thanks.

-- 
Dmitry
