Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654AB409610;
	Wed,  1 Jul 2026 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900724; cv=none; b=SLSeIC+mwXBjOGdOjCN0Tx8RueHHdO1CmEGOnOS53M8R0ruByvPUyy+EjR/atLQedDpAM/nDZ+Ns2TfVaifBYVZ3+OmvZ7QSgtvzJLS6J+oNi4CPKherzxbniDnfXgIAaDz1PBnDBzhIwox560yKMFQn3nF209kiTurG81FqTso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900724; c=relaxed/simple;
	bh=mNYqsqOZvNhjixXZv8Ezr1zqEiJxw40GTEU/SdZDdJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J68QlXMRWD1wdraf3O5LWySQ6Ph5VsHCdmot6tRltqcR4RmafEEMVUTW3cJlcnc1Y54pwFQYrtHS3w2WICWyvozkAa+10ufKu6PuhKe56FiPOho5x9TDOTBiEuDMeulrbnV4fedi8OQHCKSjZepjCYiyM1qhzL1sV9zOxBShbFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573771F000E9;
	Wed,  1 Jul 2026 10:12:01 +0000 (UTC)
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
Subject: [PATCH v2 4/9] MIPS: TXX9: rbtx4927: Use GPIO lookup table for TXx9 LEDs
Date: Wed,  1 Jul 2026 12:11:39 +0200
Message-ID: <92613064355ad1228b0f43031fc6c5d781e7d4f6.1782900491.git.geert@linux-m68k.org>
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

Convert TXx9 LED description from legacy GPIO numbers to GPIO
descriptors using a GPIO lookup table.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v2:
  - Add Reviewed-by,
  - Return early on platform_device_add() failure.
---
 arch/mips/txx9/rbtx4927/setup.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/mips/txx9/rbtx4927/setup.c b/arch/mips/txx9/rbtx4927/setup.c
index e57c409c318ca220..75674b4cc91d7207 100644
--- a/arch/mips/txx9/rbtx4927/setup.c
+++ b/arch/mips/txx9/rbtx4927/setup.c
@@ -327,11 +327,19 @@ static void __init rbtx4927_mtd_init(void)
 		tx4927_mtd_init(i);
 }
 
+static struct gpiod_lookup_table rbtx4927_gpioled_table = {
+	.table = {
+		GPIO_LOOKUP_IDX("TXx9", 0, NULL, 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("TXx9", 1, NULL, 1, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static void __init rbtx4927_gpioled_init(void)
 {
 	static const struct gpio_led leds[] = {
-		{ .name = "gpioled:green:0", .gpio = 0, .active_low = 1, },
-		{ .name = "gpioled:green:1", .gpio = 1, .active_low = 1, },
+		{ .name = "gpioled:green:0", },
+		{ .name = "gpioled:green:1", },
 	};
 	static struct gpio_led_platform_data pdata = {
 		.num_leds = ARRAY_SIZE(leds),
@@ -342,8 +350,13 @@ static void __init rbtx4927_gpioled_init(void)
 	if (!pdev)
 		return;
 	pdev->dev.platform_data = &pdata;
-	if (platform_device_add(pdev))
+	if (platform_device_add(pdev)) {
 		platform_device_put(pdev);
+		return;
+	}
+
+	rbtx4927_gpioled_table.dev_id = dev_name(&pdev->dev);
+	gpiod_add_lookup_table(&rbtx4927_gpioled_table);
 }
 
 static void __init rbtx4927_device_init(void)
-- 
2.43.0

