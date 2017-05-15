From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 0/2] pinctrl: pinctrl-imx: add gpio support for mx7ulp
Date: Mon, 15 May 2017 14:48:24 +0800
Message-ID: <1494830906-6442-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-sn1nam01on0048.outbound.protection.outlook.com ([104.47.32.48]:59008
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1759315AbdEOGs0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 May 2017 02:48:26 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, shawnguo@kernel.org, stefan@agner.ch, ping.bai@nxp.com, fugang.duan@nxp.com, kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>

This patch series intends to add support for mx7ulp based on exist
code as imx7ulp pinctrl is slightly a bit different from Vybrid.

First, iMX ULP has different IOB/OBE shift from Vibrid, so we make
it as a SoC property.

Second, current code assumes MUX0 is GPIO function. It's true for Vybrid,
but not on ULP as Mux 1 is GPIO on ULP. So the patch corrects it
a bit based on the parsed imx_pin->mux_mode from device tree.

This patch series depends on the below one sent out a few days ago.
[PATCH 0/5] pinctrl: imx: add generic pin config and imx7ulp support
https://www.spinics.net/lists/arm-kernel/msg580737.html

Dong Aisheng (2):
  pinctrl: pinctrl-imx: add IBE and OBE SoC property
  pinctrl: pinctrl-imx: do not assume mux 0 is gpio

 drivers/pinctrl/freescale/pinctrl-imx.c     | 11 ++++++-----
 drivers/pinctrl/freescale/pinctrl-imx.h     |  2 ++
 drivers/pinctrl/freescale/pinctrl-imx7ulp.c |  2 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c   |  2 ++
 4 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.7.4

