From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/9] gpio: mockup: improve the user-space testing interface
Date: Mon, 28 Jan 2019 14:47:43 +0100
Message-ID: <CACRpkdYCrLap=+cAxqnq=+jsWwe7YfZ1b8s+wQ==sQKSxXq9-w@mail.gmail.com>
References: <20190123141538.29408-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123141538.29408-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 23, 2019 at 3:15 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

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
> that will allow users to check the current configuration of a dummy
> interrupt and decide whether it should be fired depending on external
> logic.
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

I like how this is developing and how I see the two major contributors
to simulated GPIOs cooperating on this :)

It'd be nice to get Marc's feedback on the irqchip changes so we
can solidify that part.

Yours,
Linus Walleij
