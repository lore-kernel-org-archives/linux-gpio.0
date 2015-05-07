From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for the v4.1 series
Date: Thu, 7 May 2015 12:06:45 +0200
Message-ID: <CACRpkdYyyu9de5=VVLZrm=v9BA2h25RMp9HTT2CD5TjtiZ_Y7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is a smallish set of pin control fixes for the v4.1 cycle,
collected the last two weeks.

Please pull them in, details in the signed tag.

Yours,
Linus Walleij

The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:

  Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.1-3

for you to fetch changes up to c5272a28566b00cce79127ad382406e0a8650690:

  pinctrl: Don't just pretend to protect pinctrl_maps, do it for real
(2015-05-06 16:24:28 +0200)

----------------------------------------------------------------
Pin control fixes for the v4.1 series:

- Fix a real nasty legacy bug that has screwed up the protection
  of adding pinctrl maps dynamically. Normally this didn't happen
  so much but Dough Anderson ran into it and fixed it, kudos!

- Minor driver fixes for Qualcomm spmi, mediatek and Marvell
  drivers.

----------------------------------------------------------------
Andrew Andrianov (1):
      pinctrl: mvebu: Fix mapping of pin 63 (gpo -> gpio)

Colin Ian King (1):
      pinctrl: mediatek: mtk-common: initialize unmask

Doug Anderson (1):
      pinctrl: Don't just pretend to protect pinctrl_maps, do it for real

Ivan T. Ivanov (2):
      pinctrl: qcom-spmi: Fix pin direction configuration
      pinctrl: qcom-spmi-mpp: Fix input value report

 drivers/pinctrl/core.c                        | 10 ++++------
 drivers/pinctrl/core.h                        |  2 +-
 drivers/pinctrl/devicetree.c                  |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |  2 ++
 drivers/pinctrl/mvebu/pinctrl-armada-370.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |  1 +
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c       | 10 ++++++----
 7 files changed, 16 insertions(+), 13 deletions(-)
