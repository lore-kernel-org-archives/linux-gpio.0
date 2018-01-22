From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: [PATCH] [libgpiod] gpiomon: initialize the active low variable
Date: Mon, 22 Jan 2018 17:12:13 +0100
Message-ID: <20180122161213.3076-2-clemens.gruber@pqgruber.com>
References: <20180122161213.3076-1-clemens.gruber@pqgruber.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:24712 "EHLO
        mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751007AbeAVQP2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jan 2018 11:15:28 -0500
In-Reply-To: <20180122161213.3076-1-clemens.gruber@pqgruber.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Clemens Gruber <clemens.gruber@pqgruber.com>

The variable active_low is not initialized, so the value is undefined
and if the -l argument is not passed, the undefined value remains.
Fix it by initializing it to false.

Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
---
 src/tools/gpiomon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tools/gpiomon.c b/src/tools/gpiomon.c
index ad25815..5e68a4f 100644
--- a/src/tools/gpiomon.c
+++ b/src/tools/gpiomon.c
@@ -249,9 +249,9 @@ int main(int argc, char **argv)
 	unsigned int offsets[GPIOD_LINE_BULK_MAX_LINES];
 	struct timespec timeout = { 10, 0 };
 	unsigned int num_lines = 0, offset;
+	bool active_low = false;
 	int optc, opti, ret, i;
 	struct mon_ctx ctx;
-	bool active_low;
 	char *end;
 
 	memset(&ctx, 0, sizeof(ctx));
-- 
2.16.0

