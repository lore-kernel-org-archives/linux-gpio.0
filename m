From: Tom Saeger <tom.saeger@oracle.com>
Subject: [PATCH 8/8] Documentation: fix ref to gpio.txt
Date: Thu, 12 Oct 2017 15:24:16 -0500
Message-ID: <d57befdefdec3be5fb0ae56d3baf639850b04d10.1507838726.git.tom.saeger@oracle.com>
References: <cover.1507838726.git.tom.saeger@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1507838726.git.tom.saeger@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>
Cc: Tom Saeger <tom.saeger@oracle.com>, linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Tom Saeger <tom.saeger@oracle.com>
---
 Documentation/ABI/obsolete/sysfs-gpio | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/obsolete/sysfs-gpio b/Documentation/ABI/obsolete/sysfs-gpio
index 867c1fab20e2..32513dc2eec9 100644
--- a/Documentation/ABI/obsolete/sysfs-gpio
+++ b/Documentation/ABI/obsolete/sysfs-gpio
@@ -11,7 +11,7 @@ Description:
   Kernel code may export it for complete or partial access.
 
   GPIOs are identified as they are inside the kernel, using integers in
-  the range 0..INT_MAX.  See Documentation/gpio.txt for more information.
+  the range 0..INT_MAX.  See Documentation/gpio/gpio.txt for more information.
 
     /sys/class/gpio
 	/export ... asks the kernel to export a GPIO to userspace
-- 
2.14.2
