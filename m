From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH] pinctrl: Add missing of_node_put
Date: Fri, 24 Jun 2016 18:36:30 +0530
Message-ID: <20160624130630.GA11858@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:34023 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751229AbcFXNGg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jun 2016 09:06:36 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, baohua@kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr

of_find_node_by_name does an of_node_get on its return value, 
so an of_node_put is needed on this value before the corresponding 
variable goes out of scope.

The Coccinelle semantic patch used to make this change is as follows:
@@
struct device_node *n;
struct device_node *n1;
statement S;
identifier f;
expression E;
constant C;
@@

n = of_find_node_by_name(...)
...
if (!n) S
... when != of_node_put(n)
    when != n1 = f(n,...)
    when != E = n
    when any
    when strict
(
+ of_node_put(n);
  return -C;
|
  of_node_put(n);
|
  n1 = f(n,...)
|
  E = n
|
  return ...;
)

Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 3d233fc..7d9c1a3 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -5424,8 +5424,10 @@ static int atlas7_pinmux_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 	pmx->sys2pci_base = devm_ioremap_resource(&pdev->dev, &res);
-	if (IS_ERR(pmx->sys2pci_base))
+	if (IS_ERR(pmx->sys2pci_base)) {
+		of_node_put(sys2pci_np);
 		return -ENOMEM;
+	}
 
 	pmx->dev = &pdev->dev;
 
-- 
1.9.1

