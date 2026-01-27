Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014512E2852
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507269; cv=none; b=BMy6IeFM71byGXldtz6NM/4VlzlFhuoLiaZTFELtTZvOHc8XWJTesh8ULMFR6lt1meQMDknWIYRpy2D+NscpQNiB4SPoHLBMKeZMbuWGmetUttXWFNSMrjD7WkR1UYL+wzR5J9Nx6ETTsh1ugegWCv2fbSlh8s12fc2mzs3fQCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507269; c=relaxed/simple;
	bh=HeVmF5X3Z8OjUc5R0RzLvT9IdOt2BaA/r0GO4t6RaNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FItCTXHOVas8MCArwGt2adzdoi8/slbGjR/Fz6hsuIf/wR8DlRRwZqKggc6EbsMj3Tg/IlkVokcn3xG8LyzZ2WTpbu5LNtD5KT8spOTguv99bpg8Yi62Qf7UanD0iQFiQO34nLQfTG07cup/8Ag+uWnzk6oYmcEp2016gCgJUuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghY+VkMY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghY+VkMY"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fbc544b09so3944969f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769507266; x=1770112066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8JLdRq+wi1vFeuwJOX3HIei5iWGLJOqM9UIkpj0qjpQ=;
        b=ghY+VkMYDShE4BXcPAUUjFIz4Mpq8YuN9jTpkdIB/8Qx58nhlUkq7IkpgwY8l2tHSk
         ynlTWXOz+6teSLMfvnPIIQX7TrHL4SFS1w3vRO3OHFMC9ZMkNSsQlbxCs6RlHnYIXVHS
         Y2UpF/7DGFdohaa5a+52c8/7c3COPpygJku0DUYM/ufunnFzZK1Wc4/RO3P9UKcdTDFo
         Hefu4cMftbRaFV2L3sWmt7r3Z/TiJM5fR6t4OTVuesvDJ4bRBlTDTkMPur+snO/NdSQP
         NxPIHInTkmBcP88CKcRRjDhHgMClL2aSvcShLcceC1PL7U51irLFDRsvjLYrMmsxVnOW
         q+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769507266; x=1770112066;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JLdRq+wi1vFeuwJOX3HIei5iWGLJOqM9UIkpj0qjpQ=;
        b=mQ4lnEeBNPMMrQd+Pu7AlSV6WMkHGsSKCnKNw99qLUvwFQUkkzVs9mqjcbZFc2I4m6
         Et2TQgTYxdYR/aYJdI/6hGfmElC2ZIaSB5WaalaPaEzZvYDSc9Bw6qUa+HE6yfZ4palY
         bP74dsWKbB6Ji74gTwy889vQIXZoQMkJVQ+kFDVnuEQZUHUq8ve064pk7UozcKf2qIm/
         0qjg5+rGT16eo9Tc5iDOG6zYxLsxc1MeVl/c+3c1Uo5erBIMDt3xdCkB39mKU5jfgcUl
         fxsZFyFwMzR9yj+ssjVxKf7Z7oY4sVDZgPXqR55XLkSf8dIfmp5hds2XPpboQBl7eMxI
         i71w==
X-Forwarded-Encrypted: i=1; AJvYcCVBMAWZV3zavDFXFKP8cKzUBcZ8Tr5u7dliRAUvzagRVi8I3c3WTxdGQed9jVAeh4wlsjXry66ijKgn@vger.kernel.org
X-Gm-Message-State: AOJu0YyWyRSckNiCdBS+pX1wvD4IzBdM3MR/ASlkQ1DacLQGcewkJR2x
	1BNSV5lD50Odq3ln3kDZOiEjg+cpvPmEnZMnAmM81E0LKZqMeWuuUwZT
X-Gm-Gg: AZuq6aKhUROlk2JSxQC74jJDRzJvxSOOTyMCq/mmtKat9gqjMCoca2TQ8fUm5Wyruac
	w+ohhZVk1ZCkyNBgxcZ8QnWmwh5/JpclcRCXJyz3f3eSnd0SuZwBb2rNqg94cqSoooeqLapx0fv
	6j71iCBDcRh1ci7dO36D1CSgZoh+B3IaxsY9uuQTo2Dj+skFagrwdiH6UfaDJy0powrQWyjdSiD
	o7FsWOvNVJFnrPxm43hhqNNC/QFpuLhKn4XibpcT6UqpV7+ARThFRClKMnUHQIwq0uBBtq4+UGz
	Yd/9RBtHZRaW00BKZtolkumJicHzqMHv5Sjb2rD+HoTTyahKaKiLwzFUwOAeY31N98vjvTHABSg
	6/gmHZ9Ed/0hWr72Km/Fce4W0vhMKMTpzoAg57cxdINslXMPAo/6l+kzq3VLu8bqX11ZXMqMP0s
	AhKDGc3fhBkyQpGbDd5aVsWOd86l+ivSAiV4NT7wgaQn2IWoh1gpVg2IgVGK/PKKj+H7wh4orC4
	f5uZkeWmCIZBuys3Lc=
X-Received: by 2002:a05:6000:310f:b0:435:9ea8:8b83 with SMTP id ffacd0b85a97d-435dd074b85mr1528570f8f.19.1769507266174;
        Tue, 27 Jan 2026 01:47:46 -0800 (PST)
Received: from [10.0.0.128] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bedsm35462739f8f.17.2026.01.27.01.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 01:47:45 -0800 (PST)
Message-ID: <7d3edca3-7369-491c-8746-ba24cdd465bb@gmail.com>
Date: Tue, 27 Jan 2026 10:47:45 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: pca953x: mask interrupts in irq shutdown
To: Linus Walleij <linusw@kernel.org>,
 Martin Larsson <martin.larsson@actia.se>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michael Roth <mail@mroth.net>, Francesco Lavra <flavra@baylibre.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Maria Garcia <mariagarcia7293@gmail.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
References: <20260121125631.2758346-1-martin.larsson@actia.se>
 <CAD++jLmOjdiDfLPqAA+6SmK2mfddh6O2YoPD10gkBbo=dCOf9Q@mail.gmail.com>
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Content-Language: en-US
In-Reply-To: <CAD++jLmOjdiDfLPqAA+6SmK2mfddh6O2YoPD10gkBbo=dCOf9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 27/01/2026 10:29, Linus Walleij wrote:
> Add a few recent developers to CC, this is a very widely used GPIO chip.
> 
> Emanuele was dealing with IRQ storms and may want to look at this.
> 
> On Wed, Jan 21, 2026 at 2:12 PM Martin Larsson <martin.larsson@actia.se> wrote:
> 
>> In the existing implementation irq_shutdown does not mask the interrupts
>> in hardware. This can cause spurious interrupts from the IO expander.
>> Add masking to irq_shutdown to prevent spurious interrupts.
>>
>> Signed-off-by: Martin Larsson <martin.larsson@actia.se>
>> ---
>>  drivers/gpio/gpio-pca953x.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
>> index 8727ae54bc57..f93a3dbb2daa 100644
>> --- a/drivers/gpio/gpio-pca953x.c
>> +++ b/drivers/gpio/gpio-pca953x.c
>> @@ -914,6 +914,8 @@ static void pca953x_irq_shutdown(struct irq_data *d)
>>         clear_bit(hwirq, chip->irq_trig_fall);
>>         clear_bit(hwirq, chip->irq_trig_level_low);
>>         clear_bit(hwirq, chip->irq_trig_level_high);
>> +
>> +       pca953x_irq_mask(d);
> 
> It makes sense to me.
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Yours,
> Linus Walleij

Looks good to me, thanks.

Emanuele

