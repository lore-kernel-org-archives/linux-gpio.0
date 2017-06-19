From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] pinctrl/amd: Use regular interrupt instead of chained
Date: Mon, 19 Jun 2017 18:13:23 +0200
Message-ID: <20170619161323.pjdrh6l33pqix32x@pd.tnic>
References: <alpine.DEB.2.20.1705232307330.2409@nanos>
 <BLUPR12MB07212D4797B68DB06C3A6D40A0FC0@BLUPR12MB0721.namprd12.prod.outlook.com>
 <alpine.DEB.2.20.1705260841250.1902@nanos>
 <BLUPR12MB0721B0824892B985DC807471A0FC0@BLUPR12MB0721.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BLUPR12MB0721B0824892B985DC807471A0FC0@BLUPR12MB0721.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Xue, Ken" <Ken.Xue@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 26, 2017 at 09:33:10AM +0000, Shah, Nehal-bakulchandra wrote:
> Hi Thomas,
> 
> Thanks  for the prompt reply. Agree on points.
> 
> we will validate at our end and shall provide the update.

Any news on the issue? Resolution?

I still have a user reporting "irq 7: nobody cared (try booting with the
"irqpoll" option)" pointing to amd_gpio_irq_handler(), even with Thomas'
patch.

See https://bugzilla.suse.com/show_bug.cgi?id=1034261

So something's still not completely fine yet.

Thanks.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
