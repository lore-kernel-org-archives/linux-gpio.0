From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: add hogs support for machine code
Date: Thu, 26 Apr 2018 14:13:40 +0200
Message-ID: <CACRpkdbFGXGqjtcyXLmgL=kYFkfR9_s9McrNU1-=bTO7-Wgs0w@mail.gmail.com>
References: <20180410203028.11412-1-brgl@bgdev.pl> <17720832.6ELUnVt0BR@debian64>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <17720832.6ELUnVt0BR@debian64>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 12, 2018 at 10:00 PM, Christian Lamparter
<chunkeey@gmail.com> wrote:

> The problem is that unlike native gpio-controllers, pinctrls need
> to have a "pin/gpio range" defined before any gpio-hogs can be added.

Indeed. But the primary use case (correct me if I am wrong Bartosz)
is to clean up old boardfile code.

Old boardfiles belong to equally old boards. They very often do not
have pin control, just GPIO, and they very often have custom code
that just issue gpio_get(), gpio_* etc to set up hogs.

So this will be able to replace all such boilerplate with some
hog table for each boardfile and be done with it.

I.e. they have only drivers/gpio/gpio-foo.c and no pin control
driver in 9 cases out of 10. Cases do exist where they use
pin control with board files. Those are rare. But they will have
problems.

Some machine descriptor tables are used on modern archs
and the most prominent is x86 Intel. However the Intel pin control
driver is one of those that (IIRC) will actually survive this (i.e. it
doesn not have this bug). They are not even using DT, they
use ACPI.

> So what will happen is that you'll get an
> "gpiochip_machine_hog: unable to hog GPIO line $LABEL $GPIONR -517" error
> for every single gpio-hog and wonder why :(.

Hm maybe we can simply improbe the error messages so
people realize they have to go and fix their pin control driver(s)?

OK maybe a bit whimsical comment from me here... :/

Yours,
Linus Walleij
