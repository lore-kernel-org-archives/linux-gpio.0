From: "Vishwanathrao Badarkhe, Manish" <manishv.b-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] gpio: Remove duplicate include of errno.h
Date: Tue, 19 Nov 2013 18:02:42 +0530
Message-ID: <1384864362-21018-1-git-send-email-manishv.b@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

From: "Vishwanathrao Badarkhe, Manish" <manishv.b-l0cyMroinI0@public.gmane.org>

Currently, code include errno.h twice. Remove one inclusion
of errno.h

Signed-off-by: Vishwanathrao Badarkhe, Manish <manishv.b-l0cyMroinI0@public.gmane.org>
---
:100644 100644 552e3f4... de13695... M	include/linux/gpio.h
 include/linux/gpio.h |    1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 552e3f4..de13695 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -78,7 +78,6 @@ static inline int irq_to_gpio(unsigned int irq)
 
 #include <linux/kernel.h>
 #include <linux/types.h>
-#include <linux/errno.h>
 #include <linux/bug.h>
 
 struct device;
-- 
1.7.9.5
