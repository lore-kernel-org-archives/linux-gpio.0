From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/5] pinctrl: imx: add soc specific mux_mode mask and
 shift property
Date: Mon, 15 May 2017 18:59:07 +0800
Message-ID: <20170515105906.GO8471@dragon>
References: <1494592686-30967-1-git-send-email-aisheng.dong@nxp.com>
 <1494592686-30967-3-git-send-email-aisheng.dong@nxp.com>
 <20170515085236.GM8471@dragon>
 <AM3PR04MB306F70328E49CB7EE68E2C380E10@AM3PR04MB306.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933365AbdEOK7c (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 May 2017 06:59:32 -0400
Content-Disposition: inline
In-Reply-To: <AM3PR04MB306F70328E49CB7EE68E2C380E10@AM3PR04MB306.eurprd04.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "A.S. Dong" <aisheng.dong@nxp.com>
Cc: Andy Duan <fugang.duan@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "stefan@agner.ch" <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, May 15, 2017 at 09:00:32AM +0000, A.S. Dong wrote:
> > > @@ -432,7 +432,7 @@ static int imx_pinconf_get(struct pinctrl_dev
> > *pctldev,
> > >  	*config = readl(ipctl->base + pin_reg->conf_reg);
> > >
> > >  	if (info->flags & SHARE_MUX_CONF_REG)
> > > -		*config &= 0xffff;
> > > +		*config &= ~info->mux_mask;
> > 
> > It changes the way how code works.  We need a note in the commit log
> > explaining why it's safe.
> > 
> 
> Well, that's Vybrid tricks that BIT[15-0] are all configs part.
> So it hardcoded 0xffff there.
> 
> But it's not true in ULP, so use mux_mask instead to address
> the difference.

So you make the assumption that for all SHARE_MUX_CONF_REG SoCs, all
bits in the register except mux ones are config bits.  You at least need
to mention that in the commit log, IMO.

Shawn
