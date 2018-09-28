From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.19 take 4
Date: Fri, 28 Sep 2018 08:59:32 +0200
Message-ID: <CACRpkdbQrZ7HHunuB_BdUo666riyg4ZKAOKo8BDHCY3RDYrXgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Greg,

here are some three pin control fixes for v4.19.
All are x86 related.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 6bf4ca7fbc85d80446ac01c0d1d77db4d91a6d84:

  Linux 4.19-rc5 (2018-09-23 19:15:18 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.19-4

for you to fetch changes up to 72923e5488f0604fac8ef2c7e683fabd3b4c203b:

  Revert "pinctrl: intel: Do pin translation when lock IRQ"
(2018-09-25 12:50:00 +0200)

----------------------------------------------------------------
Pin control fixes for v4.19:
- Fixes to x86 hardware:
- AMD interrupt debounce issues
- Faulty Intel cannonlake register offset
- Revert pin translation IRQ locking

----------------------------------------------------------------
Daniel Kurtz (1):
      pinctrl/amd: poll InterruptEnable bits in amd_gpio_irq_set_type

Mika Westerberg (2):
      pinctrl: cannonlake: Fix HOSTSW_OWN register offset of H variant
      Revert "pinctrl: intel: Do pin translation when lock IRQ"

 drivers/pinctrl/intel/pinctrl-cannonlake.c | 33 ++++++++++++++++++------------
 drivers/pinctrl/intel/pinctrl-intel.c      | 32 -----------------------------
 drivers/pinctrl/pinctrl-amd.c              | 33 +++++++++++++++++++++---------
 3 files changed, 43 insertions(+), 55 deletions(-)
