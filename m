Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C81426681
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911380; cv=none; b=PlGDJCwHnh/m4tz1ZGJpESd+e9IALihRwBKNiOHreEJRtB5nJ+ohffIe0P9/gmB4H7fL4zHDZahKH9GcYgWv2qcgnSLhy1KyzBRY8/DIBXWUxXjlJ97OIRbbIlnPNcbZ4x7fr+41WHtk3sAtN1bCRRJO8cTCEv7mcgHyOLbYRRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911380; c=relaxed/simple;
	bh=+zZx1UCGop6TYPZIxrfkSxnpM9rhdSNLbAwPt6AGnAU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYvwM906AMSry6rKtUn/6kJ+aXKc8TwCIGRwXr548F9uZTbYyteAd31ExRgX0qs3C86tKQXHZ+L2TNORhMei89Ut/Hu0l3BtXtlgWVsp8KxU+JG/QNdvK6PAFxwYerTSftriEa51wuFytPsjGkN+1wxfSYpb3yaPNMn4c0aPi/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1odw0Pr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1odw0Pr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A862C19424
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 12:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911380;
	bh=+zZx1UCGop6TYPZIxrfkSxnpM9rhdSNLbAwPt6AGnAU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=U1odw0PrRpRYvsyVvrJc1UXSLBbIb71vSdHNQXB2yQvYuoiT+Xwe124qIi4PoASSZ
	 EDOnb98z4dV7yc6kakO9s/ejE4owE6JiTya+OYru/zBTNVGu7WAj+pvBBiAfKIc9W+
	 TK6Q4JQrBzWo/MhVi1ZHOlW1uLfzEO+oj1f14oUEq9a4qloHhXdIQ765J4OZH91Tda
	 lrpdbIT5itOJVCnSAPb0c6uwij7EW63AHBMaKaaDnWExWuorqm3YBJC4Y6I7L/enBs
	 aW67yzfrY5eg10aNbiPURAwVAbBIJvbRoLO/pTKoiMO7vGJztWMzbTT4Tk4OqFUZfN
	 lSnmA7KNzYb+g==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59b6d5bd575so5296974e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 04:16:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3c3bB+mEHWTIdoFpknIo/0nUjFeTqFpith89zpbh7Y7GngO3+7k2oDTEn5nFdf+STDfSKnPEZxnh3@vger.kernel.org
X-Gm-Message-State: AOJu0YyVj8D+5dd1/+tnZznzHnzjRskLGgk372pjXiFzm0X4if1fgEUG
	a88qJQ/rY25U/TxdFUnmU+gi/JClrQ9jw0G5puMGUszOoAdM6dXOLKwgJsuZHcHxr5/QGaudkVe
	lk55gl8doxs4akQuhLsCN9IpnBAO/gM2290dt4fTJrw==
X-Received: by 2002:a05:6512:2526:b0:59b:6853:f085 with SMTP id
 2adb3069b0e04-59dc8f2348fmr709971e87.16.1768911378444; Tue, 20 Jan 2026
 04:16:18 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 06:16:17 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 06:16:17 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260120115923.3463866-11-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-11-khristineandreea.barbulescu@oss.nxp.com>
Date: Tue, 20 Jan 2026 06:16:17 -0600
X-Gmail-Original-Message-ID: <CAMRc=McD0cRxtb3RCzzYPewFisto=4OjvA4gjaTcOk8ghTw_qA@mail.gmail.com>
X-Gm-Features: AZwV_QiTyzFRnq5hh7hZRZvq1Kgy4gAD4D9HxCaMuBiHbH1GRoIc82NCrITXf6Y
Message-ID: <CAMRc=McD0cRxtb3RCzzYPewFisto=4OjvA4gjaTcOk8ghTw_qA@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] pinctrl: s32cc: set num_custom_params to 0
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Jan 2026 12:59:22 +0100, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> The `num_custom_params` was not set to 0 and the pinctrl_desc structure
> was not initialized with 0. This would result in errors when parsing
> pinconf properties from the device tree.
>

Shoudn't this come as first in the series and with a Fixes tag?

Bartosz

> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> index 3e0c48068f08..27ea0b44a7aa 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -1272,6 +1272,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  	s32_pinctrl_desc->pctlops = &s32_pctrl_ops;
>  	s32_pinctrl_desc->pmxops = &s32_pmx_ops;
>  	s32_pinctrl_desc->confops = &s32_pinconf_ops;
> +	s32_pinctrl_desc->num_custom_params = 0;
>  	s32_pinctrl_desc->owner = THIS_MODULE;
>
>  	ipctl->regions = devm_kcalloc(&pdev->dev, soc_data->mem_regions,
> --
> 2.50.1
>
>
