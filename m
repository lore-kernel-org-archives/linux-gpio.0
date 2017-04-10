From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/2] gpio: Add a driver for Cadence GPIO controller
Date: Mon, 10 Apr 2017 15:26:10 +0200
Message-ID: <20170410152610.58bc589a@bbrezillon>
References: <1490803459-29697-1-git-send-email-boris.brezillon@free-electrons.com>
        <CACRpkdZ6w_tuzSNmFE=2BpeASNOSq0cV4fYM6F8-57Q2+3n-aQ@mail.gmail.com>
        <20170330132946.41314874@bbrezillon>
        <3422ee23-53b5-8d09-2a5e-d700358ab09d@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3422ee23-53b5-8d09-2a5e-d700358ab09d@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Hatliff <hatliff@cadence.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, 30 Mar 2017 18:26:01 +0100
Simon Hatliff <hatliff@cadence.com> wrote:

> Hi Boris, Linus,
> 
> On 30/03/17 12:29, Boris Brezillon wrote:
> > Hi Linus,
> >
> > On Thu, 30 Mar 2017 11:03:45 +0200
> > Linus Walleij <linus.walleij@linaro.org> wrote:
> >  
> >> On Wed, Mar 29, 2017 at 6:04 PM, Boris Brezillon
> >> <boris.brezillon@free-electrons.com> wrote:
> >>  
> >>> Add a driver for Cadence GPIO controller.  
> >> IIUC Cadence do a lot of things. Are there variants of this controller?  
> > I'll let Simon answer that one.  
> This is a controller that has been around since 2000.  It is not 
> configurable in any way, so there are no variants.  Cadence do not offer 
> any other GPIO controllers as IP.
> >>> +static irqreturn_t cdns_gpio_irq_handler(int irq, void *dev)
> >>> +{
> >>> +       struct cdns_gpio_chip *cgpio = dev;
> >>> +       unsigned long status;
> >>> +       int hwirq;
> >>> +
> >>> +       /*
> >>> +        * FIXME: If we have an edge irq that is masked we might lose it
> >>> +        * since reading the STATUS register clears all IRQ flags.
> >>> +        * We could store the status of all masked IRQ in the cdns_gpio_chip
> >>> +        * struct but we then have no way to re-trigger the interrupt when
> >>> +        * it is unmasked.
> >>> +        */  
> >> It is marked FIXME but do you think it can even be fixed? It seems
> >> like a hardware flaw. :(  
> > Maybe not. Unless Simon comes up with a magic register to re-trigger an
> > interrupt :-).  
> There are no plans to update the controller.

Linus, what should I do here? Drop support for edge interrupts?
