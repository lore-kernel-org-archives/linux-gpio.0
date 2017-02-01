From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.10
Date: Wed, 1 Feb 2017 09:56:05 +0100
Message-ID: <CACRpkdbBJpzsDJ6BkLnu3YAr+1CHWFemctMhNDpt=T9dTgBs_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:35231 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751839AbdBAI4G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2017 03:56:06 -0500
Received: by mail-it0-f41.google.com with SMTP id 203so12388276ith.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2017 00:56:06 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Alexander Stein <alexander.stein@systec-electronic.com>, Maxime Ripard <maxime.ripard@free-electrons.com>

Hi Linus,

another week another set of pin control fixes. The subsystem has seen
high patch-spot activity recently.

The majority of the patches are for Intel, I vaguely think it mostly concern
phones, tablets and maybe chromebooks and even laptops with this Intel
Atom family chips.

Please pull them in!

Yours,
Linus Walleij


The following changes since commit 566cf877a1fcb6d6dc0126b076aad062054c2637:

  Linux 4.10-rc6 (2017-01-29 14:25:17 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.10-4

for you to fetch changes up to cdca06e4e85974d8a3503ab15709dbbaf90d3dd1:

  pinctrl: baytrail: Add missing spinlock usage in
byt_gpio_irq_handler (2017-01-30 15:53:57 +0100)

----------------------------------------------------------------
Pin control fixes for the v4.10 series.

Driver fixes only:

- One fix to the Berlin driver making the SD card work fully
  again.

- One fix to the Allwinner/sunxi bias function: one premature
  change needs to be partially reverted.

- The remaining four patches are to Intel embedded SoCs: baytrail
  (three patches) and merrifield (one patch): register access
  debounce fixes and a missing spinlock.

----------------------------------------------------------------
Alexander Stein (1):
      pinctrl: baytrail: Add missing spinlock usage in byt_gpio_irq_handler

Andy Shevchenko (3):
      pinctrl: intel: merrifield: Add missed check in mrfld_config_set()
      pinctrl: baytrail: Rectify debounce support (part 2)
      pinctrl: baytrail: Debounce register is one per community

Jisheng Zhang (1):
      pinctrl: berlin-bg4ct: fix the value for "sd1a" of pin SCRD0_CRD_PRES

Maxime Ripard (1):
      pinctrl: sunxi: Don't enforce bias disable (for now)

 drivers/pinctrl/berlin/berlin-bg4ct.c      |  2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c   | 27 ++++++++++++++++++++-------
 drivers/pinctrl/intel/pinctrl-merrifield.c |  3 +++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c      |  3 +--
 4 files changed, 25 insertions(+), 10 deletions(-)
