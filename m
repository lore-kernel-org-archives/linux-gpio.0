From: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 4/5] isa: Remove ISA_BUS_API selection for ISA_BUS
Date: Fri, 29 Dec 2017 15:14:46 -0500
Message-ID: <bc33320887f448b772004e7c5d97322abb8cae0b.1514578085.git.vilhelm.gray@gmail.com>
References: <cover.1514578085.git.vilhelm.gray@gmail.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1514578085.git.vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

ISA_BUS_API is selected by drivers themselves when necessary. The
ISA_BUS Kconfig option is now simply a mask for true ISA device drivers
and relevant configuration. For now, the ISA_BUS Kconfig option is only
available for X86, but may be added for other arch builds in the future
if the need arises.

Signed-off-by: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/x86/Kconfig | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 8eed3f94bfc7..5478c5beb302 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2608,11 +2608,13 @@ config PCI_CNB20LE_QUIRK
 source "drivers/pci/Kconfig"
 
 config ISA_BUS
-	bool "ISA-style bus support on modern systems" if EXPERT
-	select ISA_BUS_API
+	bool "ISA bus support on modern systems" if EXPERT
 	help
-	  Enables ISA-style drivers on modern systems. This is necessary to
-	  support PC/104 devices on X86_64 platforms.
+	  Expose ISA bus device drivers and options available for selection and
+	  configuration. Enable this option if your target machine has an ISA
+	  bus. ISA is an older system, displaced by PCI and newer bus
+	  architectures -- if your target machine is modern, it probably does
+	  not have an ISA bus.
 
 	  If unsure, say N.
 
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
