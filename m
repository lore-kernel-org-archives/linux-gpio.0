Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2A4387361
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 15:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078655; cv=none; b=p2k9P9dAUrtpdEGDSivPqDfV54DOx3nVZp3qxoBrAczZOgDXNfPmgYAcMKfN3jnelKs7zdzagD6ELeDRjg3XvUwwuJQoU/ySAisnz4zKYMfzpe3i4C3itfPZFPBTlY3SfL4wTC716RNeBaHdBxw+dFf/LmOB4ImYmobPNhKvRl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078655; c=relaxed/simple;
	bh=DWEwL2IuIwaWD4tGtnV07L3j96W4HS87ywTZhYTPtt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0qIJ6F9LvlCNyH+XxMz329oldINyoZ4sK1geL37VQEI6zZ5kfdhS/UevdCDMUgH+MSea97b35DTSEHnoKcqTdNZgeR2W303spqjKoNRwQFjWY45xS3SQbxyJ7k1wfE8qitGMBoS43WEmDEYA/IcTXgZj72E1g+7OEKNbaf8ERE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWKCTjFg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWKCTjFg"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-886e61fa30fso2085106b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792078646; x=1792683446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1FE39Q7Vqkg2nBU/Z48lyMkirilHc8yi0TJpkls3cP8=;
        b=XWKCTjFg2uk9eWDXX1FeCZxQiRYTbhpdHFnjJKolsl3me8g75aI0qJ7RgABJq4tzgg
         8V5zx+coxK5XZO3dsufmbbql+DqUDXq8WPf0B691IbmekY4ar2SXTW36KMZEmyXynEko
         zSv4kqLuSUR00fEFmjPhNRX7iior4eu5sRO9aKwCsKSxef1HXwCOmCDEHp3R2aPTjxq1
         NpScvR/MkCw55gqD7F34FzXSuSm3guQcOSQGrbKm99GT1SH1bHlyoHUqnhvWNz6ufZmo
         UVg/ynsqS/Yc16V17xqs0+RhdonL6Q8glqOhZWpf05ySZ0zTU/CDF+3H/CjmAMSJiMr+
         DWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078646; x=1792683446;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FE39Q7Vqkg2nBU/Z48lyMkirilHc8yi0TJpkls3cP8=;
        b=cZzb06owxqWtM5SvGLOfUkYa94N+qUib/KaNSReDNGXZ0JvlOPtJLb/XOFZ8YxPH8q
         6l6iv+OfzEsW4SY3lqiKextQialsagjLONeu2tQd6inY0UBic9y1h+zk5Cdl5FUOFnPz
         lylrrri+3FC+FAlQB3wNxGJPl0+zyGHylsot+oGpi7v5SLDrU+wS8JJtkgNH6bBOt5oG
         udvEXxttzRGZQSjrYcAqw//Ozd6DlaEc9gdWEtRXMA00n7VswXQpcyUkMmP8ESY/EQqx
         7Vzo+wZ9jzL3vqZe1bT1XDfuy0uUFbA5XNy5KACLym7PIqfB/A3a9hP/C40e/nPMORjz
         6yjg==
X-Forwarded-Encrypted: i=1; AKwUvByda4kmKZfEbxCcjM6aVgi+JwtyNj5RzJYpAyfSzG3J5GbzY+X029F4pBOY9t93DOdrf2hWeKYvCweW@vger.kernel.org
X-Gm-Message-State: AFq9FYJR+oTWS2QQcgUXVJFNF42mNHjvIkJIhg0H2p6GUtvyQdmGLHmE
	ujWsFhB3OkntRl9a2xb2H0/Z+07k5MbsXWy8P/hAZyK5ZZsq7nTKmbj01Qwjbw==
X-Gm-Gg: AYBFou2/tNh+4XYrv1Y/awWZpxhn4ZvDkfYPBweHa/EQGpdUdNfOW+sbRehpvmC8BZd
	NzzZjKj5vUKRi/dnKDVGcroAXeqw65OpNtCsTdj1SO3YRMJTYZhNXfxogrgMeJrXCNy5ElJmccB
	E+NgprOTEvbPGPtcHJSHv4Nr5bxBkuhB3f0uFOFfPJh3fzD8GvufUrMOYpBtrWn+gNhUiX5/wgD
	S7QkOuaU73UGVJTYAci5dPTr8LDT7JQXChr//JhOlJxcR4/I9ERIhkLkJNdosxk53VhRC1cb3pj
	yWJ2sCgCAsKUzULCstA8tyI9kIoD52v/FixdnWY1qSP04PTBqgL4qAlZ6XXMEe75XmE6BDdI2MS
	0yvPn6tSUIYqmVuYnqYI1w4RwGCej8X5bZrVWt9rN36ZpPH6Qxi5Nz1BvwtVLj8WnsBod1EqEZJ
	g2tDgZS9gIj/txrelpEPh2NrBpwzKr7bb1+dHenPj08fxpmQUyIwbCrJmgZ+Dn7BeZzW2I/jH2Z
	LGFV90FXLjcmZbx/ms=
X-Received: by 2002:a05:6a20:4393:b0:3bf:63af:855 with SMTP id adf61e73a8af0-3e16bb0935bmr17207208637.1.1792078645696;
        Thu, 15 Oct 2026 08:37:25 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635c612a9sm1486761a12.17.2026.10.15.08.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:37:23 -0700 (PDT)
Date: Thu, 15 Oct 2026 23:37:14 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: cdev: don't record a line direction the driver
 refused
Message-ID: <20261015153714.GA105746@rigel>
References: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com>
 <sashiko-outbox-168233@kernel.org>
 <20261014043645.GA13991@rigel>
 <CAMRc=MeKQMiF8T+fb1TxUmk-GwF3fCwkB2GoVvEe_kcpbG6saQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeKQMiF8T+fb1TxUmk-GwF3fCwkB2GoVvEe_kcpbG6saQ@mail.gmail.com>

On Thu, Oct 15, 2026 at 06:36:26AM -0700, Bartosz Golaszewski wrote:
> On Wed, 14 Oct 2026 06:36:45 +0200, Kent Gibson <warthog618@gmail.com> said:
> > On Mon, Oct 12, 2026 at 02:04:58PM +0000, sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> >> - [High] gpio: memory leak in gpiod_set_array_value_complex() on error paths
> >> - [High] gpio: non-atomic desc->flags update clobbers concurrent IRQ flags
> >> --
> >>
> >> commit 910242af9150f094f4676cb26fb8b58cc8edfa96
> >> Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
> >>
> >
> > Hi Bart,
> >
> > following this up with you directly since Sashiko doesn't currently let
> > original authors or maintainers know about problems it discovers in existing
> > code, just the patch author and the list.
> >
> >> gpiolib: cdev: don't record a line direction the driver refused
> >>
> >> The commit modifies gpio_v2_line_config_flags_to_desc_flags() to avoid setting
> >> the GPIOD_FLAG_IS_OUT flag before the hardware direction is confirmed by the
> >> driver. This fixes an issue where refused configurations would leave the line
> >> erroneously reported as an output or input.
> >>
> >> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> >> > index 5d53bfcdf7268..9bbee3a1f9c9c 100644
> >> > --- a/drivers/gpio/gpiolib-cdev.c
> >> > +++ b/drivers/gpio/gpiolib-cdev.c
> >> > @@ -1226,14 +1226,13 @@ static void gpio_v2_line_config_flags_to_desc_flags(u64 lflags,
> >> >  {
> >> >  	unsigned long flags = READ_ONCE(*flagsp);
> >>
> >> [Severity: High]
> >> Does this non-atomic read-modify-write clobber concurrent atomic updates to
> >> desc->flags made by the IRQ subsystem?
> >>
> >> If a driver or IRQ domain calls gpiochip_lock_as_irq() or
> >> gpiochip_enable_irq() concurrently, they atomically update bits like
> >> GPIOD_FLAG_USED_AS_IRQ:
> >>
> >> 	set_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags);
> >> 	set_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &desc->flags);
> >>
> >> Because the IRQ subsystem does not check GPIOD_FLAG_REQUESTED before using
> >> the line and does not share locks with the cdev ioctl, these atomic updates
> >> can happen between this READ_ONCE() and the subsequent
> >> WRITE_ONCE(*flagsp, flags) at the end of this function.
> >>
> >> Wouldn't the atomic updates be silently overwritten when this function writes
> >> back the stale flags value?
> >>
> >> Losing these flags disables the safety check in
> >> gpiod_direction_output_nonotify(), which could allow user-space to force an
> >> active interrupt line into output mode.
> >>
> >
> > This isn't a scenario that I'd considered - I was probably assuming
> > GPIOD_FLAG_REQUESTED being set would provide protection by making the
> > line unavailable.
> >
> > How would you like to handle this?
> >
> 
> Sign... By adding it to the heap of GPIO issues found by sashiko. :(
> 

Sorry - I was hoping to help take it off that heap.

> We can't protect the flags with mutex or spinlock due to the multitude of
> issues that forced us to use SRCU. We could maybe consider atomic_t for the
> flags field and that would allow us to use various atomic ops and possibly it
> would be enough to cover all the read-modify-write cases we have. I need to
> think about it and will also ask the clanker for help.
> 

I was thinking along the lines of reverting to atomic bitops directly
on the flags, e.g. reverting b7adfb6076ff, without changing the
underlying type to atomic_t.
Given that most of the time we are operating on individual flags.

With atomic_t you could also use xchg variants for bulk ops?

Anyway, let me know if there is anything I can do to assist.

> >> >
> >> > +	/*
> >> > +	 * GPIOD_FLAG_IS_OUT is left to gpiod_direction_input/output(), which
> >> > +	 * only update it once the chip has accepted the direction.
> >> > +	 */
> >> >  	assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
> >> >  		   lflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
> >> >
> >> > -	if (lflags & GPIO_V2_LINE_FLAG_OUTPUT)
> >> > -		set_bit(GPIOD_FLAG_IS_OUT, &flags);
> >> > -	else if (lflags & GPIO_V2_LINE_FLAG_INPUT)
> >> > -		clear_bit(GPIOD_FLAG_IS_OUT, &flags);
> >> > -
> >>
> >> [Severity: High]
> >> By leaving GPIOD_FLAG_IS_OUT unset when a driver refuses the output direction,
> >> does this create a memory leak in gpiod_set_array_value_complex() when
> >> user-space subsequently calls GPIO_V2_LINE_SET_VALUES_IOCTL?
> >>
> >> Looking at gpiod_set_array_value_complex() in drivers/gpio/gpiolib.c, mask
> >> and bits can be dynamically allocated with bitmap_alloc() for large GPIO
> >> chips:
> >>
> >> 			if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags)))
> >> 				return -EPERM;
> >>
> >> If a descriptor is not configured as an output, the function immediately
> >> returns -EPERM.
> >>
> >> Doesn't this bypass the bitmap_free() calls at the end of the function and
> >> leak mask and bits?
> >>
> >> The same direct return leak appears to occur if the driver's set_multiple
> >> callback fails:
> >>
> >> 		if (count != 0) {
> >> 			ret = gpiochip_set_multiple(guard.gc, mask, bits);
> >> 			if (ret)
> >> 				return ret;
> >>
> >
> > This also looks like a valid concern in existing code.  Unlikely, but valid.
> >
> > It is also not something we can readily test.
> > Would you be open to extending gpio-sim so we can simulate constrained drivers
> > to better test alternate paths in gpiolib and cdev?
> > e.g. input only, output only, not supporting bias, supporting open drain, open
> > source, debounce, ...?
> > I haven't put any thought into what that might look like on the
> > userspace side, much less done any actual work on it, - just wondering if you
> > had or would at least be ok with it.
> >
> 
> Definitely! I don't see why I would ever be against extending the test
> coverage. :)
> 

Ok, I'll try to give it some thought.

Cheers,
Kent.

