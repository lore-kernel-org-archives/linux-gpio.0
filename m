From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V4 RESEND 0/6] pinctrl: imx: add imx7ulp pinctrl support
Date: Tue, 25 Jul 2017 21:41:50 +0800
Message-ID: <1500990116-3620-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2nam01on0081.outbound.protection.outlook.com ([104.47.34.81]:28677
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750861AbdGYNmM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Jul 2017 09:42:12 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, shawnguo@kernel.org, aisheng.dong@nxp.com, dongas86@gmail.com, stefan@agner.ch, ping.bai@nxp.com, fugang.duan@nxp.com, kernel@pengutronix.de

This is a rebased V4 version against 4.13-rc2 with latest ACKs collected.

Linus,
I saw your tree still has not rebased to 4.13-rc2, so i generated the
patch series based on Linus 4.13-rc2 branch.
Supposed it should be easy to be merged into your branch once you done
the rebase.

i.MX 7ULP has three IOMUXC instances: IOMUXC0 for M4 ports,
IOMUXC1 for A7 ports and IOMUXC DDR for DDR interface.

This patch series adds the IOMUXC1 support for A7.
It only supports generic pin config.

ChangeLog:
v3->v4:
 This patch series is a combine of the following patches per
 Maintainer's request.
[PATCH V3 1/2] dt-bindings: pinctrl: add imx7ulp pinctrl binding doc
https://www.spinics.net/lists/arm-kernel/msg582995.html
[PATCH V3 2/2] pinctrl: imx: add imx7ulp driver
https://www.spinics.net/lists/arm-kernel/msg582996.html
[PATCH 0/2] pinctrl: pinctrl-imx: add gpio support for mx7ulp
https://www.spinics.net/lists/arm-kernel/msg580993.html

 Detailed changes as follows:
 * change pad name to IMX7ULP_PAD_X style
 * switch to generic pinmux property
 * remove input/output generic property decodes as the standard
   input/out property name are still under discussing.
   It does not affect the normal GPIO function as imx7ulp pinctrl
   driver supports gpio_set_direction which will set input/output enable
   automatically.
   See: [PATCH V4 7/7] pinctrl: pinctrl-imx7ulp: add gpio_set_direction
   It will be added back later for other pads once the standard property
   is determined.

Dong Aisheng (7):
  dt-bindings: pinctrl: extend the pinmux property to support integers
    array
Dong Aisheng (6):
  dt-bindings: pinctrl: add imx7ulp pinctrl binding doc
  pinctrl: imx: switch to use the generic pinmux property
  pinctrl: imx: add imx7ulp driver
  pinctrl: imx: remove gpio_request_enable and gpio_disable_free
  pinctrl: imx: make imx_pmx_ops.gpio_set_direction platform specific
    callbacks
  pinctrl: pinctrl-imx7ulp: add gpio_set_direction support

 .../bindings/pinctrl/fsl,imx7ulp-pinctrl.txt       |  61 +++
 arch/arm/boot/dts/imx7ulp-pinfunc.h                | 468 +++++++++++++++++++++
 drivers/pinctrl/freescale/Kconfig                  |   7 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-imx.c            | 123 +-----
 drivers/pinctrl/freescale/pinctrl-imx.h            |  20 +
 drivers/pinctrl/freescale/pinctrl-imx7ulp.c        | 364 ++++++++++++++++
 drivers/pinctrl/freescale/pinctrl-vf610.c          |  25 ++
 8 files changed, 953 insertions(+), 116 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
 create mode 100644 arch/arm/boot/dts/imx7ulp-pinfunc.h
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx7ulp.c

-- 
2.7.4

