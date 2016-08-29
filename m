From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH 11/33] pcmcia: soc_common: request legacy detect GPIO with
 active low
Date: Mon, 29 Aug 2016 11:25:01 +0100
Message-ID: <E1beJkT-0000mm-Pz@rmk-PC.armlinux.org.uk>
References: <20160829102328.GA28796@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56367 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756406AbcH2Kc6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Aug 2016 06:32:58 -0400
In-Reply-To: <20160829102328.GA28796@n2100.armlinux.org.uk>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-pcmcia@lists.infradead.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>

Request the legacy card detect signal with the active low property and
remove our own negation of the detection value.  This allows us to use
the firmware-defined polarities rather than hard-coding it into the
driver.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/pcmcia/soc_common.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pcmcia/soc_common.c b/drivers/pcmcia/soc_common.c
index 5d167512e96e..edfb6045fcda 100644
--- a/drivers/pcmcia/soc_common.c
+++ b/drivers/pcmcia/soc_common.c
@@ -168,7 +168,13 @@ static int soc_pcmcia_hw_init(struct soc_pcmcia_socket *skt)
 
 	for (i = 0; i < ARRAY_SIZE(skt->stat); i++) {
 		if (gpio_is_valid(skt->stat[i].gpio)) {
-			ret = gpio_request_one(skt->stat[i].gpio, GPIOF_IN,
+			unsigned long flags = GPIOF_IN;
+
+			/* CD is active low by default */
+			if (i == SOC_STAT_CD)
+				flags |= GPIOF_ACTIVE_LOW;
+
+			ret = gpio_request_one(skt->stat[i].gpio, flags,
 					       skt->stat[i].name);
 			if (ret) {
 				__soc_pcmcia_hw_shutdown(skt, i);
@@ -235,11 +241,8 @@ static unsigned int soc_common_pcmcia_skt_state(struct soc_pcmcia_socket *skt)
 	state.bvd1 = 1;
 	state.bvd2 = 1;
 
-	/* CD is active low by default */
 	if (skt->stat[SOC_STAT_CD].desc)
-		state.detect = !gpiod_get_raw_value(skt->stat[SOC_STAT_CD].desc);
-
-	/* RDY and BVD are active high by default */
+		state.detect = !!gpiod_get_value(skt->stat[SOC_STAT_CD].desc);
 	if (skt->stat[SOC_STAT_RDY].desc)
 		state.ready = !!gpiod_get_value(skt->stat[SOC_STAT_RDY].desc);
 	if (skt->stat[SOC_STAT_BVD1].desc)
-- 
2.1.0

