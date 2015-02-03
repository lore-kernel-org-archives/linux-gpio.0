From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] gpio: pxa: add PXA1928 gpio type support
Date: Tue, 3 Feb 2015 07:44:27 -0600
Message-ID: <CAL_Jsq+aSgPceu-9Uyx_FqfAEMaSpmFD0JCVnydQNTm2G6_u0Q@mail.gmail.com>
References: <1422333966-18338-1-git-send-email-robh@kernel.org>
 <1422333966-18338-4-git-send-email-robh@kernel.org> <CACRpkdbTSh2ZOEpVkCk_QtH44C-hq=8qw-EanHUyD_6fSU_sog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:62548 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751684AbbBCNos (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Feb 2015 08:44:48 -0500
In-Reply-To: <CACRpkdbTSh2ZOEpVkCk_QtH44C-hq=8qw-EanHUyD_6fSU_sog@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jing Xiang <jxiang@marvell.com>, Xiangzhan Meng <mengxzh@marvell.com>

On Tue, Feb 3, 2015 at 6:41 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Jan 27, 2015 at 5:46 AM, Rob Herring <robh@kernel.org> wrote:
>
>> Add support for PXA1928 GPIOs. The PXA1928 adds a 6th bank from previous
>> generations.
>>
>> Signed-off-by: Jing Xiang <jxiang@marvell.com>
>> Signed-off-by: Xiangzhan Meng <mengxzh@marvell.com>
>> [robh: ported to 3.19 from vendor kernel]
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Alexandre Courbot <gnurou@gmail.com>
>
> Patch applied...
>
>> -#define BANK_OFF(n)    (((n) < 3) ? (n) << 2 : 0x100 + (((n) - 3) << 2))
>> +#define BANK_OFF(n)    (((n) < 3) ? (n) << 2 : ((n) > 5 ? 0x200 : 0x100)       \
>> +                       + (((n) % 3) << 2))
>
> While this is a bit convoluted.
>
> Someone care to send a patch converting it to something like a
> parseable static inline?

I should have looked more closely than just taking the vendor code.
This was needlessly convoluted before and this just added on to it. It
can be simplified down to this:

#define BANK_OFF(n) (((n) / 3) << 8) + (((n) % 3) << 2)

I'll send a fix unless you want to fix up this patch.

Rob
