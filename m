Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695277;
	b=mPOo8rmPL4Bo8oUfXszoOcjMKlA1Znl1b5CrarwZOY/QY0MZdTldxSZdbc1RZR/f6/d1
	 FC16RxFQIdaLhN2VPkYbAHYYQtC2Xi1v0jTf+uHGzUyIOQhUZBuVFacr0t5UyvsyVOHmo
	 G1KbC+TMujWpMbn1BsRRd8qdXYmSmdq/vp1TjEcsJK5XD9ESkYRlR9hO0HEy8bXJojdf5
	 erwrMf6/nxoMSIqe5Wm+I85DMQgG7sG+JLWpjik4Mq3ALGO5s9R8i+i3FC9/7zW2E9YZg
	 atEl90m2X9Cu3K0mZKqYeBWbuTsoY0wugj29/gDuwgKy0xWl8XKfmmm+mcBdf2kXTiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695277;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RhKt16of56GSIqtS3K+XfsNEUpLs5ygGgmwiyfLWjSI=;
	b=UfliiyExv7KvqRDciFChOwpaYcwuGxyzP0j37SoPKbXbwiZ11tsP7g0p2Ey/ZjMHF39U
	 B6L+k8cHI/ZhT4z5n0eJzFI0y0TqL5OYuHrhh7m+fdXZAlr8pkBXGxDKrUZ9I/ZeINDIi
	 gFecAtcO00TOf2igwssor5Tqs99GNGROI9v+6snP1YkeLUregMwjCGLvbI5/ad5Uh/MwM
	 9yzEuydUB9mSU6HTtIiZ8DCS8+SnRAkn3u4dVDDs15OoonJFAl2D/hbD9UHFpyaXJzuVC
	 skr0tzZzT5ClPDmz7VuFjYcOkgy0lLlVqnKKLQHleCMoSLlQi5dl9GfoLZSAqVmoMsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A777606A31D;
	Thu, 22 Oct 2026 18:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A777606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xJxva-00029X-00; Thu, 22 Oct 2026 20:54:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7C50EC0970; Thu, 22 Oct 2026 20:50:52 +0200 (CEST)
Date: Thu, 22 Oct 2026 20:50:52 +0200
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
Subject: Re: [PATCH v1 5/7] MIPS: BCM63XX: Remove one time use
 ephy_reset_gpio_flags
Message-ID: <atpbDFIFtFCntTeU@alpha.franken.de>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <20260715185112.1323510-6-andriy.shevchenko@linux.intel.com>
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
In-Reply-To: <20260715185112.1323510-6-andriy.shevchenko@linux.intel.com>

On Wed, Jul 15, 2026 at 08:46:45PM +0200, Andy Shevchenko wrote:
> ephy_reset_gpio_flags exists solely to supply polarity to the reset GPIO.
> But in practice it's kept all the same and currently only a single user
> present. Drop the member and use hard coded GPIO flags instead.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/mips/bcm63xx/boards/board_bcm963xx.c           | 7 +++----
>  arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h | 3 ---
>  2 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> index c5617b889b1c..57e916c06792 100644
> --- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
> +++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> @@ -42,7 +42,7 @@ static struct board_info __initdata board_cvg834g = {
>  	.expected_cpu_id = 0x3368,
>  
>  	.ephy_reset_gpio = 36,
> -	.ephy_reset_gpio_flags = GPIOF_OUT_INIT_HIGH,
> +
>  	.has_pci = 1,
>  	.has_uart0 = 1,
>  	.has_uart1 = 1,
> @@ -903,9 +903,8 @@ int __init board_register_devices(void)
>  
>  	platform_device_register(&bcm63xx_gpio_leds);
>  
> -	if (board.ephy_reset_gpio && board.ephy_reset_gpio_flags)
> -		gpio_request_one(board.ephy_reset_gpio,
> -				board.ephy_reset_gpio_flags, "ephy-reset");
> +	if (board.ephy_reset_gpio)
> +		gpio_request_one(board.ephy_reset_gpio, GPIOF_OUT_INIT_HIGH, "ephy-reset");
>  
>  	return 0;
>  }
> diff --git a/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h b/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
> index 830f53f28e3f..018a56cbc328 100644
> --- a/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
> +++ b/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
> @@ -46,9 +46,6 @@ struct board_info {
>  
>  	/* External PHY reset GPIO */
>  	unsigned int ephy_reset_gpio;
> -
> -	/* External PHY reset GPIO flags from gpio.h */
> -	unsigned long ephy_reset_gpio_flags;
>  };
>  
>  #endif /* ! BOARD_BCM963XX_H_ */
> -- 
> 2.50.1

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
