From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH 32/33] pcmcia: sa1100*: remove redundant bvd1/bvd2 setting
Date: Mon, 29 Aug 2016 11:26:49 +0100
Message-ID: <E1beJmD-0000oq-Ix@rmk-PC.armlinux.org.uk>
References: <20160829102328.GA28796@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56367 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756406AbcH2Kcz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Aug 2016 06:32:55 -0400
In-Reply-To: <20160829102328.GA28796@n2100.armlinux.org.uk>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-pcmcia@lists.infradead.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>

bvd1 and bvd2 both default to 1 in the generic soc_common code, so
having a driver repeat this is redundant.  Remove it.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/pcmcia/sa1100_shannon.c | 4 ----
 drivers/pcmcia/sa1100_simpad.c  | 4 ++--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pcmcia/sa1100_shannon.c b/drivers/pcmcia/sa1100_shannon.c
index 51985c8ba830..7409cb36083b 100644
--- a/drivers/pcmcia/sa1100_shannon.c
+++ b/drivers/pcmcia/sa1100_shannon.c
@@ -32,15 +32,11 @@ shannon_pcmcia_socket_state(struct soc_pcmcia_socket *skt,
 {
 	switch (skt->nr) {
 	case 0:
-		state->bvd1   = 1; 
-		state->bvd2   = 1; 
 		state->vs_3v  = 1; /* FIXME Can only apply 3.3V on Shannon. */
 		state->vs_Xv  = 0;
 		break;
 
 	case 1:
-		state->bvd1   = 1; 
-		state->bvd2   = 1; 
 		state->vs_3v  = 1; /* FIXME Can only apply 3.3V on Shannon. */
 		state->vs_Xv  = 0;
 		break;
diff --git a/drivers/pcmcia/sa1100_simpad.c b/drivers/pcmcia/sa1100_simpad.c
index e14b2f5a18bb..b59bbe68c6d7 100644
--- a/drivers/pcmcia/sa1100_simpad.c
+++ b/drivers/pcmcia/sa1100_simpad.c
@@ -38,8 +38,8 @@ simpad_pcmcia_socket_state(struct soc_pcmcia_socket *skt,
 {
 	long cs3reg = simpad_get_cs3_ro();
 
-	state->bvd1 = 1; /* Might be cs3reg & PCMCIA_BVD1 */
-	state->bvd2 = 1; /* Might be cs3reg & PCMCIA_BVD2 */
+	/* bvd1 might be cs3reg & PCMCIA_BVD1 */
+	/* bvd2 might be cs3reg & PCMCIA_BVD2 */
 
 	if ((cs3reg & (PCMCIA_VS1|PCMCIA_VS2)) ==
 			(PCMCIA_VS1|PCMCIA_VS2)) {
-- 
2.1.0

