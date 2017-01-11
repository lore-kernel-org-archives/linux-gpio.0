From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/3] Renesas RZ PFC and GPIO driver
Date: Wed, 11 Jan 2017 11:35:23 +0100
Message-ID: <20170111103522.GE12030@verge.net.au>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
 <1923903.Gi7z59W6W3@avalon>
 <SG2PR06MB1165EBCB06C5D473CBAC2F218A640@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <2671694.94z5NEauGX@avalon>
 <06e9c953-df81-08f1-a817-730301778e06@jmondi.org>
 <SG2PR06MB1165993554BE4B9A6D9D3EBC8A660@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB1165993554BE4B9A6D9D3EBC8A660@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: jacopo mondi <jacopo@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 11, 2017 at 12:46:31AM +0000, Chris Brandt wrote:
> Hi Jacopo,
> 
> On Tuesday, January 10, 2017, Jacopo Mondi wrote:
> > So, I guess what direction to take depends on whether or not we're going
> > to see more hardware with a per-pin configuration that would benefit from
> > this new rz-pfc driver (it seems so) and if this justify splitting sh-pfc
> > in two, a group-based one for R-Car devices (and all devices there
> > already) and a new pin-based one.
> 
> Well, since I'm the one with the "renesas.com" email address, I'll try to
> see if I can figure out if the R-Car PFC can be changed to something else for
> R-Car Gen4. Same goes for RZ/G. Sometimes the chip designers just keep doing
> the same thing over and over again because they don't get any feedback from
> the SW guys.
> 
> 
> > Or maybe we can tie pin-based configuration in sh-pfc and it's me not
> > seeing how to do that.
> 
> At some point....we do need to leave the "sh-" name behind as I don't really
> see much of a future for SH4 devices. Using something like pinctrl-renesas
> is probably a better name. Although, anyone who's watched the semiconductor
> business over the years knows that names never stay the same. (sigh)

FWIW I agree "renesas-" makes more sense than "sh-" for all Renesas ARM
based SoCs.
