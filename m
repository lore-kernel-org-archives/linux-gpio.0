Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EFF3D25A6;
	Fri, 17 Jul 2026 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283823; cv=none; b=WpVi3LX72TUO0GNdEIgu4Lo5S2NEqBD5k8j9W1bJmlZgb5mDwMrqWCVyODQTY3RmBmiK7P0x05S38iXPc7pN+hK8rDXatOiizX9qbui+vDSb8ODkLiV4G6ZfEX5yLuFT8RknbJ3zC9LFtvWzi52/jgAIGC4LFmGjllF6rEWckQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283823; c=relaxed/simple;
	bh=tGvidDqf6jtkfzTcLaP8DnYMHTXgmGClLCAu67eKaQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MfQ25/7hgeTqr1u5WbGncskB2GHKMfaIBIC446lMfc4iZK6L+I9Ed8UN1gNqQgmYq53j98HYsvH/EYyLOqyrKczfmj2OS078TxeZYYDjXg2oXqy7OFxmt/56YEflJLMdBzdCsyl10OxHvrY1cWcalpu7CXL279xbOa4JdXsFprg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwjeFEh+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwjeFEh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784283822; x=1815819822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tGvidDqf6jtkfzTcLaP8DnYMHTXgmGClLCAu67eKaQY=;
  b=dwjeFEh+1V7ytPYzCuiqX4FWeqbfCx8D9cw46bZ6+Qh9xsLtM8Lfir0R
   e2PVqEzEcsZKE7J42hwccsKu94Sj/GUWlAHW6jPRNYGbRPxWRz7vo5rIo
   jUK/RFHL3tsNDeJ9TUg7qQkqGgDDq1RsMiyh5dw8tcbHLMGWVTDw31n31
   5uYlI7GPdt0Xb3sPYQsbKp/gxNd+PiQAsfbLKVwsp9BmdFhyVGsd+dKch
   WGB+2egtENWIKA44Evr23UwC6vWbdyc+765A1T8NIr1h8J23K44L+5djv
   cCnkHgIfhMveiTEvA6c6UQ5JWvfSW8H5Tqcoc6zr5nmQMCsrJ3lvR+zSk
   w==;
X-CSE-ConnectionGUID: yFeYlnnQS0yHPK+BL7dpmA==
X-CSE-MsgGUID: MubOQTJSSm+DPSbMvzavJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="95555312"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="95555312"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 03:23:41 -0700
X-CSE-ConnectionGUID: HwnTdJuoTTmMif+Zc0HdWA==
X-CSE-MsgGUID: Bz+8y56PT0i4xLSMqjGqew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="258745095"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.143])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 03:23:35 -0700
Date: Fri, 17 Jul 2026 13:23:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Ming Yu <tmyu0@nuvoton.com>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/RISC-V/RENESAS ARCHITECTURE" <linux-renesas-soc@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH] gpio: Remove redundant dev_err()/dev_err_probe()
Message-ID: <aloCpCgDYjps9yQu@ashevche-desk.local>
References: <20260717083037.284134-1-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717083037.284134-1-panchuang@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 17, 2026 at 04:30:33PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
> automatically log detailed error messages on failure. Remove the
> now-redundant driver-specific dev_err() and dev_err_probe() calls.


...

> -	if (err != 0) {
> -		dev_err(chip->parent, "can't request IRQ#%d: %d\n",
> -			adnp->client->irq, err);
> +	if (err != 0)

This style is discouraged, so while at it, please replace with

	if (err)

>  		return err;
> -	}
>  
>  	return 0;

...

> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -489,10 +489,8 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
>  					       IRQF_SHARED,
>  					       "brcmstb-gpio-wake", priv);
>  
> -			if (err < 0) {
> -				dev_err(dev, "Couldn't request wake IRQ");
> +			if (err < 0)

This style might be okay, but has no sense, we know that there is no positive
out from this function, so, please also replace with

			if (err)

>  				goto out_free_domain;
> -			}
>  		}
>  		priv->irq_chip.irq_set_wake = brcmstb_gpio_irq_set_wake;
>  	}

...

> +++ b/drivers/gpio/gpio-max77620.c
> @@ -356,10 +356,8 @@ static int max77620_gpio_probe(struct platform_device *pdev)
>  	ret = devm_request_threaded_irq(&pdev->dev, gpio_irq, NULL,
>  					max77620_gpio_irqhandler, IRQF_ONESHOT,
>  					"max77620-gpio", mgpio);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
> +	if (ret < 0)
>  		return ret;
> -	}

Ditto. And so on...

-- 
With Best Regards,
Andy Shevchenko


