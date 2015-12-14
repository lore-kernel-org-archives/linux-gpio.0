From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] gpio: pxa: integrate with pincontrol
Date: Mon, 14 Dec 2015 14:42:23 +0100
Message-ID: <CACRpkdawaM5dMqoyeb=UqzaCeEdfSD-dQ+AMxwe5L9FQQsWKyw@mail.gmail.com>
References: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
	<CACRpkdZ0JZOsU7VuFyeM8akWTKHjksEC3-wB4zrx0NJBRD+agQ@mail.gmail.com>
	<87lh92kbjg.fsf@belgarion.home>
	<CACRpkdZP=3mDWxoX6PRskztoeow41T9RgDyh82NP1=xnY+S1nQ@mail.gmail.com>
	<87d1uejjmr.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:34439 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932247AbbLNNmY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2015 08:42:24 -0500
Received: by oiao124 with SMTP id o124so929701oia.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2015 05:42:23 -0800 (PST)
In-Reply-To: <87d1uejjmr.fsf@belgarion.home>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Mack <zonque@gmail.com>

On Thu, Dec 10, 2015 at 6:31 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
>
>>>    - the GPDR (gpio direction register) shared access bothers me a bit
>>
>> How is it shared and between what users?
>
> It's shared between the pin controller and the gpio controller.

OK then it may be one of these cases where we should jit the pin controller
and the GPIO controller together in the same file (under drivers/pinctrl)
to simplify the mess. We can do that in the NEXT merge window because
right now I don't want any more crisscross between gpio and pin control
as there are refactorings I'm piling up.

Another option is e.g. accessing the registers through regmap-mmio but
it feels a bit like overkill for this...

> The odd thing with the pxa architecture is that the GPDR bit selects between 2
> different alternate functions, even when the pin is not a GPIO. Strange design,
> isn't it ?

Probably just unfortunate naming.

In my presentation "building GPIO and pin control from the ground up" I
try to explain a bit how hardware engineers design these things...
http://dflund.se/~triad/papers/pincontrol.pdf

> As a consequence, both the gpio driver and pinctrl have to modify it, for
> different purposes :
>  - pinctrl will modify it to select a specific alternate function
>  - gpio driver will modify it when the pin is a GPIO, to modify its direction.

OK. Solutions per above, I guess it currently just optimistically hope
we do not fiddle the same bit in parallell from the two drivers (which
is maybe even possible to prove to be true).

Yours,
Linus Walleij
