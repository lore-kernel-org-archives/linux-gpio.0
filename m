From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 0/5] pinctrl: imx: add generic pin config and imx7ulp support
Date: Fri, 12 May 2017 20:38:00 +0800
Message-ID: <1494592686-30967-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn3nam01on0071.outbound.protection.outlook.com ([104.47.33.71]:47520
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1756166AbdELMiM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 May 2017 08:38:12 -0400
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

Dong Aisheng (5):
  pinctrl: imx: add generic pin config core support
  pinctrl: imx: add soc specific mux_mode mask and shift property
  dt-bindings: pinctrl: add imx7ulp pinctrl binding doc
  pinctrl: imx: add imx7ulp driver
  pinctrl: imx: fix debug message for SHARE_MUX_CONF_REG case

 .../bindings/pinctrl/fsl,imx7ulp-pinctrl.txt       |  56 +++
 drivers/pinctrl/freescale/Kconfig                  |   9 +-
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-imx.c            | 128 +++++-
 drivers/pinctrl/freescale/pinctrl-imx.h            |  29 ++
 drivers/pinctrl/freescale/pinctrl-imx7ulp.c        | 358 ++++++++++++++++
 drivers/pinctrl/freescale/pinctrl-vf610.c          |   2 +
 include/dt-bindings/pinctrl/imx7ulp-pinfunc.h      | 468 +++++++++++++++++++++
 8 files changed, 1030 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx7ulp.c
 create mode 100644 include/dt-bindings/pinctrl/imx7ulp-pinfunc.h

-- 
2.7.4

