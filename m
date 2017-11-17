From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: intel-gpio interrupts stop firing with Focaltech I2C-HID touchpad
Date: Fri, 17 Nov 2017 15:52:25 +0200
Message-ID: <20171117135225.GG17200@lahna.fi.intel.com>
References: <20171116115244.GQ17200@lahna.fi.intel.com>
 <CAD8Lp46fz-80hsOY1b4BFSHrr15Pk8nhYbaFh7MA0hquVSSc4g@mail.gmail.com>
 <20171116130743.GT17200@lahna.fi.intel.com>
 <CAB4CAwcqxBJNnaS9q7S7dy_1GoR5m1VHY89y+8g-G7rXBBJ1hg@mail.gmail.com>
 <20171117091134.GB17200@lahna.fi.intel.com>
 <CAB4CAwdsAXqb-2KQr3s1Z6UBJoBXwrks41qY5S8va=zz3UQ1hA@mail.gmail.com>
 <CAB4CAwfGsjtfZxHVvdyEAooqqK0whJS0MFZSsbm8+E0fi=hJyg@mail.gmail.com>
 <20171117110057.GD17200@lahna.fi.intel.com>
 <CAB4CAwcELV0LWeeBCP9MYt0i=W2sy_Cspwm2vD3K8az+hApQ3g@mail.gmail.com>
 <20171117133518.GF17200@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:49704 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756840AbdKQNwa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Nov 2017 08:52:30 -0500
Content-Disposition: inline
In-Reply-To: <20171117133518.GF17200@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: Daniel Drake <drake@endlessm.com>, heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Endless Linux Upstreaming Team <linux@endlessm.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>

On Fri, Nov 17, 2017 at 03:35:18PM +0200, Mika Westerberg wrote:
> > pin 18 (GPIO_18) GPIO 0x40900100 0x00024075

Hmm,

If I decode 0x40900100 correctly PADCFG0_GPIROUTIOXAPIC (BIT 20) flag is
set for the pin. This means the interrupt is routed to IO-APIC instead.

Now, we do clear that flag along with the others when the GPIO is
requested through gpio_request() but in this case we go through irqchip
instead so the flag is not cleared.

I wonder if the following patch changes anything?

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 71df0f70b61f..06af096f5768 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -939,6 +939,10 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
 
 	value &= ~(PADCFG0_RXEVCFG_MASK | PADCFG0_RXINV);
 
+	/* Disable SCI/SMI/NMI generation */
+	value &= ~(PADCFG0_GPIROUTIOXAPIC | PADCFG0_GPIROUTSCI);
+	value &= ~(PADCFG0_GPIROUTSMI | PADCFG0_GPIROUTNMI);
+
 	if ((type & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
 		value |= PADCFG0_RXEVCFG_EDGE_BOTH << PADCFG0_RXEVCFG_SHIFT;
 	} else if (type & IRQ_TYPE_EDGE_FALLING) {
