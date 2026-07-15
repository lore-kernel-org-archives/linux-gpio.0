Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5841947ECDE;
	Wed, 15 Jul 2026 18:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141490; cv=none; b=mCDv3ekumAmlGQe83bEfr7xmnhomgdEdid+GnSysmGIrgOyJ9C3ItXYa3RzZApwZB0d2ufNQ67MRzvoJQz/rJZ94GlkXULsO8wpuBUoCE7kLgh1XWHa3x5hijG8L6Yk+k2lmtcWDfmEzg0FmyysbRKlz+bYBvTPr55hYtl5V7yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141490; c=relaxed/simple;
	bh=JwEf2B0/taqBgVcAFv7SQawwrLtkBIODJnPpyfPpuQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovdHxw7MJ4/GQzRtkINi8ltiXiabzmmRZSIeMRhAFJL5n3jPTZVCh0XpJt1g4XAeaC4UpKTJOkNAMxJdsc0ojGZuVHe5ch43ke5yiLW1sr/1CEbq10KM4i7jk7pDqVPz+abR/qC7MuBaa4oo4CkKi/Ua9M2v09mVr9Ajys1rQqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mh5SFI97; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mh5SFI97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141487; x=1815677487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JwEf2B0/taqBgVcAFv7SQawwrLtkBIODJnPpyfPpuQ8=;
  b=mh5SFI97wR9LCkSQ922XRECL58IiQ+7v7z0qtyZ2LePiUO6jcEEr9pbw
   IKxtYrXv7xZctGCzHzp8r0lGEOT8J77jZLN8qnreMUPBnV3+FUFFupT4y
   HgIXAQyWmiRSDZHM1RKccfalqVh/IYo6h5tw6KdkrakNu0XaZ6v9RlagS
   jIbAbOmKnjEjZX/jE9g4xnYcwdpYZy1UvbojBuaWKN8yT5ZCLNVPIJY2/
   IbAtotr+0dPQ0lAl0wkUhnMLswA/4EEVSx7uwzxtTxwykR5Gb/IfpM05G
   CIo3BVv8W8Jm8MrU4/UYQK91ZyNYxl90LQDbeZg0bUg6v+tuHHVFAsAVh
   Q==;
X-CSE-ConnectionGUID: 611ZIsu0SL+2nAM2L619ZQ==
X-CSE-MsgGUID: vY3Z5qKtTqekt+QaST2Fwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84887495"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84887495"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:21 -0700
X-CSE-ConnectionGUID: OrV9bNQNTGWJhH0jJhKgFg==
X-CSE-MsgGUID: 8rEnzpPOQHC01JImubDiYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="280700292"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2026 11:51:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EA4F198; Wed, 15 Jul 2026 20:51:15 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bradford Love <brad@nextdimension.cc>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 1/7] ARM: pxa: spitz: Open code gpio_request_one()
Date: Wed, 15 Jul 2026 20:46:41 +0200
Message-ID: <20260715185112.1323510-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Open code the gpio_request_one() call to be able to kill that API
in the follow changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/arm/mach-pxa/spitz_pm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/spitz_pm.c b/arch/arm/mach-pxa/spitz_pm.c
index 03b4b347f11a..f46a3fb7e07c 100644
--- a/arch/arm/mach-pxa/spitz_pm.c
+++ b/arch/arm/mach-pxa/spitz_pm.c
@@ -108,7 +108,8 @@ static void spitz_presuspend(void)
 	PGSR2 |= GPIO_bit(SPITZ_GPIO_KEY_STROBE0);
 
 	pxa2xx_mfp_config(&gpio18_config, 1);
-	gpio_request_one(18, GPIOF_OUT_INIT_HIGH, "Unknown");
+	gpio_request(18, "Unknown");
+	gpio_direction_output(18, 1);
 	gpio_free(18);
 
 	PRER = GPIO_bit(SPITZ_GPIO_KEY_INT);
-- 
2.50.1

