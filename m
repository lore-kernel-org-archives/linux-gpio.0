From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v5.0
Date: Wed, 20 Feb 2019 09:08:25 +0100
Message-ID: <CACRpkdYMDh-VLBcKsfrCV5wV0vUqGPujztkqTjyZPznJ2APhEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

some final pin control fixes (I hope) to round off the v5.0 pin control
development cycle.

Only driver fixes, one for stable.

Please pull them in!

Yours,
Linus Walleij


The following changes since commit d13937116f1e82bf508a6325111b322c30c85eb9:

  Linux 5.0-rc6 (2019-02-10 14:42:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.0-3

for you to fetch changes up to c17abcfa93bf0be5e48bb011607d237ac2bfc839:

  pinctrl: meson: meson8b: fix the sdxc_a data 1..3 pins (2019-02-17
22:24:32 +0100)

----------------------------------------------------------------
Pin control fixes for the v5.0 series:
- Meson8B fixup for the sdc pins
- Fix SDC tile position for Qualcomm QCS404

----------------------------------------------------------------
Bjorn Andersson (1):
      pinctrl: qcom: qcs404: Correct SDC tile

Martin Blumenstingl (1):
      pinctrl: meson: meson8b: fix the sdxc_a data 1..3 pins

 drivers/pinctrl/meson/pinctrl-meson8b.c | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcs404.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
