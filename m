Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0454E0B60;
	Wed, 30 Sep 2026 15:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782047; cv=none; b=FrBrbB0l/6SGuSFac16EWY/Jny7WZRMyW/4dELMJq+bPp351/gIXD0RiHC6vbXBMA2cBJCzEX93BsoPxs57RV6iaVTUqYWZNPxbHpVkCTcrKDvlMr8n3Zl1G1jTM9KOQGqEeLWOLuimwzwOiaBZ8asST9Ajolf6UVQ5lgE49Om4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782047; c=relaxed/simple;
	bh=BMxuuBMmXl1PbkW1d5zdKSxy6yBqqDoKYBJRc1IY+1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mx50R8Yq3+98NpMqJ5IvJgMRhKKOCOEWy5robHz8dvfIOFF1+O0iZSn2mzOyc1jBmW8UHOqt+8lXiYTHlqJbheG0av181bMjv5XW7y09Saav3FnzZBjRWXCna2c5JuK30nCpjL0yScTLhBPL7qw6pVtjeZWfJFyyCrqLJtgftkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ufz6GsZa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ufz6GsZa"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FD5F497;
	Wed, 30 Sep 2026 08:27:13 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B8613F86F;
	Wed, 30 Sep 2026 08:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790782037; bh=BMxuuBMmXl1PbkW1d5zdKSxy6yBqqDoKYBJRc1IY+1E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ufz6GsZaOrldhgHWcIdahvrycYQ9GDFBm3l+cT3+cMhONUG/0Rv/0az0MGzvP64f6
	 KTHAjTCiKEngiedp52jDkZJYi/hnC2/k4MYgWXNaMPJKwG035bteweSdmZsisjJQFE
	 bLQG4cHtgkx0P07s5PbauauhTJ3n/txuJPmeC15k=
Message-ID: <a15d179f-8a43-4b4a-8bd5-fc0afecad6e0@arm.com>
Date: Wed, 30 Sep 2026 17:27:11 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first
 one that has IRQs
To: Pablo Mazzini <pmazzini@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260929203634.32998-1-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260929203634.32998-1-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pablo,

thanks for sending a patch!

On 9/29/26 22:36, Pablo Mazzini wrote:
> prepare_function_table() assumes the first pin is in bank 0. On the
> A523, which has no PA pins, every IRQ bank is numbered one too high:
> the last bank writes past the end of irq_array, and interrupts are
> looked up at the wrong offsets.

Yes, this is a known issue, and I already provided a quite different fix 
for this[1]: the A523 manual actually lists a PortA GPIO interrupt, even 
though this is pretty likely not functional. But specifying this IRQ in 
the DT fixes the problem as well.
The DT binding does not say how the IRQs are assigned to the GPIO ports, 
so from that point of view my solution is similarly usable as yours - 
though admittedly yours looks a little better and more future proof.

I guess we now need to figure out how we want to handle this in the 
future, and add an explanation to the binding. The A733 has a similar 
problem: PortA does not exist. This time the manual does not explicitly 
specify a GPIO IRQ, but conspicuously leaves a gap before the PortB GPIO 
IRQ, so we can use that as well.

Linus, Chen-Yu, Jernej: what do you think?

Cheers,
Andre

[1] 
https://lore.kernel.org/linux-sunxi/20260327113006.3135663-4-andre.przywara@arm.com/

> 
> Count the IRQ banks from the first bank that has interrupts.
> 
> Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>   drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> index 50a16f3bd131..9c5eb21a86a5 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> @@ -208,7 +208,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
>   	 * The extra functions will be filled in later.
>   	 */
>   	irq_bank = 0;
> -	last_bank = 0;
> +	last_bank = -1;
>   	for (i = 0; i < npins; i++) {
>   		struct sunxi_desc_pin *pin = &pins[i];
>   		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
> @@ -221,16 +221,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
>   		func[1].muxval = 1;
>   
>   		if (irq_mux) {
> -			if (bank > last_bank)
> +			if (last_bank >= 0 && bank > last_bank)
>   				irq_bank++;
>   			func[lastfunc].muxval = irq_mux;
>   			func[lastfunc].irqbank = irq_bank;
>   			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
>   			func[lastfunc].name = "irq";
> -		}
> -
> -		if (bank > last_bank)
>   			last_bank = bank;
> +		}
>   
>   		pin->functions = func;
>   

