Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936157;
	b=hV9zDU1cw7k1gIsqeETbQnuUKTZYM7Jx34bH5ZcQR8VPu8HQ6siLds+o7BblhjLEuk9U
	 u+WDUPheBYa9L281R0haLWi4FpWzRhGvGF5GZYNU8qutID/g5fIGtzxB6xPnedYtiuUIx
	 5+6pk27VlYkMsiED3pqCx0Cc9BVDkpCfOyyiDip2VTkMqIV8GUiHoqRehcdLB5Ee3OiaK
	 Lw+pgknWCnI2C5qdWFqA/rjRkbVFYiWLt/kq2J18LYYfqKZuY9IQjC9+tg9u2C8H9ttmW
	 9iP1mbrjFQa+i24hI8xYQNcfgzQ8RN5zNc4q33yOyElB9fjEjW8M+u2N6QOdvMFBPfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936157;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=K8c9i2c9pA77ON1bwB34pN+TouNHlVdKNHMldunC6Ho=;
	b=qVxGHWFNlDoxFl8YaQmjH3gL5GzxVEC1m3Yzbn3v0pS/09bIgNgnGY21uoySE9FXWaZ9
	 n2yMvRg3EoEidQsEulZRsdZGZEJepk4gW/RT4Jv2BYPsoT3DJvQFDTm5O2ZEptgQdwmI0
	 y3419aKLNz7onWXQT2ia5KgQS92EmNlzjvUjEyjg/6wM3E8Sram+RDFquJN+f0p3apP2X
	 ced+cHl5aGQ844EtIn6xORwt3YeoFPOEx2XbpV3V3mzbg0vChYY94B98SieJMxOz+2Wu1
	 SFQUSpufNL5Wt3aLTHhhZMbVCgstlpF2+7Ano+trOl4WFix5ZNhTdKMhl0+Nf2sGVDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="JrhUs/dN";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C366606A88D;
	Tue, 17 Nov 2026 17:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C366606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JrhUs/dN
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7C281A00;
	Tue, 17 Nov 2026 09:22:33 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06AAE3F632;
	Tue, 17 Nov 2026 09:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794936156; bh=jCf/7a/YsnLbBlVT2TCDpR5Rx5MDswY+TpQ4UF++u2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JrhUs/dNEIiQrr+/fgwKCnNl6TD35vdP16BsU/ZIFqsA/KLgpTVbHKprOfL+6wMok
	 H/uYWKOGIDQNUILCf/caFLrLO3Q5XIqFEFcPcQyeDiMc5+uv0k4Gz2CyXPaUQtIt5Z
	 y6oTZAuRVjiWbda/dmaY3wYF6OGb9v+JzHIhEJ90=
Message-ID: <76d4d8ee-801d-426f-bda9-2ed8b9a074e0@arm.com>
Date: Tue, 17 Nov 2026 18:22:37 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: sunxi: a733: do not switch the mux to read IRQ
 lines
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Enzo Adriano <enzo.adriano.code@gmail.com>,
 Pablo Mazzini <pmazzini@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/10/26 14:01, Vinicius Pedrosa wrote:
> The A733 description sets irq_read_needs_mux.

ouch, I missed that, sorry about that. I removed that even explicitly 
from the A523 ...

> When a GPIO used as an
> interrupt is read, sunxi_pinctrl_gpio_get() then switches the pin to
> input and back to SUN4I_FUNC_IRQ, which is function 6. The A733
> interrupt function is 14, so after the first read the pin is left on
> function 6 and its interrupt no longer fires.
> 
> On my board this breaks microSD card detection: the PF6
> card-detect line is read at probe, and after that neither removal nor
> insertion of the card is noticed.
> 
> The A733 data register reports the pin level while the pin is muxed
> to the interrupt function, so the switch is not needed. The A523 and
> D1 descriptions do not set this flag either. Drop it.
> 
> Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
> Tested on a Cubie A7Z with the pending A733 clock, PMIC and DT series
> applied: before this change PF6 read back function 6 and card removal
> and insertion were not seen; with it PF6 stays on function 14 and one
> removal/insertion cycle was detected.
> 
>   drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> index ca82f08a3a65..456d9170c2a2 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> @@ -23,7 +23,6 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
>   
>   static struct sunxi_pinctrl_desc a733_pinctrl_data = {
>   	.irq_banks = 10,
> -	.irq_read_needs_mux = true,
>   	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>   };
>   

