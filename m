Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A88C3FD15E;
	Wed,  1 Jul 2026 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900732; cv=none; b=BM7IV294X6huwNDZK7Yrs9LKd4nlsmAWF7kKTInbb1knCDXSNKgNiVZtm4g/tT4cHZJFxhzb9eVgv+7uSXWJsho77oBI5e38CubISyWhKoDVEgmYt9YL/BJ8Fnczrzlz6Y3o5TjtH8JxSEh2uf7p2zqekLnYggJnEsI9NHIfCbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900732; c=relaxed/simple;
	bh=jSXkSz8JX58dioIh15KZz9lTCSGLczxglZ5o659EEcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5eUb1t5AZrcsRa7/gdJ2dbArJtm4Gy5Uwho4tw/6Fma3JjNDSVk2ii9dyKfM5Irmyl2T4LqxTTE99eyn82IEKTQ28lMr+BayorD0o7ZfUrGug9S7qdZoRMyJ9baIbzh+NatLVhNXPYRVolMRZpteJEQWeJCpdNu9aHRoTgspII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4101F00A3A;
	Wed,  1 Jul 2026 10:12:08 +0000 (UTC)
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
Subject: [PATCH v2 7/9] MIPS: TXX9: Drop GPIOLIB_LEGACY select
Date: Wed,  1 Jul 2026 12:11:42 +0200
Message-ID: <0dd4ff62e5cfd5c34817c58d5311e7a060b08971.1782900491.git.geert@linux-m68k.org>
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

TXx has been converted away from the old-style gpiolib interfaces.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v2:
  - Add Reviewed-by.
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

