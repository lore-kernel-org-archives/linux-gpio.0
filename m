From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 8/9] pinctrl: Use seq_putc() in pinctrl_maps_show()
Date: Tue, 2 May 2017 11:28:16 +0200
Message-ID: <80f6dabc-6547-4d2b-2efa-15a90de41c0c@users.sourceforge.net>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:50972 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750957AbdEBJ2U (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 May 2017 05:28:20 -0400
In-Reply-To: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 May 2017 10:47:35 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 1653cbda6a82..7df16771fa13 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1732,7 +1732,7 @@ static int pinctrl_maps_show(struct seq_file *s, void *what)
 			break;
 		}
 
-		seq_printf(s, "\n");
+		seq_putc(s, '\n');
 	}
 	mutex_unlock(&pinctrl_maps_mutex);
 
-- 
2.12.2

