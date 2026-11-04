Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802210;
	b=P17hLNbHhxkhS9wKG8Gq0GvCAsEXLiDsOqcShdoQoW8oZqdRHbUQx0h63VBb0/iazU6o
	 Ay+Vf5cfFfz38gV0iGyN/D2sA2ykQY7ZyhVCsKemx66iBMgBNn3u+AAYLGTvx4mUp3/1s
	 JmItokHKrMv4gD5haIWUWc6/EDMslTQe4TZIRiildH5W6b4s7dfjPbH6YxTc3UOuqfMym
	 IC7pFsOqkDTXtDaqCcGplm6LDy2o/l28eT41RQ0jRAs5cHywGujQVQBn+bqderEiGO427
	 V9LaHVYHItt5eidwfkj7p9SsML9lVgs0dpHlOk/MtsGq5pb6LU1VxshYVN8g6dTJrrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802210;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0QvufXX/dS0oXhcE78Lkc8ubg0DBqHB8Wg9xQdkC/ME=;
	b=hNia61nn95es+UgdUAckD1PC65zA/z4wpiuSGP6BkNFWigXHdpl5DuwbQTjSRgFsoHTI
	 jPGfyv1Mi/ffyG0mXN0KxdFonmhpxNTHcyJZNF7HaUHsYWtGEcPPEv69uWDJZh4UHCi/Q
	 RV0SwvGWq3dS7QW/8E9U26IPFeS3swsSZ5dMAAb7yPa/PyyGo0AxZfVRNMNk7PcoQwr/0
	 3iwUPu2D31yg3eoxlNrTe7Qv+3QSm192K+k8zAiAAKQGN8LguNxUW97lWNyf6YB2pgE9j
	 vNMMiTSJoy4xrLmC4flNfi3go6ZQTuebzSoKMkJkuC3CZMx7k6WB9dwpmbUDvauMwng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mL7r86Fo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4D67F606A31B;
	Wed,  4 Nov 2026 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mL7r86Fo
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2B7F51F00919;
	Wed,  4 Nov 2026 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793802210;
	bh=0QvufXX/dS0oXhcE78Lkc8ubg0DBqHB8Wg9xQdkC/ME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mL7r86Fo5gyeZM0Citk5O6IqsMsWgB1dY3pHTFsMu5N4quzGwJigV9q+2N3eZbAd1
	 zt3rVj1eku87JYYspxrlKJyulF1IPrdwBYu6c64rFl472BOMGPW1GJ9y7oG7xspTIY
	 tAwjvA3VbJlW8nuTjWlhg5toVXyhW8s/ljciVeijwhNdpB/QzSe0OjiIDI1erKPktB
	 eUHkkL2M+pRCXz2TfHGn8meQfdet1p4YCM7o+e5k4a9MjbWDO8kLXqDWTIFXwmvusf
	 XBWoFUkTU+CkWMwajo+B0pmxiVZmZuFk3+qkq92HfYf3sj/eh9iHEvhZFMaoff0vi3
	 jN+2er/Ty/Wnw==
Date: Wed, 4 Nov 2026 15:23:26 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 6/7] gpiolib: avoid krealloc() in gpiod_get_array()
Message-ID: <atiydn7hetz4pfgpgybjfcdcwugp3rnqqbovtm6h45kaeh5bov@tqkc4qqm5zbx>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com>
 <sashiko-outbox-196636@kernel.org>
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
In-Reply-To: <sashiko-outbox-196636@kernel.org>

On Wed, Nov 04, 2026 at 03:48:34AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] gpiolib: delayed initialization of __free() variable in gpiod_get_array()
> --
> 
> commit ab11568406b8d4aa5255ce95e09509f3e6c86285
> Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> gpiolib: avoid krealloc() in gpiod_get_array()
> 
> This commit defers allocating the gpio_descs structure in gpiod_get_array()
> until the first GPIO descriptor is retrieved so that it can be allocated in
> a single pass without needing krealloc(). It also factors descriptor
> allocation and fast-path checks into helper functions.
>

...

> > +			descs = gpio_descs_alloc(count, desc);
> > +			if (!descs)
> >  				return ERR_PTR(-ENOMEM);
> > -
> > -			descs = array;
> > -
> > -			array_info = (void *)descs + descs_size;
> > -			array_info->get_mask = array_info->invert_mask +
> > -						  bitmap_size;
> > -			array_info->set_mask = array_info->get_mask +
> > -						  bitmap_size;
> > -
> > -			array_info->desc = descs->desc;
> > -			array_info->size = count;
> > -			array_info->gdev = gdev;
> > -			bitmap_set(array_info->get_mask, 0, count);
> > -			bitmap_set(array_info->set_mask, 0, count);
> > -			descs->info = array_info;
> >  		}
> 
> [Severity: Low]
> This isn't a bug, but in gpiod_get_array(), descs is declared at the top of
> the function with __free(gpiod_put_array) = NULL and then assigned later
> inside the loop when i == 0.
> 
> The cleanup.h conventions ask that __free() variables be defined and
> initialized in a single statement at the point of resource acquisition
> rather than initialized to NULL at the top of the function and assigned
> later. Could the first descriptor be fetched before the loop, or the
> allocation structured so that descs is defined and initialized in one
> statement?
>

Hi Dmitry, please follow the cleanup.h conventions here and in the
subsequent patch.

Bart
