Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58008417D80;
	Wed, 15 Jul 2026 18:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141489; cv=none; b=KZYrjHaU07mB5uAbhqSPVYzsn/uu+k/+Ye+Ln1EEgUDv366eyK+2qtkhC0DOQz2L2yoTWuC/rozqxpuDqimpbacpsqypTuqIxeSGgvigbXiAeQPXndy0bBI8fdgm8/SDvLzSixqMjdGUv8AyngVBA/1k5J5VwX8YXcUaVniZuG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141489; c=relaxed/simple;
	bh=3RT0bvr0YlMj/g53DZqvYLkN+FeBp21Hqe9FY6G7j0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sPmR2TjFnPV3eQCQVWYFPyRwrvFkdrWQ6GAIYGACuBUA7k+1wLM04zjVWsQWFQSbXfAG0tWFc1f1mhsuGPtnntRGcwJTUoux8/PAhkVUtwyWKesHIsbQmY65NGpxnyQJsRAMphrhQ+dtaai5NB63UTkE7UWZJj2xsBMiCWeHz5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IdLNl6Ne; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IdLNl6Ne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141487; x=1815677487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3RT0bvr0YlMj/g53DZqvYLkN+FeBp21Hqe9FY6G7j0c=;
  b=IdLNl6Nepy5ODheEFnsreTNDTIeYWvHrJozdgmiGiIiy6wEveldW1zAE
   8TJLn3caJrlBoiDi1GMzMkGG6pumhoQdTwgw9GUVuhReaMSf3Krq+DQla
   SN6WclOoUOV1wFuir5sOGj+jQ1Nhi17lLE1hwrngpZlurzV3YTyOSu3el
   x+WQaJbm+jnBxWpbxqrD1Bnt/FOwRK8ruUBG9SF7vVDuTlwNT/YEawuNl
   C7Q7AYwEFDgU6cWlZFn34oZInlwwsMhu6xLntJX5fvC2iWkj/PIisVlG5
   E6iESC6MDn52B9dIzc8ZNkxepNmyn5b096Vba7eW7hkz+DBCpcJ//p+Px
   w==;
X-CSE-ConnectionGUID: 0DXV2q8NQ1qx6aagGKw8tw==
X-CSE-MsgGUID: J6If2aOyT1W3mv15VTLxzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96308574"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="96308574"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:25 -0700
X-CSE-ConnectionGUID: lMLnisCeQDm4TCWmtpr1gw==
X-CSE-MsgGUID: IPOQ6sDsQcmUjgaIpa0bmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="294491680"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 15 Jul 2026 11:51:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0C37BA1; Wed, 15 Jul 2026 20:51:16 +0200 (CEST)
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
Subject: [PATCH v1 6/7] MIPS: BCM63XX: Open code gpio_request_one()
Date: Wed, 15 Jul 2026 20:46:46 +0200
Message-ID: <20260715185112.1323510-7-andriy.shevchenko@linux.intel.com>
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
 arch/mips/bcm63xx/boards/board_bcm963xx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 57e916c06792..993341604439 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -903,8 +903,11 @@ int __init board_register_devices(void)
 
 	platform_device_register(&bcm63xx_gpio_leds);
 
-	if (board.ephy_reset_gpio)
-		gpio_request_one(board.ephy_reset_gpio, GPIOF_OUT_INIT_HIGH, "ephy-reset");
+	if (board.ephy_reset_gpio) {
+		gpio_request(board.ephy_reset_gpio, "ephy-reset");
+		gpio_direction_output(board.ephy_reset_gpio, 1);
+		gpio_free(board.ephy_reset_gpio);
+	}
 
 	return 0;
 }
-- 
2.50.1

