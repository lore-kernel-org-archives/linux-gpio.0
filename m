From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [PATCH 0/2] pinctrl: imx: use generic pinctrl helpers
Date: Mon,  2 Jan 2017 19:20:20 +0100
Message-ID: <20170102182022.2047-1-gary.bisson@boundarydevices.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, fabio.estevam@nxp.com
Cc: tony@atomide.com, shawnguo@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Gary Bisson <gary.bisson@boundarydevices.com>
List-Id: linux-gpio@vger.kernel.org

Hi all,

This series is a follow-up to Linus suggestion to use the generic helpers
introduced by Tony [1].

Mainly I've used the generic functions in pinctrl_ops and pinmux_ops and
switched to the generic group/function_desc structures instead of the
imx-specific one that didn't bring anything special.

However I couldn't use the 'add' functions to add elements since the
parsing is done at probe time in its own way. So I've kept the
radix_insert functions. This could be modified in the future though.

Regards,
Gary

[1] http://www.spinics.net/lists/devicetree/msg155984.html

Gary Bisson (2):
  pinctrl: imx: use generic pinctrl helpers for managing groups
  pinctrl: imx: use generic pinmux helpers for managing functions

 drivers/pinctrl/freescale/Kconfig       |   3 +-
 drivers/pinctrl/freescale/pinctrl-imx.c | 286 ++++++++++----------------------
 drivers/pinctrl/freescale/pinctrl-imx.h |  33 +---
 3 files changed, 87 insertions(+), 235 deletions(-)

-- 
2.11.0
