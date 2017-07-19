From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 0/3] simulated interrupts
Date: Wed, 19 Jul 2017 16:53:24 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1707191652330.2286@nanos>
References: <1500466814-32679-1-git-send-email-brgl@bgdev.pl> <alpine.DEB.2.20.1707191424190.2286@nanos> <CAMRc=McO4L59zDT4QJSmqsdOpLfAv4NDyjddd57Prz2hjE5zWw@mail.gmail.com> <alpine.DEB.2.20.1707191557390.2286@nanos> <7c98e6b0-3dbd-52f7-79d5-4ec64bf8a66e@arm.com>
 <CAHp75Vdu1Eiyuo0WCg+Cx7aifcaQ-1ipGZ4cAPCwZ8D+id882Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vdu1Eiyuo0WCg+Cx7aifcaQ-1ipGZ4cAPCwZ8D+id882Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, 19 Jul 2017, Andy Shevchenko wrote:

> On Wed, Jul 19, 2017 at 5:19 PM, Marc Zyngier <marc.zyngier@arm.com> wrote:
> > On 19/07/17 14:58, Thomas Gleixner wrote:
> >> On Wed, 19 Jul 2017, Bartosz Golaszewski wrote:
> 
> > echo 1 >/proc/irq/9/trigger
> > (or the corresponding /sys/kernel/debug/irq/irqs/ interface if we want to make sure that this
> > is really not for production use...).
> 
> or /sys/kernel/irq as a successor of /proc/irq

/sys/kernel/debug/irq/irqs/ is already there and it's DEBUG and not
something which is in the regular sysfs maze.

Thanks,

	tglx
