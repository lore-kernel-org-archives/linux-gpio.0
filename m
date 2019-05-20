From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/5] dt-bindings: gpio: meson-gxl-gpio: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:41:06 +0200
Message-ID: <20190520144108.3787-4-narmstrong@baylibre.com>
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
 include/dt-bindings/gpio/meson-gxl-gpio.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/dt-bindings/gpio/meson-gxl-gpio.h b/include/dt-bindings/gpio/meson-gxl-gpio.h
index 01f2a2abd35e..62417358f55b 100644
--- a/include/dt-bindings/gpio/meson-gxl-gpio.h
+++ b/include/dt-bindings/gpio/meson-gxl-gpio.h
@@ -1,15 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * GPIO definitions for Amlogic Meson GXL SoCs
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
 
 #ifndef _DT_BINDINGS_MESON_GXL_GPIO_H
-- 
2.21.0
