From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: pxa: add PXA1928 gpio type support
Date: Mon, 2 Mar 2015 15:46:27 +0100
Message-ID: <CACRpkdbrHwBWT2jAvDY6YHAuigjUFu_XWJU859kVk84yd8Fhnw@mail.gmail.com>
References: <1422333966-18338-1-git-send-email-robh@kernel.org>
	<1422333966-18338-4-git-send-email-robh@kernel.org>
	<CACRpkdbTSh2ZOEpVkCk_QtH44C-hq=8qw-EanHUyD_6fSU_sog@mail.gmail.com>
	<CAL_Jsq+aSgPceu-9Uyx_FqfAEMaSpmFD0JCVnydQNTm2G6_u0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33431 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751241AbbCBOq2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2015 09:46:28 -0500
Received: by mail-oi0-f46.google.com with SMTP id x69so27321166oia.5
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2015 06:46:27 -0800 (PST)
In-Reply-To: <CAL_Jsq+aSgPceu-9Uyx_FqfAEMaSpmFD0JCVnydQNTm2G6_u0Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jing Xiang <jxiang@marvell.com>, Xiangzhan Meng <mengxzh@marvell.com>

On Tue, Feb 3, 2015 at 2:44 PM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Feb 3, 2015 at 6:41 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Tue, Jan 27, 2015 at 5:46 AM, Rob Herring <robh@kernel.org> wrote:
>>
>>> Add support for PXA1928 GPIOs. The PXA1928 adds a 6th bank from previous
>>> generations.
>>>
>>> Signed-off-by: Jing Xiang <jxiang@marvell.com>
>>> Signed-off-by: Xiangzhan Meng <mengxzh@marvell.com>
>>> [robh: ported to 3.19 from vendor kernel]
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>> Cc: Alexandre Courbot <gnurou@gmail.com>
>>
>> Patch applied...
>>
>>> -#define BANK_OFF(n)    (((n) < 3) ? (n) << 2 : 0x100 + (((n) - 3) << 2))
>>> +#define BANK_OFF(n)    (((n) < 3) ? (n) << 2 : ((n) > 5 ? 0x200 : 0x100)       \
>>> +                       + (((n) % 3) << 2))
>>
>> While this is a bit convoluted.
>>
>> Someone care to send a patch converting it to something like a
>> parseable static inline?
>
> I should have looked more closely than just taking the vendor code.
> This was needlessly convoluted before and this just added on to it. It
> can be simplified down to this:
>
> #define BANK_OFF(n) (((n) / 3) << 8) + (((n) % 3) << 2)
>
> I'll send a fix unless you want to fix up this patch.

I never saw a fixup patch, so if you have time... please tend to it.

Yours,
Linus Walleij
