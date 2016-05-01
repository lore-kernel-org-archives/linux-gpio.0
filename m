From: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 02/10] isa: Implement the max_num_isa_dev macro
Date: Sun,  1 May 2016 18:43:10 -0400
Message-ID: <b39c697cb11924f7aa11a7305256425088cf731a.1462141338.git.vilhelm.gray@gmail.com>
References: <cover.1462141338.git.vilhelm.gray@gmail.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1462141338.git.vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

max_num_isa_dev is a macro to determine the maximum possible number of
ISA devices which may be registered in the I/O port address space given
the address extent of the ISA devices.

The highest base address possible for an ISA device is 0x3FF; this
results in 1024 possible base addresses. Dividing the number of possible
base addresses by the address extent taken by each device results in the
maximum number of devices on a system.

Signed-off-by: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 include/linux/isa.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/isa.h b/include/linux/isa.h
index e394917..5ab8528 100644
--- a/include/linux/isa.h
+++ b/include/linux/isa.h
@@ -57,4 +57,15 @@ static void __exit __isa_driver##_exit(void) \
 } \
 module_exit(__isa_driver##_exit);
 
+/**
+ * max_num_isa_dev() - Maximum possible number registered of an ISA device
+ * @__ida_dev_ext: ISA device address extent
+ *
+ * The highest base address possible for an ISA device is 0x3FF; this results in
+ * 1024 possible base addresses. Dividing the number of possible base addresses
+ * by the address extent taken by each device results in the maximum number of
+ * devices on a system.
+ */
+#define max_num_isa_dev(__isa_dev_ext) (1024 / __isa_dev_ext)
+
 #endif /* __LINUX_ISA_H */
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
