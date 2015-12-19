From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.4 take 2
Date: Sat, 19 Dec 2015 12:37:26 +0100
Message-ID: <CACRpkdY8nGf3rCzrQvEZ5OJL1sLCVOMdwbiaOSmXgvyREyEiAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:34719 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932175AbbLSLh1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Dec 2015 06:37:27 -0500
Received: by mail-ob0-f170.google.com with SMTP id iw8so95830187obc.1
        for <linux-gpio@vger.kernel.org>; Sat, 19 Dec 2015 03:37:27 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

here is a bunch of small driver fixes and a MAINTAINERS
entry for the pinctrl-single driver, not much to say about that,
please pull it in!

Yours,
Linus Walleij

The following changes since commit 527e9316f8ec44bd53d90fb9f611fa7ffff52bb9:

  Linux 4.4-rc4 (2015-12-06 15:43:12 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.4-3

for you to fetch changes up to 13cbd906e89a1af42c586dcc4f42b311d23b7fd1:

  MAINTAINERS: pinctrl: Add maintainers for pinctrl-single (2015-12-14
15:03:19 +0100)

----------------------------------------------------------------
Pin control fixes:
- Driver fixes for Freescale i.MX7D, Intel, Broadcom 2835
- One MAINTAINERS entry

----------------------------------------------------------------
Qipeng Zha (2):
      pinctrl: intel: fix bug of register offset calculation
      pinctrl: intel: fix offset calculation issue of register PAD_OWN

Shawn Guo (1):
      pinctrl: freescale: add ZERO_OFFSET_VALID flag for vf610 pinctrl

Stefan Wahren (1):
      pinctrl: bcm2835: Fix initial value for direction_output

Tony Lindgren (1):
      MAINTAINERS: pinctrl: Add maintainers for pinctrl-single

 MAINTAINERS                                  |  8 ++++++
 drivers/pinctrl/bcm/pinctrl-bcm2835.c        | 13 +++++----
 drivers/pinctrl/freescale/pinctrl-vf610.c    |  2 +-
 drivers/pinctrl/intel/pinctrl-broxton.c      |  1 +
 drivers/pinctrl/intel/pinctrl-intel.c        | 41 ++++++++++++++--------------
 drivers/pinctrl/intel/pinctrl-intel.h        |  3 ++
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c |  1 +
 7 files changed, 41 insertions(+), 28 deletions(-)
