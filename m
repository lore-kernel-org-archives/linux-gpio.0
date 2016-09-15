From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: lockdep: incorrect deadlock warning with two GPIO expanders
Date: Thu, 15 Sep 2016 09:51:50 +0200
Message-ID: <20160915075150.GO5008@twins.programming.kicks-ass.net>
References: <CAMpxmJUuj5VrzEu4YZUVxr-ZqFU4VGJpjyHimMJug23EC7j=sQ@mail.gmail.com>
 <20160912120938.GR10153@twins.programming.kicks-ass.net>
 <CAMpxmJW5WNF2zE+fjmpDxubAYA_A67iQhNGTvSAL-MD-6dFTCw@mail.gmail.com>
 <20160912153356.GD10121@twins.programming.kicks-ass.net>
 <CACRpkdb00e=YexmCRwv=evVLjBDM6Pjqtcs+Mnc8JVD1Ssa5mA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb00e=YexmCRwv=evVLjBDM6Pjqtcs+Mnc8JVD1Ssa5mA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Alexandre Courbot <gnurou@gmail.com>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 13, 2016 at 02:29:24PM +0200, Linus Walleij wrote:
> On Mon, Sep 12, 2016 at 5:33 PM, Peter Zijlstra <peterz@infradead.org> wrote:
> > On Mon, Sep 12, 2016 at 05:16:14PM +0200, Bartosz Golaszewski wrote:
> 
> >> AFAIK there is no clean way to tell that a GPIO is used by an I2C
> >> multiplexer at probe time. Linus, Alexandre could you confirm?
> 
> Nominally, the GPIO descriptors are just abstract resources such
> as regulators or clocks, they can be used for a lot but just like
> a clock, regulator, dma channel etc does not know who is using
> it and for what, it does not know this, no.
> 
> > You cannot inspect the device tree while probing?
> 
> Of course it *can* but we would end up encoding a special
> case every time something like this happens, tied to just
> device tree, then another bolt-on for ACPI etc.
> 
> I have a hard time following the problem really, I'm
> afraid I'm simply just not smart enough :(

Why would this be DT or ACPI specific? Linux itself has a tree/graph of
all busses and devices right? That's what all this drivers/base/ stuff
is on about.

So can't you walk up that and see if you encounter the exact same driver
again?

Something like:

	for (nr = 0, parent = dev->parent; parent; parent = parent->parent) {
		if (parent->device_driver == &pca953x_driver.driver)
			nr++;
	}

Again, I have no clue how any of this works, but that seems like
something that ought to work.
