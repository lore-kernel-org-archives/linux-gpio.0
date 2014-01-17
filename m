From: David Cohen <david.a.cohen@linux.intel.com>
Subject: [PATCH v2] gpio: intel-mid: comments cleanup
Date: Fri, 17 Jan 2014 07:30:01 -0800
Message-ID: <1389972601-27164-1-git-send-email-david.a.cohen@linux.intel.com>
References: <1389917951-13100-1-git-send-email-david.a.cohen@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1389917951-13100-1-git-send-email-david.a.cohen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

This is a simple cleanup on gpio-intel-mid.c's header comments.

Signed-off-by: David Cohen <david.a.cohen@linux.intel.com>
---
 drivers/gpio/gpio-intel-mid.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index be803af658ac..41218e93b9fe 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -1,7 +1,7 @@
 /*
- * Moorestown platform Langwell chip GPIO driver
+ * Intel MID GPIO driver
  *
- * Copyright (c) 2008, 2009, 2013, Intel Corporation.
+ * Copyright (c) 2014 Intel Corporation.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -11,10 +11,6 @@
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
 /* Supports:
-- 
1.8.4.2
