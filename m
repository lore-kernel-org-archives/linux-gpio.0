Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7723E025E;
	Thu, 25 Jun 2026 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389987; cv=none; b=QrbFm8Q5kepFcOauS154BwDfSQFZocrb9G4y9HDP2cgp0NDxsEWhj+2347Vk4chfdT8OPu8AJy8SOx3MD3U7RMFZpolTa8XjFq5EyAgJ56a8OEoytI2wAOQe2yp5ox2S8iG4uYjsCsE/G0qN7n5/qCepBkMMRNmdk61rFRzscbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389987; c=relaxed/simple;
	bh=yvp1uB0cp7b4sAirJAMdEus9DHUG3hpaFgOZblz1hTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEsdj6amBtisCj8srL3iNpEcOvZ3f3SUf14q4ALeC0U45NNx5XzNkpdIRKf9eqjewABthUZXhrOctea++Ke6LI6DUK+higdA642Xwct3fo5kGRln+HfSIzq+00cFg1ujpTJJtr/+WlqSyUeG99WVwLo3p/gW4WOSHpBMaC5+VjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B231F000E9;
	Thu, 25 Jun 2026 12:19:44 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 4/9] MIPS: TXX9: rbtx4927: Use GPIO lookup table for TXx9 LEDs
Date: Thu, 25 Jun 2026 14:19:25 +0200
Message-ID: <3615eba18ff6a9351ecb11d9f5a0c86ef7b0e670.1782389357.git.geert@linux-m68k.org>
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

Convert TXx9 LED description from legacy GPIO numbers to GPIO
descriptors using a GPIO lookup table.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/mips/txx9/rbtx4927/setup.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/mips/txx9/rbtx4927/setup.c b/arch/mips/txx9/rbtx4927/setup.c
index e57c409c318ca220..618f6a6ab3de08f1 100644
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
@@ -344,6 +352,8 @@ static void __init rbtx4927_gpioled_init(void)
 	pdev->dev.platform_data = &pdata;
 	if (platform_device_add(pdev))
 		platform_device_put(pdev);
+	rbtx4927_gpioled_table.dev_id = dev_name(&pdev->dev);
+	gpiod_add_lookup_table(&rbtx4927_gpioled_table);
 }
 
 static void __init rbtx4927_device_init(void)
-- 
2.43.0

