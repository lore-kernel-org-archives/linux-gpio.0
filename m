From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v10 1/2] gpio: mmio: add DT support for memory-mapped GPIOs
Date: Wed, 8 Jun 2016 11:16:14 +0200
Message-ID: <CACRpkdZ4A+HtYa0fn+uuHFaBXTELK3A9xRrZ==C85+33d5r5Zg@mail.gmail.com>
References: <cover.1463172434.git.chunkeey@googlemail.com> <4af460fea30b60fbb1d621fcb568c5f3b04e1eee.1463172434.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4af460fea30b60fbb1d621fcb568c5f3b04e1eee.1463172434.git.chunkeey@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Joachim Eastwood <manabian@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 13, 2016 at 11:07 PM, Christian Lamparter
<chunkeey@googlemail.com> wrote:

> From: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>
> This patch adds support for defining memory-mapped GPIOs which
> are compatible with the existing gpio-mmio interface. The generic
> library provides support for many memory-mapped GPIO controllers
> that are found in various on-board FPGA and ASIC solutions that
> are used to control board's switches, LEDs, chip-selects,
> Ethernet/USB PHY power, etc.
>
> For setting GPIOs there are three configurations:
>         1. single input/output register resource (named "dat"),
>         2. set/clear pair (named "set" and "clr"),
>         3. single output register resource and single input resource
>            ("set" and dat").
>
> The configuration is detected by which resources are present.
> For the single output register, this drives a 1 by setting a bit
> and a zero by clearing a bit.  For the set clr pair, this drives
> a 1 by setting a bit in the set register and clears it by setting
> a bit in the clear register.
>
> For setting the GPIO direction, there are three configurations:
>         a. simple bidirectional GPIOs that requires no configuration.
>         b. an output direction register (named "dirout")
>            where a 1 bit indicates the GPIO is an output.
>         c. an input direction register (named "dirin")
>            where a 1 bit indicates the GPIO is an input.
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>

Patch applied with Alex' ACK.

Yours,
Linus Walleij
