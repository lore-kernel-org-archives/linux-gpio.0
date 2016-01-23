From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: [PATCH 3/3] mfd: lpc_ich: add GPIO support for Baytrail
Date: Sat, 23 Jan 2016 17:32:09 +0100
Message-ID: <1453566729-30220-4-git-send-email-antoine.tenart@free-electrons.com>
References: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ptyser@xes-inc.com
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This patch adds the GPIO support for the Baytrail family.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 drivers/mfd/lpc_ich.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index f13a5ded3958..d86b496874df 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -508,6 +508,7 @@ static struct lpc_ich_info lpc_chipset_info[] = {
 	[LPC_BAYTRAIL] = {
 		.name = "Bay Trail SoC",
 		.iTCO_version = 3,
+		.gpio_version = ICH_BAYTRAIL_GPIO,
 	},
 	[LPC_COLETO] = {
 		.name = "Coleto Creek",
-- 
2.7.0
