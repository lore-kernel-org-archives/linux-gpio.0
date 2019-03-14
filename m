From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 0/6] pinctrl: sunxi: Allow to configure pull-up / pull-down
 from GPIO flags
Date: Thu, 14 Mar 2019 20:32:49 +0100
Message-ID: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Hi,

Here is a series that addresses one of the issues we've had for some time
with our pinctrl driver, which is that while we should have had the strict
mode enabled, we didn't and now we have to deal with all the DT having GPIO
and pinctrl nodes for the same pins.

This was partially due to cargo cult (which has been addressed since), but
also due to technical limitations of the GPIO DT bindings at the time which
didn't allow to specify the pull-up and pull-down resistors, and the drive
strength of the pins.

Now that the former are supported, we can remove those users, and we will
deal with the latter eventually.

Let me know what you think,
Maxime

Maxime Ripard (6):
  gpio: Set proper argument value to set_config
  pinctrl: sunxi: implement pin_config_set
  pinctrl: sunxi: Fix variable assignment syntax
  pinctrl: sunxi: Declare set_config on the GPIO chip
  ARM: dts: sunxi: Remove pinctrl groups setting bias
  ARM: dts: sunxi: Remove useless pinctrl nodes

 arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts        | 20 +---
 arch/arm/boot/dts/sun4i-a10-cubieboard.dts             | 10 +--
 arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts       | 20 +---
 arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts           | 20 +---
 arch/arm/boot/dts/sun4i-a10-inet1.dts                  | 20 +---
 arch/arm/boot/dts/sun4i-a10-inet97fv2.dts              | 20 +---
 arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts           | 72 +++--------
 arch/arm/boot/dts/sun4i-a10-marsboard.dts              | 12 +--
 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts         | 18 +---
 arch/arm/boot/dts/sun4i-a10-pcduino.dts                | 12 +--
 arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts       | 19 +---
 arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts           | 10 +--
 arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts       | 10 +--
 arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts | 20 +---
 arch/arm/boot/dts/sun5i-a13-hsg-h702.dts               | 12 +--
 arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts        | 18 +---
 arch/arm/boot/dts/sun5i-a13-olinuxino.dts              | 18 +---
 arch/arm/boot/dts/sun5i-a13-utoo-p66.dts               | 14 +--
 arch/arm/boot/dts/sun5i-r8-chip.dts                    | 12 +--
 arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi   | 20 +---
 arch/arm/boot/dts/sun6i-a31-colombus.dts               | 14 +--
 arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi   | 12 +--
 arch/arm/boot/dts/sun7i-a20-bananapi.dts               | 10 +--
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts            | 12 +--
 arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts              | 12 +--
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts         | 18 +---
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts        | 18 +---
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts        | 18 +---
 arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts          | 12 +--
 arch/arm/boot/dts/sun7i-a20-orangepi.dts               | 12 +--
 arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts          | 12 +--
 arch/arm/boot/dts/sun7i-a20-pcduino3.dts               | 12 +--
 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts         | 12 +--
 arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts       | 12 +--
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi                 | 23 +----
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts              | 30 +-----
 arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts           | 23 +----
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts            | 23 +----
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts             | 23 +----
 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts           |  9 +-
 arch/arm/boot/dts/sun8i-r16-parrot.dts                 | 12 +--
 arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi   | 12 +--
 drivers/gpio/gpiolib.c                                 | 14 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c                  | 40 +++---
 44 files changed, 110 insertions(+), 662 deletions(-)

base-commit: cf08baa29613dd899954089e7cc7dba1d478b365
-- 
git-series 0.9.1
