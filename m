From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Interrupt storm from pinctrl-amd on Acer AN515-42
Date: Tue, 8 Jan 2019 16:01:33 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1901081558460.10743@nanos.tec.linutronix.de>
References: <4085fc648ff5086bd6e6237d74d2a11e945a617b.camel@gmail.com> <CACRpkdaDT9xZe6r3pJvYqubrvHh4+PkV8D38yYMEbv8fhdHMKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaDT9xZe6r3pJvYqubrvHh4+PkV8D38yYMEbv8fhdHMKQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Leonard Crestez <cdleonard@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Kurtz <djkurtz@chromium.org>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Daniel Drake <drake@endlessm.com>, Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, 28 Dec 2018, Linus Walleij wrote:

> On Fri, Dec 28, 2018 at 12:02 AM Leonard Crestez <cdleonard@gmail.com> wrote:
> 
> > Digging a little deeper it seems the touchpad interrupt is active on
> > boot and since it's configured as "level" and no touchpad driver is
> > available yet there does not seem to be any way to clear it.
> 
> I think these are called "spurious interrupts".
> 
> > I don't know how this should be handled, booting with an active enabled but
> > unclearable interrupt seems like a platform bug to me. There is even an
> > option to set touchpad to "basic" which does some sort of ps2 emulation
> > but the IRQ issue still happens!
> >
> > One workaround is to explicitly disable the interrupt from the handler
> > if no mapping is found; this will keep it disabled until
> > amd_gpio_irq_set_type is called later.
> 
> I don't know how x86 and ACPI systems usually deal with this stuff
> so I'm kind of lost. On the embedded systems that I develop on,
> I would just disable all interrupts on probe() (usually writing 0x0 in
> some interrupt enable register) and then they will get enabled
> once consumers need them.

That's the right thing to do.

> But I have come to understand that maybe ACPI systems are
> not so happy about drivers doing things like that?

Each driver has to invoke a request_irq() variant, which enables the
interrupt line. So there should be no problem when disabling all interrupts
on probe.

Thanks,

	tglx
