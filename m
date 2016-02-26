From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 01/63] of: Empty of_read_number when !OF
Date: Fri, 26 Feb 2016 14:17:10 +0100
Message-ID: <1456492692-21592-2-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:58406 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751569AbcBZNST (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:18:19 -0500
In-Reply-To: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, linux-gpio@vger.kernel.org

Introduce empty of_read_number when CONFIG_OF is not defined. This allows
us to compile test gpio drivers.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 include/linux/of.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index dc6e39696b64..bea9e092979d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -672,6 +672,11 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 {
 }
 
+static inline u64 of_read_number(const __be32 *cell, int size)
+{
+	return 0;
+}
+
 #define of_match_ptr(_ptr)	NULL
 #define of_match_node(_matches, _node)	NULL
 #endif /* CONFIG_OF */
-- 
2.7.2

