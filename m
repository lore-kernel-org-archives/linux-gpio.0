From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for the v4.1 series
Date: Mon, 25 May 2015 09:26:52 +0200
Message-ID: <CACRpkdb8dnO295DmK6yiKJe0zC67DgEpztVcm2OqUR4YZg4NBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:34184 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859AbbEYH0x (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2015 03:26:53 -0400
Received: by obfe9 with SMTP id e9so49060016obf.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2015 00:26:53 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Michael Brunner <mibru@gmx.de>

Hi Linus,

here are two GPIO fixes targeted for stable.
Nothing special, a blurb in the signed tag.

Please pull this in!

Yours,
Linus Walleij


The following changes since commit 030bbdbf4c833bc69f502eae58498bc5572db736:

  Linux 4.1-rc3 (2015-05-10 15:12:29 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.1-3

for you to fetch changes up to f230e8ffc03f17bd9d6b90ea890b8252a8cc1821:

  gpio: gpio-kempld: Fix get_direction return value (2015-05-12 13:49:13 +0200)

----------------------------------------------------------------
GPIO fixes for the v4.1 series:

- A leak in gpiochip_add path destined for stable.
- A kempld driver bug destined for stable.

----------------------------------------------------------------
Johan Hovold (1):
      gpio: fix gpio leak in gpiochip_add error path

Michael Brunner (1):
      gpio: gpio-kempld: Fix get_direction return value

 drivers/gpio/gpio-kempld.c |  2 +-
 drivers/gpio/gpiolib.c     | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)
