Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2E23BB9F4;
	Wed,  1 Jul 2026 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900717; cv=none; b=czbHhQvOjhmt71qvPQnocnyz6b/3hTcsfrik9OVZP/vnvjJlqdrqnD7g3dK073eQzNNu8wsrHLAjJ06V5AdEoGttmqib2sXFjSYVOrl9V2vsqwRuMILyRZD5b+qHsvabjdsVqGZxOXQjy15TuP0jWCZZ7/KFFwEJiVlGWpkVaEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900717; c=relaxed/simple;
	bh=agLnKkGTKqukQ1HNd7gQSPEPqeOPgDYBQ55wgTZCIGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rVed8RJ3P8N3bGeb62EtUauoC4Vb8OilmoQTzxr4PDcxnuWJWfYfxXMATORB433WaIDJ8/oO+V+hZTna8vDG1iRyc7Hy3bFhb+lpc7j5pxNvpCtHuXY4w3aKXlr04V3u6IcXidfFWWe20UrdKvV9s++1p4Fm9YEDYDpg5L3pp6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C771D1F00A3A;
	Wed,  1 Jul 2026 10:11:53 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 1/9] MIPS: TXX9: Remove tx4938_spi_init() and txx9_spi_init()
Date: Wed,  1 Jul 2026 12:11:36 +0200
Message-ID: <9452f7a7bad5183471504c2d66e43daf59a477e1.1782900491.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782900491.git.geert@linux-m68k.org>
References: <cover.1782900491.git.geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The last user of tx4938_spi_init() was removed in commit
21d638ef9483d8cf ("MIPS: TXX9: Remove rbtx4938 board support").

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v2:
  - Add Reviewed-by.
---
 arch/mips/include/asm/txx9/generic.h  |  1 -
 arch/mips/include/asm/txx9/tx4938.h   |  1 -
 arch/mips/txx9/generic/setup.c        | 17 -----------------
 arch/mips/txx9/generic/setup_tx4938.c |  6 ------
 4 files changed, 25 deletions(-)

diff --git a/arch/mips/include/asm/txx9/generic.h b/arch/mips/include/asm/txx9/generic.h
index 9a2c47bf3c4045e7..3813ab9ccf717ada 100644
--- a/arch/mips/include/asm/txx9/generic.h
+++ b/arch/mips/include/asm/txx9/generic.h
@@ -45,7 +45,6 @@ extern int (*txx9_irq_dispatch)(int pending);
 const char *prom_getenv(const char *name);
 void txx9_wdt_init(unsigned long base);
 void txx9_wdt_now(unsigned long base);
-void txx9_spi_init(int busid, unsigned long base, int irq);
 void txx9_ethaddr_init(unsigned int id, unsigned char *ethaddr);
 void txx9_sio_init(unsigned long baseaddr, int irq,
 		   unsigned int line, unsigned int sclk, int nocts);
diff --git a/arch/mips/include/asm/txx9/tx4938.h b/arch/mips/include/asm/txx9/tx4938.h
index 6ca767ee6467ca88..765f7d6a44d36ee6 100644
--- a/arch/mips/include/asm/txx9/tx4938.h
+++ b/arch/mips/include/asm/txx9/tx4938.h
@@ -281,7 +281,6 @@ void tx4938_wdt_init(void);
 void tx4938_setup(void);
 void tx4938_time_init(unsigned int tmrnr);
 void tx4938_sio_init(unsigned int sclk, unsigned int cts_mask);
-void tx4938_spi_init(int busid);
 void tx4938_ethaddr_init(unsigned char *addr0, unsigned char *addr1);
 int tx4938_report_pciclk(void);
 void tx4938_report_pci1clk(void);
diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 6c5025806914f989..97102d3327d22828 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -341,23 +341,6 @@ void txx9_wdt_now(unsigned long base)
 		     &tmrptr->tcr);
 }
 
-/* SPI support */
-void __init txx9_spi_init(int busid, unsigned long base, int irq)
-{
-	struct resource res[] = {
-		{
-			.start	= base,
-			.end	= base + 0x20 - 1,
-			.flags	= IORESOURCE_MEM,
-		}, {
-			.start	= irq,
-			.flags	= IORESOURCE_IRQ,
-		},
-	};
-	platform_device_register_simple("spi_txx9", busid,
-					res, ARRAY_SIZE(res));
-}
-
 void __init txx9_ethaddr_init(unsigned int id, unsigned char *ethaddr)
 {
 	struct platform_device *pdev =
diff --git a/arch/mips/txx9/generic/setup_tx4938.c b/arch/mips/txx9/generic/setup_tx4938.c
index ba646548c5f694bd..bfd6540f8f6a406b 100644
--- a/arch/mips/txx9/generic/setup_tx4938.c
+++ b/arch/mips/txx9/generic/setup_tx4938.c
@@ -301,12 +301,6 @@ void __init tx4938_sio_init(unsigned int sclk, unsigned int cts_mask)
 	}
 }
 
-void __init tx4938_spi_init(int busid)
-{
-	txx9_spi_init(busid, TX4938_SPI_REG & 0xfffffffffULL,
-		      TXX9_IRQ_BASE + TX4938_IR_SPI);
-}
-
 void __init tx4938_ethaddr_init(unsigned char *addr0, unsigned char *addr1)
 {
 	u64 pcfg = __raw_readq(&tx4938_ccfgptr->pcfg);
-- 
2.43.0

