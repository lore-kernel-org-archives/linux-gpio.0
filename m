From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] single remaining GPIO fix for v4.7
Date: Fri, 22 Jul 2016 15:37:46 +0200
Message-ID: <CACRpkdbnawXgi10xCriqOxTSVqkiMfqu58bukyBNxE+=UvaUVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:33468 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753595AbcGVNhr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2016 09:37:47 -0400
Received: by mail-oi0-f48.google.com with SMTP id j185so162837718oih.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2016 06:37:47 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>

Hi Linus,

sorry to send this in the last minute but Ingo says this
build failure is very prominent so I'm not gonna wait for v4.7
before sending it.

It is a case of COMPILE_TEST causing more problems than
it solves and I'm already swearing about me shooting myself
in the foot with that gun :(

I took the patch out of my development branch where it was
erroneously sitting and that is why it seems to be commited
today, but it has been in -next for more than a week.

Please pull it in.

Yours,
Linus Walleij


The following changes since commit 92d21ac74a9e3c09b0b01c764e530657e4c85c49:

  Linux 4.7-rc7 (2016-07-10 20:24:59 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.7-6

for you to fetch changes up to 0bfb85c6ba620c39c0e5124851a1bea0f5a56e05:

  gpio: tegra: don't auto-enable for COMPILE_TEST (2016-07-22 15:29:32 +0200)

----------------------------------------------------------------
Compile problem fix for Tegra

----------------------------------------------------------------
Arnd Bergmann (1):
      gpio: tegra: don't auto-enable for COMPILE_TEST

 drivers/gpio/Kconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
