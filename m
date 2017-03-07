From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/2] pinctrl: imx: use generic pinctrl helpers for
 managing groups
Date: Tue, 7 Mar 2017 09:54:48 -0800
Message-ID: <20170307175448.GU20572@atomide.com>
References: <20170102182022.2047-1-gary.bisson@boundarydevices.com>
 <20170102182022.2047-2-gary.bisson@boundarydevices.com>
 <CAOMZO5BKdP+A1JdJxkRXPvZcGGsW2k65nsseDvmFguaM8i18xw@mail.gmail.com>
 <CAAMH-ysO7SWYJ3dWjQODXBDEvfnRf09mefWBeDgeWH=MPSd+Ww@mail.gmail.com>
 <CAOMZO5AXOEFTep17etLyU1avWsDasFF+NAAPcusaMRGMR3nctg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5AXOEFTep17etLyU1avWsDasFF+NAAPcusaMRGMR3nctg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>, Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

* Fabio Estevam <festevam@gmail.com> [170307 09:39]:
> Hi Gary,
> 
> On Tue, Mar 7, 2017 at 2:26 PM, Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
> 
> > No it isn't because of the use of radix but instead of:
> > http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=950b0d91dc10
> >
> > It has been discussed here:
> > https://lkml.org/lkml/2017/2/28/140
> 
> Thanks for the clarification.
> 
> > Tony offered a patch in that thread which works. Tony, have you
> > submitted it yet?
> 
> Looking forward to this one :-)

Still waiting to hear back from Linus on what he prefers.

Regards,

Tony
