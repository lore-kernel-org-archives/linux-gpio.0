From: Vijay Kumar <vijaykumar@zilogic.com>
Subject: [PATCH] Fix no. of gpio cells in the pxa gpio binding doucmentation
Date: Mon, 05 Sep 2016 11:50:40 +0530
Message-ID: <57CD0EB8.1030500@zilogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from li2-213.members.linode.com ([69.56.173.213]:36301 "EHLO
        mail.zilogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754795AbcIEGmr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2016 02:42:47 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-gpio@vger.kernel.org

Fix the no. of gpio cells in pxa gpio binding documentation.

The no. of gpio cells for the pxa gpio is actually 2. But is
incorrectly specified as 1, in the binding documentation. From the
driver code, the second cell specifies the standard flags as described
in gpio.txt.

Signed-off-by: Vijay Kumar B. <vijaykumar@zilogic.com>

Index: linux-4.7.1/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
===================================================================
--- linux-4.7.1.orig/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
+++ linux-4.7.1/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
@@ -17,7 +17,9 @@ Required properties:
  - #interrupt-cells: Specifies the number of cells needed to encode an
    interrupt source.
  - gpio-controller : Marks the device node as a gpio controller.
-- #gpio-cells : Should be one.  It is the pin number.
+- #gpio-cells : Should be two.  The first cell is the pin number and
+  the second cell is used to specify flags. See gpio.txt for possible
+  values.
  
  Example for a MMP platform:
  
@@ -27,7 +29,7 @@ Example for a MMP platform:
  		interrupts = <49>;
  		interrupt-names = "gpio_mux";
  		gpio-controller;
-		#gpio-cells = <1>;
+		#gpio-cells = <2>;
  		interrupt-controller;
  		#interrupt-cells = <1>;
        };
