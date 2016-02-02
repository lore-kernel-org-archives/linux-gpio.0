From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 3/3] usb: phy: phy-am335x: remove include of
 regulator/consumer.h
Date: Tue, 02 Feb 2016 14:02:51 -0600
Message-ID: <20160202200251.11646.82943.stgit@bhelgaas-glaptop2.roam.corp.google.com>
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

phy-am335x.c doesn't use any interfaces from linux/regulator/consumer.h, so
stop including it.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/usb/phy/phy-am335x.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/phy/phy-am335x.c b/drivers/usb/phy/phy-am335x.c
index 39b424f..a262a43 100644
--- a/drivers/usb/phy/phy-am335x.c
+++ b/drivers/usb/phy/phy-am335x.c
@@ -5,7 +5,6 @@
 #include <linux/usb/usb_phy_generic.h>
 #include <linux/slab.h>
 #include <linux/clk.h>
-#include <linux/regulator/consumer.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/usb/of.h>
