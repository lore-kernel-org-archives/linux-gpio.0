From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for the v4.4 series
Date: Wed, 2 Dec 2015 15:13:53 +0100
Message-ID: <CACRpkdaF_PJR4H9A2nK3mBA4TkdhLGDQPFCS2hedFrhG60FxNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:34589 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932367AbbLBONy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2015 09:13:54 -0500
Received: by oies6 with SMTP id s6so25352218oie.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Dec 2015 06:13:53 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

Hi Linus,

here is a slew of GPIO fixes for the v4.4 series. I should have sent
some of them earlier but well. Some more details in the signed tag.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.4-2

for you to fetch changes up to 000255b7dfc3119c13f388f179d6fc19cd00eada:

  gpio: omap: drop omap1 mpuio specific irq_mask/unmask callbacks
(2015-11-30 13:50:21 +0100)

----------------------------------------------------------------
Some GPIO fixes for the v4.4 series:

- Fix a bunch of possible NULL references found by Coccinelle
  jockeys.
- Stop creating Tegra's debugfs on everything and it's dog.
  This is an ARM multiplatform kernel issue.
- Fix an oops in gpiolib for NULL names on named GPIOs.
- Fix a complex OMAP1 bug in the OMAP driver.

----------------------------------------------------------------
Grygorii Strashko (1):
      gpio: omap: drop omap1 mpuio specific irq_mask/unmask callbacks

LABBE Corentin (3):
      gpio: 74xx: fix a possible NULL dereference
      gpio: syscon: fix a possible NULL dereference
      gpio: palmas: fix a possible NULL dereference

Suzuki K. Poulose (1):
      gpio-tegra: Do not create the debugfs entry by default

Vladimir Zapolskiy (1):
      gpiolib: fix oops, if gpio name is NULL

 drivers/gpio/gpio-74xx-mmio.c |   7 ++-
 drivers/gpio/gpio-omap.c      |   2 -
 drivers/gpio/gpio-palmas.c    |   2 +
 drivers/gpio/gpio-syscon.c    |   6 ++-
 drivers/gpio/gpio-tegra.c     | 105 ++++++++++++++++++++++--------------------
 drivers/gpio/gpiolib.c        |   2 +-
 6 files changed, 69 insertions(+), 55 deletions(-)
