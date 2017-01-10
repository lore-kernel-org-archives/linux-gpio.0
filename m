From: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] iio: pc104: Mask PC/104 drivers via the PC104 Kconfig option
Date: Tue, 10 Jan 2017 13:51:29 -0500
Message-ID: <512f7f9909c9ff6964b34e0302eeb404e703f033.1484073325.git.vilhelm.gray@gmail.com>
References: <cover.1484073324.git.vilhelm.gray@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1484073324.git.vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

PC/104 drivers should be hidden on machines which do not support PC/104
devices. This patch adds the PC104 Kconfig option as a dependency for
the relevant PC/104 device driver Kconfig options.

Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Signed-off-by: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/iio/adc/Kconfig     | 2 +-
 drivers/iio/counter/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 9c8b558ba19e..dc897b443a17 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -465,7 +465,7 @@ config STM32_ADC
 
 config STX104
 	tristate "Apex Embedded Systems STX104 driver"
-	depends on X86 && ISA_BUS_API
+	depends on PC104 && X86 && ISA_BUS_API
 	select GPIOLIB
 	help
 	  Say yes here to build support for the Apex Embedded Systems STX104
diff --git a/drivers/iio/counter/Kconfig b/drivers/iio/counter/Kconfig
index 44627f6e4861..b37e5fc03149 100644
--- a/drivers/iio/counter/Kconfig
+++ b/drivers/iio/counter/Kconfig
@@ -7,7 +7,7 @@ menu "Counters"
 
 config 104_QUAD_8
 	tristate "ACCES 104-QUAD-8 driver"
-	depends on X86 && ISA_BUS_API
+	depends on PC104 && X86 && ISA_BUS_API
 	help
 	  Say yes here to build support for the ACCES 104-QUAD-8 quadrature
 	  encoder counter/interface device family (104-QUAD-8, 104-QUAD-4).
-- 
2.11.0
