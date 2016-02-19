From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.5
Date: Fri, 19 Feb 2016 12:34:22 +0100
Message-ID: <CACRpkda296x0EAOM1SSOxssK5k9+5PbH4v+PicssMxJie14PiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are some accumulated fixes for pin control. Should have
sent them earlier I guess but I was swamped. Anyways here
they are. All are driver fixes, nothing else. Details in the signed
tag. Roasted in linux-next.

Please pull them in!

Yours,
Linus Walleij


The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.5-2

for you to fetch changes up to d9ff0eb9ca4b00ce2fbf9ede1e99681f05c0bc91:

  pinctrl: samsung: fix SMP race condition (2016-02-15 20:45:50 +0100)

----------------------------------------------------------------
Pin control fixes for the v4.5 series, all are individual
driver fixes:
- Fix the PXA2xx driver to export its init function so we
  do not break modular compiles.
- Hide unused functions in the Nomadik driver.
- Fix up direction control in the Mediatek driver.
- Toggle the sunxi GPIO lines to input when you read them
  on the H3 GPIO controller, lest you only get garbage.
- Fix up the number of settings in the MVEBU driver.
- Fix a serious SMP race condition in the Samsung driver.

----------------------------------------------------------------
Arnd Bergmann (1):
      pinctrl: nomadik: hide unused functions

Biao Huang (1):
      pinctrl: mediatek: fix direction control issue

Krzysztof Adamski (1):
      pinctrl: sunxi: H3 requires irq_read_needs_mux

Masahiro Yamada (1):
      pinctrl: pxa: export pxa2xx_pinctrl_init()

Sebastian Hesselbarth (1):
      pinctrl: mvebu: fix num_settings in mpp group assignment

Youngmin Nam (1):
      pinctrl: samsung: fix SMP race condition

 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |  2 ++
 drivers/pinctrl/mvebu/pinctrl-mvebu.c         |  9 +++--
 drivers/pinctrl/nomadik/pinctrl-abx500.c      |  5 +--
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c          |  1 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     | 48 +++++++++++++++++++--------
 drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c      |  1 +
 6 files changed, 48 insertions(+), 18 deletions(-)
