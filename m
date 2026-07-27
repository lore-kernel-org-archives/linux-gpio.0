Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF553EEAD3;
	Mon, 27 Jul 2026 09:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145980; cv=none; b=LHuc/54Vb+hZ36Tkem5wthXPguvubilwqIWUAVaoD4jukpISTUbyosoiW9REKSuiyMx+mZPh/QKdHVRxk5MvtdI6yxI9YTk1LSFy53diME83X5EsW7NvQaqVTa1IH5aoDYMlEYvI+eRMM/6eaezVK+homlSdsEl4G09lepB442c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145980; c=relaxed/simple;
	bh=9GHMDxwEFngJyi8lduix2B1OoVXUWsnVcUO9+wVAW1E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CiopsNZhuc0E5L3D0GaVdDPlOXUPaH3TJEYu8HjYLmhysoTP6cMaMtyIKWgx8UmjOmlREe7ni+6DnBccapYe2lSiviU9t2ExC2AtHeJ9Or2G35cu4fjZc9DVd6ubWBSxrYaaAfyK4qQ6Z0cdA74eAVQlyvpZIFtM6EGDXc9T4ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7LQDNND; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7LQDNND"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC4A1F00A3A;
	Mon, 27 Jul 2026 09:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785145966;
	bh=St9QVpMeJZt7kBp7YQlB/8fQhV3xxyBiullWLJdrNxQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=D7LQDNNDA7yxSPg3t7gWSrmlFcqdt2c4J7KYSntBViU2wjlSdLb0+Q27vZVQzJpOT
	 PdCgS/AZVotWK/j93cN4YMEKNnPQ9sG2rSPVFMYjFBq6gKITUvWYJNgJR+7YpdMKm6
	 1eDDNXfmoxcrDjdAgYcDLw/VeqfyCNUB+a+VXsoGMdChXLJBsaNfhiPvuZRHkRZpRR
	 0ww54bMCUf7GYR6CC66yuQp0GYo+VnQs07X4x2EwT8EpzTWaSCDrNtVABHaTNRO8QU
	 z89fHxTAj1S3a5To+QFDn+UhhhB9aAfwXCxlHCaL2+NgtAQT0w9xln6SEBdDc0I/q0
	 OYcomXxi4de8A==
Message-ID: <1666c7f9-4d32-495f-a737-3fc06872690b@kernel.org>
Date: Mon, 27 Jul 2026 11:52:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v1 2/7] media: em28xx: Split
 em28xx_pctv_290e_set_lna_gpio() helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-media@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <20260715185112.1323510-3-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260715185112.1323510-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/07/2026 20:46, Andy Shevchenko wrote:
> Split em28xx_pctv_290e_set_lna_gpio() helper in order to deduplicate
> the GPIO request and setting.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  drivers/media/usb/em28xx/em28xx-dvb.c | 31 ++++++++++++---------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
> index 8482fc4045ea..ef148a27c94d 100644
> --- a/drivers/media/usb/em28xx/em28xx-dvb.c
> +++ b/drivers/media/usb/em28xx/em28xx-dvb.c
> @@ -737,17 +737,14 @@ static void pctv_520e_init(struct em28xx *dev)
>  				regs[i].r, regs[i].len);
>  };
>  
> -static int em28xx_pctv_290e_set_lna(struct dvb_frontend *fe)
> +static int em28xx_pctv_290e_set_lna_gpio(struct em28xx *dev, u32 lna)
>  {
> -	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
> -	struct em28xx_i2c_bus *i2c_bus = fe->dvb->priv;
> -	struct em28xx *dev = i2c_bus->dev;
>  #ifdef CONFIG_GPIOLIB_LEGACY
>  	struct em28xx_dvb *dvb = dev->dvb;
>  	int ret;
>  	unsigned long flags;
>  
> -	if (c->lna == 1)
> +	if (lna == 1)
>  		flags = GPIOF_OUT_INIT_HIGH; /* enable LNA */
>  	else
>  		flags = GPIOF_OUT_INIT_LOW; /* disable LNA */
> @@ -761,11 +758,20 @@ static int em28xx_pctv_290e_set_lna(struct dvb_frontend *fe)
>  	return ret;
>  #else
>  	dev_warn(&dev->intf->dev, "%s: LNA control is disabled (lna=%u)\n",
> -		 KBUILD_MODNAME, c->lna);
> +		 KBUILD_MODNAME, lna);
>  	return 0;
>  #endif
>  }
>  
> +static int em28xx_pctv_290e_set_lna(struct dvb_frontend *fe)
> +{
> +	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
> +	struct em28xx_i2c_bus *i2c_bus = fe->dvb->priv;
> +	struct em28xx *dev = i2c_bus->dev;
> +
> +	return em28xx_pctv_290e_set_lna_gpio(dev, c->lna);
> +}
> +
>  static int em28xx_pctv_292e_set_lna(struct dvb_frontend *fe)
>  {
>  	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
> @@ -1920,19 +1926,10 @@ static int em28xx_dvb_init(struct em28xx *dev)
>  				goto out_free;
>  			}
>  
> -#ifdef CONFIG_GPIOLIB_LEGACY
>  			/* enable LNA for DVB-T, DVB-T2 and DVB-C */
> -			result = gpio_request_one(dvb->lna_gpio,
> -						  GPIOF_OUT_INIT_LOW, NULL);
> -			if (result)
> -				dev_err(&dev->intf->dev,
> -					"gpio request failed %d\n",
> -					result);
> -			else
> -				gpio_free(dvb->lna_gpio);
> +			em28xx_pctv_290e_set_lna_gpio(dev, 0);
>  
> -			result = 0; /* continue even set LNA fails */
> -#endif
> +			/* continue even set LNA fails */
>  			dvb->fe[0]->ops.set_lna = em28xx_pctv_290e_set_lna;
>  		}
>  

