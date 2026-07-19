Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE9A13AF2;
	Sun, 19 Jul 2026 04:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784434628; cv=none; b=IgJ9EdpQ/M8a702TnTUw9W4K7hFYqAUcH+2ti0boeuDqhVTNsMdhsVpKzgOrIkKWbtukidG+9PtNcw30T4Q4EKnEE+JvOJ1T8EVx35GaQpHSIuagDTSFZC55cV96dPBiYf8Ldi45NzNEYtDa4qUB8xsP+x27MVihRJkSgCO7Gsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784434628; c=relaxed/simple;
	bh=vISnKtrlEz79KACyf2CvsP6ooMCpR3EynficHAkM47c=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=OtYZHxIRWelkxRMgrKwdGdtz59rhC5fSHM63oSdNf7ruCmGbFtGStWmBi22wKw7riMdSpv5nUoBUEBcJGueoSkmlU7D3NO6v68jd0fEj57gnPQOovRxEluqfIFAAj8S3mnl8yRgrtNKQYKTdq3wUuqVP9h6xhcCCXVprJhbmelM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=SZvFdaqw; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="SZvFdaqw"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B367786176;
	Sun, 19 Jul 2026 06:17:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ugg3sL95OsI; Sun, 19 Jul 2026 06:17:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784434622; bh=vISnKtrlEz79KACyf2CvsP6ooMCpR3EynficHAkM47c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SZvFdaqwdHOu8JBSkOQVzeDJeYbR9Tm3qpOa8d9L54hzW5y/ie9XSdc0u4Fig2IWA
	 QXuiQfB7o4oSbHvrSM2mwhYXY14+/QeyDnbgejRl5aYzzVh5Px62cxQz6SPp7NLejg
	 QmglveSjXQ6ydy5GBP7Rz9RkHlbVk6TlVlwSUK8bl30CsRTl4SgvlBdsC6vuKzu/oO
	 9cLRNsx6SrdXv1EeBO9Hr2ygTpStXYMAnusQyLEQlgcpSqVyEAwZQcP2d0K9mDeVoK
	 NHhnuJ2lkOeOKdGeFrUmCam1zbk91R//QVAuE7d1zzCUWJJgSdqqTuaIow2oO9Jjy6
	 K1UfYXIVY9eag==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 19 Jul 2026 04:17:01 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Sander Vanheule
 <sander@svanheule.net>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: realtek-otto: decide bank_read/write by device
 endianness
In-Reply-To: <CAMRc=MeKB-rH35Jw0Z7vKVuk9=d3M0x5a-LJwgim3fuUW26xWQ@mail.gmail.com>
References: <20260710183439.996923-1-adilov@disroot.org>
 <20260710183439.996923-3-adilov@disroot.org>
 <CAMRc=MddZxoi_=QCFYp1PM8OwsWbz-Tsmoa7TMkQ1bh+qf-pdA@mail.gmail.com>
 <3d6b8d6ab53aadef56e68c925030dd3b@disroot.org>
 <CAMRc=MeKB-rH35Jw0Z7vKVuk9=d3M0x5a-LJwgim3fuUW26xWQ@mail.gmail.com>
Message-ID: <ba21d405fd51a7dccd9ca5eacc0385bf@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-07-17 10:39, Bartosz Golaszewski wrote:
> On Wed, 15 Jul 2026 21:00:45 +0200, Rustam Adilov <adilov@disroot.org> said:
>> Hello,
>> On 2026-07-15 09:39, Bartosz Golaszewski wrote:
>>> On Fri, 10 Jul 2026 20:34:39 +0200, Rustam Adilov <adilov@disroot.org> said:
>>>> In order to have a working gpio controller with SWAP_IO_SPACE,
>>>> the way bank_read and bank_write are defined must be changed and
>>>> separated from GPIO_PORTS_REVERSED flag. That also includes the
>>>> flags parameter used by gpio_generic_chip_config.
>>>>
>>>> To achieve it, use the device_is_big_endian() to decide the
>>>> bank_read/write parameter and the flag.
>>>>
>>>> Signed-off-by: Rustam Adilov <adilov@disroot.org>
>>>> ---
>>>>  drivers/gpio/gpio-realtek-otto.c | 15 +++++++++------
>>>>  1 file changed, 9 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
>>>> index 491fde846d46..f96072fbce92 100644
>>>> --- a/drivers/gpio/gpio-realtek-otto.c
>>>> +++ b/drivers/gpio/gpio-realtek-otto.c
>>>> @@ -393,16 +393,19 @@ static int realtek_gpio_probe(struct platform_device *pdev)
>>>>
>>>>  	raw_spin_lock_init(&ctrl->lock);
>>>>
>>>> -	if (dev_flags & GPIO_PORTS_REVERSED) {
>>>> -		gen_gc_flags = 0;
>>>> -		ctrl->bank_read = realtek_gpio_bank_read;
>>>> -		ctrl->bank_write = realtek_gpio_bank_write;
>>>> +	if (dev_flags & GPIO_PORTS_REVERSED)
>>>>  		ctrl->line_imr_pos = realtek_gpio_line_imr_pos;
>>>> -	} else {
>>>> +	else
>>>> +		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
>>>> +
>>>> +	if (device_is_big_endian(dev)) {
>>>>  		gen_gc_flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
>>>>  		ctrl->bank_read = realtek_gpio_bank_read_swapped;
>>>>  		ctrl->bank_write = realtek_gpio_bank_write_swapped;
>>>> -		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
>>>> +	} else {
>>>> +		gen_gc_flags = 0;
>>>> +		ctrl->bank_read = realtek_gpio_bank_read;
>>>> +		ctrl->bank_write = realtek_gpio_bank_write;
>>>>  	}
>>>>
>>>>  	config = (struct gpio_generic_chip_config) {
>>>> --
>>>> 2.55.0
>>>>
>>>>
>>>
>>> Can you look at the sashiko report? I think it's right about this change
>>> possibly breaking existing devicetrees. Can we keep big-endian as the
>>> default?
>>>
>>> Bart
>>
>> Oh i didn't know sashiko was looking after this subsystem too.
>> But yes, it does require the rtl8380-gpio, rtl8390-gpio, rtl9310-gpio
>> to append big-endian or native-endian (as they are all big endian chips).
>>
>> I was thinking earlier whatever it is appropriate to make changes to
>> the arch/mips/boot/dts/realtek in this commit because it is different
>> subsystem entirely but i guess this (previous sentence) answers the
>> question, doesn't it.
>>
> 
> That's irrelevant as there may be devicetrees out in the wild and we can't
> just break them.

So, what is the solution then? Cause relying on device tree property the
driver did not rely on before would break stuff, though realistically it
is only relevant to OpenWrt and here. If we instead just create a flag
in the driver like PORTS_REVERSED, then we would have to patch it again
when SWAP_IO_SPACE is selected in the future and that is more hassle than
simply changing device tree property. Unless i am missing something, these
are the only possible ways of going about it that i can think of.

>> Also, what exactly do you mean by "Can we keep big-endian as the
>> default?" ? My only reading off is to change the if statement
>> so that the big endian flag and the _swapped functions to be
>> under the else part, is it correct?
>>
> 
> Yes, just retain the original default behavior.
> 
> Bart

Best,
Rustam
