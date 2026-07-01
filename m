Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE95140683F;
	Wed,  1 Jul 2026 10:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900719; cv=none; b=O/s1fwTa7asZHtzw5cnVB3ixmIf6aMeTPE0BQAEwjn30789eVSKFlqtxmrh6IRfCb9GNTVaLIuXlz1W+Pvr9QEoRShlRDjVggz3T+6dEZb7EXIwwdAU/F3I9bMXW1HjGapubnbw5Wi/6nQoGxoq75CUIP4OFxZgGRk0EqJsg88s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900719; c=relaxed/simple;
	bh=MkliZcmVgulpT53/3oWLkOsbEh0iqn6szuH0HHkoJSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N4PjCJlb/V/S/sTVRVEgOMoMhC9l1x94sfqWQH5P8cDFYbMswQSBTGTRWz+ZYwFnWkjHDwQ4oC7iJ6QWfJ3YwSjlLSS74JTEzMzjCoQc75UEE7SNzGgYue/AklyO/gPdGntlRIBgpXMwSk8m/37S48GapFb5R73kHNwu+FXb1d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0E81F000E9;
	Wed,  1 Jul 2026 10:11:56 +0000 (UTC)
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
Subject: [PATCH v2 2/9] MIPS: TXX9: Remove txx9_7segled_*() forward declarations
Date: Wed,  1 Jul 2026 12:11:37 +0200
Message-ID: <eaf21b1094e8a89c3dcc0e5bffcf79d9502d2189.1782900491.git.geert@linux-m68k.org>
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

The actual implementation was removed in commit 5a8df9281b052ff3 ("MIPS:
TXX9: Remove rbtx4939 board support").

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v2:
  - Add Reviewed-by.
---
 arch/mips/include/asm/txx9/generic.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/mips/include/asm/txx9/generic.h b/arch/mips/include/asm/txx9/generic.h
index 3813ab9ccf717ada..5ce5b8579a444ec3 100644
--- a/arch/mips/include/asm/txx9/generic.h
+++ b/arch/mips/include/asm/txx9/generic.h
@@ -83,11 +83,6 @@ void txx9_iocled_init(unsigned long baseaddr,
 		      int basenum, unsigned int num, int lowactive,
 		      const char *color, char **deftriggers);
 
-/* 7SEG LED */
-void txx9_7segled_init(unsigned int num,
-		       void (*putc)(unsigned int pos, unsigned char val));
-int txx9_7segled_putc(unsigned int pos, char c);
-
 void __init txx9_aclc_init(unsigned long baseaddr, int irq,
 			   unsigned int dmac_id,
 			   unsigned int dma_chan_out,
-- 
2.43.0

