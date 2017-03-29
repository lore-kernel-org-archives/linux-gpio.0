From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/2] pinctrl: imx: use generic pinctrl helpers for
 managing groups
Date: Wed, 29 Mar 2017 09:26:04 -0700
Message-ID: <20170329162604.GC10760@atomide.com>
References: <20170102182022.2047-1-gary.bisson@boundarydevices.com>
 <20170102182022.2047-2-gary.bisson@boundarydevices.com>
 <CAOMZO5BKdP+A1JdJxkRXPvZcGGsW2k65nsseDvmFguaM8i18xw@mail.gmail.com>
 <CAAMH-ysO7SWYJ3dWjQODXBDEvfnRf09mefWBeDgeWH=MPSd+Ww@mail.gmail.com>
 <CAOMZO5AXOEFTep17etLyU1avWsDasFF+NAAPcusaMRGMR3nctg@mail.gmail.com>
 <20170307175448.GU20572@atomide.com>
 <CACRpkdb1O9=xZ-sVVh1AzmW8oknQyNAW=LirtX1CEA=pkCbA1g@mail.gmail.com>
 <CAOMZO5Dyu1tgKqbpbxUHjDMswJn-adDvm-FWWb6NDQO0b1kRJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:42636 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752489AbdC2Q0J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Mar 2017 12:26:09 -0400
Content-Disposition: inline
In-Reply-To: <CAOMZO5Dyu1tgKqbpbxUHjDMswJn-adDvm-FWWb6NDQO0b1kRJg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Gary Bisson <gary.bisson@boundarydevices.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Mika =?utf-8?B?UGVudHRpbMOk?= <mika.penttila@nextfour.com>

* Fabio Estevam <festevam@gmail.com> [170329 06:36]:
> Tony/Linus
> 
> On Wed, Mar 15, 2017 at 6:46 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> >> Still waiting to hear back from Linus on what he prefers.
> >
> > I am snowed under by mail and might be missing stuff at the
> > moment...
> >
> > If there is some especially urgent fix patch I need to look into
> > can you please point it out?
> 
> Has this issue been solved in linux-next? Still seeing this regression
> in 4.11-rc4.

Yeah I was wondering about that too. We discussed using Mika's patch
[0] but with minor changes [1]. But we have not heard back from Mika,
I wonder if he is travelling or something?

Would be nice to get this regression fixed.

Regards,

Tony

[0] https://lkml.org/lkml/2017/2/28/24
[1] https://lkml.org/lkml/2017/3/16/285
