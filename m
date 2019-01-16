From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH STABLE v4.19.15] gpiolib: fix line event timestamps for
 nested irqs
Date: Wed, 16 Jan 2019 17:18:14 +0100
Message-ID: <CAMpxmJWAT2-Fr-fxBW+DcmrrUyNyJ8rtpSvLhD74GP1DcE30rQ@mail.gmail.com>
References: <20190116153557.13720-1-brgl@bgdev.pl> <20190116160216.GA4594@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116160216.GA4594@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Sasha Levin <sashal@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Stable # 4 . 20+" <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

=C5=9Br., 16 sty 2019 o 17:02 Greg KH <greg@kroah.com> napisa=C5=82(a):
>
> On Wed, Jan 16, 2019 at 04:35:57PM +0100, Bartosz Golaszewski wrote:
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
> > Fixes: d58f2bf261fd ("gpio: Timestamp events in hardirq handler")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> > Hi Sasha,
> >
> > this is a backport for v4.19.y series. The original patch didn't apply
> > due to a conflict.
>
> What is the git commit id for this patch in Linus's tree?
>

I'm not sure if you mean Linus Torvalds or Linus Walleij (through whom
my GPIO patches go) but neither has picked this one up yet. I'm not
sure why it got processed for stable already, I thought it must go
into Linus Torvalds' master branch first.

Anyway, in my GPIO branch its commit id is
8d694dcdbbdcfe4f27a52bcc6f2ce733ba5ec53c and it should get merged into
Linus Walleij's tree soon. I have already sent a PR.

Best regards,
Bartosz Golaszewski
