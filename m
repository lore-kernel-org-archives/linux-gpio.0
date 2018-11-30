From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] irq/irq_sim: provide irq_sim_fire_edge()
Date: Fri, 30 Nov 2018 23:26:25 +0100
Message-ID: <CACRpkdY9-umyz=T8v0ZmfOx8tFapvDguS3B=BYAVkY73BrkxqQ@mail.gmail.com>
References: <20181120134032.31645-1-brgl@bgdev.pl> <20181120134032.31645-2-brgl@bgdev.pl>
 <20181120171742.gkwb4s4qbcqvnefj@pengutronix.de> <CAMRc=MfKf_f+x3Wt5gScA5yb78kbpphL87bi2arxcKKGjg1S7Q@mail.gmail.com>
 <20181121191509.ia2vcklvx4q2rh56@pengutronix.de> <CAMRc=Mef_O9ANUekZaz7vP7M2PpQFjZxJBoG8EPbXt6enRPL7g@mail.gmail.com>
 <20181125211854.idnqxz4pco3r7ydr@pengutronix.de> <CAMRc=Mfu=e3BsjMN=_H9CbUvumdmT1pvNjsyivTo1WN+LC1+2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=Mfu=e3BsjMN=_H9CbUvumdmT1pvNjsyivTo1WN+LC1+2A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 29, 2018 at 7:14 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Thomas, Linus: after commit fa38869b0161 ("gpiolib: Don't support irq
> sharing for userspace") some libgpiod tests are failing because we can
> no longer depend on reading the value of a dummy GPIO after detecting
> an interrupt to know the edge of the interrupt. While these interrupts
> are triggered from debugfs and debugfs is not required to maintain
> compatibility, I thing having a working test suite for the GPIO
> subsystem and uAPI is worth applying these two patches and also the
> previous one[1].
>
> Can we have them applied for 4.20 or are there any objections?

I'm fine with applying them if I can just get an ACK from one of the IRQ
maintainers (Thomas, Marc).

Yours,
Linus Walleij
