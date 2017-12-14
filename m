From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH] tools/gpio: Don't use u_int32_t
Date: Thu, 14 Dec 2017 21:26:08 +0100
Message-ID: <20171214202608.14662-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:59508 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752298AbdLNUbF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 Dec 2017 15:31:05 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

u_int32_t is a non-standard version of uint32_t, that was apparently
introduced by BSD. Use uint32_t from stdint.h instead.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 tools/gpio/gpio-event-mon.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index 1c14c2595158..be6768e21b09 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -14,6 +14,7 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdbool.h>
+#include <stdint.h>
 #include <stdio.h>
 #include <dirent.h>
 #include <errno.h>
@@ -27,8 +28,8 @@
 
 int monitor_device(const char *device_name,
 		   unsigned int line,
-		   u_int32_t handleflags,
-		   u_int32_t eventflags,
+		   uint32_t handleflags,
+		   uint32_t eventflags,
 		   unsigned int loops)
 {
 	struct gpioevent_request req;
@@ -145,8 +146,8 @@ int main(int argc, char **argv)
 	const char *device_name = NULL;
 	unsigned int line = -1;
 	unsigned int loops = 0;
-	u_int32_t handleflags = GPIOHANDLE_REQUEST_INPUT;
-	u_int32_t eventflags = 0;
+	uint32_t handleflags = GPIOHANDLE_REQUEST_INPUT;
+	uint32_t eventflags = 0;
 	int c;
 
 	while ((c = getopt(argc, argv, "c:n:o:dsrf?")) != -1) {
-- 
2.15.0

