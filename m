Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358894;
	b=pfz4X+nGDnD/6zgklfm41Gow1ooTxMWsD1uNXIF2ZwjlISEyTKMtPhSzdKnBT61O1JK3
	 SbOL9DbPlrbWjk0GovB2SHwDzEH8FINee8pZQ2nqWeZBc/YhO3pwYwToYZ7Sm5b1mX7nc
	 OYYlA6zZjtm/IVoccJ57oNHneMpYpO6H9uaAl44YHfK6JiroytXn4wuYiwqENevE3N20j
	 7QHM4t3a5COjIEAMasd+Jq038991IbBn8jQ9zzsaf1CIfe6tvWLyl1RGcKKzKP/L3fVik
	 /1IG4NZOjrJrtMGT42O35SPyQWIXEZwSep+LGQzO/KSdm9pKQRU+o/Y5pSf8ig8L74w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Mr1+XuTgSkjae7K1Qb91H4lBdSosGmI/b2MCp8eMYDU=;
	b=TlOaP65QBa3HF5Nvj+irc+a4+QHo0FmqFBRdwZi240Ap7/SYL1yJtqRuFa4vKuyvzWFf
	 LPfzbTsvdFcI6jhEuJxZwz7d+9wDvOT7L43UOPHdgJrLcWnE3k0G46rCron6gU7tYelh/
	 RfAxCqEa1Az7PeoDzn4k4Kw3HZb+1xo0mCLTPLnviF25MjCxRpRpkEAd5xP0Kte3XPC8e
	 mZbKRHzswFudz42+6mbD1tj0NQ2eYNn8/IQB9JmsIRdBX92/mB/wcHw829kfN9pe6imTR
	 3EGNWCdodaWbjguSyFPOUyXYhKlTPkwdCwwbNMksfHNinH8wd2MdqUpAUXFdvJGOHFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cKbDNQ/W";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F439606A321
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 11:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F439606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cKbDNQ/W
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so482727a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793358889; x=1793963689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mr1+XuTgSkjae7K1Qb91H4lBdSosGmI/b2MCp8eMYDU=;
        b=cKbDNQ/WlZdgYHgXvsoeLIfDefTUui4goSPq94ObGf8vvLgtnUW+WPGBaZQ5llYMq7
         2PpkB8KatXY5F6q9N1rQNUeARnAR4wqsBmlE8eme18Cmwrtl2RbOqztYdsflN8Dj31XS
         B+qmtU5mr8amQDdncuO14gvxnAnioSO2TmFOFXBsa3XkDJjiqkeeLuAB86aNi9ZCfQqA
         HgrX7+Nitfbmk998l4iVm749LxVyb8zlkyd1/UBOxIdqUKi3nVivUXru/ieJTjFPyZU+
         i7CeZCnEEDfHx2OuTaouP3xCxyp9lVi6U+mrqkp356TUT2eSaeYZiO0ADDxTEj2L1oA4
         F18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358889; x=1793963689;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mr1+XuTgSkjae7K1Qb91H4lBdSosGmI/b2MCp8eMYDU=;
        b=bOPaFATcsUn5WE+MVCsvfzO6Km7sDtrnBPyf4O12PteGqwVoptRFtpDom+SyRemg2K
         SR6vl+7liF9c5x4dyRFAZrw7JDYDufkRE0J6Mbl6t6PvEVC/LRBlBRJ4CgXGsOKBjOWr
         yXv+m2XKWEDVP87rmeg80roXsq8h33k4RUsuVqWnwnrY1vdJ0W2SDEZhg5Ed9Ma2v4GU
         27Vi5mEtsP80/FT5H82M3Ji4+DugsuzdjSAgr48WmRuBuk7sUSSTCmOjjVDuSzfjBdlV
         EajTHQuMUL4zn/t8MVB8sRlCnVsu6n08U6u4Y4KH/ys9Q5HqqqP5FzATG2/ta7BSTpF6
         nG9w==
X-Forwarded-Encrypted: i=1; AKwUvBwx6ED20XjXIwC3Ea0+GH4nJRRESWG6sf8sWF/o0KiP2nstauEOD2WpvwHrdnwEGYP2RSQqMvHqxOfo@vger.kernel.org
X-Gm-Message-State: AFq9FYI75fhBX52pLkYxfSfISpjU+cHJZxN+zc6uGU6RdGa96UzBpwpW
	E88HWw6KBEi8IkzQYtwVxTRmyta8IlPrGPegb1Ms0TD9w376t2yi3O2d
X-Gm-Gg: AYBFou3boFKPLSqbAmB5oH/+C0MWTKyDm/uwVeyMMcfMNyybu0tpZRgxZZ2ulQNhqdo
	T3K65TN/aC2sIpCw7YBoP1ZVbN6Bw/pTY0nZ/QTDFZlYAB5fSq7w/arBGFbo8uCsDa31hfiIsjN
	ufFA0geULdVcPKiFEQnkagnrQ/qNaYQKx7mRhxEv88PFGwFy6WLIy25CPg0sWaKLL33rORBe0Zk
	AHXSYnYcJg/ZECKBUVrMtlSgctj/bhJe3BL4BNDmbVsR0AAy5WTI2bmxRtosydgh3uuY2tbsvUJ
	RaawTADJCjLp2phKGOINwjpSHaNi0O0s01CPB6d1oUVuiHEDprh2T4RE7SAdeBlYSxLRbjF/nEw
	2R0lkHWOuPwc5zZ5f7vCsKGQFrfw1CoSlST4h4qRiZPjrQpcWuY0H6FSjLn/jmbR2/FzGFAyM9f
	daPcneJwaWwofMLnICvxGiz2eMqt950Xi9DELHFK4VWrWyouyg/LFHJtRJ7EtdeLdi2AmiJmOAH
	3FnUWYrexqzE+vr0mRCDV21O7oE5NRAMHpiFrv7tPpr1fzn9Q/I5t0oUoy/yecRUYK9wV/RcwIP
	msp+l8uw+ilNXEearE0le6OE10yk3JrSaaxTzfE5m6aShLhf
X-Received: by 2002:a17:90b:5827:b0:3ab:be66:ddb7 with SMTP id 98e67ed59e1d1-3ae897bae26mr1591051a91.47.1793358888671;
        Fri, 30 Oct 2026 04:14:48 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845432e4sm3771544a91.3.2026.10.30.04.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:14:47 -0700 (PDT)
Date: Fri, 30 Oct 2026 19:14:35 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v4 6/7] gpiolib: cdev: don't report a failed line read as
 an edge
Message-ID: <20261030111435.GA76958@rigel>
References: <20261029-gpiolib-chip-removal-v4-0-aambrozewicz@nvidia.com>
 <20261029-gpiolib-chip-removal-v4-6-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261029-gpiolib-chip-removal-v4-6-aambrozewicz@nvidia.com>

On Thu, Oct 29, 2026 at 01:29:21PM +0200, Adrian Ambrozewicz wrote:
> With both edges requested, the IRQ threads read the line to tell a
> rising edge from a falling one, and report any non-zero result as
> rising, an error included. A read fails when a hot-pluggable chip is
> going away, or when gpiochip_remove() has cleared gdev->chip before the
> IRQ is freed.
> 
> Drop the event when the read fails, as debounce_work_func() does.
> 
> Reproduced with gpio-sim and a test delay in the IRQ threads: a falling
> edge during chip removal is read as rising; with this change, it is
> dropped and read() returns -ENODEV. The HTE path was compile-tested.
> 
> Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> Fixes: 73e0341992b6 ("gpiolib: cdev: support edge detection for uAPI v2")
> Fixes: 2068339a6c35 ("gpiolib: cdev: Add hardware timestamp clock type")

How did you determine that?  Those commits are where the associated blocks
of code were first added - not where the problem first exhibited.

The failure mode you are addressing was added by
commit d83cee3d ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU").
Prior to that gpiod_get_raw_value_commit(), and gpiod_get_value_cansleep()
and gpiod_get_raw_value_cansleep() that wrap it, wouldn't return the error
that you are handling.

Could you bisect to confirm?

The code change itself looks good.

Cheers,
Kent.

> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20261020-gpiolib-chip-removal-v3-0-aambrozewicz@nvidia.com?part=6
> Assisted-by: LLM
> Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index cf23b5296fd1..0d6853751e6e 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -643,6 +643,8 @@ static enum hte_return process_hw_ts_thread(void *p)
>  		level = (line->raw_level >= 0) ?
>  				line->raw_level :
>  				gpiod_get_raw_value_cansleep(line->desc);
> +		if (level < 0)
> +			return HTE_CB_HANDLED;
>  
>  		if (edflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW)
>  			level = !level;
> @@ -743,6 +745,7 @@ static irqreturn_t edge_irq_thread(int irq, void *p)
>  	struct line *line = p;
>  	struct linereq *lr = line->req;
>  	struct gpio_v2_line_event le;
> +	int level;
>  
>  	/* Do not leak kernel stack to userspace */
>  	memset(&le, 0, sizeof(le));
> @@ -763,7 +766,10 @@ static irqreturn_t edge_irq_thread(int irq, void *p)
>  
>  	switch (READ_ONCE(line->edflags) & GPIO_V2_LINE_EDGE_FLAGS) {
>  	case GPIO_V2_LINE_FLAG_EDGE_BOTH:
> -		le.id = line_event_id(gpiod_get_value_cansleep(line->desc));
> +		level = gpiod_get_value_cansleep(line->desc);
> +		if (level < 0)
> +			return IRQ_HANDLED;
> +		le.id = line_event_id(level);
>  		break;
>  	case GPIO_V2_LINE_FLAG_EDGE_RISING:
>  		le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
> @@ -2006,6 +2012,8 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
>  	    && le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE) {
>  		int level = gpiod_get_value_cansleep(le->desc);
>  
> +		if (level < 0)
> +			return IRQ_HANDLED;
>  		if (level)
>  			/* Emit low-to-high event */
>  			ge.id = GPIOEVENT_EVENT_RISING_EDGE;
> -- 
> 2.43.0
> 
