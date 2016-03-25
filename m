From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] tools/gpio: Enable compiler optimization to catch more bugs
Date: Fri, 25 Mar 2016 13:36:29 +0100
Message-ID: <1458909390-2686-2-git-send-email-geert+renesas@glider.be>
References: <1458909390-2686-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458909390-2686-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tools/gpio/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index 4d198d5c42032661..c155d6bc47a7580c 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -1,5 +1,5 @@
 CC = $(CROSS_COMPILE)gcc
-CFLAGS += -Wall -g -D_GNU_SOURCE
+CFLAGS += -O2 -Wall -g -D_GNU_SOURCE
 
 all: lsgpio
 
-- 
1.9.1
