From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] pinctrl: sh-pfc: Use ARCH_RENESAS
Date: Thu, 25 Feb 2016 18:39:46 +0900
Message-ID: <20160225093945.GA28141@verge.net.au>
References: <1456361514-18765-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdX+O2bUscyOz8bt91i3cX+w26WHuC8McBaB+uW-Zptv_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdX+O2bUscyOz8bt91i3cX+w26WHuC8McBaB+uW-Zptv_w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 25, 2016 at 08:55:33AM +0100, Geert Uytterhoeven wrote:
> On Thu, Feb 25, 2016 at 1:51 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Make use of ARCH_RENESAS in place of ARCH_SHMOBILE.
> >
> > This is part of an ongoing process to migrate from ARCH_SHMOBILE to
> > ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
> > appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Depending on whether important patches arrive for sh-pfc, I will queue this for
> v4.6 or v4.7. Is that OK for you?

Yes, either is fine for me.
