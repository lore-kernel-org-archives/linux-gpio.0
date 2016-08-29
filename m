From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH 13/33] pcmcia: soc_common: restore previous socket state on
 error
Date: Mon, 29 Aug 2016 11:25:12 +0100
Message-ID: <E1beJke-0000my-2P@rmk-PC.armlinux.org.uk>
References: <20160829102328.GA28796@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56367 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750860AbcH2Kas (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Aug 2016 06:30:48 -0400
In-Reply-To: <20160829102328.GA28796@n2100.armlinux.org.uk>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-pcmcia@lists.infradead.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>

If an attempt to set a socket state returns an error, restore the
previous socket state.  If restoring the previous socket state
fails, warn about this.

This allows us to have simple error handling in the socket state
configuration handlers - there is no need for every handler
implementation to manually undo the updates, which can be complex
when regulators are involved.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/pcmcia/soc_common.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pcmcia/soc_common.c b/drivers/pcmcia/soc_common.c
index 822de207c408..d8508c41d7da 100644
--- a/drivers/pcmcia/soc_common.c
+++ b/drivers/pcmcia/soc_common.c
@@ -292,6 +292,14 @@ static int soc_common_pcmcia_config_skt(
 	int ret;
 
 	ret = skt->ops->configure_socket(skt, state);
+	if (ret < 0) {
+		pr_err("soc_common_pcmcia: unable to configure socket %d\n",
+		       skt->nr);
+		/* restore the previous state */
+		WARN_ON(skt->ops->configure_socket(skt, &skt->cs_state));
+		return ret;
+	}
+
 	if (ret == 0) {
 		struct gpio_desc *descs[2];
 		int values[2], n = 0;
@@ -324,10 +332,6 @@ static int soc_common_pcmcia_config_skt(
 		skt->cs_state = *state;
 	}
 
-	if (ret < 0)
-		printk(KERN_ERR "soc_common_pcmcia: unable to configure "
-		       "socket %d\n", skt->nr);
-
 	return ret;
 }
 
@@ -776,6 +780,8 @@ int soc_pcmcia_add_one(struct soc_pcmcia_socket *skt)
 {
 	int ret;
 
+	skt->cs_state = dead_socket;
+
 	setup_timer(&skt->poll_timer, soc_common_pcmcia_poll_event,
 		    (unsigned long)skt);
 	skt->poll_timer.expires = jiffies + SOC_PCMCIA_POLL_PERIOD;
-- 
2.1.0

