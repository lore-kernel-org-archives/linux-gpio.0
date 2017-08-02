From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] simulated interrupts
Date: Wed, 2 Aug 2017 13:32:48 +0200
Message-ID: <CACRpkdYRcsr16YBiooDn5D4p+4qB3yhAdE-+VgBBSD4kCCO-Hw@mail.gmail.com>
References: <1500466814-32679-1-git-send-email-brgl@bgdev.pl>
 <alpine.DEB.2.20.1707191424190.2286@nanos> <CAMRc=McO4L59zDT4QJSmqsdOpLfAv4NDyjddd57Prz2hjE5zWw@mail.gmail.com>
 <alpine.DEB.2.20.1707191557390.2286@nanos> <7c98e6b0-3dbd-52f7-79d5-4ec64bf8a66e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7c98e6b0-3dbd-52f7-79d5-4ec64bf8a66e@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 19, 2017 at 4:19 PM, Marc Zyngier <marc.zyngier@arm.com> wrote:

> On a slightly tangential subject, there is another aspect that I thought
> of implementing for a while, but always ended up just relying on a quick
> hack: forcing the injection of an actual interrupt. A number of
> interrupt controllers have the ability to make an interrupt pending, for
> it to be handled as if a device had actually triggered it.

This would be especially useful for a class of embedded systems that
are woken up from deep sleep by an asynchronous interrupt controller.

Usually GPIO(-ish) lines are armed and the system put to sleep, and
when it comes up, the information of what line woke it up is there in a
special register, but the actual (synchronous) interrupt line is no longer
asserted or edge triggered, so an interrupt need to be inserted.

Yours,
Linus Walleij
