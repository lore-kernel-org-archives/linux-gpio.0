From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] gpiolib: fix line event timestamps for nested irqs
Date: Fri, 11 Jan 2019 14:45:08 +0100
Message-ID: <CAMRc=Md_8MBbc7RSwyPNMGYnJyQqvSgoyHYhEgQf5C4ac_K9eA@mail.gmail.com>
References: <20190104103226.2878-1-brgl@bgdev.pl> <CACRpkdacXeBEh2UMmigSo+zYQCj3yMyNRfxHjqhu_kiZ2JMXbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdacXeBEh2UMmigSo+zYQCj3yMyNRfxHjqhu_kiZ2JMXbg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

pt., 11 sty 2019 o 13:19 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Fri, Jan 4, 2019 at 11:32 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
>
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Nested interrupts run inside the calling thread's context and the top
> > half handler is never called which means that we never read the
> > timestamp.
> >
> > This issue came up when trying to read line events from a gpiochip
> > using regmap_irq_chip for interrupts.
> >
> > Fix it by reading the timestamp from the irq thread function if it's
> > still 0 by the time the second handler is called.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Oh that's right. Should this not have Fixes: and Cc: stable?
>
> > +       /*
> > +        * We may be running from a nested threaded interrupt in which =
case
> > +        * we didn't get the timestamp from lineevent_irq_handler().
> > +        */
> > +       if (!le->timestamp)
> > +               le->timestamp =3D ktime_get_real_ns();
> > +
> >         ge.timestamp =3D le->timestamp;
>
> I would merge these:
>
> if (!le->timestamp)
>     ge.timestamp =3D ktime_get_real_ns();
> else
>     ge.timestamp =3D le->timestamp;
>
> Yours,
> Linus Walleij

I'll fix both issues and resend.

Bart
