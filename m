Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87CC3F4DC1;
	Mon, 27 Jul 2026 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146001; cv=none; b=eIY8l4AhjVulPYku2/KKYXh4Al0lOLh4lNNY3ri39s0HzX8NaDvjw1DkkyzO8dY8BMhpk9GABDCGPAx7WcoF87IDlJNzosGvL18+DzZYhxmCn6oxsNGXJSKen82OV4DWNt2OOWC6nf9HDuEx8l/1JRX8sGkGH4p9dp68o100Ka4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146001; c=relaxed/simple;
	bh=mnd8JGUpLhfjuGMnBBumrarbO8dMDdvwUy1KHFY25m8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lVaKHas/C5r9QIHr+m2YFj9p6DLiDv7zQI66KEWZkavUXjEBO7AkC6Lwlj8VeO0sR4QOIDLcOFqJDY8o1vzLBZOHw1G6OsDE+Txpk556h9aypdgz0UoBRV6/gdHD42JCKV5RNx++i7xyhq8xnANzhYSBVifMDipoaWquJMq9K5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3ekCTAT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3ekCTAT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8F11F00A3A;
	Mon, 27 Jul 2026 09:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785145999;
	bh=aRit7Gfx5uba8dm8erPWOFTIgUtnZEAD4/wvQacClUI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=R3ekCTATANXRCgeXbpg4OzWZIkyInp1FJvNGcPQL0E/D1QA8R3VmWg0dDglcO62xl
	 gVcXhZwnQIizWbw3T+nRboftquu6MgwhJQBtjWbjHnqFSVEM6Xea1qgTHdZ93DCfbi
	 qk4PjHMQq9CtgxGzzZ8ODwLPjVx2jvFWp3OJbxfiv8cLTDIMOu5yzZ6RhPRBfgmeZk
	 284IEiBedMkOR1jXq9wfUPa1hppMvOC6PhzyrgVxLIvE5kF/Ny5VWqAqNXw1vPpeYu
	 WWsnTXCMXOw+EFBEdrn8GWIl+s21aHVCa4SjGQcTX1LOYefMdl5lt6imvEZCE5NvYf
	 n0KYnl+j4B8Cw==
Message-ID: <9ecea779-4f11-41e2-95b8-e92ab5302158@kernel.org>
Date: Mon, 27 Jul 2026 11:53:13 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v1 3/7] media: em28xx: Open code gpio_request_one()
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
 <20260715185112.1323510-4-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260715185112.1323510-4-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/07/2026 20:46, Andy Shevchenko wrote:
> Open code the gpio_request_one() call to be able to kill that API
> in the follow changes.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  drivers/media/usb/em28xx/em28xx-dvb.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
> index ef148a27c94d..d7f8dcf27900 100644
> --- a/drivers/media/usb/em28xx/em28xx-dvb.c
> +++ b/drivers/media/usb/em28xx/em28xx-dvb.c
> @@ -742,18 +742,14 @@ static int em28xx_pctv_290e_set_lna_gpio(struct em28xx *dev, u32 lna)
>  #ifdef CONFIG_GPIOLIB_LEGACY
>  	struct em28xx_dvb *dvb = dev->dvb;
>  	int ret;
> -	unsigned long flags;
>  
> -	if (lna == 1)
> -		flags = GPIOF_OUT_INIT_HIGH; /* enable LNA */
> -	else
> -		flags = GPIOF_OUT_INIT_LOW; /* disable LNA */
> -
> -	ret = gpio_request_one(dvb->lna_gpio, flags, NULL);
> -	if (ret)
> +	ret = gpio_request(dvb->lna_gpio, NULL);
> +	if (ret) {
>  		dev_err(&dev->intf->dev, "gpio request failed %d\n", ret);
> -	else
> +	} else {
> +		gpio_direction_output(dvb->lna_gpio, !!(lna == 1));
>  		gpio_free(dvb->lna_gpio);
> +	}
>  
>  	return ret;
>  #else

