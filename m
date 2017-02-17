From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [RFC PATCH 0/9] Add support for Allwinner R40 SoC
Date: Sat, 18 Feb 2017 01:37:13 +0800
Message-ID: <20170217173722.6477-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBCPKTTCQKGQEDPGSVCY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

This patchset is an experiment to add R40 support to mainline Linux.

As we have still no user manual for R40, the patchset is developed
by reading the BSP source code and device tree, educated guess and
try and error.

Note: the PATCH 1~3 and 7 is not RFC (I want them to be merged now),
but they are sent together as they have functional dependency by
RFC patches.

Icenowy Zheng (9):
  arm: sunxi: add support for R40 SoC
  pinctrl: sunxi: rename sun7i-a20 driver to sunxi-a20-r40
  pinctrl: sunxi: add support for R40 pinctrl
  clk: sunxi-ng: support R40 SoC
  ARM: dts: sun8i: add DTSI file for R40 SoC
  ARM: dts: sun8i: add DTS file for Banana Pi M2 Ultra
  phy: sun4i-usb: add support for R40 USB PHY
  ARM: dts: sun8i: add USB nodes for R40
  ARM: dts: sun8i: enable USB host for Banana Pi M2 Ultra

 Documentation/arm/sunxi/README                     |    4 +
 .../devicetree/bindings/phy/sun4i-usb-phy.txt      |    1 +
 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts  |  184 ++++
 arch/arm/boot/dts/sun8i-r40.dtsi                   |  493 +++++++++
 arch/arm/mach-sunxi/sunxi.c                        |    1 +
 drivers/clk/sunxi-ng/Kconfig                       |   10 +
 drivers/clk/sunxi-ng/Makefile                      |    1 +
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c               | 1140 ++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-r40.h               |   68 ++
 drivers/phy/phy-sun4i-usb.c                        |   17 +-
 drivers/pinctrl/sunxi/Kconfig                      |    2 +-
 drivers/pinctrl/sunxi/Makefile                     |    2 +-
 ...pinctrl-sun7i-a20.c => pinctrl-sunxi-a20-r40.c} |   69 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |    2 +
 include/dt-bindings/clock/sun8i-r40-ccu.h          |  189 ++++
 include/dt-bindings/reset/sun8i-r40-ccu.h          |  128 +++
 17 files changed, 2286 insertions(+), 26 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
 create mode 100644 arch/arm/boot/dts/sun8i-r40.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.h
 rename drivers/pinctrl/sunxi/{pinctrl-sun7i-a20.c => pinctrl-sunxi-a20-r40.c} (95%)
 create mode 100644 include/dt-bindings/clock/sun8i-r40-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-r40-ccu.h

-- 
2.11.1
