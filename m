Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14723A168B;
	Mon, 24 Aug 2026 07:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557606; cv=none; b=us65Mg04ZFVejXSpj7s90xkPaNU4cAQLa7oEEbfDEKA1Xkm/JZ2aln4lLtWKRcGFpeZkvHcy6BkOgh5P6DamhWVLQuhB1HwcVN+0RAEti8IV1KpnYFjasUoaFkuDu0PGEownRdVYHacBCGYbwHUPAw2CnsCpMmaVLnhnRXyOfEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557606; c=relaxed/simple;
	bh=aZY2Htu/rT0PU7j0rX9JiBkzz3dP5AzcZ4eIyb1HCZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ot7b2Svago8SsRsE4K2DwJzR41H8d3vH2hvSJrwXIjTzvw5umJAYNKRI7tWcgbvHWaPX57pgPabSycPaI9hA2FtJX1+scjXHcDv7CiDfBEN566kA/3ZftZV4Vks8bTxXlJ8XAxGca3Z1kLGRJvQYTukuOvj9wdgBDt5G5QGtWQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSZaVirR; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSZaVirR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787557604; x=1819093604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aZY2Htu/rT0PU7j0rX9JiBkzz3dP5AzcZ4eIyb1HCZY=;
  b=mSZaVirRmCuoxzrThKvl5DeVMjBYJdzITL6v0+6jLDtrqX/N1VBx6sIM
   /BE+xtj4LJuu3DG3emsijxx5zQ7sR0zp/7VVg7jNl1BjH+v3qtmqpnk16
   wyW9fJ5cJ+wDrvJIsvX+OQcdI71oKBnRD9pJwQV+y5A0oUDm3P/KC9Mqm
   gvz5qi1EgKq0IWz+KMrA6sCmX5vI2NNDnxSlQUVb+8+eP2wMcCm6ll7Ic
   uE04b05lYvY9EUvV5PqgI4g13Gfj2IJkLitq3ORrKP0TeuJa3oV3uB/dq
   dmnq+2K8mS+blHnBBOoQ3rW3qKzlwzZule0PNSBTYOv94WCAgVc7dOCRh
   A==;
X-CSE-ConnectionGUID: FZH3gczkRiK5WMjEok70tQ==
X-CSE-MsgGUID: /KQbypUTR8iocQFRkY45GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88203148"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88203148"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:44:31 -0700
X-CSE-ConnectionGUID: JYz2MM0GQHSheyFtJ4v5Tw==
X-CSE-MsgGUID: IuY2Ujj6RuiNOBYFELQz0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="268887919"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 24 Aug 2026 00:44:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C0E6B9B; Mon, 24 Aug 2026 09:44:28 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>
Subject: [PATCH v1 1/4] gpio: Split fwnode_is_gpiochip() helper
Date: Mon, 24 Aug 2026 09:42:32 +0200
Message-ID: <20260824074427.3226457-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
References: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many drivers repeat the same over and over. For clarity and robustness
split fwnode_is_gpiochip() helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/driver.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2ea21341adea..06d40fb77a73 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -879,9 +879,14 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
 }
 #endif /* CONFIG_GPIOLIB */
 
+static inline bool fwnode_is_gpiochip(struct fwnode_handle *fwnode)
+{
+	return fwnode_property_present(child, "gpio-controller");
+}
+
 #define for_each_gpiochip_node(dev, child)					\
 	device_for_each_child_node(dev, child)					\
-		for_each_if(fwnode_property_present(child, "gpio-controller"))
+		for_each_if(fwnode_is_gpiochip(child))
 
 static inline unsigned int gpiochip_node_count(struct device *dev)
 {
-- 
2.50.1

