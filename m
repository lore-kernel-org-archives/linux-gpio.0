Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778748;
	b=jGP+Ia4aJye8LgoQDErpHtQb8RRtV/4bBNExkiCTTr9kYhR13Ce+Jx9/lA4BR2/m9w6h
	 9m0xBVm/iy35pSpF2ouH/HoupNfjho6qIdF4GdrzVZPz1ALdtoyIpFDgrQADro5PNEOFS
	 U0mXQd2H+046mxBMn0MYddmsYiyoj8RfA65sv4Wj6JFjtEPVDbjGWBmcuNEfVyIr/KpxI
	 tqGfUEgkpqdtKDGTuuP0Jc+KxeukRchGy30nWti1rUU22FLq7E3IWsd6ZU9pYzZhpYg2a
	 xm6kE2zFPt1umUgZ4SddDf3SvaTl+59PhXlItr1KjfxRiJGCXl6MEZbzwIqttlm8Piw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778748;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spam;
	bh=ZaVGpE5VmWrwPSDV7cQyUHvfKsQON/q80mEPDwZU8v8=;
	b=xNeFb1HpGWR0JsujPITIXnVWSuCXS/H4rl44MYMCCNMGqqMyf6rWBvjyu0A7ZQGg2qP6
	 R3gSXxqNix8tidfAabSIS56cFeKQKA+82yGXcVykSslO5eHn6OFrocEflMudAoZwC8lMG
	 P8EcudFI5iE1FN/kpBmYkAxInpjr3ELgUeKUmZ6uM6Xdx5elddEAzDT46eITGrX7ChJkG
	 21LjLXYNpjW11w08AszL0wSGzYlfpJKWQ/7TF1pals49+vEQtMp9qfkLBv57a4NYNCkXn
	 BlRAacw1J6vdbvJwJJnWznLAX/A9g5e0QkRYmCYIH0G0xmBaiivq3mFmX4ZZkeBWQgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=E8BjU7e2;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00895606A321;
	Fri, 27 Nov 2026 11:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00895606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=E8BjU7e2
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 254B74C986;
	Fri, 27 Nov 2026 22:25:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795778742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZaVGpE5VmWrwPSDV7cQyUHvfKsQON/q80mEPDwZU8v8=;
	b=E8BjU7e21tO1gh0l95+WWiphxme7u7Ozzl35EgUPbZL1yDTvJy/bpNWhthIMqpkYO7DCOq
	oPeGv+2U+gi6rIX9fFgp8QdILaf2I7HmFgyT8PAE4/iLh+C1sDCPQpahntPFxDpmA+vZkb
	VBBAnYpyBqEHZ8V4tMutppS+HCcFJQ9BP7PdcSURhL57551AY6pZtBF39tMzd0FEiTHhOP
	jgRSUwtls8mosVVge6drIQvFT4ycdaw3T8w3PrFXqYgT8TyvlqTCMJBobkkP1zWyVaFy9A
	OFFfFs+knjUx4lWu8DKKMCKJ4xGptXdJhSoPsh+7xogeTp9IxUkwhde6Cb3ZDg==
From: Alastair D'Silva <alastair@d-silva.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH RESEND v3 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Fri, 27 Nov 2026 22:25:42 +1100
Message-ID: <20261127112542.2584153-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-2-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com> <20261124215048.42074-2-pmazzini@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

On Tue, 24 Nov 2026 21:50:46 +0000, Pablo Mazzini <pmazzini@gmail.com> wrote:
> prepare_function_table() numbers the IRQ banks from PA, even when PA
> has none. The static drivers number only the banks that have IRQs, and
> use irq_bank_map when the IRQ registers do not start at bank 0.
>
> Do the same here, and give the A523 and A733, whose IRQ registers
> start at PB, the map they need. Apply the map to the A733 register
> layout too, which so far ignored it. This also fixes PK on both, which
> was numbered 10 and written past the end of irq_array.
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 5 ++++-
>  drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c    | 8 +++-----
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h       | 7 ++++---
>  4 files changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> index 001bd42afa3e..f71a229926f5 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> @@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
>  /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
>  	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
>  
> -static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
> +static const unsigned int a523_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
>  
>  static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
>  /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> index ca82f08a3a65..3ebe926a1bc6 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> @@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
>  /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
>  	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
>  
> +static const unsigned int a733_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
> +
>  static struct sunxi_pinctrl_desc a733_pinctrl_data = {
> -	.irq_banks = 10,
> +	.irq_banks = ARRAY_SIZE(a733_irq_bank_map),
> +	.irq_bank_map = a733_irq_bank_map,
>  	.irq_read_needs_mux = true,
>  	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>  };
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> index 8bcd566593ae..1577897a0299 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> @@ -209,7 +209,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
>  	 * The extra functions will be filled in later.
>  	 */
>  	irq_bank = 0;
> -	last_bank = 0;
> +	last_bank = -1;
>  	for (i = 0; i < npins; i++) {
>  		struct sunxi_desc_pin *pin = &pins[i];
>  		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
> @@ -222,16 +222,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
>  		func[1].muxval = 1;
>  
>  		if (irq_mux) {
> -			if (bank > last_bank)
> +			if (last_bank >= 0 && bank > last_bank)
>  				irq_bank++;
>  			func[lastfunc].muxval = irq_mux;
>  			func[lastfunc].irqbank = irq_bank;
>  			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
>  			func[lastfunc].name = "irq";
> -		}
> -
> -		if (bank > last_bank)
>  			last_bank = bank;
> +		}
>  
>  		pin->functions = func;
>  
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> index 7c2f29e75519..09ebf67767c0 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -257,12 +257,13 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
>  
>  static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
>  {
> +	u32 hw_bank = sunxi_irq_hw_bank_num(pctl->desc, bank);
> +
>  	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
> -		return pctl->bank_offset + bank * pctl->bank_mem_size +
> +		return pctl->bank_offset + hw_bank * pctl->bank_mem_size +
>  		       A733_IRQ_REGS_OFFSET;
>  
> -	return IRQ_REGS_OFFSET +
> -	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
> +	return IRQ_REGS_OFFSET + hw_bank * IRQ_MEM_SIZE;
>  }
>  
>  static inline u32 sunxi_irq_cfg_reg(const struct sunxi_pinctrl *pctl,
> -- 
> 2.52.1
>

Tested on Xunlong OrangePi 4 Pro (Allwinner A733):
- Both pinctrl controllers (2000000.pinctrl and 7025000.pinctrl) probe.
- MMC0 card-detect GPIO on PF6 works ("Got CD GPIO").

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org> # OrangePi 4 Pro
