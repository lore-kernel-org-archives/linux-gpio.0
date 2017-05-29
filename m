From: Martin Schiller <ms@dev.tdt.de>
Subject: [PATCH] pinctrl: xway: fix copy/paste error in xrx200_grps
Date: Mon, 29 May 2017 06:08:38 +0200
Message-ID: <1496030918-3840-1-git-send-email-ms@dev.tdt.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ms.tdt.de ([195.243.126.94]:53502 "EHLO mail.dev.tdt.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750837AbdE2ERd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 May 2017 00:17:33 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, john@phrozen.org, Martin Schiller <ms@dev.tdt.de>

Signed-off-by: Martin Schiller <ms@dev.tdt.de>
---
 drivers/pinctrl/pinctrl-xway.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index d4167e2..f9e98a7 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1028,7 +1028,7 @@ static const struct ltq_pin_group xrx200_grps[] = {
 	GRP_MUX("spi_cs5", SPI, xrx200_pins_spi_cs5),
 	GRP_MUX("spi_cs6", SPI, xrx200_pins_spi_cs6),
 	GRP_MUX("usif uart_rx", USIF, xrx200_pins_usif_uart_rx),
-	GRP_MUX("usif uart_rx", USIF, xrx200_pins_usif_uart_tx),
+	GRP_MUX("usif uart_tx", USIF, xrx200_pins_usif_uart_tx),
 	GRP_MUX("usif uart_rts", USIF, xrx200_pins_usif_uart_rts),
 	GRP_MUX("usif uart_cts", USIF, xrx200_pins_usif_uart_cts),
 	GRP_MUX("usif uart_dtr", USIF, xrx200_pins_usif_uart_dtr),
-- 
2.1.4

