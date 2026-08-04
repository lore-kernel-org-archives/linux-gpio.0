Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADE03A451D
	for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2026 13:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851778; cv=none; b=bfH3mbEo6Mu1GocC6Gph0bKm0wi0yVZ8GN9JuDcNJQTbjaYls5Qh5Lg03PAkKn+vC98XimjczDcVhmXuOxGi/v3RqYms35DAE5wtokPPyXBerNifIrSeaCuBGVGXeJCrVj7jkPeUVjtrlI5xMTUD0bjytGEo0p8dmJagTTNEUms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851778; c=relaxed/simple;
	bh=50XrKBZJosL/DTC37lRfslzDFV1+RDFjg0YN60AJyx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPwhDxtXfMGeLfDwqzjCoKdeYosU4Gt70X2SPDGB8beLLdg4Q03UtuoT9iJHw/8lSbJx7rLkov+tEQ5vAgMvNrYytdcdx7QiWPBCiiApTTnKtM1VoH9BWBylGqnuah0ORJrFUOm/xNnQ0y+iMozW76kA3sRDuhpehplzXZMgfnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=b/1NDoUy; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="b/1NDoUy"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6aca0f482e5so2976412eaf.2
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2026 06:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1785851775; x=1786456575; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXXO2IRcaN/cQzNifZvrT3g0gNImnjqVwD0ab/RL39s=;
        b=b/1NDoUy/7IMpygxxmh+dw5mFHeaOjwbwLXSW0R01H6LpTQIcHrVha0xc8HP+ApBC1
         uCghuNmFo/nwRiG2cnV8XNtFd4Bz5WOVhOq/grrKP2UMov264Equ7lkAwHek3KI3OYGE
         H5GcBppL7CRjsohHh78TBGOT7j8G3mpqFuu6QHNrTxr9AdpJKwmDV+qH1IhlgCj5M1W5
         LnTPSlmIiCx8ufI0oh7XkvA0EvPGEww1wSc8mlFZDK9zsVjRna/HrQeerbKXehm9CMkT
         jAfyzyudM+5iJtmRNTgP05yEdX7Q8IUCmi4/IpfC4eiBdGFF0TxkG40BShj+dHpVHmQj
         z6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851775; x=1786456575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXXO2IRcaN/cQzNifZvrT3g0gNImnjqVwD0ab/RL39s=;
        b=ZlE9yNPntZRQS8ErTmoeeRN07NA8ZtiNcyXsdwKBAGwwfLnO9pVml8djDst97Yed42
         C4iQSLH4mUBJrFHQyLWgv+rjs3KEhxNegsIrtrT2dY9KufYx9O1upkvvzrTnRfT0Di8N
         UCy7R2SMgs6rcmzWcShSNqg728/AmS8P2hXuk99R9IB1dYbMRnKB1rTp6gtq5Cd5TwAm
         /0LsLn0zL82ekzrSY5IMJsjZNsJal1HiLjL3VgR2Ks2qkOvkMcfEIggK8gP87gsyNp3x
         k2vwJr67MfZr1/3PHDiq5fYuxX0VOvFoU8xjW6HJ1HoTyyKQlBiMe551HU/J3j467XAa
         4c4g==
X-Forwarded-Encrypted: i=1; AHgh+Rqp5JwkNF3s99JIV/Zjm7nJZ5/m6y67qBoBqoAo9BM2W7L8YwN4FKAeym2rSUJnnJgV1DgSFGnCQ7hZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzAUYqKlwX7CgpsTRT8bxgZ+NTzJBQrI0PZH5tl7zgJpA+DpZbP
	BOWp6guqxd8rxy75kFflzZ3NKzupS1CpSv+q7e+foWQMnF6Y2rltJ2I3FSj5tBIxxl4=
X-Gm-Gg: AR+sD10BmneXRHBYnJ9b88yn6hjcZijrkK1BApa/Ke8cmwOXlBSjbcy8Pd2/sNe5t1M
	mQdNNRqXrqCQxZI2UQ6kDbsiQAFADtRjlCUlhxeTtbrWw243kR5wSoN3Db6KzHhzVIjQUEhLf4W
	6wjU291KBSILricYNbGsEIo7Ufy94mtKRXqIu6ltaMKHBPH8nKmnDu1TDAUkiix/CBnsRokU7W/
	pkPVArC48PmnKiffanTrqujTN+KPIET53XNzuBaR7YLIGIko1BLx1JfaijvDDWBNU8Khrpp9gWQ
	QRi0aC9t8OuPzrTdD6cZbAOGLIh42Vkjm2AnxUhl84sh47BfkuiYZrjL/GzA2ozM+H54x+wSLVC
	Gp8VgbMD8xD0TxKDPjoCR4VxcD9XH0dp/wT76YkkCMVp70F8sJb8UK0DJYeavogGT26ziSezp18
	5B1BOq9HWaoyTd/9qrbBi067KqMnqDELJS1AoLQG4p8c+G0+y1rPt1iSD48v0g+6t7mQ6IkjPs4
	m9e+dmzgIANXAZZr9aymvmD/B+FwNjd3TyRux+a+ByLNkHk2qaFovSZBRiqYsC+JOMff58ixZav
	fJlH+ypI1Q==
X-Received: by 2002:a05:6820:430a:b0:6ac:b07c:b34b with SMTP id 006d021491bc7-6ae43181091mr17136344eaf.4.1785851775253;
        Tue, 04 Aug 2026 06:56:15 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:398b:b195:5c26:85bd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae93d45b4csm171955eaf.5.2026.08.04.06.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:56:14 -0700 (PDT)
Date: Tue, 4 Aug 2026 08:56:11 -0500
From: Corey Minyard <corey@minyard.net>
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net
Subject: Re: [PATCH RFC v5 5/7] ipmi: ls2k: Relax the dependency to its mfd
 driver
Message-ID: <anHvewDHLeyxdTJp@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
 <20260804-ls2kbmc-mod-v5-5-e6bc5cdd9a93@gmail.com>
 <anD-LJYB-afdVAXN@mail.minyard.net>
 <2E268CDE-1D85-4611-BFF7-F74DD36132AB@gmail.com>
 <anHPgqIj907WFEGT@mail.minyard.net>
 <34EE213F-DA1A-4103-AAE9-85618954C846@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34EE213F-DA1A-4103-AAE9-85618954C846@gmail.com>

On Tue, Aug 04, 2026 at 08:27:11PM +0800, Miao Wang wrote:
> Hi,
> 
> > 2026年8月4日 19:39，Corey Minyard <corey@minyard.net> 写道：
> > 
> > On Tue, Aug 04, 2026 at 05:40:14PM +0800, Miao Wang wrote:
> >> Hi,
> >> 
> >>> 2026年8月4日 04:46，Corey Minyard <corey@minyard.net> 写道：
> >>> 
> >>> On Tue, Aug 04, 2026 at 12:55:53AM +0800, Miao Wang via B4 Relay wrote:
> >>>> From: Miao Wang <shankerwangmiao@gmail.com>
> >>>> 
> >>>> There is no strong dependency between the IPMI driver and its mfd
> >>>> driver. Although the IPMI driver will not work without the mfd driver,
> >>>> it is not a hard dependency. The IPMI driver can actually be compiled
> >>>> without the mfd driver, and it will just fail to probe. When the mfd
> >>>> driver is loaded, the IPMI driver will probe successfully. Therefore,
> >>>> the dependency of the IPMI driver on its mfd driver should be relaxed
> >>>> to "imply" from "select". This will allow the mfd driver to be compiled
> >>>> as a module and the IPMI driver to be compiled as a part of the ipmi_si
> >>>> module. The adjustment to Kconfig for the mfd driver will be introduced
> >>>> in the later patch in this series.
> >>> 
> >>> I don't think that's what "imply" is for.  Imply seems to be for if
> >>> there is another subsystem that can use this subsystem, but doesn't
> >>> require it to exist.
> >>> 
> >>> For instance:
> >>> 
> >>> config SENSORS_NPCM7XX
> >>>       tristate "Nuvoton NPCM750 and compatible PWM and Fan controllers"
> >>>       imply THERMAL
> >>> 
> >>> The fan controller will work fine without the thermal subsystem; you
> >>> can control the fan speed without it.  But the thermal subsystem is the
> >>> logical user of this.  I looked at many of these things like this.
> >>> 
> >>> In the IPMI case, the IPMI driver is useless without the mfd part.  So
> >>> there's no point in compiling the IPMI part of this if the mfd part is
> >>> not there.
> >>> 
> >>> I could be wrong, but I can't see why you would want to do this.
> >> 
> >> The mfd part and the IPMI part loosely depend on each other. Without the
> >> IPMI part, the mfd part can still work to handle the display part.
> >> Without the mfd part, the IPMI part is indeed useless, but it will not
> >> generate compiling errors or other runtime errors. In the runtime,
> >> the IPMI part can be actually loaded earlier than the mfd part. As a
> >> result, their dependency is not that strong.
> > 
> > The operational dependency is strong, which is what I think you want to
> > convey here.
> > 
> >> 
> >> The reason why I want to change this is that "select" here requires the
> >> mfd part should also be compiled as built-in (i.e. = y), since the
> >> type of the configure entry IPMI_LS2K is bool. However, I cannot see
> >> there is no other reason preventing the mfd driver from compiling as
> >> a module. This patch series will introduce a minor fix, after which
> >> the mfd driver will be capable to be compiled as a module.
> >> 
> >> When the type of MFD_LS2K_BMC_CORE is changed to tristate, the "select"
> >> here will prevent selecting =m for MFD_LS2K_BMC_CORE. I thus believe
> >> that "select" here should be also changed.
> >> 
> >> Any suggestions on declaring the dependency of the both parts?
> > 
> > Ok, I understand now.
> > 
> > Why can't the IPMI part be compiled as a module?  Making that
> > module-capable would be the right fix, I think.  I can't see
> > why that wouldn't work.  IIRC, it was bool because the mfd part
> > was bool.
> 
> I would have agree with you if the IPMI part was a normal driver.
> However, the IPMI part is actually a part of ipmi_si. As a result,
> the IPMI part can actually be compiled as a module, but as a part
> of ipmi_si. That is why the configure entry IPMI_LS2K is bool rather
> than tristate. I don't think it is trivial to convert IPMI_LS2K from
> bool to tristate.

Yes, you are right it would be non-trivial.  It would take some redesign
of the ipmi_si module.  You are right here, probably not worth it.

> 
> > If you changed to imply, you would need a depends on the mfd core, BTW.
> 
> If imply is used here, and there is "select MFD_CORE" in MFD_LS2K_BMC_CORE,
> I think there is no need to add "depends on MFD_CORE" to IPMI_LS2K, if I
> understand it correctly.

If imply doesn't force MFD_LS2K_BMC_CORE to be selected, then it's not
going to force MFD_CORE to be selected.

> 
> I don't insist using imply here, if there is a better way to express the
> relation between both drivers.
> 
> > Also, IPMI_LS2K needs a "depends on IPMI_SI" either way.  I missed that
> > earlier.  Could you add that?
> 
> If I understand it correctly, there seems to be no need to add the
> dependency from the MFD driver to the driver for the actual sub-functions.
> Examples are:

There absolutely is.  You can select IPMI_LS2K without selecting
IPMI_SI.  It would compile without it, and it just wouldn't do anything,
but it would be confusing to be able to select something and it not do
anything.

> 
> - MFD_MENF21BMC and SENSORS_MENF21BMC_HWMON, LEDS_MENF21BMC, 
>   MENF21BMC_WATCHDOG: The later three declared depends on the former MFD
>   driver
> - MFD_INTEL_M10_BMC_CORE and FPGA_M10_BMC_SEC_UPDATE, 
>   SENSORS_INTEL_M10_BMC_HWMON: The later two declared depends on the
>   former MFD driver.
> - MFD_STMFX and PINCTRL_STMFX: The later declared select the former
>   MFD driver.
> 
> To summarize, as shown in the current mfd drivers, there is no need to
> declare dependency to the drivers providing the sub-functions in the
> mfd drivers, and the drivers of the sub functions should "depends on" or
> "select" the mfd driver. So if IPMI_LS2K could be tristate, then it would
> be reasonable to select MFD_LS2K_BMC_CORE or depends on MFD_LS2K_BMC_CORE.
> 
> 
> Regarding the fact that IPMI_LS2K is bool and it is not an independent
> module but a part of ipmi_si, it comes into my mind that we may choose
> to adjust the dependency from ipmi_si. That is to remove "select
> MFD_LS2K_BMC_CORE" from IPMI_LS2K, and add "select MFD_LS2K_BMC_CORE
> if IPMI_LS2K" to IPMI_SI.
> 
> I wonder if such a change would be appropriate.

That would be a good solution if it works.  Thanks for working with
me on this.

-corey

> 
> Cheers,
> 
> Miao Wang
> 
