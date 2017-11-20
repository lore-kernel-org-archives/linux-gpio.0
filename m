From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: intel-gpio interrupts stop firing with Focaltech I2C-HID touchpad
Date: Mon, 20 Nov 2017 12:32:07 +0200
Message-ID: <20171120103207.GB22431@lahna.fi.intel.com>
References: <20171116130743.GT17200@lahna.fi.intel.com>
 <CAB4CAwcqxBJNnaS9q7S7dy_1GoR5m1VHY89y+8g-G7rXBBJ1hg@mail.gmail.com>
 <20171117091134.GB17200@lahna.fi.intel.com>
 <CAB4CAwdsAXqb-2KQr3s1Z6UBJoBXwrks41qY5S8va=zz3UQ1hA@mail.gmail.com>
 <CAB4CAwfGsjtfZxHVvdyEAooqqK0whJS0MFZSsbm8+E0fi=hJyg@mail.gmail.com>
 <20171117110057.GD17200@lahna.fi.intel.com>
 <CAB4CAwcELV0LWeeBCP9MYt0i=W2sy_Cspwm2vD3K8az+hApQ3g@mail.gmail.com>
 <20171117133518.GF17200@lahna.fi.intel.com>
 <20171117135225.GG17200@lahna.fi.intel.com>
 <CAB4CAweOMHG6M0Bg_oXOVo0XuiKcvQgxO=h6qbdg4ZoskoJS9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAB4CAweOMHG6M0Bg_oXOVo0XuiKcvQgxO=h6qbdg4ZoskoJS9w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: Daniel Drake <drake@endlessm.com>, heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Endless Linux Upstreaming Team <linux@endlessm.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 20, 2017 at 01:18:51PM +0800, Chris Chiu wrote:
> On Fri, Nov 17, 2017 at 9:52 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Fri, Nov 17, 2017 at 03:35:18PM +0200, Mika Westerberg wrote:
> >> > pin 18 (GPIO_18) GPIO 0x40900100 0x00024075
> >
> > Hmm,
> >
> > If I decode 0x40900100 correctly PADCFG0_GPIROUTIOXAPIC (BIT 20) flag is
> > set for the pin. This means the interrupt is routed to IO-APIC instead.
> >
> > Now, we do clear that flag along with the others when the GPIO is
> > requested through gpio_request() but in this case we go through irqchip
> > instead so the flag is not cleared.
> >
> > I wonder if the following patch changes anything?
> >
> > diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> > index 71df0f70b61f..06af096f5768 100644
> > --- a/drivers/pinctrl/intel/pinctrl-intel.c
> > +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> > @@ -939,6 +939,10 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
> >
> >         value &= ~(PADCFG0_RXEVCFG_MASK | PADCFG0_RXINV);
> >
> > +       /* Disable SCI/SMI/NMI generation */
> > +       value &= ~(PADCFG0_GPIROUTIOXAPIC | PADCFG0_GPIROUTSCI);
> > +       value &= ~(PADCFG0_GPIROUTSMI | PADCFG0_GPIROUTNMI);
> > +
> >         if ((type & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
> >                 value |= PADCFG0_RXEVCFG_EDGE_BOTH << PADCFG0_RXEVCFG_SHIFT;
> >         } else if (type & IRQ_TYPE_EDGE_FALLING) {
> 
> It does change after the patch. I didn't have the touchpad stopping
> things after a long time test.
> The INT3452:00/pins under /sys/kernel/debug/pinctrl shows the
> following for GPIO 18.
> pin 18 (GPIO_18) GPIO 0x40800102 0x00024075

Great, thanks for testing!

> Anything else you need from me?

Nope, I'll make a proper patch and send it out this week.
