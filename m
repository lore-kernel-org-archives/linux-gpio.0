From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/2] pinctrl-meson8b: fix the NAND DQS pin definitions
Date: Sat,  1 Apr 2017 15:59:20 +0200
Message-ID: <20170401135922.1288-1-martin.blumenstingl@googlemail.com>
References: <20170325184350.7677-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35533 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751413AbdDAN7f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Apr 2017 09:59:35 -0400
Received: by mail-wm0-f68.google.com with SMTP id z133so3746242wmb.2
        for <linux-gpio@vger.kernel.org>; Sat, 01 Apr 2017 06:59:35 -0700 (PDT)
In-Reply-To: <20170325184350.7677-1-martin.blumenstingl@googlemail.com>
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

NOTE: Both patches should be applied to the same release because
patch #2 changes the "interface" exposed to DT. however, both can be
applied to the same release safely because the DQS pins were not
usable (from .dts files).


Changes since v1:
- split the patch into one that makes nand_dqs_0 and nand_dqs_1
  actually usable and a second one that renames them to nand_dqs_15
  and nand_dqs_18


Martin Blumenstingl (2):
  pinctrl: meson: meson8b: fix the NAND DQS pins
  pinctrl: meson: meson8b: rename the NAND DQS pin definitions

 drivers/pinctrl/meson/pinctrl-meson8b.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.12.1

