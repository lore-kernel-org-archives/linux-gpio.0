Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E503A4539;
	Sun, 30 Aug 2026 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788079666; cv=none; b=ZRpSKcopaXkIXB00jDrqgDeSdCuBMTbb8EGmDXjfV5DgzTSc//37U2Ya7isnb2nvjfJXxBl5lX54/ADR0ytCMwEHMxdKGgJGRc3VlduUc5iuG0QeImtq3ows8VsEby0dcqmL69Ja5co26K1kYIYFBJeDGh2GJpDbvdV3OwE2Yz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788079666; c=relaxed/simple;
	bh=uW7fu6W9Gubo2sYUPqM1tbP4mBqdpHRvkKd6KfKxGwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JgcW/6Etc39aVLTkW3FeJLbrExde0Jv+HS6/m4BOK5hqco0F2klGUKxrNQP/afW9nFhHH3z5n/Pf97ZTADQJyNu2aHWtuGhfw9giFkdS6EbI5RKoqo2B/KJ6HE4a5Nx3JLQR0j6SUnDa/zrPzhFS7IBYPDrX8tBfYB5+A9ZGjHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEKm1/g5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEKm1/g5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CAF1F000E9;
	Sun, 30 Aug 2026 08:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788079664;
	bh=LJENKskEQv3MKqY8zMRQ2izaC+yM5Jm9QOzvft5xjHs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cEKm1/g5CHjTqpMn8efRaTQfRQKaNI+bH/CHScBgt+05gtBfb3al6qOIWGU8KWg8S
	 2UhXPl/2vhQAERwDtT+1XxFzyh8DVnoo9/EI8TiFrr2XJqzdm0LtBSNJXXR9H8cDS8
	 Wgkfch4NAOr5G6r4Ksf2vH2oMkNkuGP+t4ITNbElcph5DPnXXUzX7/mPXeefRc8Iws
	 S2WBeESBofTqhloPS8NP6bC9eTSrMu5EK0jJhmHRpO2Y/krmPsTOUsn4a9H1ZpV2xq
	 VHMBeFed5w3tbfImwqb7fMhJNhY4yGF3rTcweHXnpNITKiD9i+SP8BpOilR0XZ9wt4
	 ZlEquI/33m3Ow==
Message-ID: <08c6dad7-8b0d-4daf-908e-5af875306f0f@kernel.org>
Date: Sun, 30 Aug 2026 10:47:35 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
 <20260829025720.23915-4-changhuang.liang@starfivetech.com>
 <f474f659-8234-4dfb-85cc-06d2cc295107@kernel.org>
 <ZQ4PR01MB1202DDBD0436E8F580EB6575F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ac4c6b24-02c7-4dc3-89e4-45aa335255d3@kernel.org>
 <ZQ4PR01MB120205984FB23C0776BD0D0AF2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <ZQ4PR01MB120205984FB23C0776BD0D0AF2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2026 10:42, Changhuang Liang wrote:
> Hi, Krzysztof
> 
> Thanks for the review.
> 
>> On 30/08/2026 03:29, Changhuang Liang wrote:
>>> Hi, Krzysztof
>>>
>>> Thanks for the review.
>>>
>>>> On 29/08/2026 04:57, Changhuang Liang wrote:
>>>>> +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
>>>>> +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
>>>>> +
>>>>> +/* sys0 pad numbers */
>>>>> +#define PADNUM_SYS0_GPIO_A0				0
>>>>> +#define PADNUM_SYS0_GPIO_A1				1
>>>>> +#define PADNUM_SYS0_GPIO_A2				2
>>>>> +#define PADNUM_SYS0_GPIO_A3				3
>>>>
>>>> I could not find how your driver uses these, so are you sure it's a
>>>> binding constant for the SW?
>>>
>>> Yes, these are not used in the driver, but in PATCH 6/8/10/12, etc.,
>>> some definitions for other GPIOs are still used. Therefore, I have
>>> uniformly defined them in the binding, and they will be provided to the
>> device tree for use later.
>>
>> I am confused. The driver in these patches 6/8/10/12 does include the header
>> but does not use them. Why do you include unused headers? Or what is
>> exactly the use?
> 
> I'm sorry, I missed one thing. Actually, the current patches 4/6/8/10/12/14/16/18/20 all use this:
> 
> For example, in patch 4:
> 
> static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys0[] = {
> 	{ .func = "auxpwrgood",		.val = 1 },
> 	{ .func = "gpio",		.val = 0,
> 	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0_GPIO_A2) },
> 	{ .func = "gpio",		.val = 1,
> 	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0_GPIO_A3) },
> 	{ .func = "hbled",		.val = 1 },
> 	{ .func = "pe2rst_out",		.val = 0 },
> };
> 
> These definitions are used in `struct jhb100_pinctrl_func_maps` or `struct pinvref_desc`.

OK, I was looking for PADNUM_SYS0_GPIO_A0.

Why do you need unused constants? The constants in binding headers are
interface between DTS and drivers, not hardware values. You do not need
to store there hardware values, so what is the benefit of defining
PADNUM_SYS0_GPIO_A0? Why can't PADNUM_SYS0_GPIO_A2 start at index 0?

Indices of pins are simply not bindings.

Best regards,
Krzysztof
