From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] pinctrl: sunxi: guard sub-directory with CONFIG_PINCTRL_SUNXI
Date: Thu, 28 Jan 2016 19:45:23 +0900
Message-ID: <CAK7LNAThe1J9zEAQZP3RkKxHqooOmY4U-Pn9aA0_AX-ORtZ2KQ@mail.gmail.com>
References: <1453563129-30332-1-git-send-email-yamada.masahiro@socionext.com>
	<CACRpkdad53bcBEOzKK=dTLmDSzr-rZuiFmh6XWnBqzi+NebuHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg001.nifty.com ([202.248.44.39]:30046 "EHLO
	conssluserg001-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S964914AbcA1Kp3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 28 Jan 2016 05:45:29 -0500
In-Reply-To: <CACRpkdad53bcBEOzKK=dTLmDSzr-rZuiFmh6XWnBqzi+NebuHw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Linus

2016-01-28 19:31 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> On Sat, Jan 23, 2016 at 4:32 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>
>> CONFIG_PINCTRL_SUNXI is more suitable than CONFIG_ARCH_SUNXI
>> to guard the drivers/pinctrl/sunxi/ directory.
>> (I renamed CONFIG_PINCTRL_SUNXI_COMMON to CONFIG_PINCTRL_SUNXI.)
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> This patch does not apply on linux v4.5-rc1, please rebase, add
> Maxime's ACK and resend.


I think this patch applies on v4.5-rc1.

I tried again and it succeeded.

This is my log.


yamada@beagle:~/workspace/linux$ git checkout -b foo v4.5-rc1
Switched to a new branch 'foo'
yamada@beagle:~/workspace/linux$ git am
pinctrl-sunxi-guard-sub-directory-with-CONFIG_PINCTRL_SUNXI.patch
Applying: pinctrl: sunxi: guard sub-directory with CONFIG_PINCTRL_SUNXI
yamada@beagle:~/workspace/linux$ git log -n 2
commit 74945160ad985cbd71ce325271113c5a975ca1da
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun Jan 24 00:32:09 2016 +0900

    pinctrl: sunxi: guard sub-directory with CONFIG_PINCTRL_SUNXI

    CONFIG_PINCTRL_SUNXI is more suitable than CONFIG_ARCH_SUNXI
    to guard the drivers/pinctrl/sunxi/ directory.
    (I renamed CONFIG_PINCTRL_SUNXI_COMMON to CONFIG_PINCTRL_SUNXI.)

    Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
    Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

commit 92e963f50fc74041b5e9e744c330dca48e04f08d
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Jan 24 13:06:47 2016 -0800

    Linux 4.5-rc1





-- 
Best Regards
Masahiro Yamada
