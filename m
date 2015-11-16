From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [RFC PATCH 4/7] pinctrl: sunxi: remove redundant "depends on RESET_CONTROLLER"
Date: Mon, 16 Nov 2015 12:40:09 +0900
Message-ID: <CAK7LNAThCGYWjXD4=OdgukUBLhyAtmHFH6VXO1V4DCFCpfTRjg@mail.gmail.com>
References: <1446722128-11961-1-git-send-email-yamada.masahiro@socionext.com>
	<1446722128-11961-5-git-send-email-yamada.masahiro@socionext.com>
	<CACRpkdYmdyxi+6fZNGffE6-JBZGkyq3F__Ywc4rCYYEsQeimMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg002.nifty.com ([202.248.44.40]:38007 "EHLO
	conssluserg002-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752584AbbKPDk1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Sun, 15 Nov 2015 22:40:27 -0500
In-Reply-To: <CACRpkdYmdyxi+6fZNGffE6-JBZGkyq3F__Ywc4rCYYEsQeimMQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vishnu Patekar <vishnupatekar0510@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Linus

2015-11-05 22:40 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> On Thu, Nov 5, 2015 at 12:15 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>
>> ARCH_SUNXI selects RESET_CONTROLLER.
>> The dependency "depends on RESET_CONTROLLER" is already met.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> NACK, this pin controller needs that as dependency, I don't worry
> that it's overspecified.
>
> They both do this:
> #include <linux/reset.h>
>
> And the object should specify its dependencies, not rely on them
> being implicitly available.
>
> The dep is there for human readers too, not just machines. And to
> them, this is helpful information.

How strict we should follow this rule?

Many drivers depend on OF, but do they all have "depends on OF"?





-- 
Best Regards
Masahiro Yamada
