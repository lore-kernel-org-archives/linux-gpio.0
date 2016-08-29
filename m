From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH 17/33] pcmcia: soc_common: constify pcmcia_low_level ops
 pointer
Date: Mon, 29 Aug 2016 11:25:32 +0100
Message-ID: <E1beJky-0000nM-Ja@rmk-PC.armlinux.org.uk>
References: <20160829102328.GA28796@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56367 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756406AbcH2Kdh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Aug 2016 06:33:37 -0400
In-Reply-To: <20160829102328.GA28796@n2100.armlinux.org.uk>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-pcmcia@lists.infradead.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>

Constify the pcmcia_low_level operation pointer to soc_pcmcia_init_one()
which has no need to modify it.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/pcmcia/soc_common.c | 2 +-
 drivers/pcmcia/soc_common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pcmcia/soc_common.c b/drivers/pcmcia/soc_common.c
index c8111807a6aa..13bd50df9294 100644
--- a/drivers/pcmcia/soc_common.c
+++ b/drivers/pcmcia/soc_common.c
@@ -762,7 +762,7 @@ static int soc_common_pcmcia_cpufreq_nb(struct notifier_block *nb,
 #endif
 
 void soc_pcmcia_init_one(struct soc_pcmcia_socket *skt,
-	struct pcmcia_low_level *ops, struct device *dev)
+	const struct pcmcia_low_level *ops, struct device *dev)
 {
 	int i;
 
diff --git a/drivers/pcmcia/soc_common.h b/drivers/pcmcia/soc_common.h
index f66e2fb1f33f..7833eae86960 100644
--- a/drivers/pcmcia/soc_common.h
+++ b/drivers/pcmcia/soc_common.h
@@ -149,7 +149,7 @@ struct soc_pcmcia_timing {
 extern void soc_common_pcmcia_get_timing(struct soc_pcmcia_socket *, struct soc_pcmcia_timing *);
 
 void soc_pcmcia_init_one(struct soc_pcmcia_socket *skt,
-	struct pcmcia_low_level *ops, struct device *dev);
+	const struct pcmcia_low_level *ops, struct device *dev);
 void soc_pcmcia_remove_one(struct soc_pcmcia_socket *skt);
 int soc_pcmcia_add_one(struct soc_pcmcia_socket *skt);
 int soc_pcmcia_request_gpiods(struct soc_pcmcia_socket *skt);
-- 
2.1.0

