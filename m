From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/5] pinctrl: imx: add generic pin config core support
Date: Mon, 15 May 2017 18:56:16 +0800
Message-ID: <20170515105615.GN8471@dragon>
References: <1494592686-30967-1-git-send-email-aisheng.dong@nxp.com>
 <1494592686-30967-2-git-send-email-aisheng.dong@nxp.com>
 <20170515083500.GL8471@dragon>
 <AM3PR04MB3067B92ED9E3D62153536F880E10@AM3PR04MB306.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752872AbdEOK4l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 May 2017 06:56:41 -0400
Content-Disposition: inline
In-Reply-To: <AM3PR04MB3067B92ED9E3D62153536F880E10@AM3PR04MB306.eurprd04.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "A.S. Dong" <aisheng.dong@nxp.com>
Cc: Andy Duan <fugang.duan@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "stefan@agner.ch" <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, May 15, 2017 at 08:56:18AM +0000, A.S. Dong wrote:
> > > @@ -489,17 +547,29 @@ static int imx_pinctrl_parse_groups(struct
> > device_node *np,
> > >  		pin_size = SHARE_FSL_PIN_SIZE;
> > >  	else
> > >  		pin_size = FSL_PIN_SIZE;
> > > +
> > > +	if (info->generic_pinconf)
> > > +		pin_size -= 4;
> > > +
> > >  	/* Initialise group */
> > >  	grp->name = np->name;
> > >
> > >  	/*
> > > -	 * the binding format is fsl,pins = <PIN_FUNC_ID CONFIG ...>,
> > > +	 * the binding format is pins = <PIN_FUNC_ID CONFIG ...>,
> > 
> > This is not correct for generic pinconf bindings.  CONIFIG shouldn't be
> > there.
> > 
> 
> Yes, that's for legacy stuff.

If that's for legacy bindings, you shouldn't change 'fsl,pins' to
'pins', right?

Shawn
