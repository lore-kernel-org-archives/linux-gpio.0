Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8803ED122
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284787; cv=none; b=F1yn2Kpz89xmZsIobCWP9kBzc+AksHam7C8uyBRsMkGnr1l0gNTFFSJ3gHCA/vqDTcq8huH69ZdZeU9WIOA5d0Kkaf2AbUly0Ov5IKxWpDpJwJKjV+PgRarVIfUL9EuDMIFLDvQoRYmACJBAegz1Yo1zdjvdofLAtNe6l97ed8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284787; c=relaxed/simple;
	bh=pbMTkbc2uWOYqfZia0bGJv8VpTPeBUPhh8aziMk1SXU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EzQJv/DYwV3T0oDqVofO9kP0biwfkpIqlsv6RYxcEGtMEbgPfs6R0OvzVwx0Ds264MpbNXesNiS9GbNhAG9SOWqL15h2K6KnYQzg8KgRdTQgF5n94ZXXFtWcPGkVB7VweY8XayGbX3qaHXrqhu5ewNwbFiIvywfx8PLgnAshVuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/suR+Y6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/suR+Y6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95001F00A3A
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 10:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784284785;
	bh=HGZ0SPNoTOICIAhgjKSNFPXl6dtsqiCMGntOg8/CE4g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=B/suR+Y6HMoVh9Uh+HPit8I1yFT/0b2KWW3qPBsjSUHIFqFpI1wmtjE4vdy/oPqcG
	 3ZKcWnGUfEgrdTYLdQhJ7/h3LJxwXfqpwjJR7yZlguNvNrTlJSPOP0xSmYDHZqSuem
	 dBbcvG1h47YVTOekHMhcrHzNCzWaPdZsPEkz2xISLOVvunG6WA1y1uWcFKBqzApThs
	 oe28iWVHtpI+HD1dSk0uM00bNJWjsDNI8+k/lqoWR5zwnBAUJKGflNQZMoRJx3ngr5
	 c5T+ppEN9Pf0Shlm1QehZXXlwkV6Fv8hCelMg0uuJ4Yv7vpirPGkFq4ACX6DrCkGhU
	 XQDyWOq3ctNmw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c8e65e3f5so68490531fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 03:39:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoOu0L4133iUSMt41Keb5sAmp02dPVYiLPyeW+mmIupFKfg1en5e1xcxYCKCpOKtsbgPTkbFlPiRSZ5@vger.kernel.org
X-Gm-Message-State: AOJu0YyRVtO2XIm7lpfzpmlLsovVaY/6O/4+c64LOsCbJjRmj4mQdjBI
	HKDUJpO/mpWFw5yqPn6uqEVAkcLYiQHHMdqXhfUE/EkeIiR1Kz6QC9ptfoF4ay5RITGy95FX3Hl
	Mk9o71G2t/HjMWw+lqTGwRh4rYB3122Aor/2/Cyr4DQ==
X-Received: by 2002:a05:651c:438a:20b0:39a:e29b:9a1c with SMTP id
 38308e7fff4ca-39eb28c10f3mr3422921fa.32.1784284784491; Fri, 17 Jul 2026
 03:39:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jul 2026 03:39:42 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jul 2026 03:39:42 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <3d6b8d6ab53aadef56e68c925030dd3b@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710183439.996923-1-adilov@disroot.org> <20260710183439.996923-3-adilov@disroot.org>
 <CAMRc=MddZxoi_=QCFYp1PM8OwsWbz-Tsmoa7TMkQ1bh+qf-pdA@mail.gmail.com> <3d6b8d6ab53aadef56e68c925030dd3b@disroot.org>
Date: Fri, 17 Jul 2026 03:39:42 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeKB-rH35Jw0Z7vKVuk9=d3M0x5a-LJwgim3fuUW26xWQ@mail.gmail.com>
X-Gm-Features: AUfX_mwwSFMQVdKALHYwfgJpq2RntqlCtpSoQ18F86gAvBpMLTH_oo3BwkLbA9Y
Message-ID: <CAMRc=MeKB-rH35Jw0Z7vKVuk9=d3M0x5a-LJwgim3fuUW26xWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: realtek-otto: decide bank_read/write by device endianness
To: Rustam Adilov <adilov@disroot.org>
Cc: Linus Walleij <linusw@kernel.org>, Sander Vanheule <sander@svanheule.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 21:00:45 +0200, Rustam Adilov <adilov@disroot.org> said:
> Hello,
> On 2026-07-15 09:39, Bartosz Golaszewski wrote:
>> On Fri, 10 Jul 2026 20:34:39 +0200, Rustam Adilov <adilov@disroot.org> said:
>>> In order to have a working gpio controller with SWAP_IO_SPACE,
>>> the way bank_read and bank_write are defined must be changed and
>>> separated from GPIO_PORTS_REVERSED flag. That also includes the
>>> flags parameter used by gpio_generic_chip_config.
>>>
>>> To achieve it, use the device_is_big_endian() to decide the
>>> bank_read/write parameter and the flag.
>>>
>>> Signed-off-by: Rustam Adilov <adilov@disroot.org>
>>> ---
>>>  drivers/gpio/gpio-realtek-otto.c | 15 +++++++++------
>>>  1 file changed, 9 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
>>> index 491fde846d46..f96072fbce92 100644
>>> --- a/drivers/gpio/gpio-realtek-otto.c
>>> +++ b/drivers/gpio/gpio-realtek-otto.c
>>> @@ -393,16 +393,19 @@ static int realtek_gpio_probe(struct platform_device *pdev)
>>>
>>>  	raw_spin_lock_init(&ctrl->lock);
>>>
>>> -	if (dev_flags & GPIO_PORTS_REVERSED) {
>>> -		gen_gc_flags = 0;
>>> -		ctrl->bank_read = realtek_gpio_bank_read;
>>> -		ctrl->bank_write = realtek_gpio_bank_write;
>>> +	if (dev_flags & GPIO_PORTS_REVERSED)
>>>  		ctrl->line_imr_pos = realtek_gpio_line_imr_pos;
>>> -	} else {
>>> +	else
>>> +		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
>>> +
>>> +	if (device_is_big_endian(dev)) {
>>>  		gen_gc_flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
>>>  		ctrl->bank_read = realtek_gpio_bank_read_swapped;
>>>  		ctrl->bank_write = realtek_gpio_bank_write_swapped;
>>> -		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
>>> +	} else {
>>> +		gen_gc_flags = 0;
>>> +		ctrl->bank_read = realtek_gpio_bank_read;
>>> +		ctrl->bank_write = realtek_gpio_bank_write;
>>>  	}
>>>
>>>  	config = (struct gpio_generic_chip_config) {
>>> --
>>> 2.55.0
>>>
>>>
>>
>> Can you look at the sashiko report? I think it's right about this change
>> possibly breaking existing devicetrees. Can we keep big-endian as the
>> default?
>>
>> Bart
>
> Oh i didn't know sashiko was looking after this subsystem too.
> But yes, it does require the rtl8380-gpio, rtl8390-gpio, rtl9310-gpio
> to append big-endian or native-endian (as they are all big endian chips).
>
> I was thinking earlier whatever it is appropriate to make changes to
> the arch/mips/boot/dts/realtek in this commit because it is different
> subsystem entirely but i guess this (previous sentence) answers the
> question, doesn't it.
>

That's irrelevant as there may be devicetrees out in the wild and we can't
just break them.

> Also, what exactly do you mean by "Can we keep big-endian as the
> default?" ? My only reading off is to change the if statement
> so that the big endian flag and the _swapped functions to be
> under the else part, is it correct?
>

Yes, just retain the original default behavior.

Bart
