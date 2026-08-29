Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2336032B113;
	Sat, 29 Aug 2026 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787988681; cv=none; b=fzRdYxhjQMFbi4np04ov/E4j2KZxvXQZOQ2zmypzWWni2Qicve8g16R2B0axVeLhFfAj6NH9srypxa1nRYAmvJLj9eqbvTk3I4JhmVYSJ0i1FxPVEnfXBHM8YtSk8ozvA7F2ewkOQpkslQ8wpHETneElkQwNt3gyKfhUa8mEqIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787988681; c=relaxed/simple;
	bh=fNTrb6LPmvQ0t01dL5McVgmHaTeiaCCOvvCwdeobtOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWz5qmylsxFl7CF3Tf+4FVtjv6mkR3xJOGDFWsHv8VhM2VJ8KA4rDceo3rkmknrK8cHLTul7l/YbpHb47hFety4iWbrTurKabPrfQw2fyAYqPdbbCHVoQfIzTse+ArnCRxd+V5XiRfvPxUpVDfE8FJ0dde40/sApIfNsvnvesGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBV3YhXO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBV3YhXO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36AB1F000E9;
	Sat, 29 Aug 2026 07:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787988679;
	bh=NfubPM6UMo/IG6FaMOOEgle+rUB5+JQcFLVJFPtH9ZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iBV3YhXOUrioxddD2+5BsxZ85uor5LFZs2irnpSTbtMOJ2PD615qO2QtpacVozRo3
	 q0KLtI0q3NINJOiWyqecCJCL+P/k9vKLNEqUi+zU/pbedcyj4h8PSbx+ttg9amiz2P
	 aSnog2NI3YOJNwQa+sgz/+Lsq5/CcF/povHf1nQNq+FP70K/2BK/nYrG4e1bi0C8zw
	 UnQW/JYI2WIUGQq5rW3ziNE7lQNltyl5tc8AUe5gYHcMQ4sWlnnrm3J7oo0CQiZpUm
	 9VlL7h64x7D37+VvmSWDFirmN89v+yCWiQZTalcOsqZI8Wi/nIYlQKTnl1urHFXIfd
	 zYZC6txPx61og==
Message-ID: <bd23268f-dee6-43a0-9f8a-51ae8a272082@kernel.org>
Date: Sat, 29 Aug 2026 09:31:10 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Bartosz Golaszewski <brgl@kernel.org>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
 <178634991918.1014951.7989635238440361454.robh@kernel.org>
 <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260810144012.GA1574021-robh@kernel.org>
 <ZQ4PR01MB12020D2031C400FF805791B7F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ZQ4PR01MB120275B9C0CF6BCE8C88261CF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260814-shapeless-onyx-pronghorn-d423a9@quoll>
 <ZQ4PR01MB12022F6D6F71542033CF857BF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <CAD++jL=Q38HwraN1NEOxLf_hE+k=3Q6JP+DUgQsThfYve0t0RA@mail.gmail.com>
 <20260817134715.GA18207-robh@kernel.org>
 <ZQ4PR01MB1202CB0BB258ED52179F3DF4F2AB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <ZQ4PR01MB1202CB0BB258ED52179F3DF4F2AB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/08/2026 05:08, Changhuang Liang wrote:
> Hi, Rob, Krzysztof, Conor
> 
>> On Mon, Aug 17, 2026 at 02:45:22PM +0200, Linus Walleij wrote:
>>> On Fri, Aug 14, 2026 at 1:22 PM Changhuang Liang
>>> <changhuang.liang@starfivetech.com> wrote:
>>>
>>>>> You still did not explain the cells - neither in reply nor in
>>>>> commit - thus start with that. Why do you need it? Multiple
>>>>> controllers have groupped pins or GPIOs in registers, so explanation
>> "every 32 GPIOs correspond to one register"
>>>>> tells me nothing. Why would that matter how many GPIOs is in one
>> register?
>>>>
>>>> Since every 32 GPIOs correspond to one register, Linus suggested at the
>> time that I could try using:
>>>> gpios = <&gpio [instance] offset flags>; gpio-ranges = <&pinctrl
>>>> [gpio_instance] gpio_offset pin_offset count>;
>>>>
>>>> The advantage of using this is that in a GPIO controller with more
>>>> than 32 GPIOs, every 32 GPIOs can be treated as one GPIO bank. This
>>>> way, in the driver, converting pin_offset to gpio_offset does not require a
>> large number of /32 and %32 operations.
>>>>
>>>> the following is Linus's original suggestion at the time
>>>>
>> https://lore.kernel.org/all/CAD++jL=tvDBWJHRGGJw4nnox_kcJKn5hwvwz9zx
>>>> adMRedyvRhw@mail.gmail.com/
>>>
>>> Just copy this explanation into the commit so it is clear why you need
>>> three cells for this.
>>
>> "Can use gpiolib" is not really justification. Neither is avoiding a shift and/or
>> mask. I suppose there's some h/w attribute here to justify it?
> 
> I'll go ahead and send out a new version per Linus's suggestion. In the meantime, 
> if anyone has any additional thoughts or further feedback, I'd be more than happy 
> to incorporate them. Please don't hesitate to let me know!

You got feedback... having things organized per registers does not make
them a bank.

Best regards,
Krzysztof
