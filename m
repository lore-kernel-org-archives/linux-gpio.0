From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fix for v4.11
Date: Sat, 8 Apr 2017 12:24:09 +0200
Message-ID: <CACRpkda+kKQhiaQByG4A1AtyJkNhEggh-n7q1cHn8+nQzgFzsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:36858 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751523AbdDHKYL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Apr 2017 06:24:11 -0400
Received: by mail-it0-f45.google.com with SMTP id 19so5975765itj.1
        for <linux-gpio@vger.kernel.org>; Sat, 08 Apr 2017 03:24:11 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, ext Tony Lindgren <tony@atomide.com>

Hi Linus,

this late fix for pin control is hopefully the last I send this cycle.
The problem was detected early in the v4.11 release cycle and
there has been some back and forth on how to solve it.
Sadly the proper fix arrives late, but at least not too late.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit a71c9a1c779f2499fb2afc0553e543f18aff6edf:

  Linux 4.11-rc5 (2017-04-02 17:23:54 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.11-4

for you to fetch changes up to 6118714275f0a313ecc296a87ed1af32d9691bed:

  pinctrl: core: Fix pinctrl_register_and_init() with pinctrl_enable()
(2017-04-07 01:08:08 +0200)

----------------------------------------------------------------
Late pin control fix for v4.11:

An issue was detected with pin control hos on the Freescale i.MX after
the refactorings for more general group and function handling. We now
have the proper fix for this.

----------------------------------------------------------------
Tony Lindgren (1):
      pinctrl: core: Fix pinctrl_register_and_init() with pinctrl_enable()

 Documentation/pinctrl.txt               |  8 ++-
 drivers/pinctrl/core.c                  | 97 +++++++++++++++++++++------------
 drivers/pinctrl/freescale/pinctrl-imx.c |  2 +-
 drivers/pinctrl/pinctrl-single.c        |  2 +-
 drivers/pinctrl/sh-pfc/pinctrl.c        | 11 +++-
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c |  2 +
 include/linux/pinctrl/pinctrl.h         |  3 +-
 7 files changed, 83 insertions(+), 42 deletions(-)
