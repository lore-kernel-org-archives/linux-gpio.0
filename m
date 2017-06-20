From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] pinctrl/amd: Use regular interrupt instead of chained
Date: Tue, 20 Jun 2017 11:22:05 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1706201120190.1869@nanos>
References: <alpine.DEB.2.20.1705232307330.2409@nanos> <BLUPR12MB07212D4797B68DB06C3A6D40A0FC0@BLUPR12MB0721.namprd12.prod.outlook.com> <alpine.DEB.2.20.1705260841250.1902@nanos> <BLUPR12MB0721B0824892B985DC807471A0FC0@BLUPR12MB0721.namprd12.prod.outlook.com>
 <20170619161323.pjdrh6l33pqix32x@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170619161323.pjdrh6l33pqix32x@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>, LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Xue, Ken" <Ken.Xue@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, 19 Jun 2017, Borislav Petkov wrote:

> On Fri, May 26, 2017 at 09:33:10AM +0000, Shah, Nehal-bakulchandra wrote:
> > Hi Thomas,
> > 
> > Thanks  for the prompt reply. Agree on points.
> > 
> > we will validate at our end and shall provide the update.
> 
> Any news on the issue? Resolution?
> 
> I still have a user reporting "irq 7: nobody cared (try booting with the
> "irqpoll" option)" pointing to amd_gpio_irq_handler(), even with Thomas'
> patch.
> 
> See https://bugzilla.suse.com/show_bug.cgi?id=1034261
> 
> So something's still not completely fine yet.

Well, that's kinda expected.

If the interrupt _IS_ screaming because the hardware is buggered, then the
nobody cared thing will detect it and switch it off. That's all what we can
do, aside of not loading the driver at all.

But that's way better than silently locking up the box forever.

Thanks

	tglx
