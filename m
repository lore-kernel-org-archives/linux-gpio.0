From: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 1/4] isa: Allow ISA-style drivers on modern systems
Date: Mon, 23 May 2016 20:30:44 -0400
Message-ID: <4cc7af2b90cdff1c9e680fb2c2cd81882c6695d2.1464049539.git.vilhelm.gray@gmail.com>
References: <cover.1464049539.git.vilhelm.gray@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1464049539.git.vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
Cc: x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Several modern devices, such as PC/104 cards, are expected to run on
modern systems via an ISA bus interface. Since ISA is a legacy interface
for most modern architectures, ISA support should remain disabled in
general. Support for ISA-style drivers should be enabled on a per driver
basis.

To allow ISA-style drivers on modern systems, this patch introduces the
ISA_BUS_API and ISA_BUS Kconfig options. The ISA bus driver will now
build conditionally on the ISA_BUS_API Kconfig option, which defaults to
the legacy ISA Kconfig option. The ISA_BUS Kconfig option allows the
ISA_BUS_API Kconfig option to be selected on architectures which do not
enable ISA (e.g. X86_64).

The ISA_BUS Kconfig option is currently only implemented for X86
architectures. Other architectures may have their own ISA_BUS Kconfig
options added as required.

Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Signed-off-by: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/Kconfig          | 3 +++
 arch/x86/Kconfig      | 9 +++++++++
 drivers/base/Makefile | 2 +-
 include/linux/isa.h   | 2 +-
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index b16e74e..9d9942f 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -598,6 +598,9 @@ config HAVE_STACK_VALIDATION
 	  Architecture supports the 'objtool check' host tool command, which
 	  performs compile-time stack metadata validation.
 
+config ISA_BUS_API
+	def_bool ISA
+
 #
 # ABI hall of shame
 #
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 0a7b885..d9a94da 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2439,6 +2439,15 @@ config PCI_CNB20LE_QUIRK
 
 source "drivers/pci/Kconfig"
 
+config ISA_BUS
+	bool "ISA-style bus support on modern systems" if EXPERT
+	select ISA_BUS_API
+	help
+	  Enables ISA-style drivers on modern systems. This is necessary to
+	  support PC/104 devices on X86_64 platforms.
+
+	  If unsure, say N.
+
 # x86_64 have no ISA slots, but can have ISA-style DMA.
 config ISA_DMA_API
 	bool "ISA-style DMA support" if (X86_64 && EXPERT)
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 6b2a84e..2609ba2 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_DMA_CMA) += dma-contiguous.o
 obj-y			+= power/
 obj-$(CONFIG_HAS_DMA)	+= dma-mapping.o
 obj-$(CONFIG_HAVE_GENERIC_DMA_COHERENT) += dma-coherent.o
-obj-$(CONFIG_ISA)	+= isa.o
+obj-$(CONFIG_ISA_BUS_API)	+= isa.o
 obj-$(CONFIG_FW_LOADER)	+= firmware_class.o
 obj-$(CONFIG_NUMA)	+= node.o
 obj-$(CONFIG_MEMORY_HOTPLUG_SPARSE) += memory.o
diff --git a/include/linux/isa.h b/include/linux/isa.h
index 5ab8528..384ab9b 100644
--- a/include/linux/isa.h
+++ b/include/linux/isa.h
@@ -22,7 +22,7 @@ struct isa_driver {
 
 #define to_isa_driver(x) container_of((x), struct isa_driver, driver)
 
-#ifdef CONFIG_ISA
+#ifdef CONFIG_ISA_BUS_API
 int isa_register_driver(struct isa_driver *, unsigned int);
 void isa_unregister_driver(struct isa_driver *);
 #else
-- 
2.7.3
