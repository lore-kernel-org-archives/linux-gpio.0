From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.11 take two
Date: Mon, 27 Mar 2017 09:38:02 +0200
Message-ID: <CACRpkdbAbbeY_FObg9bH-=tKQci3EpSFfGkrHc3RF09zY+u+7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

Here is a bunch of pin control fixes again. A bit more than I'd like
for this subsystem at this point, but what can I do. They are all
driver fixes for hardware issues, as like "we forgot", "we didn't think
of the fact that this could happen", "oops that one goes there" etc.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 97da3854c526d3a6ee05c849c96e48d21527606c:

  Linux 4.11-rc3 (2017-03-19 19:09:39 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.11-3

for you to fetch changes up to d7402de48efae57bbb0072e53d3800c30de57ea5:

  pinctrl: qcom: ipq4019: add missing pingroups for pins > 70
(2017-03-23 10:13:15 +0100)

----------------------------------------------------------------
Pin control fixes for v4.11, take two:

- Kconfig fixup for the TI IOdelay pinctrl-single add-on.

- Fix up a typo in the meson i2c ao groups.

- Switch a remapping back to use devm_ioremap() as
  devm_ioremap_resource() does not allow for sharing memory
  regions.

- Do not clear the Qualcomm irq status bit in irq_unmask(),
  as this can lead to missing interrupts while the irq handler
  is executing.

- Add irq_request/release_resources() on the ST driver.

- Add a bunch of mysteriously missing pingroups for high
  numbered pins in the Qualcomm ipq4019 driver.

----------------------------------------------------------------
Andrzej Hajda (1):
      pinctrl: samsung: Fix memory mapping code

Bjorn Andersson (1):
      pinctrl: qcom: Don't clear status bit on irq_unmask

Christian Lamparter (1):
      pinctrl: qcom: ipq4019: add missing pingroups for pins > 70

Neil Armstrong (1):
      pinctrl: meson-gxbb: Fix typo in i2c ao groups

Patrice Chotard (1):
      pinctrl: st: add irq_request/release_resources callbacks

Peter Robinson (1):
      pinctrl: ti: The IODelay driver is a DRA7xxx feature so depend on that SoC

 drivers/pinctrl/meson/pinctrl-meson-gxbb.c |  4 ++--
 drivers/pinctrl/pinctrl-st.c               | 30 ++++++++++++++++++++++++------
 drivers/pinctrl/qcom/pinctrl-ipq4019.c     | 30 ++++++++++++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.c         |  4 ----
 drivers/pinctrl/samsung/pinctrl-samsung.c  | 13 ++++++++++---
 drivers/pinctrl/ti/Kconfig                 |  2 +-
 6 files changed, 67 insertions(+), 16 deletions(-)
