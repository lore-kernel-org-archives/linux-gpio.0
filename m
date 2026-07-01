Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBBB40DFCF;
	Wed,  1 Jul 2026 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900729; cv=none; b=e9TAjMushjh3tDP+Osz30wp3WaJAeFX2BuLxgUtsJoPREgbfgH0A35w9AzFHSms0pyw0hI2ZK7KNuSvcaAKbbviCxJmCIHVHFaXe6eebC4m9obKNSYYdkx61kHUxn6ILuWpF3sEAS2t8RdXbcp4VlMrmJ7rDGWz2IO0Dpun1/LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900729; c=relaxed/simple;
	bh=B0DBPdbDcgJGH2EFbbmm8OmRu5Kh0J1h0+vJkGdUY4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEu6dwYGXZx6FoViuxu+nNWtD/jF8q9WjuRCoDehIuEyIowP8BUeL2zPynmpRvHO7osnYSQGm5bmGdMXGvcLpnHE3N8C4f91Y69o/IaUrTYnqkgvNmVJUqdBosuWfOBwNaTwqyVaTSaqVPJQ3pvcGIt++Api6t2+2YjUfjnnGUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B111F000E9;
	Wed,  1 Jul 2026 10:12:06 +0000 (UTC)
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
Subject: [PATCH v2 6/9] MIPS: TXX9: Use GPIO lookup table for iocled LEDs
Date: Wed,  1 Jul 2026 12:11:41 +0200
Message-ID: <68c915761e5234ad64cd62024fbac39ab097494d.1782900491.git.geert@linux-m68k.org>
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

Convert iocled LED description from legacy GPIO numbers to GPIO
descriptors using a GPIO lookup table.

For now, just ignore the "lowactive" parameter, and force
GPIO_ACTIVE_LOW, as that is what the sole caller wants.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v2:
  - Add Reviewed-by.
---
 arch/mips/txx9/generic/setup.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 611ccbe429cfe7e1..32246f5f78f5070c 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -19,6 +19,7 @@
 #include <linux/clkdev.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/txx9/ndfmc.h>
 #include <linux/serial_core.h>
@@ -615,6 +616,15 @@ static int txx9_iocled_dir_out(struct gpio_chip *chip, unsigned int offset,
 	return 0;
 }
 
+static struct gpiod_lookup_table txx9_iocled_table = {
+	.table = {
+		GPIO_LOOKUP_IDX("iocled", 0, NULL, 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("iocled", 1, NULL, 1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("iocled", 2, NULL, 2, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 void __init txx9_iocled_init(unsigned long baseaddr,
 			     int basenum, unsigned int num, int lowactive,
 			     const char *color, char **deftriggers)
@@ -659,14 +669,14 @@ void __init txx9_iocled_init(unsigned long baseaddr,
 		snprintf(iocled->names[i], sizeof(iocled->names[i]),
 			 "iocled:%s:%u", color, i);
 		led->name = iocled->names[i];
-		led->gpio = basenum + i;
-		led->active_low = lowactive;
 		if (deftriggers && *deftriggers)
 			led->default_trigger = *deftriggers++;
 	}
 	pdev->dev.platform_data = &iocled->pdata;
 	if (platform_device_add(pdev))
 		goto out_pdev;
+	txx9_iocled_table.dev_id = dev_name(&pdev->dev);
+	gpiod_add_lookup_table(&txx9_iocled_table);
 	return;
 
 out_pdev:
-- 
2.43.0

