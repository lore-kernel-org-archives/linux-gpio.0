Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695277;
	b=XniZNicGUr5ftlxfOEisPx3TAu4JvaOvSUPGKOrWbEmpdwVXHxCLfphKEwzKY+oyEhPy
	 8ZytjGeSIyIf1n7PZgKkpIJk/eQguLfpxAOJBmuVrOTnhkQ80d2xP+sLROc2VSWM+AJR3
	 iSxjFP967wNwSiHgLdu5b+wBzGjAirDGDmHN9tv0KvW+1Aceq9wG8vAJQAIS3LBP1ve8X
	 L7iPd3mob3mAgkzBdSuGR9oYT4H8t4k8Mvht0gXgLVDkGn7dsKQVwWDfNunVCnMWL4grF
	 mfVt96Rc8sRufDyrdNt4MF2CAXay5IRPGM2yBz8SjfmvNBcDHv66BBfI4DV49Vff1Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695277;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dovN6BL5FAn+zak2EvD6O7G0CJM/moSbGvOLpebY1ek=;
	b=l6jPtOjJU5CD1LQAcegyPpgoc2yKxceTbvE++Nun3lurWVK0KcMXEwU5WUqw7TryL4/U
	 dVrR/nPQbddagW0Rd9Ywp39DvGiKaUHbSc5gOi8lZprojnjbHyXw95kNUDN3kENLRZvYF
	 Cto1tjKFu8wnA5zwKTlgL21DnwStHdmgzuMAFhMBhGkHtcIQQ01EpRue5AbDSlaJJST5U
	 3y4ohc+I5ZW9HbIKQBsVSsPrE1TG4Cr3S9s9Pgj2ryGLa5jLbbMWsiPpKn9cdyBeqYexO
	 PJdKDc/uQMIEf/X4NodTFTZ48PXl3F0Ct/dMfV74Vj3WblIdt8SeZrt9COpw6SY7Xtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A74B606A31A;
	Thu, 22 Oct 2026 18:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A74B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xJxva-00029Z-00; Thu, 22 Oct 2026 20:54:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 9ABACC09F7; Thu, 22 Oct 2026 20:51:04 +0200 (CEST)
Date: Thu, 22 Oct 2026 20:51:04 +0200
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
Subject: Re: [PATCH v1 6/7] MIPS: BCM63XX: Open code gpio_request_one()
Message-ID: <atpbGHWohgb-bCk1@alpha.franken.de>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <20260715185112.1323510-7-andriy.shevchenko@linux.intel.com>
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
In-Reply-To: <20260715185112.1323510-7-andriy.shevchenko@linux.intel.com>

On Wed, Jul 15, 2026 at 08:46:46PM +0200, Andy Shevchenko wrote:
> Open code the gpio_request_one() call to be able to kill that API
> in the follow changes.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/mips/bcm63xx/boards/board_bcm963xx.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> index 57e916c06792..993341604439 100644
> --- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
> +++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> @@ -903,8 +903,11 @@ int __init board_register_devices(void)
>  
>  	platform_device_register(&bcm63xx_gpio_leds);
>  
> -	if (board.ephy_reset_gpio)
> -		gpio_request_one(board.ephy_reset_gpio, GPIOF_OUT_INIT_HIGH, "ephy-reset");
> +	if (board.ephy_reset_gpio) {
> +		gpio_request(board.ephy_reset_gpio, "ephy-reset");
> +		gpio_direction_output(board.ephy_reset_gpio, 1);
> +		gpio_free(board.ephy_reset_gpio);
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.50.1

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
