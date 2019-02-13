From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] x86: gpio: AMD G-Series pch gpio platform driver
Date: Wed, 13 Feb 2019 10:02:10 +0100
Message-ID: <CACRpkdbvY1FiqmBHj74x4H9XX8SZW7voTMfj5jq-as73_B071Q@mail.gmail.com>
References: <1549588593-4856-1-git-send-email-lkml@metux.net>
 <CACRpkdaSEZMR7LuLbO1V0k9QEBu4FWxFbq4ZL1pE9dAvNT1z_Q@mail.gmail.com> <f751539b-d844-9ab1-169b-ce6aa0056de6@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f751539b-d844-9ab1-169b-ce6aa0056de6@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 11, 2019 at 11:46 AM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 08.02.19 15:25, Linus Walleij wrote:

> >> +/*>> + * struct amd_fch_gpio_reg - GPIO register definition>> + * @reg:
> register index>> + * @name: signal name>> + */>> +struct
> amd_fch_gpio_reg {>> +    int         reg;>> +    const char* name;>>
> +};> > Can't you put this in the driver file?
>
> I'm afraid, I can't. Because the board driver needs to tell the
> gpio driver which gpio's we actually have. This seems to be really
> board specific, and the register layout of the FCHs gpio bank seems
> to be not actually linear (or maybe the pin naming is just weird)
>
> What I really don't want is undocumented registers or lines being
> exposed as gpio somewhere (not knowing what they actually do).
> Therefore, I'd like to add only those gpio registers that I can
> confirm being safe - at least until I've managed to get more
> information.

What we normally do is expose all the lines from a gpio chip
as kernel abstraction.

This is because at least in theory this chip can be used by
several boards.

The chip abstraction does have facilities for masking off
unavailable lines: in struct gpio_chip there is .valid_mask
and even a callback .init_valid_mask() to set it up.

This is currently used on ACPI systems to mask off an
make unavailable lines that are handled by firmware/BIOS.

So this is what you should use to make existing lines
unavailable, do not try to hide them by not exposing
registers or line offsets. The abstraction should model
the hardware, not the usecase.

Imposing a restriction from a board is a new thing,
and would involve setting these masks somehow using
machine data from <linux/gpio/machine.h>,
I am sure we can figure something out if you absolutely
need this.

FYI there are tons of systems out there that expose a
whole range of GPIOs that the developer have no clue
where they are connected on the PCB, the most common
case is that they are not connected (sometimes not
even leaving the chip die) or go to test points. They are
very seldom dangerous, in fact I've never seen dangerous
GPIOs, just dangerous set-ups of pins already known
to be in use for something.

Yours,
Linus Walleij
