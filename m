Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867706;
	b=fNokCDko/9XeoE/Ic7ogMcDTX6ZV8KSqw59groyGxtW8eNRNZwb5zmRfHbFedioSKZKH
	 XP02k2LXqgiLEZQRBKyncA5vgBrRWyr8Mo9dG4PqCrrWP1bLIy5jPojwipmc4O87ZCJOm
	 i58ORUmYfcop9SsRskh/iBy9UgMJUVJpgmJ7BC84g/0FTrGmVXgRzR8neq4anrZbGFp0x
	 aCDAzRSjpotASfP1nuhQbIpgnzyf25zdfbKQ8NLDXTjbRR7Mol3DppdUuTV0MAGOmH9Pu
	 3/ZtEGYzFYEsoxznI2j28E/Hbg5VQDEpKaGBa5r6raiyRJ9hI6czRMh9zT8kWE+hIGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867706;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=v0+BrrivRfnkIQASeKgDrnesCksNDWwtoNYk5A34Ewo=;
	b=yUmmB/VG3sifwp5RPM7EF6VcwHbTE2kRNfWUCdD16lqw4GukiBnon2d5YGell0rMgXg3
	 prd9yQTteiDCd2mi5iJvrmetF7ZgfUnZFR4vtXsrrXJu/dTdg6rcx9IJm0RXNQlCJ90Gw
	 9gM0kdmbnF9K4sZ5uYmglupNYQ/WIvdDXtuSprzOMKVvbgoE1zSlqQdj7wzFEh9C2P6F1
	 frb3Fq6lBL9U5Qm4zMt5WW+LpU5mKV8nLuoGWzlRDLWEplvGswrvJGuC0kbJ8rUDoo5O2
	 e8z1bVCxMK9LhA2+UA2mIlo1kjwDT+jZWlH2OvFdVBWOy4d+ylq8o4+3ilHMGW187Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HYLHAZO9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 57421606A326;
	Thu,  5 Nov 2026 08:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HYLHAZO9
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 17A251F000C1;
	Thu,  5 Nov 2026 08:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867706;
	bh=v0+BrrivRfnkIQASeKgDrnesCksNDWwtoNYk5A34Ewo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HYLHAZO917vgMApNDZmXdmOtgDBz5oOUwvtkA3LiE8EBYg9W5svxN7297d075vrBn
	 FmBIMWfxGjX/ZI2sjkWWS+OmaApQqeyN3rNPTrFYvbP3G6jJoRRUunaWgZ3Z4VapqH
	 h26yVKOPZyN10fRoIjEiq69dA3L+Z1T1z44PATiyg5Ws8ti9izEj+d5LmJKcY9sj+5
	 lKv+1pBsrjYudjh80MQrdVzNUu/XtFHkhhwS1NvmnuFrxVLQeJSdCCuggYEtFceJfW
	 Zv31pdmdm4k7zoOrjmgTsigu0C7QGZ6nptnPDrFrW7hZRp/P2yFvQ0WbGK59cD7jZK
	 JkQPgr02gma9w==
Date: Thu, 5 Nov 2026 09:35:02 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/3] ARM: sunxi: select HAVE_SHARED_GPIOS
Message-ID: <dbrddaburmupwyobtrliqf32pzowjp2t5bkpzcyslj74uslmhx@ny22if7wgmxb>
References: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
 <20261103-panel-mipi-non-exclusive-gpios-v1-2-aa862c1d71e3@oss.qualcomm.com>
 <sashiko-outbox-195389@kernel.org>
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
In-Reply-To: <sashiko-outbox-195389@kernel.org>

On Tue, Nov 03, 2026 at 01:43:13PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] ARM: sunxi: HAVE_SHARED_GPIOS ignores 3-cell sunxi SoC GPIO bindings
> --
> 
> commit 08b8c5df755142dacaed1d91af688663b9db7e82
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> ARM: sunxi: select HAVE_SHARED_GPIOS
> 
> This commit selects HAVE_SHARED_GPIOS for ARCH_SUNXI to enable automated
> management of shared GPIOs via the GPIO shared proxy module on sunxi
> platforms.
> 
> > diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> > index e015f2497111a..b62e8518e2704 100644
> > --- a/arch/arm/mach-sunxi/Kconfig
> > +++ b/arch/arm/mach-sunxi/Kconfig
> > @@ -5,6 +5,7 @@ menuconfig ARCH_SUNXI
> >  	select ARCH_HAS_RESET_CONTROLLER
> >  	select CLKSRC_MMIO
> >  	select GPIOLIB
> > +	select HAVE_SHARED_GPIOS
> 
> [Severity: Medium]
> Does selecting HAVE_SHARED_GPIOS here actually work for Allwinner sunxi SoC
> GPIO controllers?
> 
> Allwinner sunxi pinctrl/GPIO controllers (&pio and &r_pio) use 3-cell GPIO
> specifiers (#gpio-cells = <3>: bank, pin, flags), as translated in
> drivers/pinctrl/sunxi/pinctrl-sunxi.c:sunxi_pinctrl_gpio_of_xlate():
>

Right, shared GPIOs need support for 3-cell bindings first. Let's drop
this for now.

Bart
