From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: core: Make pinctrl_init_controller() static
Date: Mon, 27 Mar 2017 14:37:09 +0300
Message-ID: <20170327113709.65527-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:25395 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752535AbdC0Lta (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Mar 2017 07:49:30 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

pinctrl_init_controller() is not used outside core.c, thus make it
static and prevent compiler to warn.

drivers/pinctrl/core.c:1943:21: warning: no previous prototype for ‘pinctrl_init_controller’ [-Wmissing-prototypes]
 struct pinctrl_dev *pinctrl_init_controller(struct pinctrl_desc *pctldesc,
                     ^~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index ddefdac7dd20..2892fe2a036c 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1940,9 +1940,9 @@ static int pinctrl_check_ops(struct pinctrl_dev *pctldev)
  * @dev: parent device for this pin controller
  * @driver_data: private pin controller data for this pin controller
  */
-struct pinctrl_dev *pinctrl_init_controller(struct pinctrl_desc *pctldesc,
-					    struct device *dev,
-					    void *driver_data)
+static struct pinctrl_dev *
+pinctrl_init_controller(struct pinctrl_desc *pctldesc, struct device *dev,
+			void *driver_data)
 {
 	struct pinctrl_dev *pctldev;
 	int ret;
-- 
2.11.0

