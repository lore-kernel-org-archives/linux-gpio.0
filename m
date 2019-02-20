From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for the v5.0 series
Date: Wed, 20 Feb 2019 09:03:22 +0100
Message-ID: <CACRpkdYq5tVpFNC7sjdSATOMKCOeMxrjKK-pP6HNzgHt2bbVgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

some final polish for GPIO for v5.0.

Both patches are also tagged for stable.

Please pull them in!

Yours,
Linus Walleij


The following changes since commit 8834f5600cf3c8db365e18a3d5cac2c2780c81e5=
:

  Linux 5.0-rc5 (2019-02-03 13:48:04 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.0-4

for you to fetch changes up to af14b2c98adb85e9517390bb88309338b9075350:

  gpio: pxa: avoid attempting to set pin direction via pinctrl on MMP2
(2019-02-14 10:06:03 +0100)

----------------------------------------------------------------
Two GPIO fixes for the v5.0 series:
- Per-instance irqchip on the MT7621
- Avoid direction setting using pin control on MMP2

----------------------------------------------------------------
Lubomir Rintel (1):
      gpio: pxa: avoid attempting to set pin direction via pinctrl on MMP2

Ren=C3=A9 van Dorst (1):
      gpio: MT7621: use a per instance irq_chip structure

 drivers/gpio/gpio-mt7621.c | 20 ++++++++++----------
 drivers/gpio/gpio-pxa.c    |  1 +
 2 files changed, 11 insertions(+), 10 deletions(-)
