From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 0/3] simulated interrupts
Date: Wed, 19 Jul 2017 15:58:33 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1707191557390.2286@nanos>
References: <1500466814-32679-1-git-send-email-brgl@bgdev.pl> <alpine.DEB.2.20.1707191424190.2286@nanos> <CAMRc=McO4L59zDT4QJSmqsdOpLfAv4NDyjddd57Prz2hjE5zWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=McO4L59zDT4QJSmqsdOpLfAv4NDyjddd57Prz2hjE5zWw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, 19 Jul 2017, Bartosz Golaszewski wrote:

> 2017-07-19 14:25 GMT+02:00 Thomas Gleixner <tglx@linutronix.de>:
> > On Wed, 19 Jul 2017, Bartosz Golaszewski wrote:
> >
> >> Some frameworks (e.g. iio, gpiolib) use irq_work to implement simulated
> >> interrupts that can be 'fired' from process context when needed and
> >> requested just like normal interrupts. This is useful for testing and
> >> development purposes.
> >>
> >> Currently this code is reimplemented by every user. This series
> >> proposes to add a new set of functions that can be used by drivers
> >> that want to simulate interrupts without having to duplicate any
> >> boilerplate code.
> >>
> >> The first patch adds a simple irq simulator framework. The second
> >> extends it with resource management. The third uses the new
> >> functionality in the gpio-mockup testing driver.
> >>
> >> NOTE: The next candidate for using this API would be iio-dummy-evgen.
> >
> > I like the general idea - have not looked at the code yet. Just a quick
> > question: How many copies/variants of this scheme do we have in tree?
> >
> > Thanks,
> >
> >         tglx
> 
> Currently there are two: iio and gpiolib basically duplicate the same
> code in their respective testing drivers. I only used irq_sim in
> gpio-mockup in this series as an example and to see if there's any
> interest in merging it before spending time on iio-dummy-evgen.

Yes, I think so. Consolidation is always a good thing and simulation is
useful for developing or validating code.

Thanks,

	tglx
