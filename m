From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 1/3] pinctrl: mcp23s08: fix debugfs entry for mcp23s18
 device
Date: Thu, 27 Sep 2018 14:31:31 +0200
Message-ID: <20180927123131.mu67egnvz426vhm7@pengutronix.de>
References: <20180925145616.12610-1-m.felsch@pengutronix.de>
 <20180925145616.12610-2-m.felsch@pengutronix.de>
 <02d7e7b6-6dd4-1f3d-eeaa-07e38b427428@electromag.com.au>
 <20180926094225.xpm4mkxlmkjg2d5x@pengutronix.de>
 <252ce4f2-ccd2-2983-0a28-103801eeb21c@electromag.com.au>
 <20180927085511.uarkv4kkou4crr3e@pengutronix.de>
 <3cc5ba12-5296-4c80-8e54-eab13f43823a@cesnet.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3cc5ba12-5296-4c80-8e54-eab13f43823a@cesnet.cz>
Sender: stable-owner@vger.kernel.org
To: Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, Phil Reid <preid@electromag.com.au>, stable@vger.kernel.org, kernel@pengutronix.de
List-Id: linux-gpio@vger.kernel.org

On 18-09-27 12:54, Jan Kundrát wrote:
> On čtvrtek 27. září 2018 10:55:11 CEST, Marco Felsch wrote:
> > Hi Phil,
> > 
> > On 18-09-27 09:45, Phil Reid wrote:
> > > On 26/09/2018 5:42 PM, Marco Felsch wrote:
> > > > On 18-09-26 07:55, Phil Reid wrote: ...
> > > G'day Marco,
> > > 
> > > Sorry I still don't follow.
> > > I've got a mcp23s18 in one of my systems and debugfs seems to work fine.
> > > 
> > > one_regmap_config is only used for the S08/S17 to fiddle with the
> > > name / label
> > 
> > I know, but if I read the code correctly it shouldn't work, because in
> > your case one_regmap_config is never modified, as you told. But it is
> > initialized to NULL. This confuses me a bit.
> > 
> > This tested should not be made for the MCP_TYPE_S18 case.

Hi Jan,

> 
> Ah, right. This means that the stable tree(s) need this follow-up patch from
> February, too:
> 
>  https://patchwork.ozlabs.org/patch/875045/
> 
> Thanks for catching this.

Okay, so we can drop this patch too. Can you give me some feedback for
patch "pinctrl: mcp23s08: fix irq and irqchip setup order"?

Kind regards,
Marco

> 
> With kind regards,
> Jan
> 
> 
