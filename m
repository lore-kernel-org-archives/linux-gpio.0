Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970246;
	b=5DFJt0rFaZ7761f1DOPyTHgdjOOrDfNd+UWNOUqZgfp/AzR24DiRUBJxF73cGw85WsJh
	 Py8T5qGnGdcEfg9tI2/YjPkURcKAowhs7MWPtO0r7u0DtOPChI6UJnCNW61Vgd5kLAAZ3
	 KQtHBMKTFmPfjTkisZEqHSXOIqsWew88R7cCGWunuuzNXsL5zgWVS42qSZZV6giTPYd5V
	 eBbQaGekFmIigCtdXv8Z/wBW38OcBBt59AlBJZ5mGVAldZMDqy2A9LKWl/7DE69cJxu3q
	 62Fxs2GYkCjWyPcgmCcDcV6Eh0vRD0b9mkSsB2EDIsAvu3srQXpYFWAyukYrVoSjXVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970246;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UCKBeOZ2ggoGewJRZ/nGZX9hVpqu5lT56pUi5B+/g3U=;
	b=XknBW2rw974C49shKurE8VQKyBrleV1Xhf5MPoyCQfIdSjnkXgLnG5qAknYJLD8mOaq1
	 UQme5E8gcu9f1pvKWqW7jAoQC7urKRttwgtqex4yqAhsz/PQcA55vpg3PxLEL6+U4P5eG
	 dUAavskKNNpHDO/Ij5jzqd66/8pzUIzRNfCy5HctxhD9/ybSaH+L2z0KBsOJC0bB94NDN
	 kivz0CgUh/PJgaO7MHyRT3qtgja8hk0gobKmslhSesZHebEwZq4mHyDb4shyQ1WhT8dVW
	 v2i/SzWlIbsvZmlM28V4MUws3SZg3i7FDr/tA6I0dqKemEP//7UiMFxRdl/1ac2dm3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b10CHmSn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34918606A326;
	Fri,  6 Nov 2026 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b10CHmSn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4F51F0089F;
	Fri,  6 Nov 2026 13:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793970246;
	bh=UCKBeOZ2ggoGewJRZ/nGZX9hVpqu5lT56pUi5B+/g3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b10CHmSni3p1IQx+zj+Oxy9biEFFjGn4dFG1hcgJD4XJStyJvTSYsoAqotVFpjzEW
	 wfR11z4t8IuTXMH7g5iH7ZHlAAquWOstgwVODu3ayQVRUqpkqnQbvVCbjEj8shp3AW
	 FzRnKBCy8981CTK6EW6K7zQ3i8qKjcMfe+CFNjnYT96i1TiUxK69/5JOayqmTv7G1X
	 bK1QJcUVY+oqu48+J4/EN+fmzcwMZiRyOHZr2euEGiCvMTIotUmw/Tah5Wjlp5hENR
	 yXH17jV5Bp1Z6MUmbntpGD0ldNQjzwIeL5a1ImZM9l5mYDU5Km8RvZKB7gNHkn2SLP
	 7QwUhEFQxW80A==
Date: Fri, 6 Nov 2026 14:04:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: realtek-otto: Add RTL9311B support
Message-ID: <20261106-glossy-tarantula-of-finesse-f9d724@quoll>
References: <20261103215316.1544492-1-joshua.scott@alliedtelesis.co.nz>
 <20261103215316.1544492-3-joshua.scott@alliedtelesis.co.nz>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103215316.1544492-3-joshua.scott@alliedtelesis.co.nz>

On Wed, Nov 04, 2026 at 10:53:16AM +1300, Joshua Scott wrote:
> The Arm-based RTL9311B switch SoC has the same GPIO controller as the
> RTL9310, with port A in the most significant byte of each register and
> the same IMR layout. Add its compatible and allow the driver to be
> built for ARCH_REALTEK.
> 
> Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
> ---
>  drivers/gpio/Kconfig             | 5 +++--
>  drivers/gpio/gpio-realtek-otto.c | 3 +++
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 55e4280029d8..bc584da1abbb 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -645,14 +645,15 @@ config GPIO_RDA
>  
>  config GPIO_REALTEK_OTTO
>  	tristate "Realtek Otto GPIO support"
> -	depends on MACH_REALTEK_RTL || COMPILE_TEST
> +	depends on MACH_REALTEK_RTL || ARCH_REALTEK || COMPILE_TEST
>  	default MACH_REALTEK_RTL
>  	select GPIO_GENERIC
>  	select GPIOLIB_IRQCHIP
>  	help
>  	  The GPIO controller on the Otto MIPS platform supports up to two
>  	  banks of 32 GPIOs, with edge triggered interrupts. The 32 GPIOs
> -	  are grouped in four 8-bit wide ports.
> +	  are grouped in four 8-bit wide ports. The Arm-based RTL9311B has
> +	  the same controller.
>  
>  	  When built as a module, the module will be called realtek_otto_gpio.
>  
> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
> index 5d98ad597d9e..a4f010a0d2cf 100644
> --- a/drivers/gpio/gpio-realtek-otto.c
> +++ b/drivers/gpio/gpio-realtek-otto.c
> @@ -352,6 +352,9 @@ static const struct of_device_id realtek_gpio_of_match[] = {
>  	{
>  		.compatible = "realtek,rtl9310-gpio",
>  	},
> +	{
> +		.compatible = "realtek,rtl9311b-gpio",

Why do you need to add it if it is fully compatible?

Best regards,
Krzysztof

