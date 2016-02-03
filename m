From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 1/3] usb: phy: generic: use forward declarations instead
 of #includes
Date: Wed, 3 Feb 2016 12:46:34 -0600
Message-ID: <20160203184634.GD10879@localhost>
References: <20160202200005.11646.98254.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <20160202200237.11646.40985.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <87io25psit.fsf@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87io25psit.fsf@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Felipe Balbi <balbi@ti.com>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

[-cc Mark]

On Wed, Feb 03, 2016 at 08:18:02PM +0200, Felipe Balbi wrote:
> Bjorn Helgaas <bhelgaas@google.com> writes:
> > In include/linux/usb/usb_phy_generic.h, use a forward declaration for
> > struct gpio_desc instead of including linux/gpio/consumer.h.
> >
> > Of the files that include usb_phy_generic.h, only
> > drivers/usb/phy/phy-generic.c uses the gpiod_*() interfaces from
> > linux/gpio/consumer.h, so include consumer.h explicitly there.
> >
> > This is a little more efficient and ensures that users of the gpiod
> > interfaces include linux/gpio/consumer.h directly rather than getting it
> > accidentally via linux/usb/usb_phy_generic.h.
> >
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> >  drivers/usb/phy/phy-generic.c       |    1 +
> >  include/linux/usb/usb_phy_generic.h |    3 ++-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
> > index 5320cb8..2c1349e 100644
> > --- a/drivers/usb/phy/phy-generic.c
> > +++ b/drivers/usb/phy/phy-generic.c
> > @@ -36,6 +36,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_gpio.h>
> >  #include <linux/gpio.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/delay.h>
> >  
> >  #include "phy-generic.h"
> > diff --git a/include/linux/usb/usb_phy_generic.h b/include/linux/usb/usb_phy_generic.h
> > index c13632d5..45c20060 100644
> > --- a/include/linux/usb/usb_phy_generic.h
> > +++ b/include/linux/usb/usb_phy_generic.h
> > @@ -2,7 +2,8 @@
> >  #define __LINUX_USB_NOP_XCEIV_H
> >  
> >  #include <linux/usb/otg.h>
> > -#include <linux/gpio/consumer.h>
> > +
> > +struct gpio_desc;
> 
> then someone decides to rename struct gpio_desc and this just becomes
> yet another place to fix. Why is this any better than just including the
> header ?

You're right.  The advantage is that the includers of
usb_phy_generic.h that don't use gpiod_*() functions no longer need to
include linux/gpio/consumer.h, so they build faster.  It's a minor
advantage in this case because not very many files include
usb_phy_generic.h.

Bjorn
