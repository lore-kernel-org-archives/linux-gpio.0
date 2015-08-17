From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: don't override irq_*_resources() callbacks
Date: Mon, 17 Aug 2015 15:23:24 +0200
Message-ID: <CACRpkdbAWwY9=d8EmEPTqBrzMCGAxkGC4EgYQSMEPnQvJxrfaw@mail.gmail.com>
References: <1438346937-9020-1-git-send-email-rabin@rab.in>
	<CACRpkdaORy4W8qC-Et-2GPMQheojbBq_R9NWyatc2H7LoJPbSQ@mail.gmail.com>
	<CAMuHMdXg5UMnP2oN8UdyCEBb-RMzhhNgKZqZ0=3UPQ7RtaW4Ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXg5UMnP2oN8UdyCEBb-RMzhhNgKZqZ0=3UPQ7RtaW4Ww@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rabin Vincent <rabin@rab.in>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 17, 2015 at 10:40 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Aug 3, 2015 at 10:53 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Fri, Jul 31, 2015 at 2:48 PM, Rabin Vincent <rabin@rab.in> wrote:
>>
>>> If the driver has specified its own irq_{request/release}_resources()
>>> functions, don't override them.  The gpio-etraxfs driver will use this.
>>>
>>> Signed-off-by: Rabin Vincent <rabin@rab.in>
>>
>> Perfectly reasonable given the usecase in patch 2/2. Patch applied.
>
> So for drivers currently using GPIOLIB_IRQCHIP the calbacks were
> always overridden, even if they supplied their own?

Yeah, I guess we just assumed noone supplied their own and
expected them to be nulled out.

> Hence after this change, that's no longer the case, and pinctrl-at91.c
> will use its own, which are identical to the generic ones, modulo the bug fix
> in 5b76e79c77264899 ("gpiolib: irqchip: prevent driver unloading if gpio is
> used as irq only"). Oops...
>
> I already wrote an untested patch to convert pinctrl-at91 to the generic
> ones, shall I send that right away?

Please test it first, but yeah :)

Yours,
Linus Walleij
