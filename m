From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.10
Date: Thu, 5 Jan 2017 17:18:45 +0100
Message-ID: <CACRpkdYR=HjWPqdVt1FDO3kr4KW-rLZ6kJ_VT1CwJZB1xrMXOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:34606 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753647AbdAEQSq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Jan 2017 11:18:46 -0500
Received: by mail-qk0-f175.google.com with SMTP id a20so48321830qkc.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jan 2017 08:18:46 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

three small pin control fixes for the v4.10 series. Very little
to say about them, just driver fixes.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.10-2

for you to fetch changes up to 1259feddd0f83649d5c48d730c140b4f7f3fa288:

  pinctrl: samsung: Fix the width of PINCFG_TYPE_DRV bitfields for
Exynos5433 (2016-12-30 14:27:42 +0100)

----------------------------------------------------------------
Pin control fixes for the v4.10 series:

- One fix to the AMD pinctrl ACPI glue.

- Fix requests on the Meson driver.

- Fix bitfield widths on Samsungs Exynos 5433.

----------------------------------------------------------------
Chanwoo Choi (1):
      pinctrl: samsung: Fix the width of PINCFG_TYPE_DRV bitfields for
Exynos5433

Neil Armstrong (1):
      pinctrl: meson: fix gpio request disabling other modes

Shyam Sundar S K (1):
      pinctrl/amd: Set the level based on ACPI tables

 drivers/pinctrl/meson/pinctrl-meson.c    |  2 +-
 drivers/pinctrl/pinctrl-amd.c            | 19 +++----
 drivers/pinctrl/samsung/pinctrl-exynos.c | 91 ++++++++++++++++++--------------
 drivers/pinctrl/samsung/pinctrl-exynos.h | 31 +++++++++++
 4 files changed, 90 insertions(+), 53 deletions(-)
