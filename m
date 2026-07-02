Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C828D42EEA2;
	Thu,  2 Jul 2026 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997774; cv=none; b=IT+nzZPMzTJDLYj1ZERbiXClUohO5l5E9/P0YFmDwHNeQhEeToSf+eh/upGLXu2BI7DbvqxFmu9cFY7R4SyI46AlVXvmmjJDGRmkBUaPU73H4Lum+lYYqkO1vAdw2tX7s+bMHzqNppZ4yrIvhb0ZE9EZXu0/4khat5tAy0DWR9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997774; c=relaxed/simple;
	bh=ysYB0HfR2ElzBxQ0vsjRanwNC5HogXqATkqnY5i2J54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4zWTAvo9nrJE/f/vo8ZVKpwG5uz0H5gqo/U+i1zlAsQr6oLMY4DvgMYyYE0gO4OnifAXZeSu5RUwYXlHlPkfB8HdN1gW28har3cqMoX3d14qXgh24wDgZsIPTT7G9JMDrI4/iVTixasULLbU7ozgwhnRvKmp3y6zK5oyM3VXek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Anssswzi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Anssswzi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782997772; x=1814533772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ysYB0HfR2ElzBxQ0vsjRanwNC5HogXqATkqnY5i2J54=;
  b=AnssswziHKOh8NDSfpMWYq0Aky1LhRvePkHMlJ8p/kcJl29ELHQK41lh
   gwOtF09oNtrNdhrIBO5BFHwCz8Bhl2IGXyTmbE0tk8717O+bFZnZZiyld
   j6y+FQ74eFPon/JLhr0AVnuhyau+IVswnWX2cz6O18YDgYz+GttM95Ku1
   LVQC6xYX/6VsbjydPTPral5jRx79YtO0rJx7nXDm9FEnmiKmXO1VT+7P0
   zdTCZDd3m9XPFqgbs3bIonBoqb+7Hj4qHK6fktoYbSroxlhuWkL7kLojw
   jAudil9XlZFJTxYovmeYsFnJEOazR7atJJAI5U7EBVYrg+V60vkgHghHW
   g==;
X-CSE-ConnectionGUID: 4qoe75RBROC8duva1sJX/A==
X-CSE-MsgGUID: GComcb83RAKwE1pNeRs9jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101175360"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="101175360"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:09:26 -0700
X-CSE-ConnectionGUID: S49wbDXHQQ6CKbBMv83HZw==
X-CSE-MsgGUID: ML3lQ/c3SLi4k/ykLb3nDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="248412274"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2026 06:09:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 84B8F9B; Thu, 02 Jul 2026 15:09:21 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v1 3/4] gpio: regmap: Apply default resource callbacks for regmap IRQ chip
Date: Thu,  2 Jul 2026 14:42:56 +0200
Message-ID: <20260702130903.1790633-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
References: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When GPIO regmap creates an IRQ chip on behalf of the user, it also
takes an ownership of the respective callbacks and driver data.
With that being done, apply default resource callbacks that keep
tracking the IRQ requests and releases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-max7360.c | 7 ++++---
 drivers/gpio/gpio-regmap.c  | 3 +++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max7360.c b/drivers/gpio/gpio-max7360.c
index d12cf1dc8d57..07eda49f375b 100644
--- a/drivers/gpio/gpio-max7360.c
+++ b/drivers/gpio/gpio-max7360.c
@@ -127,7 +127,7 @@ static int max7360_handle_mask_sync(const int index,
 				    const unsigned int mask_buf,
 				    void *const irq_drv_data)
 {
-	struct regmap *regmap = irq_drv_data;
+	struct regmap *regmap = gpio_regmap_get_drvdata(irq_drv_data);
 	int ret;
 
 	for (unsigned int i = 0; i < MAX7360_MAX_GPIO; i++) {
@@ -170,7 +170,6 @@ static int max7360_gpio_probe(struct platform_device *pdev)
 
 			/* Create custom IRQ configuration. */
 			irq_chip = devm_kzalloc(dev, sizeof(*irq_chip), GFP_KERNEL);
-			gpio_config.regmap_irq_chip = irq_chip;
 			if (!irq_chip)
 				return -ENOMEM;
 
@@ -181,7 +180,9 @@ static int max7360_gpio_probe(struct platform_device *pdev)
 			irq_chip->num_irqs = MAX7360_MAX_GPIO;
 			irq_chip->irqs = max7360_regmap_irqs;
 			irq_chip->handle_mask_sync = max7360_handle_mask_sync;
-			irq_chip->irq_drv_data = regmap;
+
+			gpio_config.regmap_irq_chip = irq_chip;
+			gpio_config.drvdata = regmap;
 
 			for (unsigned int i = 0; i < MAX7360_MAX_GPIO; i++) {
 				ret = regmap_write_bits(regmap, MAX7360_REG_PWMCFG(i),
diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index ad808d8d24b3..d0e65eac9f0b 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -419,6 +419,9 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 #ifdef CONFIG_REGMAP_IRQ
 	if (config->regmap_irq_chip) {
 		gpio->regmap_irq_line = config->regmap_irq_line;
+		config->regmap_irq_chip->irq_reqres = gpio_regmap_irq_reqres;
+		config->regmap_irq_chip->irq_relres = gpio_regmap_irq_relres;
+		config->regmap_irq_chip->irq_drv_data = gpio;
 		ret = regmap_add_irq_chip_fwnode(dev_fwnode(config->parent), config->regmap,
 						 config->regmap_irq_line, config->regmap_irq_flags,
 						 0, config->regmap_irq_chip, &gpio->irq_chip_data);
-- 
2.50.1

