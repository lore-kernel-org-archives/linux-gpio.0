From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH] MAINTAINERS: drop Hoan Tran, e-mail is bouncing
Date: Fri,  8 Feb 2019 12:54:11 +0100
Message-ID: <20190208115411.7675-1-thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

Hoan Tran's e-mail is bouncing:

<hotran@apm.com>: host ASPMX.L.GOOGLE.COM[64.233.167.26] said: 550-5.2.1 The
    email account that you tried to reach is disabled. Learn more at 550 5.2.1
    https://support.google.com/mail/?p=DisabledUser q194si1780402wme.147 -
    gsmtp (in reply to RCPT TO command)

So let's remove this e-mail address from the MAINTAINERS file, and
update the status of the driver he was maintaining.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index aee591104b5f..7bb92924757d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14479,9 +14479,8 @@ S:	Maintained
 F:	drivers/tty/serial/8250/8250_dw.c
 
 SYNOPSYS DESIGNWARE APB GPIO DRIVER
-M:	Hoan Tran <hotran@apm.com>
 L:	linux-gpio@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	drivers/gpio/gpio-dwapb.c
 F:	Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
 
-- 
2.20.1
