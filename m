From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.17 take one
Date: Tue, 8 May 2018 15:30:45 +0200
Message-ID: <CACRpkdYnfUZ7_KhMw675tkdNY5DnKwNk=r+a1yYrBT9EGg4KVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are some three pin control fixes, the Intel fixes are the most serious
and important things I had queued since it affects a large portion of
deployed Chromebooks.

Please pull it in, some details are in the signed tag and individula commits.

Again, this should have been sent earlier, sorry :(

Yours,
Linus Walleij


The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.17-2

for you to fetch changes up to c41eb2c7f93531b8ea689b1e2bfe7e6b884a7213:

  pinctrl: sunrisepoint: Align GPIO number space with Windows
(2018-05-02 14:36:00 +0200)

----------------------------------------------------------------
Pin control fixes for v4.17:

- Two major fixes for the Intel Cherryview and Sunrisepoint
  pin controllers, adjusting numberspaces so that they do
  get aligned with various messed-up numbers encoded into
  the BIOS.

- A fix for the Meson driver GPIO pin range.

----------------------------------------------------------------
Mika Westerberg (2):
      pinctrl: cherryview: Associate IRQ descriptors to irqdomain
      pinctrl: sunrisepoint: Align GPIO number space with Windows

Yixun Lan (1):
      pinctrl: meson-axg: fix the range of aobus bank

 drivers/pinctrl/intel/pinctrl-cherryview.c   | 16 +++++++---
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 45 ++++++++++++++++++++++++++--
 drivers/pinctrl/meson/pinctrl-meson-axg.c    |  2 +-
 3 files changed, 55 insertions(+), 8 deletions(-)
