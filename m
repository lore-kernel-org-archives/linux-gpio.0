From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/2] irq/irq_sim: provide irq_sim_fire_edge()
Date: Sun, 2 Dec 2018 18:00:22 +0100
Message-ID: <CAMRc=MczHf3Q+826QDMMNAFU3WMKHR3L-Tj=Da4ydVRDcZThCA@mail.gmail.com>
References: <20181120134032.31645-1-brgl@bgdev.pl> <20181120134032.31645-2-brgl@bgdev.pl>
 <20181120171742.gkwb4s4qbcqvnefj@pengutronix.de> <CAMRc=MfKf_f+x3Wt5gScA5yb78kbpphL87bi2arxcKKGjg1S7Q@mail.gmail.com>
 <20181121191509.ia2vcklvx4q2rh56@pengutronix.de> <CAMRc=Mef_O9ANUekZaz7vP7M2PpQFjZxJBoG8EPbXt6enRPL7g@mail.gmail.com>
 <20181125211854.idnqxz4pco3r7ydr@pengutronix.de> <CAMRc=Mfu=e3BsjMN=_H9CbUvumdmT1pvNjsyivTo1WN+LC1+2A@mail.gmail.com>
 <CACRpkdY9-umyz=T8v0ZmfOx8tFapvDguS3B=BYAVkY73BrkxqQ@mail.gmail.com> <20181202122900.79922c91@why.wild-wind.fr.eu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181202122900.79922c91@why.wild-wind.fr.eu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

niedz., 2 gru 2018 o 13:29 Marc Zyngier <marc.zyngier@arm.com> napisa=C5=82=
(a):
>
> On Fri, 30 Nov 2018 23:26:25 +0100
> Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > On Thu, Nov 29, 2018 at 7:14 PM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> >
> > > Thomas, Linus: after commit fa38869b0161 ("gpiolib: Don't support irq
> > > sharing for userspace") some libgpiod tests are failing because we ca=
n
> > > no longer depend on reading the value of a dummy GPIO after detecting
> > > an interrupt to know the edge of the interrupt. While these interrupt=
s
> > > are triggered from debugfs and debugfs is not required to maintain
> > > compatibility, I thing having a working test suite for the GPIO
> > > subsystem and uAPI is worth applying these two patches and also the
> > > previous one[1].
> > >
> > > Can we have them applied for 4.20 or are there any objections?
> >
> > I'm fine with applying them if I can just get an ACK from one of the IR=
Q
> > maintainers (Thomas, Marc).
>
> I'm fine with that patch, with the provision that (nitpick) the edge
> field is turned into a bool instead of an int.
>
> With that,
>
> Acked-by: Marc Zyngier <marc.zyngier@arm.com>
>

I wanted to reuse the already existing IRQ_TYPE_EDGE_RISING/FALLING
defines which I think makes more sense here than a boolean.

Bart
