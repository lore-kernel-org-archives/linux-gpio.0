From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 0/3] Renesas RZ PFC and GPIO driver
Date: Wed, 11 Jan 2017 00:46:31 +0000
Message-ID: <SG2PR06MB1165993554BE4B9A6D9D3EBC8A660@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
 <1923903.Gi7z59W6W3@avalon>
 <SG2PR06MB1165EBCB06C5D473CBAC2F218A640@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <2671694.94z5NEauGX@avalon> <06e9c953-df81-08f1-a817-730301778e06@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <06e9c953-df81-08f1-a817-730301778e06@jmondi.org>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

On Tuesday, January 10, 2017, Jacopo Mondi wrote:
> So, I guess what direction to take depends on whether or not we're going
> to see more hardware with a per-pin configuration that would benefit from
> this new rz-pfc driver (it seems so) and if this justify splitting sh-pfc
> in two, a group-based one for R-Car devices (and all devices there
> already) and a new pin-based one.

Well, since I'm the one with the "renesas.com" email address, I'll try to
see if I can figure out if the R-Car PFC can be changed to something else f=
or
R-Car Gen4. Same goes for RZ/G. Sometimes the chip designers just keep doin=
g
the same thing over and over again because they don't get any feedback from
the SW guys.


> Or maybe we can tie pin-based configuration in sh-pfc and it's me not
> seeing how to do that.

At some point....we do need to leave the "sh-" name behind as I don't reall=
y
see much of a future for SH4 devices. Using something like pinctrl-renesas
is probably a better name. Although, anyone who's watched the semiconductor
business over the years knows that names never stay the same. (sigh)


Chris
