From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.3, take one
Date: Wed, 16 Sep 2015 15:17:11 +0200
Message-ID: <CACRpkdaBU3t2ruikC5He6_AAZXO_Y7GuahZB+6TPFmR+zcc5hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:36475 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752347AbbIPNRM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Sep 2015 09:17:12 -0400
Received: by oibi136 with SMTP id i136so126031615oib.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2015 06:17:11 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

here is a smallish set of pin control fixes for the v4.3 series.

Nothing special to say, business as usual, details in the
signed tag.

Please pull them in!

Yours,
Linus Walleij


The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.3-2

for you to fetch changes up to fa84b52cb681b27e6b5e003457562e25a239b9c4:

  pinctrl: samsung: s3c24xx: fix syntax error (2015-09-14 09:13:43 +0200)

----------------------------------------------------------------
This is a first set of pin control fixes for the v4.3 series:

- Some IS_ERR() fixes from Julia Lawall. I always wanted the compiler
  to catch these but error pointers by nailing them as an err pointer
  intrinsic type or something seem to be a "no can do". In any
  case, cocinelle is obviously up to the task, better than bugs
  staying around.

- Better error handling for NULL GPIO chips.

- Fix a compile error from the big irq desc refactoring. I'm
  surprised the fallout wasn't bigger than this.

----------------------------------------------------------------
Julia Lawall (2):
      pinctrl: qcom: ssbi: convert null test to IS_ERR test
      pinctrl: digicolor: convert null test to IS_ERR test

Linus Walleij (1):
      pinctrl: samsung: s3c24xx: fix syntax error

Masahiro Yamada (1):
      pinctrl: join lines that can be a single line within 80 columns

Tony Lindgren (1):
      pinctrl: core: Warn about NULL gpio_chip in pinctrl_ready_for_gpio_range()

 drivers/pinctrl/core.c                    | 3 +++
 drivers/pinctrl/pinctrl-digicolor.c       | 4 ++--
 drivers/pinctrl/pinmux.c                  | 3 +--
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c  | 4 ++--
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c   | 4 ++--
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 2 +-
 6 files changed, 11 insertions(+), 9 deletions(-)
