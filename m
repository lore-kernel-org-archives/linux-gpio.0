Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E76B346AD5
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2026 07:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470269; cv=pass; b=QArDxpwTEArx8qWEBZVVUk9IRm3NO+n6/2+4wEKNZoBdDI6+P4FGaoas8lOOhhmZ2hrvncvPDMKjV0YjD8616onc2D18BIQoyjOrFAk9GlemHp6hEOmQRxjqbBPZVYGI4f/O8fCWCkXxBMJdIPoP1CRgib2ftqwyduaoQ769bRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470269; c=relaxed/simple;
	bh=o8pvyt194UnZGpP/NNEXkeam+tkA+4rAxFe6pRuyOl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=porFjYt38HnJaL+RATbfQg37fbTgl9CS06xEoMDWkMhXCxW+wfMBv8o7vZ0XLJ+aGpH9qcwwxuFDKregd5m5wVgcPdWCtEzmQJfFXPIJsUDnZC0k8bH16VWVSzq989i/693M9Gr3ZcBw6lEVFu+oXZoFu6//P4USp753HvHk/2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5IRhwVo; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5IRhwVo"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7dc6fbf3e86so76326597b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2026 00:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780470267; cv=none;
        d=google.com; s=arc-20240605;
        b=RWzv7aCpkVnjKOXO8GIK7uoSV6O1hrEcNnMa6XPeqYG0cMnwQmOR6kG0oNx1UYMT8v
         eYQbsx9xdzrH5vd3D38vGgcv4FdJlIZ5agggdWCU+5pvTbQENBzERReR9WBQ6uAvE590
         w1nk5SdB2oxdWpsWZTJLGHIfAAk1mrQFFyLFVJjcM5sFNfCrqR/mTrOEb1FhpRMThRrx
         6NBusZE6j7MuQRzzfp7wxINaAxryU97uHft9rxfW6fRyL8kIyQFS4YQgXoCf2RwHJbH3
         U6jGB05U5/JdBoV+04j3q8yODyerbO8kNTj7BYvd3UbeJxRTXLUPHUhxVW2TYu83f+x3
         iqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YFjfWS4vOB8ZIsi+lcNJimBrXZON8uJh/eIp35B9+MA=;
        fh=VrgWGGS1JRXMXCFok33pc5POfSCcykz6aBk1Ix2Ah6k=;
        b=MKvDAAyUXLKaRdUjX/hoXyRoJTffNHVUSsTL85I5PyXaJ86XrqXmB69iFkfRfW3G1Q
         2+fSoS7ppjZFOWXg2aMczWdDf1xV5PNw4GE93V28ZA+8+MVSIUysYGacQ36fDKZ2x+9c
         jX9jMmQb+J7tqGG4t+CJ6JmQ9NbFaFqSEGghHLlJtXPboSJO5fOHqa/xn5DH8HAAJdmQ
         LPr9cIjfRc3XnYSUa0NsiJ9aoH+ySqXRBMBlXWhybaFpd5E23h2vF8SEZG269qWe83On
         HJXYRXgRYD7vTgxbWC0uD+NT4H6d/cv/MYysFVykZQ+g0DUALbDgghA0m0KGcA4Nro1O
         PpaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780470267; x=1781075067; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YFjfWS4vOB8ZIsi+lcNJimBrXZON8uJh/eIp35B9+MA=;
        b=V5IRhwVoCswMHeLCwBXIHqpdxmhCTuSdifKUN1Apt5FCtFjwykZJWvzGcCvvJnTAhw
         hIoErGeM8wNaNQ97mIn+l5OJzGKWmFTWki9dfotZr6wI+g2ifX+pPJpPIHiXD9NgRGoX
         TRsiFrFgXYJIyDYbqzDuaXeM6NA6+T72JQ5ojoI7wUY+nztlyhn/H5W9MqPR9vn9Rd59
         RUuRuA+LC4Uo/P2sEdSDfyiXY2SJrJ4fuNPyMc9F4N+q2yGPQ59jiy6Kb+CNIIptWJMV
         xcg1+yXg5gUVsKkIcV2ifmydnqUGk28uZBo5ole1wKjTl5b0M8FXkz2AGK26q9eVpd9U
         8hMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780470267; x=1781075067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFjfWS4vOB8ZIsi+lcNJimBrXZON8uJh/eIp35B9+MA=;
        b=Uo++Ded5ypIITuuPfSumGRg2zvfjQTVxgWOF6SXGdf5PkBamLJfP5AZ33mezUVu3FQ
         wy6OxrQcvQR3H05u4JLjRJIumyPbHOc+t3ZuyIJhFGlVGuApvTa5Sip87/ksihdCFAvH
         wKMmnfpl/tSKd7X3YQL7sys+k4eE/bD4U8maTWYSaWZfivU+cyZPdGp7u3Dnd5vV9F0x
         etML2iCjg6YFSrWMsPy6/6tLCCHvkIVVKCTFtm6XDHedUij2P4892QhYoKsISf/LeyYW
         AycUkAW1qLCozB05Eliqz/dRlkeNJFRGFMBAbcFGZjMxiDL4UGB5lgCfrx8Q7tvLTOD/
         RcCg==
X-Forwarded-Encrypted: i=1; AFNElJ9hkzo0tAME9yDrnCD8+k5B2AK5dN2C3tDtU0iimYkb4sU8XM3AGZyarmFmB9WDfieeYCoF+eW2oQmX@vger.kernel.org
X-Gm-Message-State: AOJu0YyKYulYXcDyOvq5mbc3JR88B8hI+ZrNNHv1q+kkvGtU2unEqO5B
	3qLZiR5/41/W4VBqXM7Hn9Dtb5H2SyeNugy/CZ+lxbjrKxSGsrz+3LgMzKr8y4n/sv+P5uQXOqz
	rt/YI1gkPAkfalQ6/z83/E+gYf9bHLzQ=
X-Gm-Gg: Acq92OHu9ssz1xG8tjB9pwoshJuhXPSQ27a4eLsybjtwoXYKmG4GJwMyoR739FDzz3O
	uU+Fa+/dRsDPd9awCyJQXaj+vnCiN6ON6iRJKTYoXuhkVocu4BYREg4XpbUD1LLs6W/6LuHOXGP
	B+4or6vCXJuxaWJdlzL+4B56c91QVudeyliSnaxUab5G+a++TxeQDL/KSHBenyBIO64uALvyVJr
	nGDK+hGb2Ak/b5nJ/WUJrYpJA2Hu8R84Ln6SV0hWo1duTwP8jZs5cacFoSYJieAZtzYZAp9Io5g
	N2k3X+XAvYr8Pk7p9lTL4f85t4I/3xUlT5QcrcTCfzF+VTwoGG3r/ncXS8jMTcReV8Lh7spH405
	YeSfQh6s1wAcrF5KBzBCUyiShtOamtfI1HcVXVCXfcJRKc7c6CyLqMla04k8jZjv0cwbNCA==
X-Received: by 2002:a05:690c:3707:b0:7c0:56f:5b7f with SMTP id
 00721157ae682-7ea483d5565mr19903837b3.20.1780470266693; Wed, 03 Jun 2026
 00:04:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com> <20260602185339.GA404948@ax162>
 <CANTFpSX0Ehpno7b=xrnqzmENn=sfKj1UcyRzXvMyy4Rcyr7NhA@mail.gmail.com> <ah9frnHDuIjF_1Su@ashevche-desk.local>
In-Reply-To: <ah9frnHDuIjF_1Su@ashevche-desk.local>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Wed, 3 Jun 2026 12:34:14 +0530
X-Gm-Features: AVHnY4IfePfp2mgJ42-3WHNo5a1Y9C179aCngSkASewMVW3OugcwPO9DdVH0LC8
Message-ID: <CANTFpSXAXP16TUK7n+pTBgZOYRqCyF4kqkf9X-TK9O_rKWY1VQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, wsa@kernel.org, mario.limonciello@amd.com, 
	brgl@bgdev.pl, basavaraj.natikar@amd.com, linusw@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 03, 2026 at 04:26, Andy Shevchenko wrote:
> Linus, if you applied this patch, please drop it. There are problems
> with patch code wise and functional wise. It needs more love and work.

Understood. I agree that the patch should be dropped. The NULL pointer
dereference reported by Nathan and the code issues you've identified
both need to be addressed properly before resubmission.

I will rework the patch addressing all your feedback and the NULL check
for resource_source.string_ptr. I will send a new version once all of the
issues are rectified.

Thanks,
Hardik

On Wed, 3 Jun 2026 at 04:26, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Jun 03, 2026 at 01:20:24AM +0530, Hardik Prakash wrote:
> > On Wed, Jun 03, 2026 at 00:23, Nathan Chancellor wrote:
> > > I bisected boot issues with a few of my test machines to this change
> > > in -next as commit ef76a3a28c79. I seem to recall a crash in strcmp()
> > > in one log but I cannot be too sure.
> >
> > Thank you for bisecting this.
> >
> > The strcmp() crash is likely the issue. In
> > check_gpioint_resource(), we access agpio->resource_source.string_ptr
> > without checking whether it is NULL first:
> >
> >     if (!strcmp(tmp->path, agpio->resource_source.string_ptr))
> >     ref->path = kstrdup(agpio->resource_source.string_ptr, ...)
> >
> > The acpi_resource_source struct has a string_length field -- when it is
> > 0, string_ptr will be NULL. On your machines, likely some GPIO resource
> > apparently has no resource source string, which we did not account for.
> >
> > I am preparing a fix that skips GPIO resources with no resource source
> > string (string_length == 0 || string_ptr == NULL). I will test it on
> > my hardware first and send a patch shortly.
> >
> > Sorry for the regression.
>
> Linus, if you applied this patch, please drop it. There are problems with patch
> code wise and functional wise. It needs more love and work.
>
> > On Wed, 3 Jun 2026 at 00:23, Nathan Chancellor <nathan@kernel.org> wrote:
> > > On Fri, May 29, 2026 at 03:38:37PM +0530, Hardik Prakash wrote:
> > > > I2C controllers may have child devices with GpioInt resources that
> > > > depend on GPIO controllers to be fully initialized. If the I2C
> > > > controller probes and enumerates children before the referenced GPIO
> > > > controller has completed probe, GPIO interrupts may not be properly
> > > > configured, leading to device failures.
> > > >
> > > > On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> > > > AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> > > > pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> > > > AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> > > > occur before the GPIO IRQ quirk in amd_gpio_probe() has run, causing:
> > > >
> > > >   i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost arbitration
> > > >
> > > > Add a generic dependency check in i2c-designware that walks ACPI child
> > > > devices, identifies any GpioInt resources, resolves the referenced GPIO
> > > > controllers, and defers probe if those controllers are not yet bound.
> > > >
> > > > This ensures GPIO controllers complete initialization (including IRQ
> > > > setup and quirks) before I2C child enumeration begins, fixing the race
> > > > without device-specific quirks or DMI matching.
> > > >
> > > > The probe ordering race was confirmed via dynamic debug tracing:
> > > >
> > > >   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
> > > >   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
> > > >   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
> > > >   2.348157  lost arbitration
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
