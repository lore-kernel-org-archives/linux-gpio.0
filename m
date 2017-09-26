From: Nik Nyby <nnyby@columbia.edu>
Subject: [PATCH] gpio: amd8111 Kconfig typo fix (trivial)
Date: Tue, 26 Sep 2017 16:37:42 -0400
Message-ID: <1506458262-11755-1-git-send-email-nnyby@columbia.edu>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eggs.gnu.org ([208.118.235.92]:36628 "EHLO eggs.gnu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S964856AbdIZUiF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Sep 2017 16:38:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
        (envelope-from <nnyby@columbia.edu>)
        id 1dwwcG-00007r-BQ
        for linux-gpio@vger.kernel.org; Tue, 26 Sep 2017 16:38:05 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, trivial@kernel.org, linux-gpio@vger.kernel.org
Cc: Nik Nyby <nnyby@columbia.edu>

uncarefull -> uncareful
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3388d54..a2f72da 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1156,7 +1156,7 @@ config GPIO_AMD8111
 	  The AMD 8111 south bridge contains 32 GPIO pins which can be used.
 
 	  Note, that usually system firmware/ACPI handles GPIO pins on their
-	  own and users might easily break their systems with uncarefull usage
+	  own and users might easily break their systems with uncareful usage
 	  of this driver!
 
 	  If unsure, say N
-- 
2.7.4

