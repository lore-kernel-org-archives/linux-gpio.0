From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH 19/33] pcmcia: sa1111: add driver-data pointer
Date: Mon, 29 Aug 2016 11:25:42 +0100
Message-ID: <E1beJl8-0000nZ-SH@rmk-PC.armlinux.org.uk>
References: <20160829102328.GA28796@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56367 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756135AbcH2Kcb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Aug 2016 06:32:31 -0400
In-Reply-To: <20160829102328.GA28796@n2100.armlinux.org.uk>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-pcmcia@lists.infradead.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>

Add a driver-data pointer so that low level drivers can add additional
data to the sa1111 pcmcia socket structure.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/pcmcia/sa1111_generic.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pcmcia/sa1111_generic.h b/drivers/pcmcia/sa1111_generic.h
index e74ecfdc1b26..0bfc82080c16 100644
--- a/drivers/pcmcia/sa1111_generic.h
+++ b/drivers/pcmcia/sa1111_generic.h
@@ -5,6 +5,7 @@ struct sa1111_pcmcia_socket {
 	struct soc_pcmcia_socket soc;
 	struct sa1111_dev *dev;
 	struct sa1111_pcmcia_socket *next;
+	void *driver_data;
 };
 
 static inline struct sa1111_pcmcia_socket *to_skt(struct soc_pcmcia_socket *s)
-- 
2.1.0

