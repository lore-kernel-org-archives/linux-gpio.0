From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.19
Date: Fri, 21 Sep 2018 10:03:09 -0700
Message-ID: <CACRpkdaTsM-VV7ck1E8Q_Fv+9NSQ7a8mQp_WAyBMvZjGkrYeLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

Hi Greg,

here are some two fixes for pin contol for v4.19.

Please pull them in for the current HEAD.

Yours,
Linus Walleij

The following changes since commit 7876320f88802b22d4e2daf7eb027dd14175a0f8:

  Linux 4.19-rc4 (2018-09-16 11:52:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.19-3

for you to fetch changes up to 96147db1e1dff83679e71ac92193cbcab761a14c:

  pinctrl: intel: Do pin translation in other GPIO operations as well
(2018-09-20 08:21:52 -0700)

----------------------------------------------------------------
Pin control fixes for v4.19:

- Two fixes for the Intel pin controllers than cause
  problems on laptops.

----------------------------------------------------------------
Mika Westerberg (1):
      pinctrl: intel: Do pin translation in other GPIO operations as well

Simon Detheridge (1):
      pinctrl: cannonlake: Fix gpio base for GPP-E

 drivers/pinctrl/intel/pinctrl-cannonlake.c |   2 +-
 drivers/pinctrl/intel/pinctrl-intel.c      | 111 ++++++++++++++++-------------
 2 files changed, 64 insertions(+), 49 deletions(-)
