From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.11
Date: Thu, 13 Apr 2017 13:36:41 +0200
Message-ID: <CACRpkdaQ=DeBwpe6dQNJwGT35voh5p838NXaNzKxkgT05hh99A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

these are hopefully the last pin control fixes I send this
kernel cycle. A Chromebook and an Exynos SoC thingie.

The Exynos patch is pretty big, it is fixing unbroken a breakage
caused by yours truly when trying to figure out the merge mess
with the different Samsung platforms for this merge window.
Sorry about that. We have countered this situation by assigning
a Samsung pin control submaintainer to catch stuff earlier.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 39da7c509acff13fc8cb12ec1bb20337c988ed36:

  Linux 4.11-rc6 (2017-04-09 09:49:44 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.11-5

for you to fetch changes up to 7036502783729c2aaf7a3c24c89087c58721430f:

  pinctrl: cherryview: Add a quirk to make Acer Chromebook keyboard
work again (2017-04-11 10:09:39 +0200)

----------------------------------------------------------------
Two pin control fixes arriving late:

- Make the Acer Chromebook keyboard work again with the Intel
  Cherryview driver.
- Fix a merge error in the Exynos 5433 driver.

----------------------------------------------------------------
Chanwoo Choi (1):
      pinctrl: samsung: Add missing part for PINCFG_TYPE_DRV of Exynos5433

Mika Westerberg (1):
      pinctrl: cherryview: Add a quirk to make Acer Chromebook
keyboard work again

 drivers/pinctrl/intel/pinctrl-cherryview.c | 26 +++++++++-
 drivers/pinctrl/samsung/pinctrl-exynos.c   | 80 +++++++++++++++---------------
 drivers/pinctrl/samsung/pinctrl-exynos.h   | 11 ----
 3 files changed, 64 insertions(+), 53 deletions(-)
