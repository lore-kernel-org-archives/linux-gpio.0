From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/5] pinctrl: meson: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:41:04 +0200
Message-ID: <20190520144108.3787-2-narmstrong@baylibre.com>
References: <20190520144108.3787-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520144108.3787-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson.c      | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson.h      | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8-pmx.h | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8.c     | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8b.c    | 8 +-------
 8 files changed, 8 insertions(+), 56 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 4edeb4cae72a..83c0b1753e70 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -1,15 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson GXBB.
  *
  * Copyright (C) 2016 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <dt-bindings/gpio/meson-gxbb-gpio.h>
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 0c0a5018102b..813f2bdd90a5 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -1,15 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson GXL.
  *
  * Copyright (C) 2016 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <dt-bindings/gpio/meson-gxl-gpio.h>
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 96a4a72708e4..54fe8f0e4e6d 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -1,14 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson SoCs
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 5eaab925f427..29ca94926af0 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -1,14 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Pin controller and GPIO driver for Amlogic Meson SoCs
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <linux/gpio/driver.h>
diff --git a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
index b93b058c8a07..3810b066df16 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
@@ -1,15 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * First generation of pinmux driver for Amlogic Meson SoCs
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
  * Copyright (C) 2017 Jerome Brunet  <jbrunet@baylibre.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 /* For this first generation of pinctrl driver every pinmux group can be
diff --git a/drivers/pinctrl/meson/pinctrl-meson8-pmx.h b/drivers/pinctrl/meson/pinctrl-meson8-pmx.h
index 47293c28f913..47c0c28bb8fe 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8-pmx.h
+++ b/drivers/pinctrl/meson/pinctrl-meson8-pmx.h
@@ -1,15 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * First generation of pinmux driver for Amlogic Meson SoCs
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
  * Copyright (C) 2017 Jerome Brunet  <jbrunet@baylibre.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 struct meson8_pmx_data {
diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index 785e29e74a56..2070e3c61a34 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -1,14 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson8 and Meson8m2.
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <dt-bindings/gpio/meson8-gpio.h>
diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index 7f76000cc12e..8d2d430ea02d 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -1,15 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson8b.
  *
  * Copyright (C) 2015 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <dt-bindings/gpio/meson8b-gpio.h>
-- 
2.21.0
