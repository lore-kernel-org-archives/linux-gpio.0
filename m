From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.20
Date: Fri, 14 Dec 2018 09:12:57 +0100
Message-ID: <CACRpkdZqeKmrMr7SsAzZHCLM+z4=eyz2XhjYFdhJJLaFDH84zQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are some three pin control fixes for the v4.20 series.
Just odd drivers, so nothing particularly interesting. Details
in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 9ff01193a20d391e8dbce4403dd5ef87c7eaaca6:

  Linux 4.20-rc3 (2018-11-18 13:33:44 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.20-3

for you to fetch changes up to 478b6767ad26ab86d9ecc341027dd09a87b1f997:

  pinctrl: sunxi: a83t: Fix IRQ offset typo for PH11 (2018-12-07 13:32:19 +0100)

----------------------------------------------------------------
Pin control fixes for the v4.20 series:
- Set the tile property on Qualcomm SDM60.
- Fix up enable register calculation for the Meson
- Fix an IRQ offset on the Sunxi (Allwinner)

----------------------------------------------------------------
Chen-Yu Tsai (1):
      pinctrl: sunxi: a83t: Fix IRQ offset typo for PH11

Craig Tatlor (1):
      pinctrl: sdm660: Set tile property for pingroups

Jerome Brunet (1):
      pinctrl: meson: fix pull enable register calculation

 drivers/pinctrl/meson/pinctrl-meson.c      |  3 ++-
 drivers/pinctrl/qcom/pinctrl-sdm660.c      | 28 +++++++++++++++-------------
 drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c |  2 +-
 3 files changed, 18 insertions(+), 15 deletions(-)
