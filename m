From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Fine-grained Runtime PM support
Date: Fri, 09 Dec 2016 01:21:27 +0200
Message-ID: <2561777.Aed1u6m3Fd@avalon>
References: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se> <1984659.qgJsdhyW2B@avalon> <20161208231551.GL21834@bigcity.dyn.berto.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161208231551.GL21834@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Hi Niklas,

On Friday 09 Dec 2016 00:15:51 Niklas S=F6derlund wrote:
> On 2016-12-08 23:40:42 +0200, Laurent Pinchart wrote:
> > On Thursday 08 Dec 2016 18:32:28 Niklas S=F6derlund wrote:
> >> From: Geert Uytterhoeven <geert+renesas@glider.be>
> >>=20
> >> Currently gpio modules are runtime-resumed at probe time. This mea=
ns the
> >> gpio module will be active all the time (except during system susp=
end,
> >> if not configured as a wake-up source).
> >>=20
> >> While an R-Car Gen2 gpio module retains pins configured for output=
 at
> >> the requested level while put in standby mode, gpio register canno=
t be
> >> accessed while suspended.  Unfortunately pm_runtime_get_sync() can=
not be
> >> called from all contexts where gpio register access is needed. Hen=
ce
> >> move the Runtime PM handling from probe/remove time to gpio reques=
t/free
> >> time, which is probably the best we can do.
> >>=20
> >> On r8a7791/koelsch, gpio modules 0, 1, 3, and 4 are now suspended =
during
> >> normal use (gpio2 is used for LEDs and regulators, gpio5 for keys,=
 gpio6
> >> for SD-Card CD & WP, gpio7 for keys and regulators).
> >>=20
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> [Niklas: s/gpio_to_priv(chip)/gpiochip_get_data(chip)/]
> >=20
> > Just curious, what's the rationale for this ?
>=20
> This was changed for the whole driver after the original patch was
> applied (at the time of change the patch was not yet reverted), see [=
1].
> I needed to update this when I resurrected the patch, maybe I could h=
ave
> been more clever and reverted the revert patch but this felt cleaner,=
 if
> it's better to do it the other way around and revert a revert please =
let
> me know so I can do so in the future.

No, this is fine. I'm a bit dubious about [1] given that it consumes mo=
re CPU=20
cycles without any benefit as far as I can see. Maybe I can't see far e=
nough=20
though, Linus Walleij could prove me wrong :-)

> [1] c7b6f457cb53bcee ("gpio: rcar: use gpiochip data pointer").

--=20
Regards,

Laurent Pinchart
