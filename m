From: Fabian Frederick <fabf@skynet.be>
Subject: [PATCH 1/1 linux-next RESEND] pinctrl: use ERR_CAST instead of ERR_PTR/PTR_ERR
Date: Mon, 27 Apr 2015 18:04:05 +0200
Message-ID: <1430150646-21946-1-git-send-email-fabf@skynet.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailrelay103.isp.belgacom.be ([195.238.20.130]:8159 "EHLO
	mailrelay103.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752967AbbD0QEX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 27 Apr 2015 12:04:23 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Fabian Frederick <fabf@skynet.be>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Inspired by scripts/coccinelle/api/err_cast.cocci

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 include/linux/pinctrl/consumer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 18eccef..d7e5d60 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -142,7 +142,7 @@ static inline struct pinctrl * __must_check pinctrl_get_select(
 	s = pinctrl_lookup_state(p, name);
 	if (IS_ERR(s)) {
 		pinctrl_put(p);
-		return ERR_PTR(PTR_ERR(s));
+		return ERR_CAST(s);
 	}
 
 	ret = pinctrl_select_state(p, s);
-- 
1.9.1

