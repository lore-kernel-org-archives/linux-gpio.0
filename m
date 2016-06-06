From: Wolfram Sang <wsa@the-dreams.de>
Subject: [RFC 0/3] pinctrl: sh-pfc: add r8a7795 support for voltage switching
Date: Mon,  6 Jun 2016 08:50:08 +0200
Message-ID: <1465195811-3041-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:47457 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750956AbcFFGuZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 6 Jun 2016 02:50:25 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa@the-dreams.de>

This series adds support for PFC voltage switching for r8a7795. I decided to
refactor voltage switching because all Gen2 and Gen3 hardware follow the same
style to do that. So, we can put generic handling to the core and keep only
pin-to-bit mapping SoC specific. See patch 1 for details.

Tested on a Lager board (r8a7790/H2) and a Salvator-X (r8a7795/H3) by using
UHS/non-UHS SD cards. They work fine with SDR50 and the POCCTRL register
setting was also verified.

Branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/h3-pfc-set-voltage

Please let me know what you think.

Thanks,

   Wolfram

Wolfram Sang (3):
  pinctrl: sh-pfc: refactor voltage setting
  pinctrl: sh-pfc: r8a7795: add support for voltage switching
  arm64: dts: r8a7795: salvator: enable UHS for SDHI 0 & 3

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 22 +++++++-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               | 58 +++++-----------------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 24 ++++++++-
 drivers/pinctrl/sh-pfc/pinctrl.c                   | 41 +++++++++------
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |  4 +-
 5 files changed, 82 insertions(+), 67 deletions(-)

-- 
2.8.1

