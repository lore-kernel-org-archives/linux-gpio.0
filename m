From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/1] pinctrl-meson8b: fix the NAND DQS pin definitions
Date: Sat, 25 Mar 2017 19:43:49 +0100
Message-ID: <20170325184350.7677-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36762 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751462AbdCYSoF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Mar 2017 14:44:05 -0400
Received: by mail-wm0-f66.google.com with SMTP id x124so3820187wmf.3
        for <linux-gpio@vger.kernel.org>; Sat, 25 Mar 2017 11:44:03 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, khilman@baylibre.com, carlo@caione.org, linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>

We currently do not have a NAND driver but once we have one this will
become handy:
The current nand_dqs_0 and nand_dqs_1 groups are not usable because the
"nand" function only allows "nand_dqs0" and "nand_dqs1" (no underscore
after "nand_dqs").

While here, also rename the groups to "nand_dqs_15" (uses pin 15) and
"nand_dqs_18" (uses pin 18).
Renaming is safe in this case as it was not possible to use these
groups/pins before (so we can be sure that there are no "old DT
consumers" out there).


Martin Blumenstingl (1):
  pinctrl: meson: meson8b: fix the NAND DQS pins

 drivers/pinctrl/meson/pinctrl-meson8b.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.12.1

