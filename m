From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH v2] selftest/gpio: Remove duplicate header
Date: Wed, 6 Mar 2019 21:50:19 +0530
Message-ID: <20190306162018.GA3187@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: bamv2005@gmail.com, shuah@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, sabyasachi.linux@gmail.com
List-Id: linux-gpio@vger.kernel.org

From: Sabyasachi Gupta <sabyasachi.linux@gmail.com>

Remove duplicate header which are included twice.

Signed-off-by: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
v2: Corrected format.

 tools/testing/selftests/gpio/gpio-mockup-chardev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/gpio/gpio-mockup-chardev.c b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
index aaa1e9f..d587c81 100644
--- a/tools/testing/selftests/gpio/gpio-mockup-chardev.c
+++ b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
@@ -12,7 +12,6 @@
 #include <unistd.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <stdio.h>
 #include <errno.h>
 #include <string.h>
 #include <fcntl.h>
-- 
1.9.1
