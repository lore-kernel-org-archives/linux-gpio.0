From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v4 0/7] gpio: mockup: improve the user-space testing interface
Date: Mon, 18 Feb 2019 17:44:17 +0100
Message-ID: <CAMRc=Md-fXCFYtwPdZN5nxL4cecia5QN9aV5=pAG3rpZ9OHi+A@mail.gmail.com>
References: <20190214134232.3821-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214134232.3821-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

czw., 14 lut 2019 o 14:42 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(=
a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Hi Marc,
>
> another try at the irq_sim stuff. This time I added a notifier chain to
> irq_sim and made gpio-mockup register a notifier block. This way interest=
ed
> users will get notified about a type config change.
>
> v1 -> v2:
> - instead of providing the irq_sim_get_type() helper, move the irq type
>   logic into the simulator and provide a helper that allows users to spec=
ify
>   the type of the fired interrupt
>
> v2 -> v3:
> - switch back to having irq_sim_type() and put the line state logic into =
the
>   GPIO testing module
>
> v3- > v4:
> - drop irq_sim_get_type() and use a notifier chain instead so that any ch=
ange
>   in type configuration can be pushed out to interested users
> - change the locking mechanism in gpio-mockup to a spinlock as we can't t=
ake
>   a mutex when a hardirq-safe spinlock in irq_desc is being held when the
>   irq_set_type() callback is called
> - refuse to set any other type than falling or rising edge in irq_set_con=
fig
>
> Bartosz Golaszewski (7):
>   irq/irq_sim: add a notifier chain
>   gpio: mockup: add locking
>   gpio: mockup: implement get_multiple()
>   gpio: mockup: don't create the debugfs link named after the label
>   gpio: mockup: change the type of 'offset' to unsigned int
>   gpio: mockup: change the signature of unlocked get/set helpers
>   gpio: mockup: rework debugfs interface
>
>  drivers/gpio/gpio-mockup.c | 215 ++++++++++++++++++++++++++++++++-----
>  include/linux/irq_sim.h    |  22 +++-
>  kernel/irq/irq_sim.c       |  40 +++++++
>  3 files changed, 246 insertions(+), 31 deletions(-)
>
> --
> 2.20.1
>

Since this really is overkill, I sent v5 in which I simple store the
trigger type by calling irqd_set_trigger_type().

Superseded by v5.

Bartosz
