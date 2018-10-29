From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 0/2] pinctrl: sh-pfc: r8a77965: Add VIN4 and VIN5
Date: Mon, 29 Oct 2018 19:13:42 +0100
Message-ID: <1540836824-4636-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, horms@verge.net.au
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hello,
   this two patches add supports for VIN4 and VIN5 interfaces to R-Car M3-N.

On this SoC (and in the forthcoming support for E3 R8A77990) the VIN groups
could appear on different sets of pins, usually the 'a' and 'b' one.

With the existing VIN_DATA_PIN_GROUP macro we have to specify group names as:

VIN_DATA_PIN_GROUP(vin4_data_a, 8)

which results in the group being named as "vin4_data_a_8" which is
un-consistent with the canonical group names (eg. "vin4_data8_a").

This series adds a macro that allows to specify the group 'version' along with
the pin and mux numbers in patch [1/1]. I haven't been able to find a better
term than 'version' as 'group' was already taken. Suggestions welcome.

As I cannot test VIN4 nor VIN5 on Salvator-XS as the parallel pins are not
wired, I made sure the macro creates correct names and fields not only by
compile testing it, but with a small C program [1] that replicates the VIN data
layout defined in the PFC module and access fields (and has helped me testing
more easily the preprocessor stringification/concatenation process).

Final note: Simon, you took the E3 patches in your tree, and I expect them to
land on v4.20-rc1. They use the old macros, are follow up patches ok?)

Thanks
   j

[1] https://paste.debian.net/1049603/

Jacopo Mondi (2):
  pinctrl: sh-pfc: Introduce VIN_DATA_PIN_GROUP_VER
  pinctrl: sh-pfc: r8a77965: Add VIN[4|5] groups/functions

 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 254 ++++++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h       |  20 ++-
 2 files changed, 269 insertions(+), 5 deletions(-)

--
2.7.4
