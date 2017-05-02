From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Add group for AVB MDIO and MII
 pins
Date: Tue, 2 May 2017 16:33:50 +0200
Message-ID: <20170502143350.GM1532@bigcity.dyn.berto.se>
References: <1492681746-20005-1-git-send-email-geert+renesas@glider.be>
 <2338736.vqmUpXt7la@avalon>
 <CAMuHMdWEMOXctK6F6fXeO+Y3S4_tkikJYUf=bA9u5yofD5ciQw@mail.gmail.com>
 <5295991.u29V8BK3nd@avalon>
 <CAMuHMdVvdDqo7yxGBc9L7iF4ZVRYNEFFmzuzU75t4+hXZpSUWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVvdDqo7yxGBc9L7iF4ZVRYNEFFmzuzU75t4+hXZpSUWA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Geert and Laurent,

On 2017-04-20 13:47:19 +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Thu, Apr 20, 2017 at 1:44 PM, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Thursday 20 Apr 2017 13:37:27 Geert Uytterhoeven wrote:
> >> On Thu, Apr 20, 2017 at 12:18 PM, Laurent Pinchart wrote:
> >> > On Thursday 20 Apr 2017 12:11:41 Geert Uytterhoeven wrote:
> >> >> On Thu, Apr 20, 2017 at 12:02 PM, Laurent Pinchart wrote:
> >> >>> On Thursday 20 Apr 2017 11:49:06 Geert Uytterhoeven wrote:
> >> >>>> Group the AVB pins into similar groups as found in other 
> >> >>>> sh-pfc
> >> >>>> drivers. The pins can not be muxed between functions other than AVB,
> >> >>>> but their drive strengths can be controlled.
> >> >>>>
> >> >>>> The group avb_mdc containing ADV_MDC and ADV_MDIO is called avb_mdio
> >> >>>> on other SoCs. In pfc-r8a7796 the avb_mdc group already existed and is
> >> >>>> in use in DT. Therefore add the ADV_MDIO pin to the existing group
> >> >>>> instead of renaming it.
> >> >>>
> >> >>> This clearly shows that we need a few kernel releases to test
> >> >>> PFC-related code and DT before we can commit to an ABI. How do you
> >> >>> think we should handle this ?
> >> >>
> >> >> That's a difficult question
> >> >>
> >> >> For now I'd like to treat R-Car M3-W the same as H3.
> >> >
> >> > I still believe we should introduce some kind of unstable period for DT
> >> > bindings, during which they will be merged in mainline but still subject
> >> > to modification. It could just be a few kernel releases.
> >>
> >> Like, from v4.4 (when avb_mdc was added for H3) until v4.12 (earliest
> >> we can correct this)?
> >
> > Sorry, I misread you, I thought that H3 named the group mdio (you might want
> > to clarify this in the commit message). I was referring to when M3 PFC support
> 
> Sorry, this was a bit unclear (I reused the description from the H3 patch).
> This was actually referring to R-Car Gen2. Will fix.
> 
> > was introduced, which was v4.10, so that's just two releases. We obviously
> > can't rename mdc to mdio on H3 if we want to keep backward compatibility.
> 
> And because of pin-compatibility and board sharing of H3 and M3-W, I
> want both to use identical group naming.

I also think it's a benefit if the group names are identical on H3 and 
M3-W. And I think it is unfortunate that the name do not match Gen2 
naming.

When adding the pins to r8a7795 I thought of instead adding AVB_MDIO to 
the group avb_mdc add a new group with the Gen2 naming (avb_mdio) and 
add both AVB_MDC and AVB_MDIO to this group but still also keep the 
group avb_mdc. If I had done that it would be compatible with Gen2 
naming and backward compatible with old H3 DT. Maybe I was wrong of not 
doing it like this and perhaps that solution should be revisited? That 
is keep avb_mdc as is on H3 for backward compatibility but add avb_mdio to 
both H3 and M3-W and update H3 DT to use avb_mdio.

In any case I reviewed the pins as it is identical to how it's done on 
H3. So if you choose to move forward with this approach feel free to 
add:

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Regards,
Niklas Söderlund
