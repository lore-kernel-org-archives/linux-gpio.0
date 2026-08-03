Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1399D42CB07
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 20:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790004; cv=none; b=kNil1oVu8AYtW+5+GnNOlAjNkVu1jVS3vXXMDVFbio33HKUmgoez5j+w6C4iePL0AsSMf9r/V5XNd20/Kgjya+QUu4NNAA91m3f7Ex2tQzWOR5kjZNWHhW04SxbqkR3Ls9/N+AzPbm/UfeXaK5uk261kwctW9B3fTA1sjcpw33w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790004; c=relaxed/simple;
	bh=wBX8BLZdTegOaun5exk4Y6K5BxBMg2rdL/rBxt1YWWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UC44wcfT1MUhHCSIwUjnR43V64q3/CUDumh4Qu22HTAPYPA7pZ3F5vnghF1pMi0og1wQk9I3UHTjAiMJPuJ0STOm39os0oyjGOd1m/SgHTeT9BckWknd15DCRJgjI5XSylL1ppGXEuvaiqXAtRfFxBlzbKJjXa5D3yTR8DrGTGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=hzORDCbq; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="hzORDCbq"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-456d267da8cso1620348fac.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 13:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1785790002; x=1786394802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7CkkLegqd2C08aV3jq1XWB4t5IoMIYqhhbrvHHvW604=;
        b=hzORDCbq/olWF23aZqtBTMikCDGH4WgJhHUSnYV4ccEjgz+Pk73dxC9e+tUBR0vPy1
         085YPHYw42LqEw3+01+2kCFB5IrN4OVynuRKmmciKE228Bx8dkLb5y2zbrf/G+wVs/SH
         hiJsrPbEsuZHK4BawZfQHj6113OyRTeRmQXbgeOjXTt01cmvTPE/1rv4kbgEm46Djfxw
         d4VXNjivWaJa4phybXz97W/+HR3k5RCj2Fq8DnryRGGVYBFV3wJui3Xw3wE7L43qRDH7
         wHpKmFSVAjaAVCKv/YahRq5ZlOPfA2Dydi09cMpjj/4G2PWeAGWLYCSTzg0hWTZkESam
         6USw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790002; x=1786394802;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CkkLegqd2C08aV3jq1XWB4t5IoMIYqhhbrvHHvW604=;
        b=Zez7yiZSYBQn+BEaSpqgywTXokVSXazjxUHxTEootrrpnYU12L34ULSDVKrzJ1rJh3
         heLjlWypXvkRZSpA8xor9FFL08FLdALAkDLGVJ8NCRm0v5RHBluBCNpmR349hAIRbnJG
         WaUcG2oIqY7ZRNVU58uXzx2FI/4SozwNR6iotaoGhZoRvLGsh74Q17lJhQCJA0C8Lks3
         GUshkG57A5LV2JuyLhxK+qQeqImDrDsbJcZWe/7kNbckEkxw2xc+FsN5G4Dlac6VgXPh
         PsotQTELekrN9zunOzd8qgftT47fqweG/TLs4TUf/TyLOjqZVOFB3NNQKox7+NdtzPtj
         HDZA==
X-Forwarded-Encrypted: i=1; AHgh+Rq04GPdOJ4LNo39MXKLvP+Qwoq3M2DBwHsAd3TiBIqZUXLB1asCKDcobPakT/5j62vFeeyT3W8CT4qK@vger.kernel.org
X-Gm-Message-State: AOJu0YxalEaTZcAaSt/InZ+UV9u/G/7LKAZkUh+hm4PDanalygmk2nm8
	8i2Qjl4FB01UYI2PRvHxLs3qwFhyBKcJntLZR+afrQnlG/aBqWNHmmcdrwrEgMdbtyE=
X-Gm-Gg: AR+sD13cqYCARlRVvViRvnZG6nbzJl5ZUz2GHgAxuDmcKRQ4zyL1Q5m8jN0iNlAizGi
	r4SNViqL9fhM3gTD74tKCFCQMi9peA3O0qsVkUX/bmrYOoPvcGdx+xqIplT/bIe8X+IFwwXUpon
	0IcpIMaJRguKZv++BmbzOZhL5nWBdIq5BkHts8DsoiuWHxTVTHOvnWMBXCeZQ+RZkmsxMZL+Jl/
	61l0ElQSgp0k/msq4w/lPJuvY2T/D6rTK8eZVx+Xk4rkFfHE9GeQe+KCY2qMls/1bvi2b4K3dJB
	TTlssC/7mKRbV6z8GVUvypF1Hh0muc4WgAYFDm6iDC/K4uwadB50kP6Jz7MeIlb7PU2T9ABLvWW
	V+kJIFzrKFsne/SUedIrevINLkDNkZk16NoMoXnaqzZFYvrtlGdoZ0cbnt7JKvSwMdV2u00TaRG
	N+AoEWmzhaqmSn4CTXNG+rAyLbtKjlivJ3E35VVTWlJ7PSJjgqO0vA//4QPsxozOqYccOzOzJUI
	Yx8TaONzXLUvSazQE9bX9NxEx3VPleVbM5dyMytHGYb4S3GP1gX4T0ds5YE5CPSH7E0xrUeBlH/
	qedCgaE81vjtNWMHaWQG
X-Received: by 2002:a05:6871:646:b0:43d:8b5:933c with SMTP id 586e51a60fabf-459057b3bd5mr18200643fac.8.1785790001800;
        Mon, 03 Aug 2026 13:46:41 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:398b:b195:5c26:85bd])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f6064843sm9889268fac.4.2026.08.03.13.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 13:46:41 -0700 (PDT)
Date: Mon, 3 Aug 2026 15:46:36 -0500
From: Corey Minyard <corey@minyard.net>
To: shankerwangmiao@gmail.com
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
Message-ID: <anD-LJYB-afdVAXN@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
 <20260804-ls2kbmc-mod-v5-5-e6bc5cdd9a93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-ls2kbmc-mod-v5-5-e6bc5cdd9a93@gmail.com>

On Tue, Aug 04, 2026 at 12:55:53AM +0800, Miao Wang via B4 Relay wrote:
> From: Miao Wang <shankerwangmiao@gmail.com>
> 
> There is no strong dependency between the IPMI driver and its mfd
> driver. Although the IPMI driver will not work without the mfd driver,
> it is not a hard dependency. The IPMI driver can actually be compiled
> without the mfd driver, and it will just fail to probe. When the mfd
> driver is loaded, the IPMI driver will probe successfully. Therefore,
> the dependency of the IPMI driver on its mfd driver should be relaxed
> to "imply" from "select". This will allow the mfd driver to be compiled
> as a module and the IPMI driver to be compiled as a part of the ipmi_si
> module. The adjustment to Kconfig for the mfd driver will be introduced
> in the later patch in this series.

I don't think that's what "imply" is for.  Imply seems to be for if
there is another subsystem that can use this subsystem, but doesn't
require it to exist.

For instance:

config SENSORS_NPCM7XX
        tristate "Nuvoton NPCM750 and compatible PWM and Fan controllers"
        imply THERMAL

The fan controller will work fine without the thermal subsystem; you
can control the fan speed without it.  But the thermal subsystem is the
logical user of this.  I looked at many of these things like this.

In the IPMI case, the IPMI driver is useless without the mfd part.  So
there's no point in compiling the IPMI part of this if the mfd part is
not there.

I could be wrong, but I can't see why you would want to do this.

-corey

> 
> Fixes: d46651d4e3c0 ("ipmi: Add Loongson-2K BMC support")
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
> ---
>  drivers/char/ipmi/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 669f7600019747bcd2b37563477cf336f19a0407..f456e3e89416932f0d21bb742153a503aeb24267 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -87,7 +87,7 @@ config IPMI_IPMB
>  config IPMI_LS2K
>  	bool 'Loongson-2K IPMI interface'
>  	depends on LOONGARCH
> -	select MFD_LS2K_BMC_CORE
> +	imply MFD_LS2K_BMC_CORE
>  	help
>  	  Provides a driver for Loongson-2K IPMI interfaces.
>  
> 
> -- 
> 2.49.0
> 
> 
