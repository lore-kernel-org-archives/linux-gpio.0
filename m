Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594547;
	b=le6L+OpFLJs+MzzHRoMEUCyoUhsl8vgKxwDCkHMx+ozEeSWGhYtFc9T6226MnOpLUfeG
	 2to42xuC0AQqvcctMYAwYRHb8f2q+rDUaqA6puu12KOKJ8gjrCplWTSJ4iL3yWlU5bREl
	 K4cRioO7CqMJ1PKXG+a/ntWd7xt4wqvY9MgL6KlzJADQ2hMNuzYL5IJiVcgEdW//4J8GX
	 bRkORHWAEuqXGaZgnd5CvBNyVSyrbWcvbKJVcUliJkPykih5vQdmFW2l8YVHHOJQ+BQ5o
	 zM9LK/4eAWdlmCkAugM7y9w20g6KvPyneJZAIXZ6KCLVNiNcbmivm5p/k0O7Tz9Zhlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594547;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eBp9krLjZ25iZxVymuE84Qor8V5KnNOsAPiVhwsTD/s=;
	b=RBZw3q/nf85ctyNRtPkygnrxe4CMLiy0HdwjzOm5l75emwOEBz02rxV3LvNmkrUq5+ms
	 gL4/ahPmFsY2q6MzUxmhc8ZdCRtU2Ni/Ay0rAqH4W4tBD4aYlGJG2D9f1SbZYToakFBut
	 e01u+aFLFfAUFzqPy5Lksu7g7KqKWoCH+6JQXV0aGeK+T7hijAOGcUhzl06kMvTTXQQaa
	 FBl2W88wwV96qQKZ5A/935cJ3hEspNGPdyf9sYO7eEBJR8ChHz7VgWI39R/GLITq9S2YR
	 ocdY+yfmxbsTg8O4viGMcYVvJalqVYxn1X1yKjzTY1pb3+CDEGoXHlMqgUUMnhFoWxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E5wSKGcr;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5C7606A32D;
	Wed, 21 Oct 2026 14:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB5C7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E5wSKGcr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792594547; x=1824130547;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7if26d8q5Z0ZK5J/T5LST+jgstuVFQFfhqDJoJ4qJ3Q=;
  b=E5wSKGcrRoinxM2sOBX/CGqgEqZhEvOILC0zARLqADFmn+Mz8gXb9HPp
   cAX/SAfU5V1asHxvXl/KB149PIRhYcTBfFpR7C9lZ7eRE7yFHEnD44GpC
   JcnR8taslZO6kK8cO4IXJ45t9ZIdYkN0M4ZxTWBTdA6kTtCQbhApqUYsa
   50ODoEeSWeTgWfD+BgUv+Z9mPK/KrV80FUltMbL69jVlC3ABdppGUNPze
   viwU43tEmT31i4zuXikJvJLICBsOCFMRbW62qlwn8IZS6YyWMsWFvBABs
   rw0AtlvKbAcx1FsZULr5pOw5tQ7TTXrfxvu9zAhoQ4hOi9ykEo+JEO7PV
   w==;
X-CSE-ConnectionGUID: aWsLwO9ASCOhzJ8Sdnikvw==
X-CSE-MsgGUID: B++LnyQvT7KlJeuReEAohA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1210478"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1210478"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 07:55:46 -0700
X-CSE-ConnectionGUID: b/SO/sTmRjiepmKqctXq+w==
X-CSE-MsgGUID: /0boSUw9R1aaMF4d49YI9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3453853"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 21 Oct 2026 07:55:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id DD2A89B; Wed, 21 Oct 2026 16:55:43 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v1 1/1] gpiolib: Put stubs in order in linux/gpio/driver.h
Date: Wed, 21 Oct 2026 16:55:43 +0200
Message-ID: <20261021145543.567959-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stubs in linux/gpio/driver.h go in a slightly different order
than declarations. Put stubs in the same order.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/driver.h | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 7918b1575201..f3f913691a59 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -837,6 +837,17 @@ struct gpio_device *gpio_device_find_by_fwnode(const struct fwnode_handle *fwnod
 
 #include <asm/bug.h>
 
+static inline int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset)
+{
+	WARN_ON(1);
+	return -EINVAL;
+}
+
+static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset)
+{
+	WARN_ON(1);
+}
+
 static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
@@ -873,19 +884,6 @@ static inline struct gpio_device *gpio_device_find_by_fwnode(const struct fwnode
 	WARN_ON(1);
 	return NULL;
 }
-
-static inline int gpiochip_lock_as_irq(struct gpio_chip *gc,
-				       unsigned int offset)
-{
-	WARN_ON(1);
-	return -EINVAL;
-}
-
-static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
-					  unsigned int offset)
-{
-	WARN_ON(1);
-}
 #endif /* CONFIG_GPIOLIB */
 
 static inline bool fwnode_is_gpiochip(struct fwnode_handle *fwnode)
-- 
2.50.1

