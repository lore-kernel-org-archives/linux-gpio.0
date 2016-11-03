From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 0/4] pinctrl: sh-pfc: r8a7795: Support none GPIO pins with configurable drive-strength
Date: Thu,  3 Nov 2016 17:15:26 +0100
Message-ID: <20161103161530.11763-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:59031 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758689AbcKCQQr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Nov 2016 12:16:47 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

Hi Geert and Laurent,

This series adds support to control the drive strength for none GPIO
pins. All pins which can have its drive strength controlled is now supported. I 
have also added the new pins to the correct groups, or added groups to mimic 
other sh-pfc drivers. One notable exception is the group avb_mdc which on other 
SoC are called avb_mdio, see commit 3/4 for explanation.

The series is based on top of v4.9-rc3 and tested on Salvator-X. My test
is a bit crude and is setting a few of the AVB pins to a higher
drive-strength value then the others and observing that the AVB fails to
work after the pfc settings are applied (NFS root failing to mount after
kernel is fetched over TFTP). I also tested setting the drive strength for 
individual pins and for whole groups.

Changes since v1

- Add comment about that it's the R-Car H3SiP pin matrix which is used to 
  generate a unique id number for each pin. Even if the pin matrix are 
  different on other packages all the driver care about is that it's a unique 
  number.

- Add FSCLKST pin after discussion with Geert

- Moved avb_mii group relative to other avb pin groups for a more logical 
  order, thanks Sergei for pointing this out

- Add Acked-by and Reviewed-by tags

- Fixed spelling error

Niklas Söderlund (4):
  pinctrl: sh-pfc: Support named pins with custom configuration
  pinctrl: sh-pfc: r8a7795: Support none GPIO pins with configurable
    drive-strength
  pinctrl: sh-pfc: r8a7795: Add group for AVB MDIO and MII pins
  pinctrl: sh-pfc: r8a7795: Add group for QSPI0 and QSPI1 pins

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 263 ++++++++++++++++++++++++++++++++---
 drivers/pinctrl/sh-pfc/sh_pfc.h      |   8 ++
 2 files changed, 252 insertions(+), 19 deletions(-)

-- 
2.10.2

