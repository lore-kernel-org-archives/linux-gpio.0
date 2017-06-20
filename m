From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] pinctrl/amd: Use regular interrupt instead of chained
Date: Tue, 20 Jun 2017 11:29:33 +0200
Message-ID: <20170620092933.m4pbbjcpw4zjas3i@pd.tnic>
References: <alpine.DEB.2.20.1705232307330.2409@nanos>
 <BLUPR12MB07212D4797B68DB06C3A6D40A0FC0@BLUPR12MB0721.namprd12.prod.outlook.com>
 <alpine.DEB.2.20.1705260841250.1902@nanos>
 <BLUPR12MB0721B0824892B985DC807471A0FC0@BLUPR12MB0721.namprd12.prod.outlook.com>
 <20170619161323.pjdrh6l33pqix32x@pd.tnic>
 <alpine.DEB.2.20.1706201120190.1869@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1706201120190.1869@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>, LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Xue, Ken" <Ken.Xue@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 20, 2017 at 11:22:05AM +0200, Thomas Gleixner wrote:
> If the interrupt _IS_ screaming because the hardware is buggered, then the
> nobody cared thing will detect it and switch it off. That's all what we can
> do, aside of not loading the driver at all.
> 
> But that's way better than silently locking up the box forever.

Sounds to me we should route this fix to stable.

Looking at Linus' branch:

https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?h=fixes&id=ba714a9c1dea85e0bf2899d02dfeb9c70040427c

patch isn't tagged for stable.

Should it be?

It certainly is an improvement of the situation.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
