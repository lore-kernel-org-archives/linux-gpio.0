From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for the v4.1 kernel cycle
Date: Mon, 25 May 2015 09:33:08 +0200
Message-ID: <CACRpkdbvsqc7Ng27eK37UHmb7TTuRUPc_v6m2r=4=1FbrFmf=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35992 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750852AbbEYHdJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2015 03:33:09 -0400
Received: by oihb142 with SMTP id b142so52369167oih.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2015 00:33:08 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Carlo Caione <carlo@caione.org>, Ray Jui <rjui@broadcom.com>

Hi Linus,

here are some three pin control fixes for the v4.1 cycle,
all driver-specific. Business as usual and calm as it should
be in this portion of the merge window.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 030bbdbf4c833bc69f502eae58498bc5572db736:

  Linux 4.1-rc3 (2015-05-10 15:12:29 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.1-4

for you to fetch changes up to 984cffdeaeb7ea5a21f49a89f638d84d62d08992:

  pinctrl: Fix gpio/pin mapping for Meson8b (2015-05-19 11:40:52 +0200)

----------------------------------------------------------------
Pin control fixes for the v4.1 kernel cycle:

- IRQ trigger fix for the Intel Cherryview.
- GPIO-to-pin mapping fix for the Cygnus driver.
- GPIO-to-pin mapping fix for the Meson8b driver.

----------------------------------------------------------------
Carlo Caione (1):
      pinctrl: Fix gpio/pin mapping for Meson8b

Mika Westerberg (1):
      pinctrl: cherryview: Read triggering type from HW if not set
when requested

Ray Jui (1):
      pinctrl: cygnus: fixed incorrect GPIO-pin mapping

 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c  |  4 ++-
 drivers/pinctrl/intel/pinctrl-cherryview.c | 44 ++++++++++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c      |  2 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c    |  4 +--
 4 files changed, 50 insertions(+), 4 deletions(-)
