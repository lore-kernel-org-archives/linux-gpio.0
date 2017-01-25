From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [RFC 0/5] Renesas RZ series pinctrl driver
Date: Wed, 25 Jan 2017 19:09:42 +0100
Message-ID: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hello,
   after having discussed in great detail the RZ series per-pin PFC hardware
peculiarities, this is a proposal for a possible pin-based pin controller
driver for SoC devices of Renesas RZ family.

This RFC series adds a minimal driver infrastructure which supports pin
multiplexing via explicit per-pin settings performed in device tree sources.

The driver is composed by a "core" module, which aims to be generic enough to
support different RZ SoC device, and a "SoC" module, which is instead specific
to the single device.
Right now, the only "SoC" module support implemented is for RZ/A1H (Genmai
and GR-Peach boards).

Why an "SoC" module, if a single SoC is supported then?
RZ devices with a pin-based PFC hardware have different register layouts and
available pin functions, the "SoC" module is requested to enumerate its pins,
and provide function for HW interfacing (currently only set_mux() is supported).
This should make adding support for new chips fairly easy.

One note on the current DT ABI:
right now a pin configuration is specified in DTS using utility macros defined
in the (currently undocumented)
arch/arm/boot/dts/include/dt-bindings/pinctrl/pinctrl-renesas-rz.h header file.
Each pin configuration is a triplet of u32 in the form of

<BANK PIN ALTERNATE_FUNC_#>

It should be fairly easy adding additional parameters to configure
what was missing in the original group-based PFC driver for RZ devices
(I'm thinking of IO mode control, input buffer configuration, bi-directional
configuration etc).
Once these configuration parameters have been retrieved from the DTS, they can
be passed down to the "SoC" module, and let it deal with them as it does right
now with mux settings.

Currently, there is no support for pinconfig operations, and no GPIO support.
I'm planning to work on GPIO integration as soon as I have sent this out, but
I wanted to send this first to start collecting comments as soon as I could.

I have tested the correctness of mux settings printing out register values,
and enabling/disabling the SCIF2 module connected to serial debug interface.

The series makes use of newly introduced pin[ctrl|mux]_generic functions,
currently only available in Linus Walleij's linux-pinctrl.git tree.
I have merged the devel/ branch of that tree on top of Geert's renesas-drivers
master one.
The merge is available for clone at git://jmondi.org/linux in
jmondi/renesas/pinctrl-devel branch, for the interested ones.

Sending out as RFC, as I do expect lot of comments both from Renesas people that
has a deeper knowledge of other RZ Series SoCs than me, and from gpio/pinctrl
people as this is the first pin control driver I send out (so please bear with
me on this :)

Thank you
   j

Jacopo Mondi (5):
  pinctrl: rz-pfc: Add Renesas RZ pinctrl core module
  pinctrl: rz-pfc: Add Renesas RZ/A1 pinctrl driver
  arm: dts: dt-bindings: Add Renesas RZ pinctrl header
  arm: dts: r7s1000: Add pincontroller node
  arm: dts: genmai: Add SCIF2 pin group

 arch/arm/boot/dts/r7s72100-genmai.dts            |  13 +
 arch/arm/boot/dts/r7s72100.dtsi                  |  12 +
 drivers/pinctrl/Kconfig                          |   1 +
 drivers/pinctrl/Makefile                         |   1 +
 drivers/pinctrl/rz-pfc/Kconfig                   |  25 ++
 drivers/pinctrl/rz-pfc/Makefile                  |   2 +
 drivers/pinctrl/rz-pfc/pinctrl-rz.c              | 433 +++++++++++++++++++++++
 drivers/pinctrl/rz-pfc/pinctrl-rz.h              | 114 ++++++
 drivers/pinctrl/rz-pfc/pinctrl-rza1.c            | 346 ++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-renesas-rz.h |  19 +
 10 files changed, 966 insertions(+)
 create mode 100644 drivers/pinctrl/rz-pfc/Kconfig
 create mode 100644 drivers/pinctrl/rz-pfc/Makefile
 create mode 100644 drivers/pinctrl/rz-pfc/pinctrl-rz.c
 create mode 100644 drivers/pinctrl/rz-pfc/pinctrl-rz.h
 create mode 100644 drivers/pinctrl/rz-pfc/pinctrl-rza1.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-renesas-rz.h

-- 
2.7.4
