From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/9] gpio: mockup: improve the user-space testing interface
Date: Wed, 6 Feb 2019 11:23:46 +0100
Message-ID: <CAMRc=MdyJO4F+GJ6S-moxQ1znQXatL6H27RFFiuaaOuLQdvnAA@mail.gmail.com>
References: <20190129084411.30495-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129084411.30495-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

wt., 29 sty 2019 o 09:44 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This series aims at reworking the gpio-mockup debugfs interface. The
> reason for that is the fact that certain known problems with this
> testing module exist and the user-space tests are broken anyway
> after commit fa38869b0161 ("gpiolib: Don't support irq sharing
> for userspace") which made it impossible for gpio-mockup to ignore
> certain events (e.g. only receive notifications about rising edge
> events).
>
> The first three patches improve the interrupt simulator. The first one
> makes the struct irq_chip part of the irq_sim structure so that we can
> support multiple instances at once. The second delegates the irq number
> mapping to the irq domain subsystem. The third patch provides a helper
> that will allow users to specify the type of the fired interrupt so that
> the configuration set by the set_type() callback can be taken into accoun=
t.
>
> Next six patches improve the gpio-mockup module. Patches 4-5 have been
> reviewed before but missed the last merge window. Patch 6 is there
> because we're already breaking the debugfs interface anyway and it
> removes a link that has no users. Patches 7-8 are minor tweaks.
>
> Last patch introduces a rework of the debugfs interface. With this
> change each mockup chip is represented by a directory named after the
> chip's device name under <debugfs mount point>/gpio-mockup/. Each line
> is represented by a file using the line's offset as the name under the
> chip's directory. Reading from the line's file yields the current
> *value*, writing to the line's file changes the current "pull". Default
> pull for mockup lines is down. More info on that can be found in the
> comment added by this change to the gpio-mockup code.
>
> This is somewhat inspired by the idea of the gpio-simulator by
> Uwe Kleine-K=C3=B6nig except that I strongly belive that when testing
> certain user API code paths we should not be using the same paths for
> verification. That's why there's a separate interface (debugfs) sharing
> as little as possible with the character device that allows to check if
> various operations (reading and setting values, events) work as
> expected instead of two connected dummy chips sharing the same
> interface.
>
> If accepted this will of course require major modification of user-space
> tests in libgpiod once upstream.
>
> v1 -> v2:
> - instead of providing the irq_sim_get_type() helper, move the irq type
>   logic into the simulator and provide a helper that allows users to spec=
ify
>   the type of the fired interrupt
>
> Bartosz Golaszewski (9):
>   irq/irq_sim: don't share the irq_chip structure between simulators
>   irq/irq_sim: use irq domain
>   irq/irq_sim: provide irq_sim_fire_type()
>   gpio: mockup: add locking
>   gpio: mockup: implement get_multiple()
>   gpio: mockup: don't create the debugfs link named after the label
>   gpio: mockup: change the type of 'offset' to unsigned int
>   gpio: mockup: change the signature of unlocked get/set helpers
>   gpio: mockup: rework debugfs interface
>
>  drivers/gpio/gpio-mockup.c | 185 +++++++++++++++++++++++++++++++------
>  include/linux/irq_sim.h    |  17 +++-
>  kernel/irq/irq_sim.c       | 126 ++++++++++++++++++-------
>  3 files changed, 263 insertions(+), 65 deletions(-)
>
> --
> 2.19.1
>

Marc, Thomas,

if there are no objections - could you please ack the three first
patches and let me take them through the GPIO tree? I would really
appreciate if we could have them in v5.1.

Bart
