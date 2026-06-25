Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCAF3E1D04;
	Thu, 25 Jun 2026 12:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389989; cv=none; b=DouvuOYUUIHdVl6W2JGVpW5n/+RQQ1PSeNi2atbNjlaDkMOESKtBYGhyJdzf9zYcaSNnbDHoPc3CAmMs/e9fmVUrsltb8iRSLkNv9UwwrPBYFqnOz4Z/ZYjZsMEfm1fUt3Q5bPfYL5WVoEjRb6Mgi+zklXAyCbpxst8mIIY2fx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389989; c=relaxed/simple;
	bh=ffw0y/6xQF73k8sL+GUpvbsuZcAeg9ccRcDje0EXB4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQ3h9owBN3D9V6oPYRohPbv4HHMpGye6trl2kkXfp5VT8iYv3e/Gy4JzkbHkIzU8sZ/N+V81GRR8CCN9hm3aQ6Qtk+BtMZ7ZwwH0dbBKCsSM6axbqV31uXilVotanfKyCzsrt5xxdthpYDVRXjNiBBKXR4+V+EDORi2II96Lp+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB991F00A3A;
	Thu, 25 Jun 2026 12:19:46 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 5/9] MIPS: TXX9: Reduce TXX9_IOCLED_MAXLEDS to 3
Date: Thu, 25 Jun 2026 14:19:26 +0200
Message-ID: <77535cc848c89d339fc5efe9ce1a30e017164a18.1782389357.git.geert@linux-m68k.org>
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

The number of available GPIOs and LEDs on the TXx9 IOC FPGA depends on
the platform.  Since commit 455481fc9a807798 ("MIPS: Remove TX39XX
support"), the only remaining platform (rbtx4927) supports just three.
Hence reduce the maximum number, to reduce allocation size.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/mips/txx9/generic/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 97102d3327d22828..611ccbe429cfe7e1 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -569,7 +569,7 @@ void __init txx9_ndfmc_init(unsigned long baseaddr,
 #if IS_ENABLED(CONFIG_LEDS_GPIO)
 static DEFINE_SPINLOCK(txx9_iocled_lock);
 
-#define TXX9_IOCLED_MAXLEDS 8
+#define TXX9_IOCLED_MAXLEDS 3	/* rbtx4927 */
 
 struct txx9_iocled_data {
 	struct gpio_chip chip;
-- 
2.43.0

