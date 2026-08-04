Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49DF3DDB01
	for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2026 19:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785872083; cv=none; b=PfQWnLLcli9mfsO4PUe66bdUBvcbz6YOXNt7LBySt/Go/7Q8LqTN3iYmDqeFIUgjYiP/PrGgBC2+BHA4y1nxs4NhlNRx+i0UPILFH/jA0VUfxy5mLmShMaElQFyc3ZB7oinC2GNQAjp6ka/V9nITkiD+zh+HzgWTk7OO/6/HRzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785872083; c=relaxed/simple;
	bh=FkX/xieosdVcbH6HYR/PC2y2qnBz+V3S46vzsZqxsNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcNmvLGshnh/fRtq4Duk1nJligrydUtoMc2+sBYaOi/EyQH23HRL9Cp5Vi5lij4sjC7SqJ9aJwOnI28EvSWVsQBkBl3+e+z6boVB47gDmFA/oP88RUhxFcVZYY9n/30CvIEUqyO458ZFDl9bsuL9ubNVKBF3cN70qH3xTXiZP0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=RWUdRPWx; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="RWUdRPWx"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-49c38a4f110so158703b6e.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2026 12:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1785872080; x=1786476880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wvj3oWgLlHevgQNE90cRfYih3W8rje/GVXDKMGEKiAw=;
        b=RWUdRPWxs9+eD1bRt0cbEaRPnu2VL57EpB2Y92rEoR7l7sBwJlForqhUPut+/82w/W
         JQVlrNnqHXF6IQgAueKFq/4XZLAh07RiMgOsFRHaQcLzbuZpqe1lgAHln3SfP4pZ4SP/
         MvnGRMiFQdyNdZQjxsajUfhosz58+ROaQIbV0Q0nOsWN9JtdwGwhtdQkWP0mK5PTN4UK
         XyJH4R8mT6W23g/0c9aPcjvX+wN7FHj97x0EKLROg3uzRxBjSXGaxhx22V4+TZ8qHJg8
         UUdLMMj5kVINt1ZLulXbKii5DigFwSEQm5RgT/c326mO5w0rLrQpOSEwtlncUC+tFX+c
         w7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872080; x=1786476880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wvj3oWgLlHevgQNE90cRfYih3W8rje/GVXDKMGEKiAw=;
        b=H0NbsmQe/9SzOW+HVq0k8FV7RWpWIxBPR0DCSqkd50zbHflAS34daOdQA/HcFZmjf+
         CHqRxV91PyalZtyAnrogmIpLp6MFzHW2XW7fg10Y+wA6UjPdk4fkhSLLcmUVEeuGkINs
         NDF/majIXYd4CBX5FZzk12IxURkHwAyhklxuvY6x4jSgRUu7EbHkp/3ucMyCh2HxwgXw
         KpgCNRc0kgsaIToZaWcAlGCEsHaIM0TEP4JJCv46tLxwx/SXI8y4B7E7Lz733tk7shtR
         hO2CNtVYWfqSuqaye62boZdrIBF7VE9XwFOnZDSN8p3Lrb3LnaoFmjSkIVd0vjMQFweS
         dC5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Tq33jkLjLSDAEBUa1G/Ctfqt0oNRjf3syDdSpZeqJMRKlJZYf+x4W3oFj0hrQU6JguSjcAPhktcN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8bVk6ujcl5JdNLUrAn7lIq7yZsxh4GbceZ2o7F2G+o0s7+ckX
	82RnS5AYa7b9lU17V27GhLRgTD4qS8tJpb2YKN+QXPm9jXRQC/BtIXwdKhOTSSYiYxA=
X-Gm-Gg: AR+sD11Wr7HgTKOg1jJQ5Yu2fhKBzuUuR/qnbQEdFFFpmdsRN8O/PHrIxmQ+t+WJbzl
	x7hoFEXs5X1I3p63RoDuoN0BkZqfgzyk0OrUE1WdnOaDLtp0j6huYe6iddUlOhcNfiY+JQZpkaA
	y/IRsSJEZ7u1FQYWlH5dt0I1AffEvHSSG9R8IzNFYDDQDkvLqPTGeK843NyXCd7qyG7SnX2fCut
	2ftV+ofe+lu6pJNOruu5pdU2ysl6HDEcCRd6cGotRFLejAbnLmXo21XwL54UYI85ZADHcS0t43U
	kzcuCqdr66wRuhqQ2oov01OONvb2wbDE8CQelYDGZuyc7194j5pMU1bRSl1C7Z7laynI9fYttxv
	6moj5bDwT8ERKSzyxwLr/qLFCvLwFAp3Awp2bSY/pgWRxJC/dzrr2/hKndb9RSoh4eudrxiypD3
	Ig1uDp+4gR4uOJcxBK3g9HlcEWPdh3CysdvXOFPXEhixqCmnZSu1SjJcnClHaN5Hh6xHbieKIo+
	8qTjKWraWMJouSjaJ9scQRA4/OlkfGiV0eDw+8XZ6/gdhcYoAD8GSjChMfdc+GgFiIBMrjiR0Q0
	wsyqz7POCV1O/jSBBRWZ
X-Received: by 2002:a05:6808:1992:b0:48b:1e49:24a8 with SMTP id 5614622812f47-4afae069101mr645898b6e.11.1785872080464;
        Tue, 04 Aug 2026 12:34:40 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:398b:b195:5c26:85bd])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae4b828dsm263189b6e.6.2026.08.04.12.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:34:39 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:34:34 -0500
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
Subject: Re: [PATCH RFC v6 5/7] ipmi: ls2k: adjust dependency to its mfd
 driver
Message-ID: <anI-yljxhMbZ2DFt@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
 <20260805-ls2kbmc-mod-v6-5-16ccde412d86@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-ls2kbmc-mod-v6-5-16ccde412d86@gmail.com>

On Wed, Aug 05, 2026 at 03:14:23AM +0800, Miao Wang via B4 Relay wrote:
> From: Miao Wang <shankerwangmiao@gmail.com>
> 
> There is functional dependency between the IPMI driver and its mfd
> driver. Previously, the dependency was set to "select" from
> IPMI_LS2K to MFD_LS2K_BMC_CORE. However, the ipmi driver is actually
> compiled as a part of the ipmi_si module, and IPMI_LS2K is a bool
> option. Therefore, the dependency "select" will force the mfd driver
> to be compiled built-in when the ipmi driver is built as a module. This
> is not desirable. This patch fixes this by declaring a conditional
> dependency from IPMI_SI to MFD_LS2K_BMC_CORE if IPMI_LS2K is selected.
> This will allow the mfd driver to be compiled as a module if the ipmi
> driver is built as a module. The adjustment to Kconfig for the mfd
> driver will be introduced in the later patch in this series.

Looks good to me.

Acked-by: Corey Minyard <cminyard@mvista.com>

> 
> Fixes: d46651d4e3c0 ("ipmi: Add Loongson-2K BMC support")
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
> ---
>  drivers/char/ipmi/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 669f7600019747bcd2b37563477cf336f19a0407..07f3308c71616215871a730b87f1991d2b502e63 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -62,6 +62,7 @@ config IPMI_DEVICE_INTERFACE
>  config IPMI_SI
>  	tristate 'IPMI System Interface handler'
>  	select IPMI_PLAT_DATA
> +	select MFD_LS2K_BMC_CORE if IPMI_LS2K
>  	help
>  	  Provides a driver for System Interfaces (KCS, SMIC, BT).
>  	  Currently, only KCS and SMIC are supported.  If
> @@ -87,7 +88,6 @@ config IPMI_IPMB
>  config IPMI_LS2K
>  	bool 'Loongson-2K IPMI interface'
>  	depends on LOONGARCH
> -	select MFD_LS2K_BMC_CORE
>  	help
>  	  Provides a driver for Loongson-2K IPMI interfaces.
>  
> 
> -- 
> 2.49.0
> 
> 
