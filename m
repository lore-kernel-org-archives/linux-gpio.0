Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194E538AC7B;
	Wed,  9 Sep 2026 06:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788933817; cv=none; b=R6F3H79/upGCKZsb6VWLrSiBmRYZf0Yu1iu5PBhOZgdD/hhskdavJm+8ys04FE8/l3x0iINMDyLRU7nql360jhkXeS5GQmlDqKH4/WYwooCsJOWo+/eyQv9KsiGtnzgX7uTHZIWJoEkrWdfR4O+z0lpT1gmDemHEE/0hYy2XWGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788933817; c=relaxed/simple;
	bh=M6w3Ge9eJZsZ2rCLlqnb4SeaB6p2w53rjI9OdQRrCzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UBYmzKZOO6S2inK51G/XLAf7ptVfJYpO9oB03DfYRIuT1PyLf8olyVDcL4MD40ogLr34rVSeFIBSO3Dja1vvFbnPSvp3y0cXTKo6vLkS5XK7m6avP1ujn+vq7/cvz+rXblSGj7xYEtdr7WWGcVx89xD5Y388MXUNvCTmrCuWpsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IObT8R6Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IObT8R6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E873D1F00A3D;
	Wed,  9 Sep 2026 06:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788933815;
	bh=haPdEZpp+cqsQIMNTEqsXgMDal7mY9IjuG8Msg3Fc1I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IObT8R6ZUcNF3PqkRrC/NfhRw8ik7iq59ieIkrpuMbDDVSEY8WeFiamkXKR3+8Y7y
	 Is1dmshqunrZSGMUSSRfaYJKWWEkgpPY+Mi4fOZMdoyKDL95DOIvAeJ0WeZTLwIrri
	 kBzpiC4hfYtaIbM+QGsGd0UiWCMjncGAsDb1O1eyNmqUgYTif+gE1IBEbF60K53EV+
	 MQatEpE+BgXVSqWwIZ/kM58fwoQpZBH5B/l3/8YobvIZ80N/KmJHTNCSs5HvXYpO5v
	 ZxeOXgwsjFqo654nOQjQvy711x2uAsK4u8aiFahXC1LBwg3mt0mirbnoK4zgHjQBZK
	 engUOpEeAhvPw==
Message-ID: <95b7ad43-9c68-4830-a35c-7cb29ca9b75f@kernel.org>
Date: Wed, 9 Sep 2026 08:03:25 +0200
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
 <08c6dad7-8b0d-4daf-908e-5af875306f0f@kernel.org>
 <ZQ4PR01MB1202123864865439817E1549F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <ZQ4PR01MB1202123864865439817E1549F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2026 10:57, Changhuang Liang wrote:
> Hi, Krzysztof
> 
> Thanks for the review.
> 
>> On 30/08/2026 10:42, Changhuang Liang wrote:
>>> Hi, Krzysztof
>>>
>>> Thanks for the review.
>>>
>>>> On 30/08/2026 03:29, Changhuang Liang wrote:
>>>>> Hi, Krzysztof
>>>>>
>>>>> Thanks for the review.
>>>>>
>>>>>> On 29/08/2026 04:57, Changhuang Liang wrote:
>>>>>>> +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
>>>>>>> +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
>>>>>>> +
>>>>>>> +/* sys0 pad numbers */
>>>>>>> +#define PADNUM_SYS0_GPIO_A0				0
>>>>>>> +#define PADNUM_SYS0_GPIO_A1				1
>>>>>>> +#define PADNUM_SYS0_GPIO_A2				2
>>>>>>> +#define PADNUM_SYS0_GPIO_A3				3
>>>>>>
>>>>>> I could not find how your driver uses these, so are you sure it's a
>>>>>> binding constant for the SW?
>>>>>
>>>>> Yes, these are not used in the driver, but in PATCH 6/8/10/12, etc.,
>>>>> some definitions for other GPIOs are still used. Therefore, I have
>>>>> uniformly defined them in the binding, and they will be provided to
>>>>> the
>>>> device tree for use later.
>>>>
>>>> I am confused. The driver in these patches 6/8/10/12 does include the
>>>> header but does not use them. Why do you include unused headers? Or
>>>> what is exactly the use?
>>>
>>> I'm sorry, I missed one thing. Actually, the current patches
>> 4/6/8/10/12/14/16/18/20 all use this:
>>>
>>> For example, in patch 4:
>>>
>>> static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys0[] = {
>>> 	{ .func = "auxpwrgood",		.val = 1 },
>>> 	{ .func = "gpio",		.val = 0,
>>> 	  .max_pin =
>> JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0_GPIO_A2) },
>>> 	{ .func = "gpio",		.val = 1,
>>> 	  .max_pin =
>> JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0_GPIO_A3) },
>>> 	{ .func = "hbled",		.val = 1 },
>>> 	{ .func = "pe2rst_out",		.val = 0 },
>>> };
>>>
>>> These definitions are used in `struct jhb100_pinctrl_func_maps` or `struct
>> pinvref_desc`.
>>
>> OK, I was looking for PADNUM_SYS0_GPIO_A0.
>>
>> Why do you need unused constants? The constants in binding headers are
>> interface between DTS and drivers, not hardware values. You do not need to
>> store there hardware values, so what is the benefit of defining
>> PADNUM_SYS0_GPIO_A0? Why can't PADNUM_SYS0_GPIO_A2 start at index
>> 0?
> 
> Here, it is also provided for use by the device tree later. For example:
> 
> 	auxpowergood0_pins: auxpowergood0-grp {
> 		auxpowergood0-pins {
> 			pins = <PADNUM_SYS0_GPIO_A0>;
> 			function = "auxpwrgood";
> 			input-enable;
> 		};
> 	};
> 
> 	auxpowergood1_pins: auxpowergood1-grp {
> 		auxpowergood1-pins {
> 			pins = <PADNUM_SYS0_GPIO_A1>;
> 			function = "auxpwrgood";
> 			input-enable;
> 		};
> 	};
> 
> The pins property corresponds to the specific GPIO offset, so PADNUM_SYS0_GPIO_A2 cannot start at index 0.

Did you even read my reply? Or you just respond whatever to tick the
checkbox of responding to maintainer?

AGAIN:
"You do not need to store there hardware values"

Do you understand the term ABI between software and DTS? Is in this term
anything about your actual hardware numbers? No.

Best regards,
Krzysztof
