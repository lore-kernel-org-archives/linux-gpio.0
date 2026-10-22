Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695277;
	b=qdWvQmxti90NQ9qxgzWb6xZaAGby60sAiyY/wgZiJZzkh9FTv7iZ7I+3XuojW1TAiaX3
	 oNVSx7G7P0IqwqHomYVb/YChHk9rV+Z5gXQvEaYwkmymuEyLpZeDgEUMWV62eMDKKiRVU
	 VpXVJc94uLbpRhjYT06QDqRb+Sxsa+6naQjGHYwbndVI/0NosHd8xwzF7x+mChwDPL1Tm
	 zczVzH+9mCF6fTQqWjaymkTr1rtrpx3X+W1YoMAiLYVDO05jqTe2p1UpHewB7DlV+esI8
	 d1DBrFsYBghv+ZZQjvVQJhcspgnuiemmDfybIsAYge+icxzTIl7xfoogCg6Hl2q5yKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695277;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nKpgdfCWqF+9Q5MR5EBAQAUQb+BD1snzTotJ0iQU74U=;
	b=AjMNGUVMBMLx0uFrhI4w1Ke9o43PzQw2erqCDBpQWBaKwCu4TFj8nkjIAAFWkRevUwHR
	 n47reFI/EDYSQUbbOr7JjHn7BhqNS3pc92gxjWXulWLYDQkYWMGT38T2ZjsXzQM4I9uzG
	 gyfB3sHg4T4/2wLSkU8jWA65tXQ2lCxrOMv7Wpos6JHo1mN5DtX5lVAGlZEHqgRrXlFXb
	 QASCY0KIWALrBLQJoj6fWdsOlbuSIioj1EiRmI18SaIrIWv6Y7/XbU1HSCQ/leEQ+Wn+k
	 N+R4rYLI7+IHokeEBqU/VO9KCAIkM1qFELYFWcggwL+etodyEwYWt17IL3E/syHd02A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54539606A319;
	Thu, 22 Oct 2026 18:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54539606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xJxva-00029V-00; Thu, 22 Oct 2026 20:54:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E4FE9C0423; Thu, 22 Oct 2026 20:50:40 +0200 (CEST)
Date: Thu, 22 Oct 2026 20:50:40 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 4/7] MIPS: BCM47XX: Open code gpio_request_one()
Message-ID: <atpbABKiC2KlCxeU@alpha.franken.de>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <20260715185112.1323510-5-andriy.shevchenko@linux.intel.com>
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
In-Reply-To: <20260715185112.1323510-5-andriy.shevchenko@linux.intel.com>

On Wed, Jul 15, 2026 at 08:46:44PM +0200, Andy Shevchenko wrote:
> Open code the gpio_request_one() call to be able to kill that API
> in the follow changes.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/mips/bcm47xx/workarounds.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/bcm47xx/workarounds.c b/arch/mips/bcm47xx/workarounds.c
> index 745c6228eb2c..9148d2c219d1 100644
> --- a/arch/mips/bcm47xx/workarounds.c
> +++ b/arch/mips/bcm47xx/workarounds.c
> @@ -9,11 +9,13 @@ static void __init bcm47xx_workarounds_enable_usb_power(int usb_power)
>  {
>  	int err;
>  
> -	err = gpio_request_one(usb_power, GPIOF_OUT_INIT_HIGH, "usb_power");
> -	if (err)
> +	err = gpio_request(usb_power, "usb_power");
> +	if (err) {
>  		pr_err("Failed to request USB power gpio: %d\n", err);
> -	else
> +	} else {
> +		gpio_direction_output(usb_power, 1);
>  		gpio_free(usb_power);
> +	}
>  }
>  
>  void __init bcm47xx_workarounds(void)
> -- 
> 2.50.1

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
