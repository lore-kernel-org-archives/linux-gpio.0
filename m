From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 2/3] usb: phy: generic: use forward declarations instead of
 #includes
Date: Tue, 02 Feb 2016 14:02:44 -0600
Message-ID: <20160202200244.11646.12411.stgit@bhelgaas-glaptop2.roam.corp.google.com>
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

In drivers/usb/phy/phy-generic.h, use forward declarations for struct
regulator and struct gpio_desc instead of including
linux/regulator/consumer.h and linux/gpio/consumer.h.

phy-generic.c is included three places (phy-am335x.c, phy-generic.c,
phy-keystone.c).  Of these, phy-am335x.c and phy-generic.c already include
regulator/consumer.h and phy-keystone.c doesn't need it; only phy-generic.c
uses gpiod_*() interfaces, and it already includes gpio/consumer.h.

This is a little more efficient and ensures that users of the regulator and
gpio interfaces include the relevant header files directly rather than
accidentally getting them via drivers/usb/phy/phy-generic.h.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/usb/phy/phy-generic.h |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-generic.h b/drivers/usb/phy/phy-generic.h
index 0d0eadd..cc4f1bd 100644
--- a/drivers/usb/phy/phy-generic.h
+++ b/drivers/usb/phy/phy-generic.h
@@ -2,8 +2,9 @@
 #define _PHY_GENERIC_H_
 
 #include <linux/usb/usb_phy_generic.h>
-#include <linux/gpio/consumer.h>
-#include <linux/regulator/consumer.h>
+
+struct regulator;
+struct gpio_desc;
 
 struct usb_phy_generic {
 	struct usb_phy phy;
