From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/2] pinctrl: imx: use generic pinctrl helpers for
 managing groups
Date: Thu, 30 Mar 2017 08:05:02 -0700
Message-ID: <20170330150501.GE10760@atomide.com>
References: <20170102182022.2047-1-gary.bisson@boundarydevices.com>
 <20170102182022.2047-2-gary.bisson@boundarydevices.com>
 <CAOMZO5BKdP+A1JdJxkRXPvZcGGsW2k65nsseDvmFguaM8i18xw@mail.gmail.com>
 <CAAMH-ysO7SWYJ3dWjQODXBDEvfnRf09mefWBeDgeWH=MPSd+Ww@mail.gmail.com>
 <CAOMZO5AXOEFTep17etLyU1avWsDasFF+NAAPcusaMRGMR3nctg@mail.gmail.com>
 <20170307175448.GU20572@atomide.com>
 <CACRpkdb1O9=xZ-sVVh1AzmW8oknQyNAW=LirtX1CEA=pkCbA1g@mail.gmail.com>
 <CAOMZO5Dyu1tgKqbpbxUHjDMswJn-adDvm-FWWb6NDQO0b1kRJg@mail.gmail.com>
 <CACRpkdZ_a7YqkoM+oFettCq2h8RRnW3GSeOBbVkRACR6fcxnrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZ_a7YqkoM+oFettCq2h8RRnW3GSeOBbVkRACR6fcxnrg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Fabio Estevam <festevam@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Gary Bisson <gary.bisson@boundarydevices.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [170330 02:08]:
> On Wed, Mar 29, 2017 at 3:33 PM, Fabio Estevam <festevam@gmail.com> wrote:
> > Tony/Linus
> >
> > On Wed, Mar 15, 2017 at 6:46 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> >>> Still waiting to hear back from Linus on what he prefers.
> >>
> >> I am snowed under by mail and might be missing stuff at the
> >> moment...
> >>
> >> If there is some especially urgent fix patch I need to look into
> >> can you please point it out?
> >
> > Has this issue been solved in linux-next? Still seeing this regression
> > in 4.11-rc4.
> 
> I'm a bit relying on others to test and supply patches here,
> if Tony's patch works for you you can send it with your
> own Signed-off-by and suggest that I merge it.

I'll send a patch for testing shortly.

Regards,

Tony
