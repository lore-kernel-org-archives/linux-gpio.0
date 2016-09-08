From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/3] pinctrl: sh-pfc: r8a779[14]: Implement voltage switching for SDHI
Date: Thu,  8 Sep 2016 13:36:45 +0200
Message-ID: <1473334608-24638-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49450 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757927AbcIHLhA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2016 07:37:00 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Simon Horman <horms+renesas@verge.net.au>

Hi,

this series adds voltage switching for SDHI to sh-pfc for the r8a7791 and
r8a794 SoCs. It is based on work for the r8a7790 SoC by Wolfram Sang.

The r8a7793 should be able to be trivially supported using the
same mechanism as r8a7791. I intend to provide a follow-up patch
once testing is completed.

Simon Horman (3):
  pinctrl: sh-pfc: Add PORT_GP_24 helper macro
  pinctrl: sh-pfc: r8a7791: Implement voltage switching for SDHI
  pinctrl: sh-pfc: r8a7794: Implement voltage switching for SDHI

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 29 ++++++++++++++++++++++++++++-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 34 +++++++++++++++++++++++++++++++++-
 drivers/pinctrl/sh-pfc/sh_pfc.h      |  8 ++++++--
 3 files changed, 67 insertions(+), 4 deletions(-)

-- 
2.7.0.rc3.207.g0ac5344

