From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: r8a7795: Support none GPIO pins with configurable drive-strength
Date: Wed, 05 Oct 2016 13:12:43 +0300
Message-ID: <3518755.LVzpMhDk71@avalon>
References: <20160913140314.22035-1-niklas.soderlund+renesas@ragnatech.se> <20161005083338.GD7241@bigcity.dyn.berto.se> <CAMuHMdVWze2HGhxgdvOAyENM0c7K10kpYEEmJ5eddqudVYkPrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52146 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752395AbcJEKMs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Oct 2016 06:12:48 -0400
In-Reply-To: <CAMuHMdVWze2HGhxgdvOAyENM0c7K10kpYEEmJ5eddqudVYkPrA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

Hi Geert,

On Wednesday 05 Oct 2016 11:51:49 Geert Uytterhoeven wrote:
> On Wed, Oct 5, 2016 at 10:33 AM, Niklas S=F6derlund wrote:
> > On 2016-10-04 21:13:18 +0200, Geert Uytterhoeven wrote:
> >> On Tue, Sep 13, 2016 at 4:03 PM, Niklas S=F6derlund wrote:
> >> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> >> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c

[snip]

> >>> +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  4,  AE4,
> >>> SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* QSPI1_IO2 */
> >>> +      SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  5,  AE5,
> >>> SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* QSPI1_MISO_IO1 */
> >>> +      SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  7,  AP7,
> >>> SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* DU_DOTCLKIN0 */
> >>> +      SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  8,  AP8,
> >>> SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* DU_DOTCLKIN1 */
> >>> +      SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  7,  AR7,
> >>> SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* DU_DOTCLKIN2 */
> >>> +      SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  8,  AR8,
> >>> SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* DU_DOTCLKIN3 */
> >>> +      SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 30, AR30,
> >>> SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* TMS */
> >>> +      SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 28, AT28,
> >>> SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* TDO */
> >>> +      SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, AT30,
> >>> SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* ASEBRK */>
> >>
> >> All these pin numbers match R-Car H3SiP, while there exists also a=
 plain
> >> R-Car H3, which uses completely different pin numbers.
> >>=20
> >> How are we gonna distinguish these two variants?
> >> Perhaps we can refer to these pins in some other way, to have cons=
istent
> >> numbering?
> >>=20
> >> Or don't we have to? Are these numbers visible in userspace (sysfs=
)?
> >=20
> > Unfortunately both the number and name are show in sysfs under
> > '/sys/kernel/debug/pinctrl/e6060000.pfc/*', example from the pins n=
ode:
> >=20
> > <snip>
> > pin 1906 (PIN_AP7) sh-pfc
> > pin 1907 (PIN_AP8) sh-pfc
> > pin 1984 (PIN_AR7) sh-pfc
> > pin 1985 (PIN_AR8) sh-pfc
> > pin 2007 (PIN_AR30) sh-pfc
> > pin 2083 (PIN_AT28) sh-pfc
> > pin 2085 (PIN_AT30) sh-pfc
> > </snip>
>=20
> Thanks for checking!
>=20
> > So yes a way to present consistent names is needed if this driver s=
hould
> > match both H3 variants. But I'm not sure the numbers needs to be
> > correlated to the pin matrix they only need to be unique I think, p=
lease
> > correct me if I'm wrong. And if that is the case then maybe a solut=
ion
>=20
> Yes, I also think they just have to be unique.
> Having some system to make it easier to have unique numbers is nice.
>=20
> > to the problem is to simply change the name of the pins from there =
pin
> > matrix location to there function:
> >=20
> > - SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, AT30,
> > SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* ASEBRK */
> > + SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, ASEBRK,
> > SH_PFC_PIN_CFG_DRIVE_STRENGTH),      /* ASEBRK */
> >=20
> > That would keep the names and numbers consistent on both H3 varinat=
s.
> > The names would correlate to function and the numbers simply serve =
as a
> > pin identifier which is unique and derived from the H3SiP pin layou=
t,
> > probably a comment about this in the source is a good idea :-)
>=20
> So "the system" would be H3SiP pin numbers.
> Looks good to me.
>=20
> Laurent, do you agree?

I'm fine with that.

--=20
Regards,

Laurent Pinchart

