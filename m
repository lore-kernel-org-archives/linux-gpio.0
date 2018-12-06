From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 0/2] pinctrl: sunxi: Account for per-bank GPIO regulators
Date: Thu, 6 Dec 2018 23:28:21 +0800
Message-ID: <CAGb2v672oGHpeKEb4HV8ecZro2v-NPC9cV_DKPdNv9dy2OTREQ@mail.gmail.com>
References: <cover.50931fbda5c95345087740e4c1ef5a57fdd53480.1544104801.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.50931fbda5c95345087740e4c1ef5a57fdd53480.1544104801.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 6, 2018 at 10:02 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi,
>
> Here is a first attempt at getting the regulators properly accounted for
> the GPIO banks on the Allwinner SoCs.

Cool. This is better than what I had in mind, which involved a deferred
task to grab the regulators.

> The main interogation I have currently is whether we should always try to
> get the regulator for the current branch, or if we should restrict it to
> the one available on the SoCs.

Not sure what you mean here, but we should probably just list the actual
names.

For pre-A20 SoCs (A10/A10s/A13), they aren't even named VCC-Px. Instead
they are named after the primary function of the pin bank, such as
VCC-CARD, VCC-NAND, VCC-CSI0, VCC-CSI1.

For pin banks that don't have per-bank power inputs, you should fall back
to VCC-IO, or VCC-RTC in the case of the PL pins.

So here's the rub: On A33 and later SoCs that are paired with a PMIC, VCC-PL
or VCC-RTC is powered by the RTC regulator of the PMIC, which only gets
registered when the PMIC regulator driver is probed, which needs the RSB
controller, which needs the pin controller and the PL pins...

ChenYu

>
> Let me know what you think,
> Maxime
>
> Maxime Ripard (2):
>   pinctrl: sunxi: Deal with per-bank regulators
>   ARM: dts: sun7i: bananapi: Add GPIO banks regulators
>
>  arch/arm/boot/dts/sun7i-a20-bananapi.dts |  5 ++-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c    | 63 +++++++++++++++++++++++++-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h    |  6 ++-
>  3 files changed, 74 insertions(+)
>
> base-commit: 651022382c7f8da46cb4872a545ee1da6d097d2a
> --
> git-series 0.9.1
