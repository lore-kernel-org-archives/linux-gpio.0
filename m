From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: vf610: handle level IRQ's properly
Date: Thu, 24 Sep 2015 16:03:28 -0700
Message-ID: <CACRpkdYmaOQ-N4yGXo3_95dTVhF6FC0C9O2w+811=xLTO7gm0g@mail.gmail.com>
References: <1440197802-29720-1-git-send-email-stefan@agner.ch>
	<CACRpkdYqU_yvZE4WS2jBDOhemPy7dcHeOoj_dG61hCL8ugTMYg@mail.gmail.com>
	<99db8c092e8b54d485e88887630d51c0@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <99db8c092e8b54d485e88887630d51c0@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, Tien Hock Loh <thloh@altera.com>, Markus Mayer <markus.mayer@linaro.org>, Markus Mayer <mmayer@broadcom.com>, Andreas Larsson <andreas@gaisler.com>, David Cohen <david.a.cohen@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?Richard_R=C3=B6jfors?= <richard.rojfors@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 26, 2015 at 10:11 AM, Stefan Agner <stefan@agner.ch> wrote:
> On 2015-08-26 05:47, Linus Walleij wrote:
>> On Sat, Aug 22, 2015 at 12:56 AM, Stefan Agner <stefan@agner.ch> wrote:
>>
>>> The GPIO IRQ controller is able to generate level triggered
>>> interrupts, however, these were handled by handle_simple_irq so far
>>> which did not take care of IRQ masking. This lead to "nobody cared
>>> (try booting with the "irqpoll" option)" stack traces.
>>>
>>> Use the generic interrupt handlers depending on the IRQ type.
>>>
>>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>>
>> Patch applied.
>
> Thx
>
>
>> Hm, this looks like a problem that could exist in a few more
>> GPIO drivers. Can you look around and see if there is something
>> immediately suspicious in drivers/gpio?
>
> Just looked a bit around. There are some which use handle_simple_irq but
> also run their handler in threaded/one-shot handler. I guess in that
> case it is fine to use the simple_irq handler.
>
> However, those GPIO drivers look suspicious:
>
> gpio-altera.c: Uses handle_simple_irq, supports edge and level
> gpio-bcm-kona.c: Uses handle_simple_irq, supports only edge
> gpio-grgpio.c: Uses handle_simple_irq, supports edge and level
> gpio-intel-mid.c: Uses handle_simple_irq, supports only edge
> gpio-lynxpoint.c: Uses handle_simple_irq, supports edge and level
> gpio-ml-ioh.c: Uses handle_simple_irq, supports edge and level
> gpio-pl061.c: Uses handle_simple_irq, supports edge and level
> gpio-rcar.c: Uses handle_level_irq, supports edge and level
> gpio-timberdale.c: Uses handle_simple_irq, supports edge and level

Thanks!

I'm gonna look at pl061 myself, for the rest I ping the maintainers,
(To-line) I suspect a lot of them have never really been tested with
level IRQs because most just use edge IRQs.

Yours,
Linus Walleij
