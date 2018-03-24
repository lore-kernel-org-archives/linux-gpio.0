From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.16
Date: Sat, 24 Mar 2018 17:43:25 +0100
Message-ID: <CACRpkda9+tSc3GYZ=UPe4uTOaC0Y2zO3A1VBQQeZfkZ=Zytksg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is a set of two fixes for pin control for v4.16.

Details are in the signed tag as usal.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 661e50bc853209e41a5c14a290ca4decc43cbfd1=
:

  Linux 4.16-rc4 (2018-03-04 14:54:11 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.16-3

for you to fetch changes up to 93b0beae721b3344923b4b8317e9d83b542f4ca6:

  pinctrl: samsung: Validate alias coming from DT (2018-03-08 13:02:26 +010=
0)

----------------------------------------------------------------
Pin control fixes for v4.16:
- One fix to the Renesas SH-PFC driver removing a duplicate clkout pin
  which was causing crashes.
- One fix to the Samsung driver for out of bounds exceptions.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      pinctrl: samsung: Validate alias coming from DT

Niklas S=C3=B6derlund (1):
      pinctrl: sh-pfc: r8a7795: remove duplicate of CLKOUT pin in pinmux_pi=
ns[]

 drivers/pinctrl/samsung/pinctrl-exynos-arm.c   | 56 +++++++++++++++++++---=
-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 14 +++++-
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c      | 28 ++++++++++--
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c      |  7 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      | 61 ++++++++++++++++------=
----
 drivers/pinctrl/samsung/pinctrl-samsung.h      | 40 ++++++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c           |  1 -
 7 files changed, 154 insertions(+), 53 deletions(-)
