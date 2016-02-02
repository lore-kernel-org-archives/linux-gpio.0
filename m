From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 1/3] usb: phy: generic: use forward declarations instead of
 #includes
Date: Tue, 02 Feb 2016 14:02:37 -0600
Message-ID: <20160202200237.11646.40985.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20160202200005.11646.98254.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160202200005.11646.98254.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>
List-Id: linux-gpio@vger.kernel.org

In include/linux/usb/usb_phy_generic.h, use a forward declaration for
struct gpio_desc instead of including linux/gpio/consumer.h.

Of the files that include usb_phy_generic.h, only
drivers/usb/phy/phy-generic.c uses the gpiod_*() interfaces from
linux/gpio/consumer.h, so include consumer.h explicitly there.

This is a little more efficient and ensures that users of the gpiod
interfaces include linux/gpio/consumer.h directly rather than getting it
accidentally via linux/usb/usb_phy_generic.h.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/usb/phy/phy-generic.c       |    1 +
 include/linux/usb/usb_phy_generic.h |    3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index 5320cb8..2c1349e 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -36,6 +36,7 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 
 #include "phy-generic.h"
diff --git a/include/linux/usb/usb_phy_generic.h b/include/linux/usb/usb_phy_generic.h
index c13632d5..45c20060 100644
--- a/include/linux/usb/usb_phy_generic.h
+++ b/include/linux/usb/usb_phy_generic.h
@@ -2,7 +2,8 @@
 #define __LINUX_USB_NOP_XCEIV_H
 
 #include <linux/usb/otg.h>
-#include <linux/gpio/consumer.h>
+
+struct gpio_desc;
 
 struct usb_phy_generic_platform_data {
 	enum usb_phy_type type;
