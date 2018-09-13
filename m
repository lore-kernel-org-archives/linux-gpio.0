From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.19
Date: Thu, 13 Sep 2018 14:13:15 +0200
Message-ID: <CACRpkdY7m-Q54BwoKEN5a4+9fTgQ3o6qWNXT+y0bqGkG2dkBiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are some three pin control fixes for the v4.19 series. This subsystem
has been unusually quiet this merge window so not much fixes appeared.

Please pull them in!

Details in the signed tag.

Yours,
Linus Walleij


The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.19-2

for you to fetch changes up to 5bc5a671b1f4b3aa019264ce970d3683a9ffa761:

  pinctrl: madera: Fix possible NULL pointer with pdata config
(2018-08-29 14:02:47 +0200)

----------------------------------------------------------------
Pin control fixes for the v4.19 kernel cycle:

- A complicated IRQ fix for the MSM driver (see commit).

- Fix the group/function check in the Ingenic driver.

- Deal with a possible NULL pointer dereference in the Madera
  driver.

----------------------------------------------------------------
Paul Burton (1):
      pinctrl: ingenic: Fix group & function error checking

Richard Fitzgerald (1):
      pinctrl: madera: Fix possible NULL pointer with pdata config

Stephen Boyd (1):
      pinctrl: msm: Really mask level interrupts to prevent latching

 drivers/pinctrl/cirrus/pinctrl-madera-core.c |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c            |  4 ++--
 drivers/pinctrl/qcom/pinctrl-msm.c           | 24 ++++++++++++++++++++++++
 3 files changed, 27 insertions(+), 3 deletions(-)
