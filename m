From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: guard sub-directory with CONFIG_PINCTRL_SUNXI
Date: Thu, 28 Jan 2016 14:27:06 +0100
Message-ID: <CACRpkdbXVLPZ_UtF9=nVxdbrp3xTEMududjXXpbF1KbRApz=1A@mail.gmail.com>
References: <1453563129-30332-1-git-send-email-yamada.masahiro@socionext.com>
	<CACRpkdad53bcBEOzKK=dTLmDSzr-rZuiFmh6XWnBqzi+NebuHw@mail.gmail.com>
	<CAK7LNAThe1J9zEAQZP3RkKxHqooOmY4U-Pn9aA0_AX-ORtZ2KQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAThe1J9zEAQZP3RkKxHqooOmY4U-Pn9aA0_AX-ORtZ2KQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 28, 2016 at 11:45 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2016-01-28 19:31 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
>> On Sat, Jan 23, 2016 at 4:32 PM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>
>>> CONFIG_PINCTRL_SUNXI is more suitable than CONFIG_ARCH_SUNXI
>>> to guard the drivers/pinctrl/sunxi/ directory.
>>> (I renamed CONFIG_PINCTRL_SUNXI_COMMON to CONFIG_PINCTRL_SUNXI.)
>>>
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>
>> This patch does not apply on linux v4.5-rc1, please rebase, add
>> Maxime's ACK and resend.
>
>
> I think this patch applies on v4.5-rc1.
>
> I tried again and it succeeded.

Bah, my own fault of course.

I had other patches to Makefile etc in my tree, it was easy to fix up
so applied it now, sorry for the fuzz.

Yours,
Linus Walleij
