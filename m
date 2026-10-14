Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538EF2868B4
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 04:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791952617; cv=none; b=rgWV45/RD8uxsKBfGokFVb8kfMTgnFnfm57NcU7hq157BxCgvOIYfknNoOySPhQk52rB6/oFMb1Uv7QxJ92JKdXP7VjwfgcnoJblHm3DrOKMEI7gglNweGwAhfkJLq+ByT1etc1uMeuG7cbl5JI7Khm2yLd3DQW+BgUcjBo/AmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791952617; c=relaxed/simple;
	bh=913S0N2ONHLmRLuK6hS24u9LvQSIo9+3yrYngKAt6Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TT1lf0LiLa0sQpph1duvArtvrKP8eP0AsYn8QDpGlkM/qQrCalZEuzv7GCZQlqCtC1bGhsbUR/5MFH+xKsMo3M1VnwiGijdPTdyk0nfF+PW4GfpBlgNJrVLiX+ahMVlXIwMbsDWJTP2hyC4oOdihkp0aefzF9RV84sVSPb+dgf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4gRhqFe; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4gRhqFe"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8874539bccbso24834b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 21:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791952615; x=1792557415; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJtuJmn6QAxc4IGgoXU0NiUvMniAp6RHAN8rLK0qjsw=;
        b=k4gRhqFehIGEw7QMkN1T+tnnkc5Nnx9iguXbpKK+LA2dHfg1NxvjrEZ+AGZlJmpDjn
         LiP4HmHvkHg3FMAXpvFjhuq6tMG2BEtgV+5O+uQ7tbVNxrCFYLKH74bSmSYTydHCK0Qj
         qtk92jcQ+0Pnrhq/yzIleVsos9f2pV9aZxPI7r1XJFapyyIDX/dKsB5vPIq15iEpjSxj
         fNVQhkzkwdXOFjln6lVpHH809t8d1cqD4R4/GhTDGBK24fg95oovvl4AKjmqw+ausmaQ
         hcGVa62V/+XkYzkkzvJCIduRBqX8Hq4YNvCwGmhwXBzEWz4Wq1ChNYuIRqxeLzXSpYlC
         9GOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791952615; x=1792557415;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YJtuJmn6QAxc4IGgoXU0NiUvMniAp6RHAN8rLK0qjsw=;
        b=gCX8Igw1X+I0p0hf//5XI/e0QI3wWghceqS12E4XjuPmZI0r9PHLR2qKFJBlQxEGP5
         Nf/eGPZ5lrPtnsozNBdFj4Bjzho5kw4AwUsa3FTaHvUSpILXM8L6qvh4s5z9bU6gDTQi
         ONlHo6EMS7RKAputSYHlMlcnlCvgHTnO+6kpML6qvB89RSmPQBmG8dZ2cg438R+n/ecr
         m7/pRf49KP1abInHNyJ/zulxDDqpwV+O+u700oXm5AhDYq69tztYi/+3Jr+s98xf6G76
         9mZ3W0bWa8905AVxE9GXho9mXm21DqWUTIr1eSzE570JDSRmK02fEjQcaDLBM0QSoqmT
         hfuQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8whnP2YJhxxhna9NIqbz6m+lXzuBoeHs3ALFRejNjv2q3ta0J6DLh2JqEbumSOob9NIh3T+tLfnK9@vger.kernel.org
X-Gm-Message-State: AFq9FYKSky0q3akdUCEr1HJ437iix8pplC3eCvX4sd7zw3mFDZgQTzqc
	kjdsa7hTqZ5psyCiZjoVDHOexGy/xUwL4X9KX9ZRlYMRm/H+Xz8U0PiF
X-Gm-Gg: AYBFou25bMrn1lVs9CYQCvvkhkcGWmHNMAxxVWuow/IV4SCyRsfIZdoxCc3C7E6clIE
	LveQBcipVx2EvtvKfIwewe6Em4o5d2tkf/rRvitrly5+JE5Gj+jA/wHBpGeDTfBomzG6uCcVP2e
	dvfsRfXe4Zzvy6n7pVX9JkjX5zhYs7+Rup2XXJunkYqlrrsMV9YdN8J/TSScWaUl45lOUVNRMdJ
	eNRU6YmImlvgwVi06iVzbbPyktkDdkkSvF2ioKeEauE1FnHDp/76B1Uetp/7xyTgPnSYe+V8iq8
	GsAJXEUr4HPnS0fE/TWQta5HDEjM8C0WGOCr3DCCiwbSr/wLfi4bVG+Lrx8rcWQQsWlcbTf2LO6
	CJkYinD6LBOlflg9CkODR9HyibrhZDYbAA/4+xZ/hHwUDw4afxxcT0hlv13alf0HyVF/4IzVQu9
	OGRktsRogVzfHg5Tt6kAVdrHIymIkUnlnv791coAXyGvXW+3ZxRqa/7H/q8J2RGzpv83JHvfXdM
	FrpdFCZ6QXIsng2Q9j+skK3woZM
X-Received: by 2002:a05:6a00:3d01:b0:880:973d:597a with SMTP id d2e1a72fcca58-897c82ad79cmr13526555b3a.53.1791952615483;
        Tue, 13 Oct 2026 21:36:55 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d803d6410sm580543b3a.33.2026.10.13.21.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:36:54 -0700 (PDT)
Date: Wed, 14 Oct 2026 12:36:45 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: cdev: don't record a line direction the driver
 refused
Message-ID: <20261014043645.GA13991@rigel>
References: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com>
 <sashiko-outbox-168233@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-168233@kernel.org>

On Mon, Oct 12, 2026 at 02:04:58PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] gpio: memory leak in gpiod_set_array_value_complex() on error paths
> - [High] gpio: non-atomic desc->flags update clobbers concurrent IRQ flags
> --
> 
> commit 910242af9150f094f4676cb26fb8b58cc8edfa96
> Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
> 

Hi Bart,

following this up with you directly since Sashiko doesn't currently let
original authors or maintainers know about problems it discovers in existing
code, just the patch author and the list.

> gpiolib: cdev: don't record a line direction the driver refused
> 
> The commit modifies gpio_v2_line_config_flags_to_desc_flags() to avoid setting
> the GPIOD_FLAG_IS_OUT flag before the hardware direction is confirmed by the
> driver. This fixes an issue where refused configurations would leave the line
> erroneously reported as an output or input.
> 
> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > index 5d53bfcdf7268..9bbee3a1f9c9c 100644
> > --- a/drivers/gpio/gpiolib-cdev.c
> > +++ b/drivers/gpio/gpiolib-cdev.c
> > @@ -1226,14 +1226,13 @@ static void gpio_v2_line_config_flags_to_desc_flags(u64 lflags,
> >  {
> >  	unsigned long flags = READ_ONCE(*flagsp);
> 
> [Severity: High]
> Does this non-atomic read-modify-write clobber concurrent atomic updates to
> desc->flags made by the IRQ subsystem?
> 
> If a driver or IRQ domain calls gpiochip_lock_as_irq() or
> gpiochip_enable_irq() concurrently, they atomically update bits like
> GPIOD_FLAG_USED_AS_IRQ:
> 
> 	set_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags);
> 	set_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &desc->flags);
> 
> Because the IRQ subsystem does not check GPIOD_FLAG_REQUESTED before using
> the line and does not share locks with the cdev ioctl, these atomic updates
> can happen between this READ_ONCE() and the subsequent
> WRITE_ONCE(*flagsp, flags) at the end of this function.
> 
> Wouldn't the atomic updates be silently overwritten when this function writes
> back the stale flags value?
> 
> Losing these flags disables the safety check in
> gpiod_direction_output_nonotify(), which could allow user-space to force an
> active interrupt line into output mode.
> 

This isn't a scenario that I'd considered - I was probably assuming
GPIOD_FLAG_REQUESTED being set would provide protection by making the
line unavailable.

How would you like to handle this?

> >  
> > +	/*
> > +	 * GPIOD_FLAG_IS_OUT is left to gpiod_direction_input/output(), which
> > +	 * only update it once the chip has accepted the direction.
> > +	 */
> >  	assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
> >  		   lflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
> >  
> > -	if (lflags & GPIO_V2_LINE_FLAG_OUTPUT)
> > -		set_bit(GPIOD_FLAG_IS_OUT, &flags);
> > -	else if (lflags & GPIO_V2_LINE_FLAG_INPUT)
> > -		clear_bit(GPIOD_FLAG_IS_OUT, &flags);
> > -
> 
> [Severity: High]
> By leaving GPIOD_FLAG_IS_OUT unset when a driver refuses the output direction,
> does this create a memory leak in gpiod_set_array_value_complex() when
> user-space subsequently calls GPIO_V2_LINE_SET_VALUES_IOCTL?
> 
> Looking at gpiod_set_array_value_complex() in drivers/gpio/gpiolib.c, mask
> and bits can be dynamically allocated with bitmap_alloc() for large GPIO
> chips:
> 
> 			if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags)))
> 				return -EPERM;
> 
> If a descriptor is not configured as an output, the function immediately
> returns -EPERM. 
> 
> Doesn't this bypass the bitmap_free() calls at the end of the function and
> leak mask and bits?
> 
> The same direct return leak appears to occur if the driver's set_multiple
> callback fails:
> 
> 		if (count != 0) {
> 			ret = gpiochip_set_multiple(guard.gc, mask, bits);
> 			if (ret)
> 				return ret;
> 

This also looks like a valid concern in existing code.  Unlikely, but valid.

It is also not something we can readily test.
Would you be open to extending gpio-sim so we can simulate constrained drivers
to better test alternate paths in gpiolib and cdev?
e.g. input only, output only, not supporting bias, supporting open drain, open
source, debounce, ...?
I haven't put any thought into what that might look like on the
userspace side, much less done any actual work on it, - just wondering if you
had or would at least be ok with it.

Cheers,
Kent.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com?part=1
