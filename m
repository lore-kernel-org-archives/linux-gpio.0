Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F91E3E2ABA;
	Thu, 25 Jun 2026 12:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389994; cv=none; b=YvHFk/U8HK2zl+Gd5E9Z8/j/kjzaPF5L6+Ftn8RLkX6SbxjVgZ6aWr/AE+OO6YKyBsnKH2HLvn26tfY58DGbyLEuXLZqOV6pP917aDtuHTbrZb600J47GzI58xsev9KsyuzXTqsNdXBCnFqfT0q+b5mU4lM2fIB0n8kYzrDj8ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389994; c=relaxed/simple;
	bh=PnfudNjWm8jbHktxtpdI1nxUjxyRgZL3bwZiew9uRko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i0omGjJFDYqOPSxl3fOOtKmLNTanpFp9u7Pqqptg/AmIcTChb24zIgVoB4WvPXpWKi3BMj4q3F8Q7h8Re0Gg84vrIlxIQA0ZjjHwzuya2/o/JG+uzlFjGVgwAhhD+smogPF7IlJYdMDZhPk7+2qk/JanU0nc43myNmVlGyDG8XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C93B1F00A3A;
	Thu, 25 Jun 2026 12:19:51 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 7/9] MIPS: TXX9: Drop GPIOLIB_LEGACY select
Date: Thu, 25 Jun 2026 14:19:28 +0200
Message-ID: <970cff4598382874ec4a59cee5f51c131b82a0a4.1782389357.git.geert@linux-m68k.org>
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

TXx has been converted away from the old-style gpiolib interfaces.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/mips/txx9/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/txx9/Kconfig b/arch/mips/txx9/Kconfig
index 92b759a434c0eedf..7335efa4d52801dc 100644
--- a/arch/mips/txx9/Kconfig
+++ b/arch/mips/txx9/Kconfig
@@ -37,7 +37,6 @@ config SOC_TX4927
 	select IRQ_TXX9
 	select PCI_TX4927
 	select GPIO_TXX9
-	select GPIOLIB_LEGACY
 
 config SOC_TX4938
 	bool
-- 
2.43.0

