From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] irq/irq_sim: provide irq_sim_fire_edge()
Date: Sun, 2 Dec 2018 22:56:13 +0100
Message-ID: <20181202215613.jcfrxwl4taiqgsql@pengutronix.de>
References: <20181120134032.31645-1-brgl@bgdev.pl>
 <20181120134032.31645-2-brgl@bgdev.pl>
 <20181120171742.gkwb4s4qbcqvnefj@pengutronix.de>
 <CAMRc=MfKf_f+x3Wt5gScA5yb78kbpphL87bi2arxcKKGjg1S7Q@mail.gmail.com>
 <20181121191509.ia2vcklvx4q2rh56@pengutronix.de>
 <CAMRc=Mef_O9ANUekZaz7vP7M2PpQFjZxJBoG8EPbXt6enRPL7g@mail.gmail.com>
 <20181125211854.idnqxz4pco3r7ydr@pengutronix.de>
 <CAMRc=Mfu=e3BsjMN=_H9CbUvumdmT1pvNjsyivTo1WN+LC1+2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfu=e3BsjMN=_H9CbUvumdmT1pvNjsyivTo1WN+LC1+2A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Hello,

On Thu, Nov 29, 2018 at 07:14:45PM +0100, Bartosz Golaszewski wrote:
> We're getting too much into details of how to handle simulated
> interrupts and we can continue discussing it, but meanwhile I'd like
> to address a different thing:
> 
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

Just for the record: I objected the patch, Bartosz agrees to discuss
further and but because this is too much detail the patch should now be
applied anyhow to fix the test suite of an external project. This seems
wrong to me.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
