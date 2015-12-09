From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] gpiolib: tighten up ACPI legacy gpio lookups
Date: Wed, 9 Dec 2015 09:21:33 -0800
Message-ID: <20151209172133.GC27131@dtor-ws>
References: <20151111194530.GA26559@dtor-ws>
 <CACRpkdbXaXzQ38sy9JJGEhx+ix3WzheAsKJqsXum2T9n00YEvA@mail.gmail.com>
 <20151127173721.GC27040@dtor-ws>
 <CACRpkda7fRZ=CB=Ec2iHmA=u9w6T7-WH2RNVvxBS5jL8he77Tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda7fRZ=CB=Ec2iHmA=u9w6T7-WH2RNVvxBS5jL8he77Tg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Johan Hovold <johan@kernel.org>, "Tirdea, Irina" <irina.tirdea@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 09, 2015 at 04:11:30PM +0100, Linus Walleij wrote:
> Hi Dmitry,
> 
> Sorry for me being so damned slow.

Heh, I am not the one to complain about people being slow ;)

> 
> On Fri, Nov 27, 2015 at 6:37 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Tue, Nov 17, 2015 at 02:43:14PM +0100, Linus Walleij wrote:
> >> On Wed, Nov 11, 2015 at 8:45 PM, Dmitry Torokhov
> >> <dmitry.torokhov@gmail.com> wrote:
> >>
> >> > We should not fall back to the legacy unnamed gpio lookup style if the
> >> > driver requests gpios with different names, because we'll give out the same
> >> > gpio twice. Let's keep track of the names that were used for the device and
> >> > only do the fallback for the first name used.
> >> >
> >> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >> > ---
> >> >
> >> > v1: incorporated changes suggested by Mika Westerberg in response to the
> >> > draft patch I posted in Goodix thread.
> >> >
> >> > v2: moved acpi_can_fallback_to_crs body to drivers/gpio/gpiolib-acpi.c
> >> > and provided stub for !CONFIG_ACPI case to fix build error if ACPI is
> >> > disabled.
> >>
> >> Patch applied with Mika's ACK.
> >>
> >> Had to fuzz a bit to make it apply, hope nothing breaks.
> >
> > Hmm, I'd like to get this patch into my tree as well to apply Irina's
> > goodix pieces on top to make sure they do not break. Would it be OK for
> > me to just apply the patch and hope git will sort it out when we merge
> > into next/mainline, you maybe you could prepare a 4.3-based branch with
> > the patch for me to pull?
> 
> I had to fuzz the patch so then you need to get the version I applied out
> of my tree.
> 
> But I'm not going to rebase the tree so you can pull commit
> 9c3c9bc9cc980d8981f75109f3921576daf75723
> from the GPIO tree if you like. Or I can make a tag there if
> you prefer, just tell me.

Both would mean I will end up with parts of your work-in-progress queue,
which I would rather avoid. If you create a branch (lets call it A) off
v4.3 and apply that one patch there and merge branch A it into your main
branch (even though you already have a version of the same patch in your
main branch) and I will merge that branch A into my tree then we are
guaranteed not to have conflicts as git will resolve everything nicely.

Thanks.

-- 
Dmitry
