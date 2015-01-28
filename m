From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] final pin control fix for v3.19
Date: Wed, 28 Jan 2015 10:25:21 +0100
Message-ID: <CACRpkdZfWmO324Jk5Bv4Mi15eZ=pMiOuUzT=oOoaU150Jo6Nnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is a (hopefully) final pin control fix for the v3.19 series.
This affects the AT91 driver only and is tagged for stable as
well.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 26bc420b59a38e4e6685a73345a0def461136dce:

  Linux 3.19-rc6 (2015-01-25 20:04:41 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v3.19-4

for you to fetch changes up to a0b957f306fa4d0a39f4ffe5e5e25e856e6be46e:

  pinctrl: at91: allow to have disabled gpio bank (2015-01-26 09:13:36 +0100)

----------------------------------------------------------------
A late pin control fix for the v3.19 series:
The AT91 gpio controller would miss wakeup events, this
single fix make it work properly.

----------------------------------------------------------------
Jean-Christophe PLAGNIOL-VILLARD (1):
      pinctrl: at91: allow to have disabled gpio bank

 drivers/pinctrl/pinctrl-at91.c | 108 +++++++++++++++++++++--------------------
 1 file changed, 55 insertions(+), 53 deletions(-)
