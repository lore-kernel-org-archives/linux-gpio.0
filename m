From: Anthony Fee <anthony.fee@emutex.com>
Subject: [PATCH] gpio: generic: add request function pointer
Date: Mon, 12 May 2014 17:54:40 +0000 (UTC)
Message-ID: <loom.20140512T195210-63@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:51054 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751336AbaELSAG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 12 May 2014 14:00:06 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glg-linux-gpio@m.gmane.org>)
	id 1WjuWC-0002DZ-Ik
	for linux-gpio@vger.kernel.org; Mon, 12 May 2014 20:00:04 +0200
Received: from 46.7.4.229 ([46.7.4.229])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-gpio@vger.kernel.org>; Mon, 12 May 2014 20:00:04 +0200
Received: from anthony.fee by 46.7.4.229 with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-gpio@vger.kernel.org>; Mon, 12 May 2014 20:00:04 +0200
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

gpiolib will require all gpio drivers to expicitly set the request function 
pointer in future. To encourage gpio driver developers to adhere to this 
standard gpio-generic.c now sets this function pointer.

Signed-off-by: Anthony Fee <anthony.fee@emutex.com>
---
 drivers/gpio/gpio-generic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index b5dff9e..fea8c82 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -388,6 +388,14 @@ static int bgpio_setup_direction(struct bgpio_chip 
*bgc,
        return 0;
 }

+static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
+{
+       if (gpio_pin < chip->ngpio)
+               return 0;
+
+       return -EINVAL;
+}
+
 int bgpio_remove(struct bgpio_chip *bgc)
 {
        return gpiochip_remove(&bgc->gc);
@@ -413,6 +421,7 @@ int bgpio_init(struct bgpio_chip *bgc, struct device 
*dev,
        bgc->gc.label = dev_name(dev);
        bgc->gc.base = -1;
        bgc->gc.ngpio = bgc->bits;
+       bgc->gc.request = bgpio_request;

        ret = bgpio_setup_io(bgc, dat, set, clr);
        if (ret)
-- 
1.9.0

