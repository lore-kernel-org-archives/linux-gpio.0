Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D530534DCE0
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 14:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556044; cv=none; b=PaHaS3vGT6hndedrb4mRpA+t9SZw2UBQBqFOp1Uf979lgtIOEsYEfD798UJfBlCbXV6yLAlTuHK2SVlVP1Wr3eDB07SeyXKff+4DD8jF7yrXr3TdWAfJIKUeJlb7nWxkxstv8aEqtkjXX2Mj5jvbc5umyPpo3GoaIWSd+qCz0S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556044; c=relaxed/simple;
	bh=3hl70xUiwlqoqAP+LQrWDbHD5OO5ikke1mIBKgo084M=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJsxkecSSh9P0clv6c/houuj4+Ev8gcVP9zTlZaw4XTJJ/OHap4JH0kLyq0LhZFX1toi851Ris6xlmP8WwWB8EhONDiAFvpXv1zAjafPDYNXPJVvhEt6Tzjbb2WTX8Aq3LxoRPVH9lnFo1zKQwZbH+sX1uIYzQzqUXV0IhWWFwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHyG53ue; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHyG53ue"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888A71F000E9
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784556042;
	bh=PsTWikTtRDt5GcemR6ONSNO7lWHcGKg/zeNYCLWPl/8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=VHyG53ueUOJkP2XOICOijM9NhtHef8LWq7zd45q9JVMSlLDRJ7ygz+3aqiuJwRf3O
	 2NqWQLrldSu7sjYWhpxOelKwiX6djdfud455SUhuBxg2oIEdK6NN1se1ED7pl9LVvC
	 w4vZOOckv+x11gkzPUvOvMVRV49CQA0A416kYwa43W6noweZESqh7AeczelCK/Sub2
	 mZ5YWzCt6hl1tVhC/+cPURQHh5fybx08fEG5zxLuftezx819PH0ZxhPEV0xdRl4wpV
	 Ca1teP2qFfZNf+ZdiZ2E1Df/S9bFOzDIkacQMmne2r9HVu3be9ulJpR/pkx4OUfpYz
	 XfstCsA0Js86g==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so8847134e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 07:00:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpnCU/qA+5SBgQYyc/HHD5L/BsGSgKLcBvZeewEGyoPKYyLs4D/JpcA0i3UXjV8nup8YUu7qh0oiwln@vger.kernel.org
X-Gm-Message-State: AOJu0YzarwWj2phouOQhtylgKr3JMZmwWYjFv3EBim/MmvN7bzP63jlh
	sS5a0KyMIvRcePNqLmTMU2QNPv82hGVn5LFIQ8yAqxQ2IJXp7R9J9oztv022yUAHbxgp9bSlfjg
	0+7MsRYTIt/dMtNu63ZqFyKluy+FOLRB9ka47LLbLMg==
X-Received: by 2002:a05:6512:61d3:20b0:5ae:b135:64de with SMTP id
 2adb3069b0e04-5b28f9ac22amr2255666e87.31.1784556041206; Mon, 20 Jul 2026
 07:00:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 10:00:39 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 10:00:39 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ba21d405fd51a7dccd9ca5eacc0385bf@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710183439.996923-1-adilov@disroot.org> <20260710183439.996923-3-adilov@disroot.org>
 <CAMRc=MddZxoi_=QCFYp1PM8OwsWbz-Tsmoa7TMkQ1bh+qf-pdA@mail.gmail.com>
 <3d6b8d6ab53aadef56e68c925030dd3b@disroot.org> <CAMRc=MeKB-rH35Jw0Z7vKVuk9=d3M0x5a-LJwgim3fuUW26xWQ@mail.gmail.com>
 <ba21d405fd51a7dccd9ca5eacc0385bf@disroot.org>
Date: Mon, 20 Jul 2026 10:00:39 -0400
X-Gmail-Original-Message-ID: <CAMRc=McQnKRLXh6898gdSHnWnBC8vhM2kdoKgganj+ptVUyU2w@mail.gmail.com>
X-Gm-Features: AUfX_mwvJHnZfQIlqVxlPeVnDrQmJHcCvTQEdaQk_CoU1pVs50mb7IV__2s9uww
Message-ID: <CAMRc=McQnKRLXh6898gdSHnWnBC8vhM2kdoKgganj+ptVUyU2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: realtek-otto: decide bank_read/write by device endianness
To: Rustam Adilov <adilov@disroot.org>
Cc: Linus Walleij <linusw@kernel.org>, Sander Vanheule <sander@svanheule.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 Jul 2026 06:17:01 +0200, Rustam Adilov <adilov@disroot.org> said:
> On 2026-07-17 10:39, Bartosz Golaszewski wrote:
>> On Wed, 15 Jul 2026 21:00:45 +0200, Rustam Adilov <adilov@disroot.org> said:
>>> Hello,
>>> On 2026-07-15 09:39, Bartosz Golaszewski wrote:
>>>> On Fri, 10 Jul 2026 20:34:39 +0200, Rustam Adilov <adilov@disroot.org> said:
>>>>> In order to have a working gpio controller with SWAP_IO_SPACE,
>>>>> the way bank_read and bank_write are defined must be changed and
>>>>> separated from GPIO_PORTS_REVERSED flag. That also includes the
>>>>> flags parameter used by gpio_generic_chip_config.
>>>>>
>>>>> To achieve it, use the device_is_big_endian() to decide the
>>>>> bank_read/write parameter and the flag.
>>>>>
>>>>> Signed-off-by: Rustam Adilov <adilov@disroot.org>
>>>>> ---
>>>>>  drivers/gpio/gpio-realtek-otto.c | 15 +++++++++------
>>>>>  1 file changed, 9 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
>>>>> index 491fde846d46..f96072fbce92 100644
>>>>> --- a/drivers/gpio/gpio-realtek-otto.c
>>>>> +++ b/drivers/gpio/gpio-realtek-otto.c
>>>>> @@ -393,16 +393,19 @@ static int realtek_gpio_probe(struct platform_device *pdev)
>>>>>
>>>>>  	raw_spin_lock_init(&ctrl->lock);
>>>>>
>>>>> -	if (dev_flags & GPIO_PORTS_REVERSED) {
>>>>> -		gen_gc_flags = 0;
>>>>> -		ctrl->bank_read = realtek_gpio_bank_read;
>>>>> -		ctrl->bank_write = realtek_gpio_bank_write;
>>>>> +	if (dev_flags & GPIO_PORTS_REVERSED)
>>>>>  		ctrl->line_imr_pos = realtek_gpio_line_imr_pos;
>>>>> -	} else {
>>>>> +	else
>>>>> +		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
>>>>> +
>>>>> +	if (device_is_big_endian(dev)) {
>>>>>  		gen_gc_flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
>>>>>  		ctrl->bank_read = realtek_gpio_bank_read_swapped;
>>>>>  		ctrl->bank_write = realtek_gpio_bank_write_swapped;
>>>>> -		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
>>>>> +	} else {
>>>>> +		gen_gc_flags = 0;
>>>>> +		ctrl->bank_read = realtek_gpio_bank_read;
>>>>> +		ctrl->bank_write = realtek_gpio_bank_write;
>>>>>  	}
>>>>>
>>>>>  	config = (struct gpio_generic_chip_config) {
>>>>> --
>>>>> 2.55.0
>>>>>
>>>>>
>>>>
>>>> Can you look at the sashiko report? I think it's right about this change
>>>> possibly breaking existing devicetrees. Can we keep big-endian as the
>>>> default?
>>>>
>>>> Bart
>>>
>>> Oh i didn't know sashiko was looking after this subsystem too.
>>> But yes, it does require the rtl8380-gpio, rtl8390-gpio, rtl9310-gpio
>>> to append big-endian or native-endian (as they are all big endian chips).
>>>
>>> I was thinking earlier whatever it is appropriate to make changes to
>>> the arch/mips/boot/dts/realtek in this commit because it is different
>>> subsystem entirely but i guess this (previous sentence) answers the
>>> question, doesn't it.
>>>
>>
>> That's irrelevant as there may be devicetrees out in the wild and we can't
>> just break them.
>
> So, what is the solution then? Cause relying on device tree property the
> driver did not rely on before would break stuff, though realistically it
> is only relevant to OpenWrt and here. If we instead just create a flag
> in the driver like PORTS_REVERSED, then we would have to patch it again
> when SWAP_IO_SPACE is selected in the future and that is more hassle than
> simply changing device tree property. Unless i am missing something, these
> are the only possible ways of going about it that i can think of.
>

I don't know the details of this use case. In general: devicetree support is
considered stable ABI. If a driver ever supported a certain property in any
release it must do so indefinitely. Any changes you propose must retain the
same behavior for existing users - even if they are missing certain DT flags,
even if they're out of tree. We don't care about breaking the code of
out-of-tree drivers but we *do* care about breaking out-of-tree devicetrees.

Bart
