From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] pinctrl: lantiq: Switch to SPDX header
Date: Tue, 11 Jun 2019 09:20:04 +0200
Message-ID: <20190611072004.2978373-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: John Crispin <john@phrozen.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: linux-gpio@vger.kernel.org

The original license text had a typo ("publishhed") which would be
likely to confuse automated licensing auditing tools. Let's just switch
to SPDX instead of fixing the wording.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/pinctrl/pinctrl-lantiq.c | 5 +----
 drivers/pinctrl/pinctrl-lantiq.h | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-lantiq.c b/drivers/pinctrl/pinctrl-l=
antiq.c
index 22e80613e269..029e0aecb8d8 100644
--- a/drivers/pinctrl/pinctrl-lantiq.c
+++ b/drivers/pinctrl/pinctrl-lantiq.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/drivers/pinctrl/pinctrl-lantiq.c
  *  based on linux/drivers/pinctrl/pinctrl-pxa3xx.c
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
- *
  *  Copyright (C) 2012 John Crispin <john@phrozen.org>
  */
=20
diff --git a/drivers/pinctrl/pinctrl-lantiq.h b/drivers/pinctrl/pinctrl-l=
antiq.h
index 0e4308b8f235..d6530838fca8 100644
--- a/drivers/pinctrl/pinctrl-lantiq.h
+++ b/drivers/pinctrl/pinctrl-lantiq.h
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/drivers/pinctrl/pinctrl-lantiq.h
  *  based on linux/drivers/pinctrl/pinctrl-pxa3xx.h
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
- *
  *  Copyright (C) 2012 John Crispin <john@phrozen.org>
  */
=20
--=20
2.21.0
