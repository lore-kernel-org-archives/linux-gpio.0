Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615621;
	b=HFkbAtrjCMyMwNB04cAxJT2x2lwXzrI9MkqioJ5QWRhq8qb1VVgCFKzKOjmzrF9FECBs
	 +2JA/DWxE2ctYpyP/428q90WqjHLI93D3znFJFzcoEUcMyBmSZpZ5lBTanQYXNm2GRqBC
	 FWPGWCOg9TJU/I3qi8s3+A3zZYeW9cYgvMg3hsp21FIvRGbKm31c3SWAkq+rWrq88nKYv
	 oIwRDcHGcvDcD6HTyCORBYqbgx6l96ZpeFrN+m49vQLjISYZ2f0orYAZu/EC9B4PmNCff
	 e5x/JJZOl6o23JXwssO1qZML/+lrLh+jJeQ7S3Y27SF+g/kHMjV/99eRcL76YKOuLNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615621;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TsNtWc/0aGCTjKMA4H866moa20ExqmOsyOx1rYRFaRc=;
	b=eb9dRih0VT8keeGTQZ42o793tBQ4QVc3RDbRlYy94LZ+hcwarm9Qb40Bv9VgEXzdatEF
	 1H3l/selOSmSDRhfsRbK/P344PSQyQSAp/lDUDq1SEHhttzVtq9qp3VPRF0Br2de9dv18
	 n1YYTLDIJDPB5Ntv00lebFn1AbkzM69R2eILIS8Zg7c8q76LMKQC3deNX1CM4yDZyzgV6
	 y9o0tGMCVEhuJQWIPh96jnTGFDV0G8sKKHsElF6NRZeLQw/d+l5fHDIIgRyyM8hvv1POv
	 /94IMzfDqZMslDTt+siwcK+rpLxhavDmE21fO98ZRD1wckzjdkEGjg4bZWTycf1BXrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O2EuGI0T;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66FC606A337;
	Wed, 21 Oct 2026 20:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D66FC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O2EuGI0T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792615621; x=1824151621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N5gLnMwYQv+qjRt+a74O/z10rixfiFnQyKKlAKSBJNA=;
  b=O2EuGI0Tlm6FYXeNyvd43euKaTLaGtCJUhhQL2DkCZLiTw8rSiaOXk/v
   bSOAekhDpC2dLK3zoRIDTVd8LJhgoGmEufDD+1x+H8pUsW/0ZqVUtTkPI
   Y/FtwHBZPF7kgQ+xgOb7k1NTsYEjRFL7hZ0Q4eV1cCcePzzlybz6RYxwo
   JmyK8xePyzM6PAvqHXoGGpT6OGlwmYEZOT9uxJcUVF9pRks1JO+XoYPl6
   aB6BuwNzBmcxUrWgKMkeOYILQSQgKEb40hSe2uJTXdOf2jFrNarSdRRft
   NVXqYsg7ZtlWXdvimQgpYT7zhYO75fVAGnSc4w95jj2lHOibju+GzQuFg
   w==;
X-CSE-ConnectionGUID: pW8ULCKNQouSvionRCnZEg==
X-CSE-MsgGUID: XfJ9xRxLTr6Yv/1xqrIjDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1449957"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1449957"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 13:47:00 -0700
X-CSE-ConnectionGUID: ncFjdARPTNGB7bHfM0WW9g==
X-CSE-MsgGUID: QBjhuhqJTAaam3NsP6ZDyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="4952196"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa012.fm.intel.com with ESMTP; 21 Oct 2026 13:46:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 50B219B; Wed, 21 Oct 2026 22:46:55 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Samuel Moelius <sam.moelius@trailofbits.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v1 1/3] gpiolib: Introduce devm_gpiochip_dispose_irq_mappings()
Date: Wed, 21 Oct 2026 22:44:43 +0200
Message-ID: <20261021204654.1001101-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
References: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
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

Several drivers already copy'n'paste almost the same code to dispose
IRQ mappings on remove over and over. Deduplicate that by introducing
a devm_gpiochip_dispose_irq_mappings().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-devres.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h   |  4 ++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index cc0e434a37d3..94690f14a949 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -10,6 +10,7 @@
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/gfp.h>
+#include <linux/irqdomain.h>
 #include <linux/types.h>
 
 #include <linux/gpio/consumer.h>
@@ -323,6 +324,38 @@ void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs)
 }
 EXPORT_SYMBOL_GPL(devm_gpiod_put_array);
 
+struct gpiochip_irqdomain {
+	struct gpio_chip *gc;
+	struct irq_domain *domain;
+};
+
+static void gpiochip_dispose_irq_mappings(struct device *dev, void *res)
+{
+	struct gpiochip_irqdomain *gcirq = res;
+
+	for (unsigned int i = 0; i < gcirq->gc->ngpio; i++)
+		irq_dispose_mapping(irq_find_mapping(gcirq->domain, i));
+}
+
+int devm_gpiochip_dispose_irq_mappings(struct device *dev,
+				       struct gpio_chip *gc,
+				       struct irq_domain *domain)
+{
+	struct gpiochip_irqdomain *gcirq;
+
+	gcirq = devres_alloc(gpiochip_dispose_irq_mappings, sizeof(*gcirq), GFP_KERNEL);
+	if (!gcirq)
+		return -ENOMEM;
+
+	gcirq->gc = gc;
+	gcirq->domain = domain;
+
+	devres_add(dev, gcirq);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_gpiochip_dispose_irq_mappings);
+
 static void devm_gpio_chip_release(void *data)
 {
 	struct gpio_chip *gc = data;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b3b938ec5332..c610b5a9f8fa 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -707,6 +707,10 @@ static inline int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
 }
 #endif
 
+int devm_gpiochip_dispose_irq_mappings(struct device *dev,
+				       struct gpio_chip *gc,
+				       struct irq_domain *domain);
+
 int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset);
 int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
-- 
2.50.1

