From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 0/2] pinctrl: sunxi: Account for per-bank GPIO regulators
Date: Fri, 7 Dec 2018 00:01:18 +0800
Message-ID: <CAGb2v65wEMd0iCMBD83Sr5fpEkTte6S9-sJyoYLJmGzEOFYJNQ@mail.gmail.com>
References: <cover.50931fbda5c95345087740e4c1ef5a57fdd53480.1544104801.git-series.maxime.ripard@bootlin.com>
 <CAGb2v672oGHpeKEb4HV8ecZro2v-NPC9cV_DKPdNv9dy2OTREQ@mail.gmail.com>
 <20181206154748.45iqfnlirm6blt4k@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181206154748.45iqfnlirm6blt4k@flea>
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

On Thu, Dec 6, 2018 at 11:47 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi,
>
> On Thu, Dec 06, 2018 at 11:28:21PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Dec 6, 2018 at 10:02 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > The main interogation I have currently is whether we should always try to
> > > get the regulator for the current branch, or if we should restrict it to
> > > the one available on the SoCs.
> >
> > Not sure what you mean here, but we should probably just list the actual
> > names.
>
> The A20 for example doesn't have a VCC-PB regulator, so do we want to
> try to grab it if we request a PB* pin, or should we just know that
> somehow and not do it?

AFAIK, pin banks that don't have a separate supply are powered collectively
by VCC-IO, as mentioned below in my previous reply.

> > For pre-A20 SoCs (A10/A10s/A13), they aren't even named VCC-Px. Instead
> > they are named after the primary function of the pin bank, such as
> > VCC-CARD, VCC-NAND, VCC-CSI0, VCC-CSI1.
>
> I'd really prefer to stick to vcc-pX, that's pretty obvious even for
> those older SoCs, and we can maintain some consistency that way.

IRRC Mark said that supply names should match design names, not what is
convenient. And then again there's the fallback for those that don't have
separate rails.

> > For pin banks that don't have per-bank power inputs, you should fall back
> > to VCC-IO, or VCC-RTC in the case of the PL pins.
> >
> > So here's the rub: On A33 and later SoCs that are paired with a PMIC, VCC-PL
> > or VCC-RTC is powered by the RTC regulator of the PMIC, which only gets
> > registered when the PMIC regulator driver is probed, which needs the RSB
> > controller, which needs the pin controller and the PL pins...
>
> I haven't seen any VCC-P* on the A33, do you have a reference?

The A33 has a VCC-PD. This is not listed in the datasheet, but is shown in
schematics. Other pins would be powered by VCC-IO, with the exception of PL,
which would be power by VCC-RTC. The last bit is just a guess. We should
probably ask Allwinner, or try to do some tests.

ChenYu
