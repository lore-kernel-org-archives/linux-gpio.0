From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] extcon: gpio: Request reasonable interrupts
Date: Fri, 7 Jun 2019 23:24:54 +0200
Message-ID: <CACRpkdaCaZyzfr9=QRz6uRZpK6mw_zDeVmBwgH7=FPbNGKB9tQ@mail.gmail.com>
References: <CGME20190530183941epcas5p4688d5fa80df649e4184a296ea78e6256@epcas5p4.samsung.com>
 <20190530183932.4132-1-linus.walleij@linaro.org> <28b92b86-19ac-0bf3-57d8-c7ab4557a45b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <28b92b86-19ac-0bf3-57d8-c7ab4557a45b@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 4, 2019 at 3:30 AM Chanwoo Choi <cw00.choi@samsung.com> wrote:
> On 19. 5. 31. =EC=98=A4=EC=A0=84 3:39, Linus Walleij wrote:

> > +     /*
> > +      * It is unlikely that this is an acknowledged interrupt that goe=
s
> > +      * away after handling, what we are looking for are falling edges
> > +      * if the signal is active low, and rising edges if the signal is
> > +      * active high.
> > +      */
> > +     if (gpiod_is_active_low(data->gpiod))
> > +             irq_flags =3D IRQF_TRIGGER_FALLING;
>
> If gpiod_is_active_low(data->gpiod) is true, irq_flags might be
> IRQF_TRIGGER_LOW instead of IRQF_TRIGGER_FALLING. How can we sure
> that irq_flags is always IRQF_TRIGGER_FALLING?

OK correct me if I'm wrong, but this is an external connector and
the GPIO goes low/high when the connector is physically inserted.
If it was level trigged, it would lock up the CPU with interrupts until
it was unplugged again, since there is no way to acknowledge a
level IRQ.

I think level IRQ on GPIOs are only used for logic peripherals
such as ethernet controllers etc where you can talk to the peripheral
and get it to deassert the line and thus acknowledge the IRQ.

So the way I see it only edge triggering makes sense for extcon.

Correct me if I'm wrong.

Yours,
Linus Walleij
