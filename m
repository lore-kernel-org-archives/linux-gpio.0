Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705168;
	b=EH4Hkl35b241SEqFxykvjMXsHWeX1yCeB1KJ7cWDQk8qeojVI4lpZpBvTDV2VTBjaBXU
	 eW28VNkIiFGHC9WchpWgSSrWJaTJFhApx/lECgm536Rv8wndPmGL7hRDUzVgYSTeoi8aQ
	 tapO6A4PjLKvgJZ85/8yBapS+w41eRGsw6oCOC3ivkLcZau1cCmILyZ/i4802W3spZw19
	 DyE8O5bJm2IUGeUrkZViZdy5PYUIHVi6RDULhOmb0bv+rHGGL3UaQOxWC1aI59vnaAucD
	 IfCVRqJW4W9/nY/VS4N86ekpf3oZTXwS3KphslK1nr6mRl+CIrX4k2+TjL0ptTcsVkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705168;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dbft8haI/Mye7BgK+H8nW1NXfgOE0ftSkpSJ8dBb/4s=;
	b=SUqGf8k+m97/XjBdsIUJxyEP3StsqJ8LMZBU2e9n1M0g+XD0irbF1n0ahTLkOEQH1zAz
	 xq3xJALobR08ixJDPpnwh4O0dH33tH8/Ld+jboVvFEhyNAMMbeDzmGZBqX4vhvPRjFuEx
	 +Qh0qQXQQVp3aMxU4WcL/Ktl641er4U5kBNLDgGntaDfytQU8+eKHmVOG4F+QRmNKAUjo
	 MigMAUCfBjAdLxIRXQAAYCZn2hgMkwD0287dAZ18OhgN4hqamvQotlueEjzA5EBMqaci7
	 ET2C6djBBZW3RGllv50mXGdYH/qWS+g8B3+DCIbOL8Q51H7mUeUMgGULeYlmdEALH8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VDEaQYzA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 67FA1606A31C;
	Thu, 26 Nov 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VDEaQYzA
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 7CA5B1F000C6;
	Thu, 26 Nov 2026 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795705168;
	bh=dbft8haI/Mye7BgK+H8nW1NXfgOE0ftSkpSJ8dBb/4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VDEaQYzAspNrHwCT+VDEhtgtlsGpzS5B20SeKDFBDsUtaUyYG3FEKOpubCoVP9k+w
	 3IBpqS3JmNmAEYBwaPbcKNwH7hRHLQmMEzxdBpkm8O6as6GTgj2Jz/tZY8/t2m8DlY
	 /q91c6Vp0Vi15uyQ+1Q55pF64eItyk16f/7dAigbGY/No73pe5a6aRfeq30ovf86+Z
	 oFVf4OsWQsr+UEr1vreMi3j2DGk6Ubx0L9jpHLr1sHVFME3k6EjoWw3+ownATxzeoN
	 /XKUrYTTfan/15cgtSlwJ2R9wS8QZsGJcZVWnXKPwu2POWF2DXoJN92VL8l4UokngN
	 tE00EiJjYvb+w==
Date: Thu, 26 Nov 2026 15:59:24 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Zqiang <qiang.zhang@linux.dev>
Cc: linusw@kernel.org, paulmck@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Use srcu_dereference() in gpiod_get_label()
Message-ID: <ybhhwqv2xgg4g3ormfcc7lncbo75irefvdk7yn2vsctjydefyz@n65bjszpepbm>
References: <20261126084233.17381-1-qiang.zhang@linux.dev>
 <20261126084233.17381-2-qiang.zhang@linux.dev>
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
In-Reply-To: <20261126084233.17381-2-qiang.zhang@linux.dev>

On Thu, Nov 26, 2026 at 04:42:33PM +0800, Zqiang wrote:
> The srcu_dereference_check() already evaluates 'srcu_read_lock_held(ssp)'
> internally, so passing srcu_read_lock_held() as the extra condition is
> redundant. all callers of gpiod_get_label() hold the desc_srcu read lock,
> so replace it with srcu_dereference(), which provides identical lockdep
> coverage.
> 
> No functional changes.
> 
> Signed-off-by: Zqiang <qiang.zhang@linux.dev>
> ---
>  drivers/gpio/gpiolib.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 5dd4d142cf52..47ce89bfb578 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -124,8 +124,7 @@ const char *gpiod_get_label(struct gpio_desc *desc)
>  
>  	flags = READ_ONCE(desc->flags);
>  
> -	label = srcu_dereference_check(desc->label, &desc->gdev->desc_srcu,
> -				srcu_read_lock_held(&desc->gdev->desc_srcu));
> +	label = srcu_dereference(desc->label, &desc->gdev->desc_srcu);
>  
>  	if (test_bit(GPIOD_FLAG_USED_AS_IRQ, &flags))
>  		return label ? label->str : "interrupt";
> -- 
> 2.17.1
>

What is this patch? A v2 to the one it's replying to? A separate change
(in which case it should be a new thread, not a reply)?

I'm confused by this thread.

Bart
