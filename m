From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fix for v4.15
Date: Fri, 22 Dec 2017 15:34:38 +0100
Message-ID: <CACRpkdau+ZE9Xo5DijEMeBYwik_SidSGe04j_rDJF6ijyc600w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is a single pin control fix affecting a bunch of Intel
chromebooks. Nothing else collected up amazingly.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 50c4c4e268a2d7a3e58ebb698ac74da0de40ae36:

  Linux 4.15-rc3 (2017-12-10 17:56:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.15-3

for you to fetch changes up to d2b3c353595a855794f8b9df5b5bdbe8deb0c413:

  pinctrl: cherryview: Mask all interrupts on Intel_Strago based
systems (2017-12-12 09:51:38 +0100)

----------------------------------------------------------------
A single pin control fix for Intel machines, affecting a bunch of
Chromebooks.

----------------------------------------------------------------
Mika Westerberg (1):
      pinctrl: cherryview: Mask all interrupts on Intel_Strago based systems

 drivers/pinctrl/intel/pinctrl-cherryview.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
