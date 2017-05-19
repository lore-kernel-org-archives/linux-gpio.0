From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V2 0/5] pinctrl: imx: add generic pin config and imx7ulp support
Date: Fri, 19 May 2017 15:05:40 +0800
Message-ID: <1495177545-23006-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2nam03on0085.outbound.protection.outlook.com ([104.47.42.85]:3584
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751003AbdESHFp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 May 2017 03:05:45 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, shawnguo@kernel.org, stefan@agner.ch, ping.bai@nxp.com, fugang.duan@nxp.com, kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>

This patch series intends to add the generic pin config support for imx
platforms.

The design is based on the exist architecture that the core will
provide a uniformed way to decode the generic pin config into platform
config register raw data according to the imx_cfg_params_decode maps
registered by platform.

Two useful macros, IMX_CFG_PARAMS_DECODE and IMX_CFG_PARAMS_DECODE_INVERT,
are created for platform to register decode map conveniently.

In order to cope with some special case, a platform specific fixup()
function is also available to use.

The series also added the imx7ulp pinctrl support which only supports
generic pin config.

ChangeLog:
v1->v2:
 Minor changes including:
 * comments/commit messages improvement
 * add more descriptions in binding doc
 * move dt-bindings/pinctrl/imx7ulp-pinfunc.h to arch/arm/boot/dts
 See individual for details.
 * Patch 5 moved to patch 1 in new series

Dong Aisheng (5):
  pinctrl: imx: fix debug message for SHARE_MUX_CONF_REG case
  pinctrl: imx: add generic pin config core support
  pinctrl: imx: add soc specific mux_mode mask and shift property
  dt-bindings: pinctrl: add imx7ulp pinctrl binding doc
  pinctrl: imx: add imx7ulp driver

 .../bindings/pinctrl/fsl,imx7ulp-pinctrl.txt       |  63 +++
 arch/arm/boot/dts/imx7ulp-pinfunc.h                | 468 +++++++++++++++++++++
 drivers/pinctrl/freescale/Kconfig                  |   9 +-
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-imx.c            | 130 +++++-
 drivers/pinctrl/freescale/pinctrl-imx.h            |  29 ++
 drivers/pinctrl/freescale/pinctrl-imx7ulp.c        | 358 ++++++++++++++++
 drivers/pinctrl/freescale/pinctrl-vf610.c          |   2 +
 8 files changed, 1040 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
 create mode 100644 arch/arm/boot/dts/imx7ulp-pinfunc.h
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx7ulp.c

-- 
2.7.4

