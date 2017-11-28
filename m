From: Colin King <colin.king@canonical.com>
Subject: [PATCH] gpio: gpio-stmpe: make various char arrays static const, shrinks object size
Date: Tue, 28 Nov 2017 18:23:39 +0000
Message-ID: <20171128182339.24579-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the read-only arrays edge_det_values, rise_values and
fall_values on the stack but instead make them static and constify them.
Makes the object code smaller by over 240 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
   9525	   2520	    192	  12237	   2fcd	drivers/gpio/gpio-stmpe.o

After:
   text	   data	    bss	    dec	    hex	filename
   9025	   2776	    192	  11993	   2ed9	drivers/gpio/gpio-stmpe.o

(gcc version 7.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/gpio-stmpe.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index e6e5cca624a7..e3d048e65339 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -273,15 +273,21 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 		u8 fall_reg;
 		u8 irqen_reg;
 
-		char *edge_det_values[] = {"edge-inactive",
-					   "edge-asserted",
-					   "not-supported"};
-		char *rise_values[] = {"no-rising-edge-detection",
-				       "rising-edge-detection",
-				       "not-supported"};
-		char *fall_values[] = {"no-falling-edge-detection",
-				       "falling-edge-detection",
-				       "not-supported"};
+		static const char * const edge_det_values[] = {
+			"edge-inactive",
+			"edge-asserted",
+			"not-supported"
+		};
+		static const char * const rise_values[] = {
+			"no-rising-edge-detection",
+			"rising-edge-detection",
+			"not-supported"
+		};
+		static const char * const fall_values[] = {
+			"no-falling-edge-detection",
+			"falling-edge-detection",
+			"not-supported"
+		};
 		#define NOT_SUPPORTED_IDX 2
 		u8 edge_det = NOT_SUPPORTED_IDX;
 		u8 rise = NOT_SUPPORTED_IDX;
-- 
2.14.1
