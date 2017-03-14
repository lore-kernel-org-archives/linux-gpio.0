From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: Re: [PATCH] fix pinctrl setup for i.IMX6
Date: Tue, 14 Mar 2017 15:55:27 +0100
Message-ID: <20170314145527.q53qh7yzm2x4zksf@t450s.lan>
References: <d217e26e-9b5c-7b01-67e2-017293ca1407@nextfour.com>
 <CACRpkdZ6=1U6cDdPr64aDFDizHfzzAPOeNKwQy5Z0nRpB=jLjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:35987 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752424AbdCNOzo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2017 10:55:44 -0400
Received: by mail-wm0-f51.google.com with SMTP id n11so66018186wma.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2017 07:55:33 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACRpkdZ6=1U6cDdPr64aDFDizHfzzAPOeNKwQy5Z0nRpB=jLjw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika =?iso-8859-1?Q?Penttil=E4?= <mika.penttila@nextfour.com>, ext Tony Lindgren <tony@atomide.com>, Stefan Agner <stefan@agner.ch>, Shawn Guo <shawnguo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

On Tue, Mar 14, 2017 at 03:47:58PM +0100, Linus Walleij wrote:
> On Tue, Feb 28, 2017 at 7:00 AM, Mika Penttilä
> <mika.penttila@nextfour.com> wrote:
> 
> > Recent pulls for mainline pre 4.11 introduced pinctrl setup changes and moved pinctrl-imx to
> > use generic helpers.
> >
> > Net effect was that hog group could not be resolved. I made it work for myself
> > with a two stage setup with create and start separated, and dt probe in between them.
> >
> >
> > Signed-off-by: Mika Penttilä <mika.penttila@nextfour.com>
> 
> Sorry for including the whole mail body, some people may have missed the
> mail. Notably the i.MX maintainers.
> 
> Your patch reminds me of the pinctrl_register() vs pinctrl_register_and_init()
> introduced by Tony Lindgren, can you look into this in commit
> 950b0d91dc108f54bccca5a2f75bb46f2df63d29
> "pinctrl: core: Fix regression caused by delayed work for hogs"?
> 
> Does switching pinctrl_register_and_init() back to pinctrl_register()
> solve your problem?
> 
> Gary: have you seen any problem like this?

Yes, Mika brought it up as soon as the first 4.11-rc appeared and indeed
this issue can be reproduced on any i.MX6 platform.

Then Tony offered a patch but you haven't replied to him yet:
https://lkml.org/lkml/2017/2/28/140

Regards,
Gary
