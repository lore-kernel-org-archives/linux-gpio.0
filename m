From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] pinctrl: xway: Switch to SPDX header
Date: Tue, 11 Jun 2019 09:20:01 +0200
Message-ID: <20190611072001.2978298-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: John Crispin <john@phrozen.org>, Martin Schiller <mschiller@tdt.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: linux-gpio@vger.kernel.org

The original license text had a typo ("publishhed") which would be
likely to confuse automated licensing auditing tools. Let's just switch
to SPDX instead of fixing the wording.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/pinctrl/pinctrl-xway.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xwa=
y.c
index ae74b260b014..b4b4e9ad0fa4 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/drivers/pinctrl/pinmux-xway.c
  *  based on linux/drivers/pinctrl/pinmux-pxa910.c
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
- *
  *  Copyright (C) 2012 John Crispin <john@phrozen.org>
  *  Copyright (C) 2015 Martin Schiller <mschiller@tdt.de>
  */
--=20
2.21.0
