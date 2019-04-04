From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: Implements gpio free function
Date: Thu, 4 Apr 2019 23:03:42 +0700
Message-ID: <CACRpkdYNN1Zyhw5+4=R68SQNMe_ZVWPD49afF3xEN-v39aikKw@mail.gmail.com>
References: <1553135724-38331-1-git-send-email-zhuchangchun@cvte.com>
 <20190321084420.GG3622@lahna.fi.intel.com> <20190321092330.GK9224@smile.fi.intel.com>
 <140c6ec0-7c11-6aa9-8434-f14d77be9a8c@metux.net> <CACRpkdZ1xPJ=NS=o=-PYqCO4d-VVZM1=f=xBZa5Dwx78LFPYtA@mail.gmail.com>
 <cb643914-2c3f-0c63-13e4-8171fa9a37e7@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cb643914-2c3f-0c63-13e4-8171fa9a37e7@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, zhuchangchun <zhuchangchun@cvte.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, hendychu@aliyun.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 4, 2019 at 5:51 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 03.04.19 06:13, Linus Walleij wrote:
>
> > But the chardev on the other hand will protect you from all this.
> > If the program crashes, the lines will be free:ed.
> > If two scripts try to access the same GPIO, they will be denied.

> Right, when you want this concurrency protection and cleanup stiff
> the chardev is the better choice. But I've already had several cases
> where the simplicity of the sysfs interface is a big win - all you need
> few trivial fs operations.

It is admittedly a tradeoff. But if we want something that is hacky
and dangerous it should be moved over to debugfs not sitting
around in sysfs. In debugfs we give users enough rope all the
time.

> Another interesting usecase is permission handling:
>
> a) some ioctls need special privileges (oh, how I hate all these "if
>    (!capable(CAP_SYS_ADMIN)) ..." lines in the drivers), but you wanna
>    give some unprivileged user access to them
> b) you wanna give an unprivileged user access to specific gpio's,
>    but not to all at once.
>
> With pure filesystem based approach, you can easly define permissions
> for each filesystem object.

This was a comment when we designed the chardev as well, but
noone really could give a good usecase for this. Often GPIOs they
want to protect should not have been made available to userspace
or anyone else in the first place and we now have ways inside
the kernel to take GPIOs aside (valid_mask) we can also use
hogs (at least in the device tree) to set up GPIOs so that they are
held perpetually by the kernel (until reboot) so that userspace
cannot try to use them.

I can't see that any more access control granularity than the
whole gpiochip chardev is really used, not anymore than
you want to have access control on every indidual pixel on
a framebuffer or each individual block on a block device.

Things like requesting and flipping several GPIOs at once
could become explosively complex to implement with
individual access permissions on each GPIO line, and this
is on the other hand a very real and important use case.

Yours,
Linus Walleij
