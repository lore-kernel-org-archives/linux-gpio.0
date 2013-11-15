From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 6/9] ARM: sa1100: enable IRQ domains
Date: Fri, 15 Nov 2013 12:47:57 +0400
Message-ID: <1384505280-25389-7-git-send-email-dbaryshkov@gmail.com>
References: <1384505280-25389-1-git-send-email-dbaryshkov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:40353 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754781Ab3KOIs2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2013 03:48:28 -0500
Received: by mail-wi0-f169.google.com with SMTP id hi5so2147677wib.4
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2013 00:48:27 -0800 (PST)
In-Reply-To: <1384505280-25389-1-git-send-email-dbaryshkov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Dmitry Artamonow <mad_soft@inbox.ru>

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2e6521927..a00b3c7 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -718,6 +718,7 @@ config ARCH_SA1100
 	select CPU_SA1100
 	select GENERIC_CLOCKEVENTS
 	select HAVE_IDE
+	select IRQ_DOMAIN
 	select ISA
 	select MULTI_IRQ_HANDLER
 	select NEED_MACH_MEMORY_H
-- 
1.8.4.2

