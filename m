From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio: mockup: use device properties instead of
 platform_data
Date: Tue, 25 Sep 2018 12:03:21 +0300
Message-ID: <20180925090321.GX2664@lahna.fi.intel.com>
References: <20180923111727.10378-1-brgl@bgdev.pl>
 <CAMRc=MfZ8jRZHgXBq9TeYm5VpmLzwG7gF-NMYay9Zg-iEgFQDQ@mail.gmail.com>
 <CACRpkdb7zKfa_e6WWHncg+gxGncsC_Bx7gpkhJyutH4tqJRkew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb7zKfa_e6WWHncg+gxGncsC_Bx7gpkhJyutH4tqJRkew@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Bamvor Jian Zhang <bamv2005@gmail.com>, vincent.whitchurch@axis.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 25, 2018 at 10:53:30AM +0200, Linus Walleij wrote:
> On Mon, Sep 24, 2018 at 9:35 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > niedz., 23 wrz 2018 o 13:17 Bartosz Golaszewski <brgl@bgdev.pl> napisał(a):
> > >
> > > Some users want to introduce device tree support to the mockup driver.
> > > Let's make it easier by switching to using generic device properties.
> > > The driver stays compatible with previous use cases and after this
> > > conversion there'll be no need to change the way probing of mockup
> > > GPIO chips works.
> > >
> > > Tested with libgpiod test suite.
> > >
> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> (...)
> > Linus, I just noticed that we either need to drop the check for
> > -ENOENT or add an else that returns on any other error. I'll need to
> > send a v2
> 
> OK business as usual.
> 
> > but I'll let you first tell me if you like the general idea.
> 
> I don't know, I'm a bit ignorant about the idea, scope and
> ambition with device properties.
> 
> In my book this relates to the fwnode concept, but maybe
> I'm wrong?

I think you are right.

> Mika, please fill us in here. The device properties in gpiolib
> came in the patch
> "gpio: Rework of_gpiochip_set_names() to use device property accessors"

I'm not sure what to answer to be honest :) The idea behind that patch
was that we would be able to use the same properties (DT properties,
ACPI _DSD properties, or possibly built-in properties) to set names for
GPIOs.
