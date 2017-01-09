From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 0/3] Renesas RZ PFC and GPIO driver
Date: Mon, 9 Jan 2017 21:08:49 +0000
Message-ID: <SG2PR06MB1165EE67EA2969815758A3038A640@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
 <11976735.hueksWqZOA@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <11976735.hueksWqZOA@avalon>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Monday, January 09, 2017, Laurent Pinchart wrote:
> Pin control on the Renesas RZ chips is performed per pin instead of per
> function (but unfortunately with the various bits of configuration split
> across a bunch of registers, otherwise we could have used pinctrl-single)=
.

I will say this...'spoilier alert'...you're not going to see this particula=
r
PFC HW much anymore in the RZA series.

It will still be a 'per pin control' like the existing RZ/A1, but the bits
will not be spread out over a bunch of registers. So something like
pinctrl-single should work.

No idea about the future of RZG series.


> This gives us an opportunity to move away from the sh-pfc awful (but more
> or less needed for the R-Car family) architecture and implement something
> much, much cleaner without all those obscure data tables and macros, with
> per-pin configuration. Shouldn't we rejoice and embrace that opportunity =
?

Honestly, that driver structure confuses the heck out of me. I guess you ha=
ve
to understand the restrictions of the R-Car PFC HW to really appreciate it.

Of course I like the idea of a simple PFC for Renesas SoCs, of course the
existing RZ/A1 would be (hopefully) the worst case scenario.

I assume to make a one-size-fits-all per-pin driver, instead of filling out
structures and enums, you'd have to have callback functions that basically =
you
pass "set pin X to function #3"...which basically brings you back to what t=
he
core of the pinctrl system does now any (if I understand it correctly).

Chris
