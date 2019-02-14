From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 1/2] x86: gpio: AMD G-Series pch gpio platform driver
Date: Thu, 14 Feb 2019 10:53:04 +0100
Message-ID: <6f723c65-be90-132d-e714-616a21149fe0@metux.net>
References: <1549588593-4856-1-git-send-email-lkml@metux.net>
 <CACRpkdaSEZMR7LuLbO1V0k9QEBu4FWxFbq4ZL1pE9dAvNT1z_Q@mail.gmail.com>
 <f751539b-d844-9ab1-169b-ce6aa0056de6@metux.net>
 <CACRpkdbvY1FiqmBHj74x4H9XX8SZW7voTMfj5jq-as73_B071Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbvY1FiqmBHj74x4H9XX8SZW7voTMfj5jq-as73_B071Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 13.02.19 10:02, Linus Walleij wrote:

Hi,

> What we normally do is expose all the lines from a gpio chip> as kernel abstraction.> > This is because at least in theory this chip
can be used by> several boards.
I'm afraid it's a bit more complicated. The register set doesn't
seem to be linear. I have absolutely no idea what the undocumented
registers do. For the sake of security, I would hate to see them
accessible from userland.

> The chip abstraction does have facilities for masking off
> unavailable lines: in struct gpio_chip there is .valid_mask
> and even a callback .init_valid_mask() to set it up.

Okay, but then again I'd need to pass this from the board
driver into the gpio driver. Feels much easier and safer to
just pass the registers.

What I perhaps could do: add all documented registers as gpio's
in the gpio driver and make the board driver a dummy consumer
for the unused ones.

> So this is what you should use to make existing lines
> unavailable, do not try to hide them by not exposing
> registers or line offsets. The abstraction should model
> the hardware, not the usecase.

According to my information, it is the hardware who dictates that
non-linear layout. Even the PIN naming is non-linear. And I don't
like to see this passed to upper layers, or even userland. So,
at least the gpio driver should only serve the documented gpios
and present them lineary.

Maybe the holes in the register set are technically also gpios,
but used by some internal logic and not properly masked out in
hw - really weird things (possibly damage) could happen.

> FYI there are tons of systems out there that expose a
> whole range of GPIOs that the developer have no clue
> where they are connected on the PCB, the most common
> case is that they are not connected (sometimes not
> even leaving the chip die) or go to test points. They are
> very seldom dangerous, in fact I've never seen dangerous
> GPIOs, just dangerous set-ups of pins already known
> to be in use for something.

Can't speak about standard ICs/SoCs, but i've seen such things
in some of my client's fpga designs. For example incomplete
decoders, gpios attached to internal state machines, etc, etc
So, I've learned to be *very* cautious with undocumented registers.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
