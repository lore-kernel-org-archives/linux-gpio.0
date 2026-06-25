Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C052A3E16A0;
	Thu, 25 Jun 2026 12:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389985; cv=none; b=jJlbjqt8rlQmfmE+0qxlAfn2MMV/OHXsAt5sY3SHVbXicZPf2au+VTSznqs7niLt4rho8tRao9H010t1/ux7/97rrZmfBhJhD4WSJQOEmsWLY2qBi47DdadeCZuUKwJElgAsLX3w4yd4UEkBr4jsmCQyPYkWuHzTvlIA0nG2Ugk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389985; c=relaxed/simple;
	bh=WxYCG0Tfd1YE9jUVa3/b5I8fyrCBlyPkUlu3VBY5zXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9j2MdVa1aIDW1ck1fmBfAXGEltzPDl0w9qD9K9yI9sCDmSDRDYn1phTc9q8viGYbi/kjiiKNpBBpEk6mREkUx3oaBSb4BRWzkGbIqLVEE4QialL0n1IKBmZ1sHuT0Q8zXnC+PjxtDvTzrJqu8QhTjqNf3k21V2KKDV2+OcGS/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27111F00A3A;
	Thu, 25 Jun 2026 12:19:42 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 3/9] MIPS: TXX9: rbtx4927: Use GPIO lookup table for SIO DTR
Date: Thu, 25 Jun 2026 14:19:24 +0200
Message-ID: <f4a6c829c18219c77aa2f4824f0286c6a40c6d39.1782389357.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782389357.git.geert@linux-m68k.org>
References: <cover.1782389357.git.geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert SIO DTR handling from legacy GPIO calls to GPIO descriptors
using a GPIO lookup table.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/mips/txx9/rbtx4927/setup.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/mips/txx9/rbtx4927/setup.c b/arch/mips/txx9/rbtx4927/setup.c
index 31955c1d55550fd4..e57c409c318ca220 100644
--- a/arch/mips/txx9/rbtx4927/setup.c
+++ b/arch/mips/txx9/rbtx4927/setup.c
@@ -49,6 +49,7 @@
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/leds.h>
 #include <asm/io.h>
 #include <asm/reboot.h>
@@ -157,11 +158,20 @@ static inline void tx4927_pci_setup(void) {}
 static inline void tx4937_pci_setup(void) {}
 #endif /* CONFIG_PCI */
 
+/* TX4927-SIO DTR on (PIO[15]) */
+GPIO_LOOKUP_SINGLE(sio_gpio_table, NULL, "TXx9", 15, "sio-dtr",
+		   GPIO_ACTIVE_HIGH);
+
 static void __init rbtx4927_gpio_init(void)
 {
-	/* TX4927-SIO DTR on (PIO[15]) */
-	gpio_request(15, "sio-dtr");
-	gpio_direction_output(15, 1);
+	struct gpio_desc *d;
+
+	gpiod_add_lookup_table(&sio_gpio_table);
+	d = gpiod_get(NULL, "sio-dtr", GPIOD_OUT_HIGH);
+	if (IS_ERR(d))
+		pr_err("Unable to get sio-dtr GPIO descriptor\n");
+	else
+		gpiod_put(d);
 
 	tx4927_sio_init(0, 0);
 }
-- 
2.43.0

