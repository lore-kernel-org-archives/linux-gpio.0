Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C4641325C;
	Wed,  1 Jul 2026 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900735; cv=none; b=dziqaQN6Qw6R0lixj7CthAWNCjDPxERaN7te2N9O4omGQKT326RodkUCCY5JaUpzBu+clSlUUo4qaNjv8Q/PCjZKIqFTspkOSG5thRR9f72QhUmmhm2XmnBR+aELYMRaTyQuckxviW/YvfMRjIDzV9l5cpkUCc86wwvDgDIjVHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900735; c=relaxed/simple;
	bh=B+gZKHu/lByLRWszcaHlq3vLi6sughi4S+f0VWBBNqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOwdic0cCk554dp6sRaht7PfwFv6BCjgkWe1hSAg85LUdhEmRvrP3IA/Kvr/Fe5X6eunquDcpyg4BiZDBF0YHYfnOBpB8QOapi2qQcjZfXV4Ql3n1LDKjN4//Q2Q8sCZCgE5Jw4Ztl+KDMFfcD0aLY9sCf5YRdzD7vOpWBvnn5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B521F000E9;
	Wed,  1 Jul 2026 10:12:11 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 8/9] MIPS: TXX9: Convert gpio_txx9 to dynamic GPIO base allocation
Date: Wed,  1 Jul 2026 12:11:43 +0200
Message-ID: <121d6400aa83dd5339c2a2a8a95e90e98ffb326a.1782900491.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782900491.git.geert@linux-m68k.org>
References: <cover.1782900491.git.geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Static allocation of GPIO base is deprecated, use dynamic allocation.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v2:
  - Add Reviewed-by.
---
 arch/mips/include/asm/txx9pio.h | 3 +--
 arch/mips/kernel/gpio_txx9.c    | 5 ++---
 arch/mips/txx9/rbtx4927/setup.c | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/txx9pio.h b/arch/mips/include/asm/txx9pio.h
index 3d6fa9f8d5135411..c33a977244005479 100644
--- a/arch/mips/include/asm/txx9pio.h
+++ b/arch/mips/include/asm/txx9pio.h
@@ -23,7 +23,6 @@ struct txx9_pio_reg {
 	__u32 maskext;
 };
 
-int txx9_gpio_init(unsigned long baseaddr,
-		   unsigned int base, unsigned int num);
+int txx9_gpio_init(unsigned long baseaddr, unsigned int num);
 
 #endif /* __ASM_TXX9PIO_H */
diff --git a/arch/mips/kernel/gpio_txx9.c b/arch/mips/kernel/gpio_txx9.c
index 96ac40d20c238018..b2e73263d94c8419 100644
--- a/arch/mips/kernel/gpio_txx9.c
+++ b/arch/mips/kernel/gpio_txx9.c
@@ -76,13 +76,12 @@ static struct gpio_chip txx9_gpio_chip = {
 	.label = "TXx9",
 };
 
-int __init txx9_gpio_init(unsigned long baseaddr,
-			  unsigned int base, unsigned int num)
+int __init txx9_gpio_init(unsigned long baseaddr, unsigned int num)
 {
 	txx9_pioptr = ioremap(baseaddr, sizeof(struct txx9_pio_reg));
 	if (!txx9_pioptr)
 		return -ENODEV;
-	txx9_gpio_chip.base = base;
+	txx9_gpio_chip.base = -1;
 	txx9_gpio_chip.ngpio = num;
 	return gpiochip_add_data(&txx9_gpio_chip, NULL);
 }
diff --git a/arch/mips/txx9/rbtx4927/setup.c b/arch/mips/txx9/rbtx4927/setup.c
index 75674b4cc91d7207..e904217a5fb20102 100644
--- a/arch/mips/txx9/rbtx4927/setup.c
+++ b/arch/mips/txx9/rbtx4927/setup.c
@@ -178,7 +178,7 @@ static void __init rbtx4927_gpio_init(void)
 
 static void __init rbtx4927_arch_init(void)
 {
-	txx9_gpio_init(TX4927_PIO_REG & 0xfffffffffULL, 0, TX4927_NUM_PIO);
+	txx9_gpio_init(TX4927_PIO_REG & 0xfffffffffULL, TX4927_NUM_PIO);
 
 	rbtx4927_gpio_init();
 
@@ -187,7 +187,7 @@ static void __init rbtx4927_arch_init(void)
 
 static void __init rbtx4937_arch_init(void)
 {
-	txx9_gpio_init(TX4938_PIO_REG & 0xfffffffffULL, 0, TX4938_NUM_PIO);
+	txx9_gpio_init(TX4938_PIO_REG & 0xfffffffffULL, TX4938_NUM_PIO);
 
 	rbtx4927_gpio_init();
 
-- 
2.43.0

