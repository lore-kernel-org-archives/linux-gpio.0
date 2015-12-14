From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 0/4] gpio: pxa: integrate with pincontrol
Date: Mon, 14 Dec 2015 22:10:55 +0100
Message-ID: <87io40ivmo.fsf@belgarion.home>
References: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
	<CACRpkdZ0JZOsU7VuFyeM8akWTKHjksEC3-wB4zrx0NJBRD+agQ@mail.gmail.com>
	<87lh92kbjg.fsf@belgarion.home>
	<CACRpkdZP=3mDWxoX6PRskztoeow41T9RgDyh82NP1=xnY+S1nQ@mail.gmail.com>
	<87d1uejjmr.fsf@belgarion.home>
	<CACRpkdawaM5dMqoyeb=UqzaCeEdfSD-dQ+AMxwe5L9FQQsWKyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdawaM5dMqoyeb=UqzaCeEdfSD-dQ+AMxwe5L9FQQsWKyw@mail.gmail.com>
	(Linus Walleij's message of "Mon, 14 Dec 2015 14:42:23 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Mack <zonque@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Linus Walleij <linus.walleij@linaro.org> writes:

> On Thu, Dec 10, 2015 at 6:31 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>> Linus Walleij <linus.walleij@linaro.org> writes:
>>
>>>>    - the GPDR (gpio direction register) shared access bothers me a bit
>>>
>>> How is it shared and between what users?
>>
>> It's shared between the pin controller and the gpio controller.
>
> OK then it may be one of these cases where we should jit the pin controller
> and the GPIO controller together in the same file (under drivers/pinctrl)
> to simplify the mess. We can do that in the NEXT merge window because
> right now I don't want any more crisscross between gpio and pin control
> as there are refactorings I'm piling up.

Well, maybe, but I don't know how to do it, due to the number of possibilities,
given that :
 - gpio-pxa.c should work for pxa27x device-tree
   (this would be possible with a pinctrl+gpio fusion)
 - gpio-pxa.c should work for pxa3xx device-tree
   (I don't know how to do this, pxa3xx uses pinctrl-single AFAIK)
 - gpio-pxa.c should work for pxa168 + mmp* device-tree
   (same as for pxa3xx)
 - gpio-pxa.c might should with pxa27x platform_data
   (this doesn't work yet fully, the wake-up pin give me headaches)
 - gpio-pxa.c should work with pxa25x platform_data
   (I don't see either how a merged pinctrl+gpio driver could address this)

All of this to say it looks a bit complicated to me to have a gpio+pinctrl in
the same file, but I might be missing something obvious.
 
> Another option is e.g. accessing the registers through regmap-mmio but
> it feels a bit like overkill for this...
Yes, overkill maybe, but maybe an idea. The nice thing about regmap is the debug
capabilities, the less good is the permanent need of locks ...

>> The odd thing with the pxa architecture is that the GPDR bit selects between 2
>> different alternate functions, even when the pin is not a GPIO. Strange design,
>> isn't it ?
>
> Probably just unfortunate naming.
>
> In my presentation "building GPIO and pin control from the ground up" I
> try to explain a bit how hardware engineers design these things...
> http://dflund.se/~triad/papers/pincontrol.pdf
Nice, I had already read it :)

>> As a consequence, both the gpio driver and pinctrl have to modify it, for
>> different purposes :
>>  - pinctrl will modify it to select a specific alternate function
>>  - gpio driver will modify it when the pin is a GPIO, to modify its direction.
>
> OK. Solutions per above, I guess it currently just optimistically hope
> we do not fiddle the same bit in parallell from the two drivers (which
> is maybe even possible to prove to be true).
Ok. I will think about it again in the next days.

Cheers.

-- 
Robert
