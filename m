From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 38/86] gpio/sch: use uapi/linux/pci_ids.h directly
Date: Sun, 29 Mar 2015 15:40:39 +0200
Message-ID: <1427635734-24786-39-git-send-email-mst@redhat.com>
References: <1427635734-24786-1-git-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1427635734-24786-1-git-send-email-mst@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Header moved from linux/pci_ids.h to uapi/linux/pci_ids.h,
use the new header directly so we can drop
the wrapper in include/linux/pci_ids.h.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/gpio/gpio-sch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index b72906f..9a4ac88 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -25,7 +25,7 @@
 #include <linux/errno.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
-#include <linux/pci_ids.h>
+#include <uapi/linux/pci_ids.h>
 
 #include <linux/gpio.h>
 
-- 
MST
