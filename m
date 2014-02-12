From: Markus Mayer <markus.mayer@linaro.org>
Subject: =?UTF-8?q?=5BPATCH=5D=20MAINTAINERS=3A=20Add=20Broadcom=20GPIO=20maintainer?=
Date: Wed, 12 Feb 2014 15:42:27 -0800
Message-ID: <1392248547-11627-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Daudt <bcm@fixthebug.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Linux GPIO List <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

List myself as maintainer for Broadcom's Kona GPIO driver.

Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
---

Does that look like a reasonable way to make this change? I added the
entry alphabetically in the BROADCOM section.

 MAINTAINERS |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2cf5cf..896cf2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1909,6 +1909,13 @@ L:	linux-scsi@vger.kernel.org
 S:	Supported
 F:	drivers/scsi/bnx2i/
=20
+BROADCOM KONA GPIO DRIVER
+M:	Markus Mayer <markus.mayer@linaro.org>
+L:	bcm-kernel-feedback-list@broadcom.com
+S:	Supported
+F:	drivers/gpio/gpio-bcm-kona.c
+F:	Documentation/devicetree/bindings/gpio/gpio-bcm-kona.txt
+
 BROADCOM SPECIFIC AMBA DRIVER (BCMA)
 M:	Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
 L:	linux-wireless@vger.kernel.org
--=20
1.7.9.5
