Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11035111BB;
	Mon,  7 Sep 2026 16:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799042; cv=none; b=XwI2WmFrTn9661LPMKxKbrRgnXiGHCC5u9kVRQ1P/ysqfCLePz2V18UgpK1fWWQBI3PNZ3h+Cx2nLjB0hcn1LczEyW5H9+6d3J3ioSOUv/fbiP+ibBHkaloqL1AKUo/NUWHEe+Rf2yzynks8HCUTTjeY6IxqSH43MgCKFRK+skg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799042; c=relaxed/simple;
	bh=6kqG/e8sZ87b3BUCGf+yCqlrnhgTSJ8M1EMSPkDdTJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eA28dujFm0YtcgBGMKRz6QDmRcmcNCb7mOjzF/M85CEkhdwARQxK4/qD4PgwG/jvOcuGPdJZnb8U9RU42VE7jWErI7dgA2RgSElcXrASDkFM02ZzGpsDAbVXIBfiEGVyjr/nj+wugfd84i95rIBNi0aH204Z/rR0X/l9AFQ65eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Td/9gobw; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Td/9gobw"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hdt5T0XthzKmTV;
	Mon, 07 Sep 2026 18:37:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788799037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EO2GKXusc5sJejI+vtQwq/vqi5rB/tLAfP5uzYmGrL8=;
	b=Td/9gobwv6CFZZM8fnbBTlzl1SJ2o4g/OmrIYyUCE7iPYA+QlEDkNRlT/3kmRxnghKAPCa
	/R6/IrBfwSf00CnFzkLo6BlYAm4lF4dXeYam8+yj8KRylKtPmZOoy1DruPySvgNof1SKSt
	E/MSu7pS7LebbVPjfObmd/AfbTDiIl163bGNcr5lF67Y9gyBq2NLRbl/y1arZzEVVQOT9Z
	yWQGtPmMnt2l9ZzM9PzcE2THBEFwkqeajRej7Y1HljEfhadlWTEr9YeCw5QWzvlMnqyVUl
	ByBjMG7WSToyk0Q8KeugfMvUUnw9uVFWw0P7HUQtwgf8gaCdVLpIgXj7l3/QiA==
Message-ID: <43eccc85-fca3-4c69-9114-b45ab5e1b487@mailbox.org>
Date: Mon, 7 Sep 2026 14:10:21 +0200
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: gg7w3pappfq9efwgsh1jjfzqp1dzfhbp
X-MBO-RS-ID: cb48dd79e9fccc77b24

On 9/7/26 9:53 AM, Geert Uytterhoeven wrote:

Hello Geert,

> On Sat, 5 Sept 2026 at 23:57, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 9/4/26 1:15 PM, Geert Uytterhoeven wrote:
>>>> +++ b/drivers/gpio/gpio-rcar.c
>>>
>>>> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
>>>>
>>>>    #define RCAR_MAX_GPIO_PER_BANK         32
>>>>
>>>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
>>>
>>> IMO passing a pointer to offs complicates the code.  Perhaps pass offs
>>> by value, and return the adjusted offset or a negative error code?
>>
>> I want to avoid that, since if I only return error value, I can then do
>> simple:
>>
>> ret = gpio_rcar_remap_offset(...);
>> if (ret)
>>     return ret;
>>
>> in gpio_rcar_read() and gpio_rcar_write(), which are the only two call
>> sites of this function.
> 
> gpio_rcar_read() and gpio_rcar_write() do not return error codes.
> I was thinking of
> 
>      offs = gpio_rcar_remap_offset(p, offs);
>      if (offs < 0)
>              return 0;
> 
> which is almost the same, but avoids passing offs by address.

Is there any benefit to it, compared to keeping the value and return 
code separate ?

>>>> +{
>>>> +       /* R-Car Gen4 and older do not need any offset remap. */
>>>> +       if (!p->info.has_layout_gen5)
>>>> +               return 0;
>>>> +
>>>> +       /*
>>>> +        * R-Car Gen5 register layout is slightly different and the offsets
>>>> +        * that have to be added to or subtracted from each register offset
>>>> +        * can be divided into five groups, listed below.
>>>> +        */
>>>> +       switch (*offs) {
>>>> +       case IOINTSEL...OUTDT:
>>>> +               return 0;
>>>> +       case INDT:
>>>> +               *offs += 0x10;
>>>> +               return 0;
>>>> +       case INTDT...EDGLEVEL:
>>>> +               fallthrough;
>>>> +       case BOTHEDGE:
>>>> +               *offs += 0x70;
>>>> +               return 0;
>>>> +       case OUTDTSEL:
>>>> +               *offs -= 0x34;
>>>> +               return 0;
>>>> +       case INEN:
>>>> +               *offs -= 0x38;
>>>> +               return 0;
>>>> +       default:
>>>> +               /*
>>>> +                * This here must never be reached, if this is reached, that
>>>> +                * means there is a catastrophic failure in the driver. Skip
>>>> +                * any IO read/write to prevent further damage.
>>>> +                */
>>>> +               WARN_ON(1);
>>>
>>> A build-time failure would be better.  I tried BUILD_BUG() instead,
>>> but unfortunately gcc is not smart enough to notice this case is
>>> never reached.  __always_inline doesn't seem to help either.
>> I had one more idea -- how about we convert the driver to mmio regmap,
>> use opaque register numbers throughout the driver to identify registers
>> to the regmap (maybe not a great idea), and then implement .read/.write
>> callbacks in the regmap_config which instead of doing plain
>> readl()/writel() for register IO would instead do this remapping ?
>> Regmap could validate that the opaque register numbers are only the
>> expected register numbers and reject all the others. Maybe the opaque
>> register numbers could instead of Gen4 register offsets. What do you think ?
> 
> That's similar (but more complex?) than the array look-up
> in drivers/tty/serial/sh-sci.c I pointed to before.
> drivers/i2c/busses/i2c-riic.c uses the same method.

Those do not use regmap (drivers/base/regmap/), do they ?

> I.e. just convert the existing register defines into an enum, and use
> that to index a table with the family-specific offsets?
Are we back to the table look up discussion instead of remap function ?
