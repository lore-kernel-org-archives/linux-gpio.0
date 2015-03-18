From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] pinctrl: dt-binding: fix generic pinmux/pinconf examples
Date: Wed, 18 Mar 2015 14:25:17 +0200
Message-ID: <20150318122517.GE7221@tarshish>
References: <b6effc6c0cb6b9488145b873dc01fcba2a4cd1df.1426402515.git.baruch@tkos.co.il>
 <CACRpkdbwPyuthWPswEY_BX5N=nFAgA+0A-tnW=dFT2zRC0XR6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:56493 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756326AbbCRMZW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 18 Mar 2015 08:25:22 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbwPyuthWPswEY_BX5N=nFAgA+0A-tnW=dFT2zRC0XR6A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

On Wed, Mar 18, 2015 at 01:16:00PM +0100, Linus Walleij wrote:
> On Sun, Mar 15, 2015 at 7:55 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > pinconf_generic_dt_node_to_map() scans only subnodes of the pinctrl-0 
> > pahndle, not the referenced node itself. Change the example nodes to 
> > match.
> >
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Patch applied...
> 
> >  state_0_node_a {
> > -       function = "uart0";
> > -       groups = "u0rxtx", "u0rtscts";
> > +       uart0 {
> > +               function = "uart0";
> > +               groups = "u0rxtx", "u0rtscts";
> > +       };
> >  };
> >  state_1_node_a {
> > -       function = "spi0";
> > -       groups = "spi0pins";
> > +       spi0 {
> > +               function = "spi0";
> > +               groups = "spi0pins";
> > +       };
> >  };
> 
> But that is a bit insane. We should fix the parsing code to handle
> either case instead.

OK. I'll take a look into this tomorrow.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
