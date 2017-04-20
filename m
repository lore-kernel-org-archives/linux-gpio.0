From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Add group for AVB MDIO and MII pins
Date: Thu, 20 Apr 2017 14:44:43 +0300
Message-ID: <5295991.u29V8BK3nd@avalon>
References: <1492681746-20005-1-git-send-email-geert+renesas@glider.be> <2338736.vqmUpXt7la@avalon> <CAMuHMdWEMOXctK6F6fXeO+Y3S4_tkikJYUf=bA9u5yofD5ciQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWEMOXctK6F6fXeO+Y3S4_tkikJYUf=bA9u5yofD5ciQw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Geert,

On Thursday 20 Apr 2017 13:37:27 Geert Uytterhoeven wrote:
> On Thu, Apr 20, 2017 at 12:18 PM, Laurent Pinchart wrote:
> > On Thursday 20 Apr 2017 12:11:41 Geert Uytterhoeven wrote:
> >> On Thu, Apr 20, 2017 at 12:02 PM, Laurent Pinchart wrote:
> >>> On Thursday 20 Apr 2017 11:49:06 Geert Uytterhoeven wrote:
> >>>> Group the AVB pins into similar groups as found in other sh-pfc
> >>>> drivers. The pins can not be muxed between functions other than AVB,
> >>>> but their drive strengths can be controlled.
> >>>> 
> >>>> The group avb_mdc containing ADV_MDC and ADV_MDIO is called avb_mdio
> >>>> on other SoCs. In pfc-r8a7796 the avb_mdc group already existed and is
> >>>> in use in DT. Therefore add the ADV_MDIO pin to the existing group
> >>>> instead of renaming it.
> >>> 
> >>> This clearly shows that we need a few kernel releases to test
> >>> PFC-related code and DT before we can commit to an ABI. How do you
> >>> think we should handle this ?
> >> 
> >> That's a difficult question 
> >> 
> >> For now I'd like to treat R-Car M3-W the same as H3.
> > 
> > I still believe we should introduce some kind of unstable period for DT
> > bindings, during which they will be merged in mainline but still subject
> > to modification. It could just be a few kernel releases.
> 
> Like, from v4.4 (when avb_mdc was added for H3) until v4.12 (earliest
> we can correct this)?

Sorry, I misread you, I thought that H3 named the group mdio (you might want 
to clarify this in the commit message). I was referring to when M3 PFC support 
was introduced, which was v4.10, so that's just two releases. We obviously 
can't rename mdc to mdio on H3 if we want to keep backward compatibility.

-- 
Regards,

Laurent Pinchart
