Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615620;
	b=KIWCEOmbLKPbCE/I2J0dc73/v3iQe45h/yJavZZ9OvQ+lW4jlfppwY4+uLcAndmQESSD
	 00hiQlfGl36Lo5KWvAYuDuVK64tdnqyXQbJMWf3gogPWTkJItXAyhKveT+74NPb7vKQrA
	 39x2hwc7xDsP6EzKcYeaWNKKkWTO1HaGNvZJc20uc6zbSUNohnX8FgMbHdb7Xq0Ja7xv9
	 Vz2jGZrcI0Tcag1lIaR9yymo2+Wdye7C/RRZlriyCpyMVscjkIUjcSdfVzItjlMmZHU7K
	 NPjjlczKvOxNj9qydJLu4XD6RPtGSnpmJrLXHRoJKiXsISC2E37VRw/FLPNGoIwFijQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615620;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PgSqXDzMwf24mVtFSvDLv/MrFshFwtQnuKcKC+r8wy4=;
	b=3AfpAQjY9Vr/nzzZWPppXydhNrozxfesMNNwTVjDdDByKqTPr6fuAp0aXU/Ee4tOZBxG
	 ZApYc8iA0xC2Okmfh5qEvLqpexQLhYmGa0r6V7oCydd4q8sQNNyiMrDXrfi7nWTSuSnDO
	 4BjTvOH5Wv5qF5hrY+VQI2SZpi4XEgAwgeBbe5kV9N6+dpKHh5C2DzhOsMNjPO/B51rz3
	 jORfoh6n00lu5CyOmuB8lXOywq6cxga3Iz0y05SvXANM1wbT81TWEarjeVDsnZYL3p+2h
	 awy+uWg29CX+/nJNqv5XuLibsiktL455Ge8vRCSWx923KjMUJ6FnRzGx49aBQx88BTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jglmjx92;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB1B606A31E;
	Wed, 21 Oct 2026 20:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB1B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jglmjx92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792615619; x=1824151619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XVMRCO4lwSpeRUU4nBkODKTrZ96uDsqD7e21rCb2HI8=;
  b=jglmjx926mYdtzt1FrJ+FO7hessLAU1sL68sgAozaYpMvVtrEnks+bxA
   1mHGpDzlWZY7Wly5Y27yspmzWr0gSbuI1MbKYn1lmF/rx5ZXcaFuXFdv3
   DTgP2n42b6k/nA+eJjcC98/pZZQXyafQTdasvmzdVcw4R79WUeMjnPgix
   bK6f8f9uKbvtsMg2khLy76ejpv2ft8HQ6W/4GFXKnebZlv++szMFqiaaI
   CL1t2t27D+RUMrjUwrdpIUjWSSK7BEg1Q8ywAMpIo0b5KpkA228n8UI7H
   2ffjdrjqpBoJ187k4le6nHNzxcXuzWWX593Qn+35/CDPT+yN5Ze02VZnY
   A==;
X-CSE-ConnectionGUID: iM0u/EFwRw6HDVmY1fkd3w==
X-CSE-MsgGUID: Susg9wbfSPOGg4l50dqi0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1243665"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1243665"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 13:46:58 -0700
X-CSE-ConnectionGUID: 62+Bpy71QsK4J7GuFTh/RQ==
X-CSE-MsgGUID: gvQpcpl+RcWlkn9TvrQdlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3534464"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2026 13:46:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 58E979E; Wed, 21 Oct 2026 22:46:55 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Samuel Moelius <sam.moelius@trailofbits.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v1 3/3] gpio: sim: Replace custom devm_gpiochip_dispose_irq_mappings()
Date: Wed, 21 Oct 2026 22:44:45 +0200
Message-ID: <20261021204654.1001101-4-andriy.shevchenko@linux.intel.com>
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

Replace custom implementation of devm_gpiochip_dispose_irq_mappings().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-sim.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 34b45d0d3575..5667871f21c2 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -338,15 +338,6 @@ static void gpio_sim_put_device(void *data)
 	put_device(dev);
 }
 
-static void gpio_sim_dispose_mappings(void *data)
-{
-	struct gpio_sim_chip *chip = data;
-	unsigned int i;
-
-	for (i = 0; i < chip->gc.ngpio; i++)
-		irq_dispose_mapping(irq_find_mapping(chip->irq_sim, i));
-}
-
 static void gpio_sim_sysfs_remove(void *data)
 {
 	struct gpio_sim_chip *chip = data;
@@ -467,10 +458,6 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	if (IS_ERR(chip->irq_sim))
 		return PTR_ERR(chip->irq_sim);
 
-	ret = devm_add_action_or_reset(dev, gpio_sim_dispose_mappings, chip);
-	if (ret)
-		return ret;
-
 	ret = devm_mutex_init(dev, &chip->lock);
 	if (ret)
 		return ret;
@@ -496,6 +483,10 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	gc->dbg_show = PTR_IF(IS_ENABLED(CONFIG_DEBUG_FS), gpio_sim_dbg_show);
 	gc->can_sleep = true;
 
+	ret = devm_gpiochip_dispose_irq_mappings(dev, gc, chip->irq_sim);
+	if (ret)
+		return ret;
+
 	ret = devm_gpiochip_add_data(dev, gc, chip);
 	if (ret)
 		return ret;
-- 
2.50.1

