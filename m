From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: [PATCH 2/3] mfd: lpc_ich: use a correct mask for the GPIO base address
Date: Sat, 23 Jan 2016 17:32:08 +0100
Message-ID: <1453566729-30220-3-git-send-email-antoine.tenart@free-electrons.com>
References: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ptyser@xes-inc.com
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The GPIO base address is read from the GPIOBASE register. The first
bit must be cleared as it can be hardwired to 1 to represent the i/o
space. Other bits are either containing the base address of are
reserved. They should not be cleared as all the chipsets do not have
the same reserved bits.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 drivers/mfd/lpc_ich.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index b514f3cf140d..f13a5ded3958 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -921,7 +921,10 @@ static int lpc_ich_init_gpio(struct pci_dev *dev)
 gpe0_done:
 	/* Setup GPIO base register */
 	pci_read_config_dword(dev, priv->gbase, &base_addr_cfg);
-	base_addr = base_addr_cfg & 0x0000ff80;
+
+	/* Clear the i/o flag */
+	base_addr = base_addr_cfg & ~BIT(0);
+
 	if (!base_addr) {
 		dev_notice(&dev->dev, "I/O space for GPIO uninitialized\n");
 		ret = -ENODEV;
-- 
2.7.0
