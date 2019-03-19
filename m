From: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH V2] gpio: amd-fch: Fix bogus SPDX identifier
Date: Tue, 19 Mar 2019 15:54:16 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1903191552550.2537@nanos.tec.linutronix.de>
References: <alpine.DEB.2.21.1903191513170.2537@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1903191513170.2537@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Enrico Weigelt <info@metux.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
List-Id: linux-gpio@vger.kernel.org

spdxcheck.py complains:

 include/linux/platform_data/gpio/gpio-amd-fch.h: 1:28 Invalid License ID: GPL+

which is correct because GPL+ is not a valid identifier. Of course this
could have been caught by checkpatch.pl _before_ submitting or merging the
patch.

 WARNING: 'SPDX-License-Identifier: GPL+ */' is not supported in LICENSES/...
 #271: FILE: include/linux/platform_data/gpio/gpio-amd-fch.h:1:
 +/* SPDX-License-Identifier: GPL+ */

Fix it under the assumption that the author meant GPL-2.0+, which makes
sense as the corresponding C file is using that identifier.

Fixes: e09d168f13f0 ("gpio: AMD G-Series PCH gpio driver")
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
Stupid me should refresh patches before sending them. Blush!
---
diff --git a/include/linux/platform_data/gpio/gpio-amd-fch.h b/include/linux/platform_data/gpio/gpio-amd-fch.h
index a867637e172d..7290ec40a71e 100644
--- a/include/linux/platform_data/gpio/gpio-amd-fch.h
+++ b/include/linux/platform_data/gpio/gpio-amd-fch.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL+ */
+/* SPDX-License-Identifier: GPL-2.0+ */
 
 /*
  * AMD FCH gpio driver platform-data
