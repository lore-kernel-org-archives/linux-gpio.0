From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.8
Date: Tue, 6 Sep 2016 10:04:56 +0200
Message-ID: <CACRpkda3iMyqTGGz1AjAdnAf8u_DWSZZtcKGKRz7rcNR_pRewg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34911 "EHLO
        mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755541AbcIFIE6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2016 04:04:58 -0400
Received: by mail-oi0-f51.google.com with SMTP id s131so19292409oie.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 Sep 2016 01:04:57 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

nothing special at all, just three driver fixes.

Please pull them in!

Yours,
Linus Walleij


The following changes since commit fa8410b355251fd30341662a40ac6b22d3e38468:

  Linux 4.8-rc3 (2016-08-21 16:14:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.8-3

for you to fetch changes up to 486095fae3a8a6b1ae07c51844699d9bd5cfbebc:

  pinctrl: sunxi: fix uart1 CTS/RTS pins at PG on A23/A33 (2016-08-23
12:28:31 +0200)

----------------------------------------------------------------
Pin control fixes for the v4.8 development cycle, all
SoC-specific driver fixes:
- Fix routing problems in pistachio (Imagination) and
  sunxi (AllWinner)
- Fix an interrupt problem in the Cherryview (Intel)

----------------------------------------------------------------
Icenowy Zheng (1):
      pinctrl: sunxi: fix uart1 CTS/RTS pins at PG on A23/A33

James Hartley (1):
      pinctrl: pistachio: fix mfio pll_lock pinmux

Mika Westerberg (1):
      pinctrl: cherryview: Do not mask all interrupts in probe

 drivers/pinctrl/intel/pinctrl-cherryview.c |  5 ++---
 drivers/pinctrl/pinctrl-pistachio.c        | 12 ++++++------
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23.c  |  4 ++--
 drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c  |  4 ++--
 4 files changed, 12 insertions(+), 13 deletions(-)
