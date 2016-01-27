From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] pinctrl: pxa: export pxa2xx_pinctrl_init()
Date: Wed, 27 Jan 2016 21:20:27 +0100
Message-ID: <87powm93lg.fsf@belgarion.home>
References: <1453577113-14423-1-git-send-email-yamada.masahiro@socionext.com>
	<CACRpkdai_HysVqroBz-NcupxRF_2PPyHQnj8e8Ani6+04xre0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdai_HysVqroBz-NcupxRF_2PPyHQnj8e8Ani6+04xre0A@mail.gmail.com>
	(Linus Walleij's message of "Wed, 27 Jan 2016 13:33:23 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Mack <daniel@zonque.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Linus Walleij <linus.walleij@linaro.org> writes:

> On Sat, Jan 23, 2016 at 8:25 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>
>> Building pinctrl-pxa27x.c as a module causes a link error:
>>
>> ERROR: "pxa2xx_pinctrl_init" [drivers/pinctrl/pxa/pinctrl-pxa27x.ko] undefined!
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Patch applied with Robert's ACK.
Thanks Linus.

Cheers.

-- 
Robert
