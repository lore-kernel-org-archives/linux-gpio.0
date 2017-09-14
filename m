From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.14 take one
Date: Thu, 14 Sep 2017 11:34:36 +0200
Message-ID: <CACRpkdZR_mEDmoVCuf7n6zC3F0Y+rp07kDFom-gVcDpQBU-wZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:45082 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751536AbdINJei (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Sep 2017 05:34:38 -0400
Received: by mail-it0-f53.google.com with SMTP id v19so3779969ite.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Sep 2017 02:34:38 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

this slew of fixes for pin control was noticed and patched up early,
so to get the annoyance out of the way for -rc1 it would make sense
to send them already.

As predicted, it is based on a random merge commit at this point.
It's beeen boiled in linux-next.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 5969d1bb3082b41eba8fd2c826559abe38ccb6df:

  Merge branch 'gperf-removal' (2017-09-07 21:39:15 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.14-2

for you to fetch changes up to 79d2c8bede2c93f9432d7da0bc2f76a195c90fc0:

  pinctrl/amd: save pin registers over suspend/resume (2017-09-12
15:58:45 +0200)

----------------------------------------------------------------
A first set of pin control fixes noted early in the kernel cycle:

- Fix a build include in the Uniphier driver to keep pace with
  ongoing refactorings.

- Fix a slew of minor semantic and syntactic issues as well as
  stricting up Kconfig for the new Spreadtrum driver.

- Fix the GPIO interrupt set-up on the Marvell 37xx Armada as
  fallout for dynamically allocating irq descriptors from the
  core. (Also tagged for stable.)

- Fix AMD register suspend/resume state spool/unspooling so that
  wakeup works as it should. (Also tagged for stable.)

----------------------------------------------------------------
Colin Ian King (1):
      pinctrl: sprd: make three local functions static

Dan Carpenter (2):
      pinctrl: sprd: check for allocation failure
      pinctrl: sprd: fix off by one bugs

Daniel Drake (1):
      pinctrl/amd: save pin registers over suspend/resume

Geert Uytterhoeven (1):
      pinctrl: sprd: Restrict PINCTRL_SPRD to ARCH_SPRD or COMPILE_TEST

Gregory CLEMENT (1):
      pinctrl: armada-37xx: Fix gpio interrupt setup

Masahiro Yamada (1):
      pinctrl: uniphier: include <linux/build_bug.h> instead of <linux/bug.h>

Randy Dunlap (1):
      pinctrl: sprd: fix build errors and dependencies

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 41 ++++++++--------
 drivers/pinctrl/pinctrl-amd.c               | 75 +++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-amd.h               |  1 +
 drivers/pinctrl/sprd/Kconfig                |  3 ++
 drivers/pinctrl/sprd/pinctrl-sprd.c         | 32 ++++++------
 drivers/pinctrl/uniphier/pinctrl-uniphier.h |  2 +-
 6 files changed, 120 insertions(+), 34 deletions(-)
