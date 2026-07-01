Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F782404BF3;
	Wed,  1 Jul 2026 10:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900727; cv=none; b=Hia39Q7JKjhHRII1z477WZwyDmwuXkcdhoCXFbTUw8YLXgWcGDcyT1Zzqu6131aNgZdTqQUhyq+6vY7gcTshBJ4oD7c3DEEGqSWj+ZtnAibMKx8mEAEDLGuMie7jBr8NFKh/YfABNxUDdgq3d0iMdRCdHb65dZG5f0r08TgsZUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900727; c=relaxed/simple;
	bh=TI3kKfAtk/F3Qh22c6KjxjUvJ6p1rCWZjhYRrQwDxxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KZWJYMn+SzsbuINBSpeVhBSAnDDZI0oS3i6EwgX9bZXtEEziiQDgQIr+qPL+KgWWisNqk3NbpU8YEUtbqXPVk+u14adCm8hT0YysF0IVXA5a8sGEaVuhGHeR5AD3jS+3+mfintv84O3VRGUHNRQXDDyq4lmkPxRAM5RfoQWZ+6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB8D1F00A3A;
	Wed,  1 Jul 2026 10:12:03 +0000 (UTC)
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
Subject: [PATCH v2 5/9] MIPS: TXX9: Reduce TXX9_IOCLED_MAXLEDS to 3
Date: Wed,  1 Jul 2026 12:11:40 +0200
Message-ID: <918814dbc0532a0d375ae5e333ea3613942f3110.1782900491.git.geert@linux-m68k.org>
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

The number of available GPIOs and LEDs on the TXx9 IOC FPGA depends on
the platform.  Since commit 455481fc9a807798 ("MIPS: Remove TX39XX
support"), the only remaining platform (rbtx4927) supports just three.
Hence reduce the maximum number, to reduce allocation size.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v2:
  - Add Reviewed-by.
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

