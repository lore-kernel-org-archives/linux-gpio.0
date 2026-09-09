Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47131F16B;
	Wed,  9 Sep 2026 01:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788917653; cv=none; b=gGyJhlNU1mGk8+xtgZa74T0TAZMv/GlRrJWOM/Avp/jUFLjdBz2Kwp6eYOlj8ZChRsHApPH3PEeHqX8h3IuiRQ+UMHfhsayrdEptd95aeqJCyAnyEYeWehNR6/RBydkUxJZlygcyVnBf8QVj37gzVw7Erv7wTiinmeJCVLkbc3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788917653; c=relaxed/simple;
	bh=CDyJE+i4OPH6iK3meqPlGPohZHESDSzKomzHmRhnOrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ohQlnf1zVJxaubKoIvNLYTbaGYPKYL6Btbon7c4Vp/FrwkSoIG9ZJI7hwFpwStndag9lz/ynOlbSwGTrivMwTQb84MfUNl1mFNsmgizEdgTLFzIajoA3lXKo/HBGVUwPhWLDU+3ypFwP+A4nkf6YCO1qU04jrBBXvclfzn6DSCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kVkLwsrt; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kVkLwsrt"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hfjyR4Fktz8sYY;
	Wed, 09 Sep 2026 03:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788917647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oen7SxWNOkmw/Mne5KXubQLU0+t6pswvJ0mbFH3FjXI=;
	b=kVkLwsrtVcuv40zNmEdd5H5zsiLOD3NN6ZAloLFXardIVlO2zHu2Kuhr0YhzzXLRWfkzCu
	QH5r2zzXogHhrXtu3hITjGjiN8J+q2OQhxnD/CuOHy4mXm9ZgqtV92duyr64YEqAt6OjdZ
	Wx2bLNQryJXIDPKFY/4koYFqopsxvlX7q4YlTDhTKaTpfmhoTxlq5OQgUOGvkUVmfB6niy
	63obYlD99tGMPHN9lFL2hf4DLOpvRlXVXnyU8dcoqq+uNIA4+n36laysgcFmB3Crk9Fl5O
	0ywm5Ej9Bja10gL3StuRnQzQvH6OOEKqBvAbAsAnXy1FSQ6PfTbJ6k0rLhG7OQ==
Message-ID: <b837e41d-ba6f-40bf-89db-b62ccd2be467@mailbox.org>
Date: Wed, 9 Sep 2026 03:34:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
 <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org>
 <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
 <43eccc85-fca3-4c69-9114-b45ab5e1b487@mailbox.org>
 <CAMuHMdVWm1JzmXx1++dhvHbnBbVqQnVVAANfmH5Y24bhJU7pXQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVWm1JzmXx1++dhvHbnBbVqQnVVAANfmH5Y24bhJU7pXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 7afcf83a0758599f27a
X-MBO-RS-META: krtuwrze3fxqgftse3541gjj53gurcio

On 9/8/26 9:49 AM, Geert Uytterhoeven wrote:

Hello Geert,

>>>> On 9/4/26 1:15 PM, Geert Uytterhoeven wrote:
>>>>>> +++ b/drivers/gpio/gpio-rcar.c
>>>>>
>>>>>> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
>>>>>>
>>>>>>     #define RCAR_MAX_GPIO_PER_BANK         32
>>>>>>
>>>>>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
>>>>>
>>>>> IMO passing a pointer to offs complicates the code.  Perhaps pass offs
>>>>> by value, and return the adjusted offset or a negative error code?
>>>>
>>>> I want to avoid that, since if I only return error value, I can then do
>>>> simple:
>>>>
>>>> ret = gpio_rcar_remap_offset(...);
>>>> if (ret)
>>>>      return ret;
>>>>
>>>> in gpio_rcar_read() and gpio_rcar_write(), which are the only two call
>>>> sites of this function.
>>>
>>> gpio_rcar_read() and gpio_rcar_write() do not return error codes.
>>> I was thinking of
>>>
>>>       offs = gpio_rcar_remap_offset(p, offs);
>>>       if (offs < 0)
>>>               return 0;
>>>
>>> which is almost the same, but avoids passing offs by address.
>>
>> Is there any benefit to it, compared to keeping the value and return
>> code separate ?
> 
> Naive me (I am not a compiler writer) thinks the compiler may have a
> harder time to optimize the code when addresses are involved.

Will the compiler generate code that is worse in the end ?

>>>>>> +{
>>>>>> +       /* R-Car Gen4 and older do not need any offset remap. */
>>>>>> +       if (!p->info.has_layout_gen5)
>>>>>> +               return 0;
>>>>>> +
>>>>>> +       /*
>>>>>> +        * R-Car Gen5 register layout is slightly different and the offsets
>>>>>> +        * that have to be added to or subtracted from each register offset
>>>>>> +        * can be divided into five groups, listed below.
>>>>>> +        */
>>>>>> +       switch (*offs) {
>>>>>> +       case IOINTSEL...OUTDT:
>>>>>> +               return 0;
>>>>>> +       case INDT:
>>>>>> +               *offs += 0x10;
>>>>>> +               return 0;
>>>>>> +       case INTDT...EDGLEVEL:
>>>>>> +               fallthrough;
>>>>>> +       case BOTHEDGE:
>>>>>> +               *offs += 0x70;
>>>>>> +               return 0;
>>>>>> +       case OUTDTSEL:
>>>>>> +               *offs -= 0x34;
>>>>>> +               return 0;
>>>>>> +       case INEN:
>>>>>> +               *offs -= 0x38;
>>>>>> +               return 0;
>>>>>> +       default:
>>>>>> +               /*
>>>>>> +                * This here must never be reached, if this is reached, that
>>>>>> +                * means there is a catastrophic failure in the driver. Skip
>>>>>> +                * any IO read/write to prevent further damage.
>>>>>> +                */
>>>>>> +               WARN_ON(1);
>>>>>
>>>>> A build-time failure would be better.  I tried BUILD_BUG() instead,
>>>>> but unfortunately gcc is not smart enough to notice this case is
>>>>> never reached.  __always_inline doesn't seem to help either.
>>>> I had one more idea -- how about we convert the driver to mmio regmap,
>>>> use opaque register numbers throughout the driver to identify registers
>>>> to the regmap (maybe not a great idea), and then implement .read/.write
>>>> callbacks in the regmap_config which instead of doing plain
>>>> readl()/writel() for register IO would instead do this remapping ?
>>>> Regmap could validate that the opaque register numbers are only the
>>>> expected register numbers and reject all the others. Maybe the opaque
>>>> register numbers could instead of Gen4 register offsets. What do you think ?
>>>
>>> That's similar (but more complex?) than the array look-up
>>> in drivers/tty/serial/sh-sci.c I pointed to before.
>>> drivers/i2c/busses/i2c-riic.c uses the same method.
>>
>> Those do not use regmap (drivers/base/regmap/), do they ?
> 
> No they don't.

What about my regmap suggestion ?

>>> I.e. just convert the existing register defines into an enum, and use
>>> that to index a table with the family-specific offsets?
>>
>> Are we back to the table look up discussion instead of remap function ?
> 
> Yes, I think that's the simplest and best-performing solution

The performance benefit of the table look up was never confirmed.

> : one
> extra table look-up (array indexing) in gpio_rcar_{read,write}(),
> compared to an extra function call to gpio_rcar_remap_offset().

The function is inlined by the compiler. The table look up will likely 
suffer due to non-locality of the data in cache.

> As a bonus, storing -1 for a non-existing register in the look-up table
> would let us get rid of the four existing .has_<reg> booleans, e.g.
> 
>     -        if (p->info.has_both_edge_trigger)
>     +        if (p->info.regs[BOTHEDGE] >= 0)
>                      gpio_rcar_modify_bit(p, BOTHEDGE, hwirq, both);
Please see the actual-regmap suggestion I proposed above, that solves 
this problem too, without mixing signed and unsigned types.
