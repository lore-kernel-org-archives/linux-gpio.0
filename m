From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for the v4.9 series
Date: Wed, 19 Oct 2016 15:16:06 +0200
Message-ID: <CACRpkdbHAOh=5W0_ppoKmqWtAooi-52xBb8J+NUaif4iwyGjHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are some pin control fixes. Details in the signed tag.
Two of them tagged for stable even.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc=
:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.9-2

for you to fetch changes up to c538b9436751a0be2e1246b48353bc23156bdbcc:

  pinctrl: intel: Only restore pins that are used by the driver
(2016-10-18 14:38:16 +0200)

----------------------------------------------------------------
Pin control fixes for v4.9 first round:

- A bunch of barnsjukdomar/kinderkrankheiten/maladie infantile
  in the Aspeed driver. (Why doesn't English have a word for this?)

- Fix a lockdep bug on the Intel BayTrail.

- Fix a few special laptop issues on the Intel pin controller
  solving suspend issues.

----------------------------------------------------------------
Andrew Jeffery (4):
      pinctrl: aspeed: "Not enabled" is a significant mux state
      pinctrl: aspeed-g5: Fix names of GPID2 pins
      pinctrl: aspeed-g5: Fix GPIOE1 typo
      pinctrl: aspeed-g5: Fix pin association of SPI1 function

Mika Westerberg (1):
      pinctrl: intel: Only restore pins that are used by the driver

Ville Syrj=C3=A4l=C3=A4 (1):
      pinctrl: baytrail: Fix lockdep

 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |   4 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         | 100 +++++++++++++++++=
----
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  12 +--
 drivers/pinctrl/intel/pinctrl-baytrail.c           |   3 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |  25 +++++-
 5 files changed, 120 insertions(+), 24 deletions(-)
