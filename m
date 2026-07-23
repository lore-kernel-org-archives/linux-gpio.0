Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4900446EF9C;
	Thu, 23 Jul 2026 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806188; cv=none; b=bZN7mvYkSqEDLDnPTNZyid5S4Ka4qH78N2SliFiWqYNKG3lL405dckE7XW99UBUyahvYH4MB1EeK2eJythaJH8Zq6qxjf5NljozvCAwPCEMT6YQisyh6xKaOz8MAzvWYaX+wi8wvQL6S8hnQ+AFjOQ+cXCg1YTOFbH5kMt2KrJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806188; c=relaxed/simple;
	bh=ZdW9dTwqV9CZ+Ibuil4TEZraemwJrGygG72czleTpBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDMGDS09/vR0LjnPlbFJxrEfOpHe6G2ZCsDJD0kh28JgD05LzY4aiwocuOiEtb0Fy9Nnb6ORP186NaauouSmxq1tlSAGubtbsk0GOP1TS3aOc2xI762cRUwsR7M0FInMCYBqgIqVY+3eLXGVolY9IqjDvtV4rbkmDhYRsb8+0sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FE5WUJ1c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FE5WUJ1c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE1C1F000E9;
	Thu, 23 Jul 2026 11:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784806187;
	bh=rLlgOzkI5bkMt+H4hdc0o70nEKtrNFmAk4aznXWIaNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FE5WUJ1cAd21uBeCVP7iw8xQvlqVeAaM+/+plrrkge6OBqCax2HT7RVwc7xZed9aC
	 OsLIWd1FPiFWTPB3JcorXc86+TDl1kGRWztExVPprjmaApgJtKiLXy2snsJZO2jhT6
	 5GI5jitjZWYS8ML+WEAFh5d4qsodq9xi7iDB9+6Cn3B5c+MEa43wOmL4IQFpgz+7Zn
	 i2WgqZXHQV0Xcqr9t9aImE0if40hs3IazCM7Nzf2mkZP5FUv9HBM/CzK7B0/wiLzfl
	 qICrsC4WEPibMirjlE77HIK05DTXoanEnxftCx0LywC8NU4pueY9cWKRMrJBHI9ase
	 lEfNRu21ZMVfg==
Date: Thu, 23 Jul 2026 12:29:40 +0100
From: Lee Jones <lee@kernel.org>
To: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Corey Minyard <corey@minyard.net>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Miao Wang <shankerwangmiao@gmail.com>
Subject: Re: [PATCH RFC v3 1/7] mfd: ls2kbmc: Make a copy when parsing mode
 string
Message-ID: <20260723112940.GC3363113@google.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-1-ef718636e78e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-ls2kbmc-mod-v3-1-ef718636e78e@gmail.com>

Why is this v3 set still RFC?  What comment are you requesting?

On Fri, 10 Jul 2026, Miao Wang via B4 Relay wrote:

> From: Miao Wang <shankerwangmiao@gmail.com>
> 
> When parsing the mode string from BMC, the string is manipulated
> in-place with strsep(), preventing from parsing it again. Make a copy of
> the original string and manipulate the copy instead to fix this.
> 
> Fixes: 0d64f6d1ffe9 ("mfd: ls2kbmc: Introduce Loongson-2K BMC core driver")
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
> ---
>  drivers/mfd/ls2k-bmc-core.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe757a5bde43775a483a48352e706d..27f6e096404d67459038a0607378057ec7ef69ab 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -427,34 +427,54 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
>   */
>  static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_data *pd)
>  {
> -	char *mode;
> +	/* Assume 64 bytes is enough for the resolution string */
> +	char mode_buf[64], mode_buf_orig[64];
> +	char *mode = mode_buf;
> +	const void __iomem *mode_base;
>  	int depth, ret;
>  
>  	/* The last 16M of PCI BAR0 is used to store the resolution string. */
> -	mode = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
> -	if (!mode)
> +	mode_base = ioremap(pci_resource_start(pdev, 0) + SZ_16M,
> +			    sizeof(mode_buf));
> +	if (!mode_base)
>  		return -ENOMEM;
> +	memcpy_fromio(mode_buf, mode_base, sizeof(mode_buf) - 1);
> +	mode_buf[sizeof(mode_buf) - 1] = '\0';
> +	iounmap((void __iomem *)mode_base);
> +	memcpy(mode_buf_orig, mode_buf, sizeof(mode_buf_orig));
>  
>  	/* The resolution field starts with the flag "video=". */
>  	if (!strncmp(mode, "video=", 6))
>  		mode = mode + 6;
> +	else
> +		goto invalid_mode;
>  
> -	ret = kstrtoint(strsep(&mode, "x"), 10, &pd->width);
> +	ret = kstrtouint(strsep(&mode, "x"), 10, &pd->width);
>  	if (ret)
>  		return ret;
> +	if (mode == NULL)
> +		goto invalid_mode;
>  
> -	ret = kstrtoint(strsep(&mode, "-"), 10, &pd->height);
> +	ret = kstrtouint(strsep(&mode, "-"), 10, &pd->height);
>  	if (ret)
>  		return ret;
> +	if (mode == NULL)
> +		goto invalid_mode;
>  
>  	ret = kstrtoint(strsep(&mode, "@"), 10, &depth);
>  	if (ret)
>  		return ret;
> +	if (mode == NULL)
> +		goto invalid_mode;
>  
>  	pd->stride = pd->width * depth / 8;
>  	pd->format = depth == 32 ? "a8r8g8b8" : "r5g6b5";
>  
>  	return 0;
> +
> +invalid_mode:
> +	dev_err(&pdev->dev, "Invalid resolution string: %s\n", mode_buf_orig);
> +	return -EINVAL;
>  }
>  
>  static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
> 
> -- 
> 2.49.0
> 
> 

-- 
Lee Jones
