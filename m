Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDF239479F
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139841; cv=none; b=mQEtgD5ZBiFns2UyVgZDRpQZX7qiRha2ov+onbdvKLI1pz3sZP0oBX5xhsOXYAtzEVCzZ58lKAh6a2RbmtU13VAFQTTXWkhgyXRd1Tb+GE3hvx5JGF1tac2sNyY7qRgfZ5dUkEOaktksFnLkKQIqYX5ABq8FVrTVAsP5Yk0sriU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139841; c=relaxed/simple;
	bh=1TnPKdmxObsO2tg7Nzed93p6cvsba4CdIsP8kC7pMWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jt3y0eE1PPnZjmymbH7Ml7b2AjcVBGOJO9TImYPywRNdpNkHe+58LWWzZ0k4pwwTJNdfFcM0rgBIYiFWAj3MKovsWKFRw8S7DgkfuuM9okOaRYy/B14rdqXsDTx0mTU5/xpo+vZfSPsNsy8DkDAia16EV1mA/AkHw42mSRFygBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eODZSix6; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eODZSix6"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1c9879395so2492376a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 01:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792139839; x=1792744639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87cdue0a6MBVAH6rJZDBNZb+A8eLAWz/u/y+MZ24PAc=;
        b=eODZSix6ys2xAaY7cv9DyrcYcbUy90AJzEFAda+ho07RXLYc0koa0kgQRMR3dyDBKu
         Zo1YpKwDMritaQ5LDsBBx69HTSBW/3A2tJQFiYk7ZBZu23Vwjwhg7Yg0evwtwvWUzyfX
         cBHJDwu7eNT+Nqo6pVsCn+qJ7fftwuv9PlmM04xHBmcvowCjXMBoxVa4uXi9Nups9gNo
         3NVBuw7tzwX7GEpyx/Kd3iOv57shsgRPMM64WS6tvc4zGI7It/8dv/tMq37n2duV2f+/
         1hYsNMI0ur6DiQPE1wOc6qWewPe0QbZJwwSDdqz4tTK+4xIB5AdNEcBFge65TOwlqmhS
         9pVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139839; x=1792744639;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87cdue0a6MBVAH6rJZDBNZb+A8eLAWz/u/y+MZ24PAc=;
        b=ZHMFkD0zDTVzLno2dLDiimkRibQfxTDFljlzrl2yeJ8DNbfala53YDoQPz4nL07EpA
         HXqdaEiX9A0UWBmWLfLIPXVcAjZUBYYRQL1OfkG6bapf1wVyeyg3OAdlfm0lU53VNU6S
         Zd0d9CvJ2bBC0XNUg7nXpz9EB2KYp0F2aYwgJns8Pm5UDQhHI8kn6g6ZPcergzHU7XBi
         c8BC0hxjWJXdyJoEniBw+sHHkkY4NTDPPS9Ygf/LggnE62+51ImUA7Y/ZtUOkUew2fkQ
         +cjRnRaMyhU2Hzj2dey1vKD4ekjCsJ3LzEzOXqLXRgRIEsBUWmZRaXxRMSDURmG0Vicj
         e4cQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1Fm1dsVBzJSYETVQ135Nx7XjHmk4ezATdumrEOJSSIaZa7/awUvs8YsjCHPeZ0XmwPH09Lbv7Nhq+@vger.kernel.org
X-Gm-Message-State: AFq9FYIzLgrLlVMnuJl5zZMt3NgokrPtlQL8OHyecH1HCY6xRnOF3SrB
	Ya+Q6gSLlLNycakKcqn22g5DkOILzoEfg5t+3I0tOKAHBRsnCW5f2no0
X-Gm-Gg: AYBFou0PZ1SfVQeGMralZZtbzxtdP22aVtz3MIYudkTOKMtm7jQp8P8SbG5v/hMplnQ
	xbnIIjiJ1Nuf6tPsPpU1cMz2s1mzUMCT/OWrYCW8s3lNYVVV3dZSsewOzaIfrh+hEu71UinM7Zq
	3p7LDnLGjax+UHfLXwkBgbDfKgLn1JTgnJj+mCnrRe/76ypdsqgzJC/oXJjNsZ35AP8j+Di/2gb
	qsfWiwwEwaTAmsUKThlEMZ7AUiwI8B/fuJzlm0oCYSbcG7nEHOgCuxbK/7FlEhZiblNlyLWjAht
	rFSU/d+GIF0yjkUQLoROE32VNWOV5W94DmKv3AX4QAd4JVcDcyu6qM8ZBXGgZlCFZ8jcj1O6qzL
	M4vngAmv+YjRpy9ZvDYK7OxHugN1/2a119fBVFN8XCzxaDqWnODRaNkVEAUKRHXFoAJMAeLscSk
	+EdJcFpqcRJNinGVWtjworzK5SoRGjp2PjPTrNUX28cGNAbW0Xidriav93LGEB5NdNIX464ilQX
	XwLE45XiIV+6maoIV4=
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3ab9c7307d0mr10733127a91.6.1792139838713;
        Fri, 16 Oct 2026 01:37:18 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3b16c2asm918208a91.2.2026.10.16.01.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:37:18 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:37:09 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: cdev: don't record a line direction the driver
 refused
Message-ID: <20261016083709.GA56522@rigel>
References: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com>
 <sashiko-outbox-168233@kernel.org>
 <20261014043645.GA13991@rigel>
 <CAMRc=MeKQMiF8T+fb1TxUmk-GwF3fCwkB2GoVvEe_kcpbG6saQ@mail.gmail.com>
 <20261015153714.GA105746@rigel>
 <20261016074704.1860749-9-aambrozewicz@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016074704.1860749-9-aambrozewicz@nvidia.com>


> gpiod_free_commit() does the same read-modify-write: it reads the
> flags, calls ->free(), which may sleep, and writes the word back.
> Patch 8 of chip-removal v2 (for the debounce race Sashiko found on the
> event clock fix) relies on that write: it resets debounce_period_us
> first and makes the write a release store, pairing with the
> test_and_set_bit() in gpiod_request_commit(), so that a new owner sees
> the reset. With atomic bitops there, clearing GPIOD_FLAG_REQUESTED last
> with clear_bit_unlock() would give the same ordering. v2 keeps the
> release store, as that matches the code today.
> 
> v2 of this patch only drops the GPIOD_FLAG_IS_OUT lines from
> gpio_v2_line_config_flags_to_desc_flags(), which b7adfb6076ff also
> touches, so a revert and this patch only need rebasing over each other.
> 
> > > >> Doesn't this bypass the bitmap_free() calls at the end of the function and
> > > >> leak mask and bits?
> > > >
> > > > This also looks like a valid concern in existing code.  Unlikely, but valid.
> > > >
> > > > It is also not something we can readily test.
> 
> It is: both the -EPERM return and the one after a failed
> gpiochip_set_multiple() skip the bitmap_free() calls when the bitmaps
> were allocated. The -EPERM path shows up with gpio-sim as it is: on a
> chip with more lines than CONFIG_GPIOLIB_FASTPATH_LIMIT (512 by
> default; I used 600), GPIO_V2_LINE_SET_VALUES_IOCTL on a line requested
> as input leaves the two bitmaps to kmemleak.

I was thinking specifically of the gpiochip_set_multiple() error path.
How do you elicit a gpiochip_set_multiple() failure from gpio-sim -
it always returns 0?

> Unless Bart would rather take it
> himself, I'll send the fix as patch 7 of chip-removal v2:
> 

Oh nuts, I overlooked the EPERM case.
Bart has already merged a patch for the gpiod_set_multiple() failure leak[1]
- you were Cced.
I would keep patches in your removal series focused on that and keep
patches for existing problems separate so we can get that series merged as
soon as possible.

I'll send out a patch for the EPERM path shortly.

Cheers,
Kent.

[1] https://lore.kernel.org/linux-gpio/179206624090.9766.14775829225106044242.b4-ty@oss.qualcomm.com/T/#t
