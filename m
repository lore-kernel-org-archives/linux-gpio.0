Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F2F403146;
	Wed,  1 Jul 2026 10:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900737; cv=none; b=dwRLx3OYIlAO+yOShJSXnaqTCXlG+B1f+pa0OOv99qsqKAKRJgOOr1sWU8yzpUKctpCjoYmLUrN6+g6Egq0Kf/Ln9J3hE0/Swwh8hCMql33zWBFEM4v7ryyzi8LhUjC6Wa7VcmSbF5NRXRVA+QC2O5oXKsI01em8SKwWVQSQiSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900737; c=relaxed/simple;
	bh=xw/RjGvq8tAT7TeUTa28eWuEeizoLodGiK1EzfMqbUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AH0N+dPNFokd/sCCiHCOsFgyI4RcXV8iQlmrSHoN13ML5VugY9BwvmjLUTY9SkRIV87sG567nVwfFNNGr5h4FgdpNOCod9267TMt+oRe3nSGc9SyQPcoHrlLmE8q5LIqUY+B3DIB/lMBp1Xn1264HFxrunJSJCVOMFr6A2oClJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBEC1F00A3A;
	Wed,  1 Jul 2026 10:12:13 +0000 (UTC)
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
Subject: [PATCH v2 9/9] MIPS: TXX9: Clean up txx9_iocled_init()
Date: Wed,  1 Jul 2026 12:11:44 +0200
Message-ID: <fd58225121892960c6a9c45b742288863ab872d2.1782900491.git.geert@linux-m68k.org>
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

The sole caller already uses dynamic GPIO base allocation, so drop
support for static allocation.
While at it, drop the no longer used "lowactive" parameter.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v2:
  - Add Reviewed-by.
---
 arch/mips/include/asm/txx9/generic.h |  3 +--
 arch/mips/txx9/generic/setup.c       | 12 ++++--------
 arch/mips/txx9/rbtx4927/setup.c      |  2 +-
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/txx9/generic.h b/arch/mips/include/asm/txx9/generic.h
index 5ce5b8579a444ec3..653315fb6ca559a7 100644
--- a/arch/mips/include/asm/txx9/generic.h
+++ b/arch/mips/include/asm/txx9/generic.h
@@ -79,8 +79,7 @@ static inline unsigned int __fls8(unsigned char x)
 	return r;
 }
 
-void txx9_iocled_init(unsigned long baseaddr,
-		      int basenum, unsigned int num, int lowactive,
+void txx9_iocled_init(unsigned long baseaddr, unsigned int num,
 		      const char *color, char **deftriggers);
 
 void __init txx9_aclc_init(unsigned long baseaddr, int irq,
diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 32246f5f78f5070c..5f66236038c8f468 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -625,8 +625,7 @@ static struct gpiod_lookup_table txx9_iocled_table = {
 	},
 };
 
-void __init txx9_iocled_init(unsigned long baseaddr,
-			     int basenum, unsigned int num, int lowactive,
+void __init txx9_iocled_init(unsigned long baseaddr, unsigned int num,
 			     const char *color, char **deftriggers)
 {
 	struct txx9_iocled_data *iocled;
@@ -652,14 +651,12 @@ void __init txx9_iocled_init(unsigned long baseaddr,
 	iocled->chip.direction_input = txx9_iocled_dir_in;
 	iocled->chip.direction_output = txx9_iocled_dir_out;
 	iocled->chip.label = "iocled";
-	iocled->chip.base = basenum;
+	iocled->chip.base = -1;
 	iocled->chip.ngpio = num;
 	if (gpiochip_add_data(&iocled->chip, iocled))
 		goto out_unmap;
-	if (basenum < 0)
-		basenum = iocled->chip.base;
 
-	pdev = platform_device_alloc("leds-gpio", basenum);
+	pdev = platform_device_alloc("leds-gpio", iocled->chip.base);
 	if (!pdev)
 		goto out_gpio;
 	iocled->pdata.num_leds = num;
@@ -689,8 +686,7 @@ void __init txx9_iocled_init(unsigned long baseaddr,
 	kfree(iocled);
 }
 #else /* CONFIG_LEDS_GPIO */
-void __init txx9_iocled_init(unsigned long baseaddr,
-			     int basenum, unsigned int num, int lowactive,
+void __init txx9_iocled_init(unsigned long baseaddr, unsigned int num,
 			     const char *color, char **deftriggers)
 {
 }
diff --git a/arch/mips/txx9/rbtx4927/setup.c b/arch/mips/txx9/rbtx4927/setup.c
index e904217a5fb20102..223889c031866ca3 100644
--- a/arch/mips/txx9/rbtx4927/setup.c
+++ b/arch/mips/txx9/rbtx4927/setup.c
@@ -373,7 +373,7 @@ static void __init rbtx4927_device_init(void)
 		tx4938_aclc_init();
 	}
 	platform_device_register_simple("txx9aclc-generic", -1, NULL, 0);
-	txx9_iocled_init(RBTX4927_LED_ADDR - IO_BASE, -1, 3, 1, "green", NULL);
+	txx9_iocled_init(RBTX4927_LED_ADDR - IO_BASE, 3, "green", NULL);
 	rbtx4927_gpioled_init();
 }
 
-- 
2.43.0

