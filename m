From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: Do pin translation in other GPIO
 operations as well
Date: Thu, 20 Sep 2018 08:26:25 -0700
Message-ID: <CACRpkdYhpBYEY0OJA0A15Q7OOM31ogGxeaUbNNqSMpJ9af4hOA@mail.gmail.com>
References: <20180918153621.71984-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180918153621.71984-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rajatja@google.com, casey.g.bowman@intel.com, matthew.s.atwood@intel.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 18, 2018 at 8:36 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> For some reason I thought GPIOLIB handles translation from GPIO ranges
> to pinctrl pins but it turns out not to be the case. This means that
> when GPIOs operations are performed for a pin controller having a custom
> GPIO base such as Cannon Lake and Ice Lake incorrect pin number gets
> used internally.
>
> Fix this in the same way we did for lock/unlock IRQ operations and
> translate the GPIO number to pin before using it.
>
> Fixes: a60eac3239f0 ("pinctrl: intel: Allow custom GPIO base for pad groups")
> Reported-by: Rajat Jain <rajatja@google.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

I applied this for fixes.

However when merging with devel I get some a merge conflict,
probably due to some cleanups from Andy.

I tried to fix it up (just use your code) but please check the
result.

Yours,
Linus Walleij
