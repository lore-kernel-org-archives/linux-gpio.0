From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 0/3] pinctrl: sx150x fixes for the 4-pin chips
Date: Fri,  2 Dec 2016 11:51:13 +0100
Message-ID: <1480675876-19540-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Peter Rosin <peda@axentia.se>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Linus!

I found some more issues when reading the sx150x code.

Only the first patch actually fixes a problem. I didn't want to add a
Fixes tag, since I don't know if commits on the pinctrl devel branch
are considered stable? Or if you perhaps want to squash this patch with
the patch it fixes?

Anyway, at your discretion, this could be added to patch #1:

Fixes: 4f5ac8cf0a11 ("pinctrl: sx150x: add support for sx1501, sx1504, sx1505, sx1507")

The other two patches are almost entirely cosmetic.

Cheers,
Peter

Peter Rosin (3):
  pinctrl: sx150x: access the correct bits in the 4-bit regs of
    sx150[147]
  pinctrl: sx150x: rename 'reg_advance' to 'reg_advanced'
  pinctrl: sx150x: handle missing 'advanced' reg in sx1504 and sx1505

 drivers/pinctrl/pinctrl-sx150x.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

-- 
2.1.4
