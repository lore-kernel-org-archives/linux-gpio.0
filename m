From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control Kconfig fix for v4.1
Date: Tue, 21 Apr 2015 09:40:10 +0200
Message-ID: <CACRpkda0PJDDd2MoLbsiHJ--_3GaVun-GAsDo5tx_FV7_OcHvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:32897 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752130AbbDUHkL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Apr 2015 03:40:11 -0400
Received: by oblw8 with SMTP id w8so139456851obl.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2015 00:40:10 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

here is a single patch fixing the Kconfig noise from allmodconfig
that you reported for the pin control subsystem.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit bb0fd7ab0986105765d11baa82e619c618a235aa:

  Merge branch 'for-linus' of
git://ftp.arm.linux.org.uk/~rmk/linux-arm (2015-04-14 21:03:26 -0700)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.1-2

for you to fetch changes up to b99e6fb86541e4dc28f5c3ff7418347fa9d8d29c:

  pinctrl: fix allmodconfig noise (2015-04-15 10:02:42 +0200)

----------------------------------------------------------------
This fixes the annoying Kconfig noise from pin control.
Mea Culpa.

----------------------------------------------------------------
Linus Walleij (1):
      pinctrl: fix allmodconfig noise

 drivers/pinctrl/Kconfig          | 5 ++++-
 drivers/pinctrl/mediatek/Kconfig | 3 +++
 drivers/pinctrl/nomadik/Kconfig  | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)
