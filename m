From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: Deal with per-bank regulators
Date: Wed, 9 Jan 2019 12:36:19 +0800
Message-ID: <CAGb2v670u-nnb61i0pz-4jmWn+1E8BKm=MZcZ5TYsrCju4-w4A@mail.gmail.com>
References: <cover.50931fbda5c95345087740e4c1ef5a57fdd53480.1544104801.git-series.maxime.ripard@bootlin.com>
 <3401ca7517927243f567899819e0d02eee12984f.1544104801.git-series.maxime.ripard@bootlin.com>
 <CAGb2v66m-BtUaWkOvjiaO1LybikqxVn-S7uOE9zV6QW9KHLL8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v66m-BtUaWkOvjiaO1LybikqxVn-S7uOE9zV6QW9KHLL8Q@mail.gmail.com>
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
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mylene Josserand <mylene.josserand@bootlin.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 7, 2019 at 1:20 PM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Thu, Dec 6, 2018 at 10:02 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > The Allwinner SoCs have on most of their GPIO banks a regulator input.
> >
> > This issue was mainly ignored so far because either the regulator was a
> > static regulator that would be providing power anyway, or the bank was used
> > for a feature unsupported so far (CSI). For the odd cases, enabling it in
> > the bootloader was the preferred option.
> >
> > However, now that we are starting to support those features, and that we
> > can't really rely on the bootloader for this, we need to model those
> > regulators as such in the DT.
> >
> > This is slightly more complicated than what it looks like, since some
> > regulators will be tied to the PMIC, and in order to have access to the
> > PMIC bus, you need to mux its pins, which will need the pinctrl driver,
> > that needs the regulator driver to be registered. And this is how you get a
> > circular dependency.
> >
> > In practice however, the hardware cannot fall into this case since it would
> > result in a completely unusable bus. In order to avoid that circular
> > dependency, we can thus get and enable the regulators at pin_request time.
> > We'll then need to account for the references of all the pins of a
> > particular branch to know when to put the reference, but it works pretty
> > nicely once implemented.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> I'm getting a warning on my Bananapi M1+:
>
> [  +0.004918] sun4i-pinctrl 1c20800.pinctrl: 1c20800.pinctrl supply
> vcc-pa not found, using dummy regulator
> [  +0.009931] sun7i-dwmac 1c50000.ethernet: PTP uses main clock
> [  +0.005764] sun7i-dwmac 1c50000.ethernet: no reset control found
> [  +0.006111] ------------[ cut here ]------------
> [  +0.004640] WARNING: CPU: 1 PID: 1 at drivers/regulator/core.c:2054
> _regulator_put.part.8+0xf8/0xfc
> [  +0.009065] Modules linked in:
> [  +0.003085] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.0.0-rc1 #5
> [  +0.006179] Hardware name: Allwinner sun7i (A20) Family
> [  +0.005252] [<c010eaf0>] (unwind_backtrace) from [<c010b854>]
> (show_stack+0x10/0x14)
> [  +0.007755] [<c010b854>] (show_stack) from [<c089ac28>] (dump_stack+0x88/0x9c)
> [  +0.007233] [<c089ac28>] (dump_stack) from [<c0127450>] (__warn+0xd4/0xf0)
> [  +0.006881] [<c0127450>] (__warn) from [<c01274ac>]
> (warn_slowpath_null+0x40/0x48)
> [  +0.007576] [<c01274ac>] (warn_slowpath_null) from [<c03fd25c>]
> (_regulator_put.part.8+0xf8/0xfc)
> [  +0.008876] [<c03fd25c>] (_regulator_put.part.8) from [<c03fd288>]
> (regulator_put+0x28/0x38)
> [  +0.008446] [<c03fd288>] (regulator_put) from [<c03c5f2c>]
> (sunxi_pmx_free+0x38/0x48)
> [  +0.007837] [<c03c5f2c>] (sunxi_pmx_free) from [<c03c2444>]
> (pin_free+0x9c/0xfc)
> [  +0.007402] [<c03c2444>] (pin_free) from [<c03c2fb0>]
> (pinmux_disable_setting+0x118/0x184)
> [  +0.008271] [<c03c2fb0>] (pinmux_disable_setting) from [<c03c0060>]
> (pinctrl_free+0x13c/0x144)
> [  +0.008619] [<c03c0060>] (pinctrl_free) from [<c048c6a0>]
> (release_nodes+0x1bc/0x200)
> [  +0.007839] [<c048c6a0>] (release_nodes) from [<c0488964>]
> (really_probe+0x110/0x2cc)
> [  +0.007838] [<c0488964>] (really_probe) from [<c0488c84>]
> (driver_probe_device+0x60/0x16c)
> [  +0.008270] [<c0488c84>] (driver_probe_device) from [<c0488e6c>]
> (__driver_attach+0xdc/0xe0)
> [  +0.008444] [<c0488e6c>] (__driver_attach) from [<c0486d44>]
> (bus_for_each_dev+0x74/0xb4)
> [  +0.008184] [<c0486d44>] (bus_for_each_dev) from [<c0487edc>]
> (bus_add_driver+0x1bc/0x200)
> [  +0.008270] [<c0487edc>] (bus_add_driver) from [<c04897ac>]
> (driver_register+0x74/0x108)
> [  +0.008098] [<c04897ac>] (driver_register) from [<c010270c>]
> (do_one_initcall+0x7c/0x1a8)
> [  +0.008187] [<c010270c>] (do_one_initcall) from [<c0d00e14>]
> (kernel_init_freeable+0x13c/0x1d8)
> [  +0.008705] [<c0d00e14>] (kernel_init_freeable) from [<c08b08b8>]
> (kernel_init+0x8/0x110)
> [  +0.008184] [<c08b08b8>] (kernel_init) from [<c01010e8>]
> (ret_from_fork+0x14/0x2c)
> [  +0.007570] Exception stack(0xef04ffb0 to 0xef04fff8)
> [  +0.005054] ffa0:                                     00000000
> 00000000 00000000 00000000
> [  +0.008180] ffc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [  +0.008179] ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [  +0.006654] ---[ end trace 2bdb4a597b3c54ef ]---
>
> Note that sun7i-dwmac probe is deferred here. The instance where the
> probe succeeds shows
> no warning.

Found the issue. There's a mismatch on the conditions when the regulator
is enabled and disabled. I'll send a fix for it.

ChenYu
