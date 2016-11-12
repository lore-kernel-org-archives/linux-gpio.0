From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv3 0/6] pinctrl: sh-pfc: Fixups for bias handling and preparation for none GPIO pins
Date: Sat, 12 Nov 2016 17:04:23 +0100
Message-ID: <20161112160429.12524-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:60012 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966113AbcKLQGO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Nov 2016 11:06:14 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

Hi,

This series fixes two issues I encounter for bias handling in the PFC
while preparing my drive strength patch set.

I also attached a new patch 6/6 that adds the macro
SH_PFC_PIN_NAMED_CFG() and was previously part of the series 'pinctrl:
sh-pfc: r8a7795: Support none GPIO pins with configurable
drive-strength'.

The reason I moved this patch to this series are both 6/6 and the new
bias helper function introduced in 2/6 are dependencies for other PFC
patch series I wish to send out. So to simplify the dependencies between
series this looked like the best option, if not please let me know.

Changes since v2
- Change return type and arguments to the bias information lookup function 
  after feedback from Laurent.
- Changed bias info structure data types to avoid unneeded padding after 
  feedback from Laurent.
- Sort variable declaration in descending line length order.
- Add Reviewed-by tag from Laurent.

Changes since v1
- Moved bias helper function from pfc-r8a7795.c to the sh-pfc core.
- Convert r8a7778 to use the new bias helper function.
- Fixed up spelling and attached Ack-tags.
- Attached a patch to add SH_PFC_PIN_NAMED_CFG() to simplify
  dependencies for other series.


Niklas Söderlund (6):
  pinctrl: sh-pfc: Do not unconditionally support
    PIN_CONFIG_BIAS_DISABLE
  pinctrl: sh-pfc: Add helper to handle bias lookup table
  pinctrl: sh-pfc: r8a7795: Simplify get bias logic
  pinctrl: sh-pfc: r8a7795: Use lookup function for bias data
  pinctrl: sh-pfc: r8a7778: Use lookup function for bias data
  pinctrl: sh-pfc: Support named pins with custom configuration

 drivers/pinctrl/sh-pfc/core.c        |  15 ++
 drivers/pinctrl/sh-pfc/core.h        |   4 +
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c | 342 ++++++++++++++++-----------------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 354 +++++++++++++++++------------------
 drivers/pinctrl/sh-pfc/pinctrl.c     |   3 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h      |  14 ++
 6 files changed, 384 insertions(+), 348 deletions(-)

-- 
2.10.2

