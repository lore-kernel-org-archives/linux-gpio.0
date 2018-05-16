From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH] pinctrl: berlin: switch to SPDX license identifier
Date: Wed, 16 May 2018 15:33:37 +0800
Message-ID: <20180516153337.79763417@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Use the appropriate SPDX license identifier in the berlin pinctrl
driver source file and drop the previous license text.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/pinctrl/berlin/berlin-bg2.c   |  5 +----
 drivers/pinctrl/berlin/berlin-bg2cd.c |  5 +----
 drivers/pinctrl/berlin/berlin-bg2q.c  |  5 +----
 drivers/pinctrl/berlin/berlin-bg4ct.c | 13 +------------
 drivers/pinctrl/berlin/berlin.c       |  5 +----
 drivers/pinctrl/berlin/berlin.h       |  5 +----
 6 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin-bg2.c b/drivers/pinctrl/berlin/b=
erlin-bg2.c
index bf2e17d0d6e4..acbd413340e8 100644
--- a/drivers/pinctrl/berlin/berlin-bg2.c
+++ b/drivers/pinctrl/berlin/berlin-bg2.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Marvell Berlin BG2 pinctrl driver.
  *
  * Copyright (C) 2014 Marvell Technology Group Ltd.
  *
  * Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
=20
 #include <linux/init.h>
diff --git a/drivers/pinctrl/berlin/berlin-bg2cd.c b/drivers/pinctrl/berlin=
/berlin-bg2cd.c
index 9bee7bd1650f..c0f5d86d5d01 100644
--- a/drivers/pinctrl/berlin/berlin-bg2cd.c
+++ b/drivers/pinctrl/berlin/berlin-bg2cd.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Marvell Berlin BG2CD pinctrl driver.
  *
  * Copyright (C) 2014 Marvell Technology Group Ltd.
  *
  * Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
=20
 #include <linux/init.h>
diff --git a/drivers/pinctrl/berlin/berlin-bg2q.c b/drivers/pinctrl/berlin/=
berlin-bg2q.c
index eee6763f114c..20a3216ede07 100644
--- a/drivers/pinctrl/berlin/berlin-bg2q.c
+++ b/drivers/pinctrl/berlin/berlin-bg2q.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Marvell Berlin BG2Q pinctrl driver
  *
  * Copyright (C) 2014 Marvell Technology Group Ltd.
  *
  * Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
=20
 #include <linux/init.h>
diff --git a/drivers/pinctrl/berlin/berlin-bg4ct.c b/drivers/pinctrl/berlin=
/berlin-bg4ct.c
index e6740656ee7c..6a7fe929a68b 100644
--- a/drivers/pinctrl/berlin/berlin-bg4ct.c
+++ b/drivers/pinctrl/berlin/berlin-bg4ct.c
@@ -1,21 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Marvell berlin4ct pinctrl driver
  *
  * Copyright (C) 2015 Marvell Technology Group Ltd.
  *
  * Author: Jisheng Zhang <jszhang@marvell.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License f=
or
- * more details.
- *
- * You should have received a copy of the GNU General Public License along=
 with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
=20
 #include <linux/init.h>
diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berli=
n.c
index cc3bd2efafe3..a620a8e8fa78 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Marvell Berlin SoC pinctrl core driver
  *
  * Copyright (C) 2014 Marvell Technology Group Ltd.
  *
  * Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
=20
 #include <linux/io.h>
diff --git a/drivers/pinctrl/berlin/berlin.h b/drivers/pinctrl/berlin/berli=
n.h
index e9b30f95b03e..d7787754d1ed 100644
--- a/drivers/pinctrl/berlin/berlin.h
+++ b/drivers/pinctrl/berlin/berlin.h
@@ -1,13 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Marvell Berlin SoC pinctrl driver.
  *
  * Copyright (C) 2014 Marvell Technology Group Ltd.
  *
  * Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
=20
 #ifndef __PINCTRL_BERLIN_H
--=20
2.17.0
