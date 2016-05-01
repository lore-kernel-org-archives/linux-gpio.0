From: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 05/10] iio: stx104: Utilize the module_isa_driver and max_num_isa_dev macros
Date: Sun,  1 May 2016 18:44:11 -0400
Message-ID: <fbf47c2fecb0dbaee717fc7f863cee1a903c8ae0.1462141338.git.vilhelm.gray@gmail.com>
References: <cover.1462141338.git.vilhelm.gray@gmail.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1462141338.git.vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

The Apex Embedded Systems STX104 DAC drivers does not do anything
special in module init/exit. This patch eliminates the module init/exit
boilerplate code by utilizing the module_isa_driver macro.

Additionally, the max_num_isa_dev macro is utilized to simplify the
determination of maximum possible STX104 devices in the system.

Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Signed-off-by: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/iio/dac/stx104.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/dac/stx104.c b/drivers/iio/dac/stx104.c
index 174f4b7..2794122 100644
--- a/drivers/iio/dac/stx104.c
+++ b/drivers/iio/dac/stx104.c
@@ -33,16 +33,9 @@
 }
 
 #define STX104_EXTENT 16
-/**
- * The highest base address possible for an ISA device is 0x3FF; this results in
- * 1024 possible base addresses. Dividing the number of possible base addresses
- * by the address extent taken by each device results in the maximum number of
- * devices on a system.
- */
-#define MAX_NUM_STX104 (1024 / STX104_EXTENT)
 
-static unsigned base[MAX_NUM_STX104];
-static unsigned num_stx104;
+static unsigned int base[max_num_isa_dev(STX104_EXTENT)];
+static unsigned int num_stx104;
 module_param_array(base, uint, &num_stx104, 0);
 MODULE_PARM_DESC(base, "Apex Embedded Systems STX104 base addresses");
 
@@ -134,18 +127,7 @@ static struct isa_driver stx104_driver = {
 	}
 };
 
-static void __exit stx104_exit(void)
-{
-	isa_unregister_driver(&stx104_driver);
-}
-
-static int __init stx104_init(void)
-{
-	return isa_register_driver(&stx104_driver, num_stx104);
-}
-
-module_init(stx104_init);
-module_exit(stx104_exit);
+module_isa_driver(stx104_driver, num_stx104);
 
 MODULE_AUTHOR("William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
 MODULE_DESCRIPTION("Apex Embedded Systems STX104 DAC driver");
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
