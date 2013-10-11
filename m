From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio/lynxpoint: check if the interrupt is enabled in IRQ
 handler
Date: Fri, 11 Oct 2013 14:09:40 +0300
Message-ID: <20131011110940.GO3521@intel.com>
References: <1380638143-20040-1-git-send-email-mika.westerberg@linux.intel.com>
 <CACRpkda=C3+pkVsVbZAkasxyWGedNsb7oAKTt4ApnJ4Q+k9BCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda=C3+pkVsVbZAkasxyWGedNsb7oAKTt4ApnJ4Q+k9BCw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 11, 2013 at 12:57:37PM +0200, Linus Walleij wrote:
> On Tue, Oct 1, 2013 at 4:35 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
> > Checking LP_INT_STAT is not enough in the interrupt handler because its
> > contents get updated regardless of whether the pin has interrupt enabled or
> > not. This causes the driver to loop forever for GPIOs that are pulled up.
> >
> > Fix this by checking the interrupt enable bit for the pin as well.
> >
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Patch applied for fixes with Mathias ACK.

Thanks!

> Should this be tagged for -stable as well?

Yes, please. I think starting from 3.9 when this driver was merged.
