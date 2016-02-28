From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH] gpio: Switch to devm_ioremap_resource()
Date: Sun, 28 Feb 2016 18:00:56 +0530
Message-ID: <20160228123056.GA12584@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:35581 "EHLO
	mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750737AbcB1MbC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Feb 2016 07:31:02 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr

Replace calls to devm_request_mem_region and devm_ioremap with a
direct call to devm_ioremap_resource instead and modify error
handling.

Move the call to platform_get_resource adjacent to the call to
devm_ioremap_resource to make the connection between them more
clear.

A simplified version of the Coccinelle semantic patch that is used to
make this change is as follows:
//<smpl>
@nm@
expression myname;
identifier i;
@@

struct platform_driver i = { .driver = { .name = myname } };

@@
expression dev,res,size,e1,e;
expression nm.myname;
@@

-if (!devm_request_mem_region(dev, res->start, size,
-                              \(res->name\|dev_name(dev)\|myname\)))
                               {
-   ...
-   return ...;
-}
... when != res->start = e1
e =
-devm_ioremap(dev,res->start,size);
+devm_ioremap_resource(dev,res);

if
-(e == NULL)
+(IS_ERR(e))
{
 ...
-return ...;
+return PTR_ERR(e);
}
//</smpl>

Further, updated error handling by hand as devm_ioremap_resource
gives appropriate error messages, so remove unnecessary error
messages.

Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
---
 drivers/gpio/gpio-timberdale.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index a6de10c..bd04328 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -237,12 +237,6 @@ static int timbgpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!iomem) {
-		dev_err(dev, "Unable to get resource\n");
-		return -EINVAL;
-	}
-
 	tgpio = devm_kzalloc(dev, sizeof(struct timbgpio), GFP_KERNEL);
 	if (!tgpio) {
 		dev_err(dev, "Memory alloc failed\n");
@@ -252,17 +246,10 @@ static int timbgpio_probe(struct platform_device *pdev)
 
 	spin_lock_init(&tgpio->lock);
 
-	if (!devm_request_mem_region(dev, iomem->start, resource_size(iomem),
-				     DRIVER_NAME)) {
-		dev_err(dev, "Region already claimed\n");
-		return -EBUSY;
-	}
-
-	tgpio->membase = devm_ioremap(dev, iomem->start, resource_size(iomem));
-	if (!tgpio->membase) {
-		dev_err(dev, "Cannot ioremap\n");
-		return -ENOMEM;
-	}
+	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	tgpio->membase = devm_ioremap_resource(dev, iomem);
+	if (IS_ERR(tgpio->membase))
+		return PTR_ERR(tgpio->membase);
 
 	gc = &tgpio->gpio;
 
-- 
1.9.1

