From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 1/8] MAINTAINERS: GPIO: Add Documentation/driver-api/gpio/
Date: Fri,  9 Mar 2018 00:40:17 +0100
Message-ID: <20180308234024.24145-2-j.neuschaefer@gmx.net>
References: <20180308234024.24145-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308234024.24145-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>
List-Id: linux-gpio@vger.kernel.org

Steer patches to Documentation/driver-api/gpio/ into the right
direction.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6a89d31e4a4..313c0907020c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6029,6 +6029,7 @@ L:	linux-gpio@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/gpio/
+F:	Documentation/driver-api/gpio/
 F:	Documentation/gpio/
 F:	Documentation/ABI/testing/gpio-cdev
 F:	Documentation/ABI/obsolete/sysfs-gpio
-- 
2.16.1
