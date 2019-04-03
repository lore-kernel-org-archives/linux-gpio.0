From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: Implements gpio free function
Date: Wed, 3 Apr 2019 11:13:55 +0700
Message-ID: <CACRpkdZ1xPJ=NS=o=-PYqCO4d-VVZM1=f=xBZa5Dwx78LFPYtA@mail.gmail.com>
References: <1553135724-38331-1-git-send-email-zhuchangchun@cvte.com>
 <20190321084420.GG3622@lahna.fi.intel.com> <20190321092330.GK9224@smile.fi.intel.com>
 <140c6ec0-7c11-6aa9-8434-f14d77be9a8c@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <140c6ec0-7c11-6aa9-8434-f14d77be9a8c@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, zhuchangchun <zhuchangchun@cvte.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, hendychu@aliyun.com
List-Id: linux-gpio@vger.kernel.org

On Sat, Mar 23, 2019 at 1:32 AM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 21.03.19 10:23, Andy Shevchenko wrote:
>
> > ...and on top of that GPIO sysfs interface is deprecated.
>
> I don't like the idea of deprecating this. It might not be enough for
> all usecases, but for a lot of usecases, it's a very easy and simple
> interfaces.

Yeah it is deprecated for years.

It is not like I don't see the simpleness and utility.

The reason why it is not good for anyone is simple:

Export some GPIOs in sysfs. You script crashes. Who is going
to unexport them now? (Answer: noone. Restart machine?)

Two scripts at the same time try to use the same GPIO. Such as happen
to start the same script twice. What happens
now? (Answer: both, with interesting results.)

Sure you can make more elaborate scripts that check for stuff already
being exported etc.

But the chardev on the other hand will protect you from all this.

If the program crashes, the lines will be free:ed.

If two scripts try to access the same GPIO, they will be denied.

And to spice things up, I only add new stuff like open drain and
driving several lines at the same time only to the chardev.

Yours,
Linus Walleij
