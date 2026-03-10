Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF313E63B9;
	Tue, 10 Mar 2026 12:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146730; cv=none; b=OrKEf7/uu4rguNpGXzBxkZPDyfb7RJZHaEdt2FdAuogNfVutsfLx/Z3d9sTQNn8mSxa5i7CwJpulffGh+4Ng8eupTRsS7VO222Qmgq6RcpJZKkedOamGyTZiuDy9urawY4mP8cpKCvDHz2R6vqOv6s1pUYpfAU9RnXwRyI6ldEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146730; c=relaxed/simple;
	bh=1pDp3Qkly2VVJyn5uS1f5Qf9t0lTLCceyj74xLhq9BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDSpRJ5p/apovDleOVDDeyJg3nOkeymp+ufgJ0FLYARQA8UkoyQ9E8hSEzdT/OIBBcip7WgX29PwjlSWhxgp8IOvA/KFM+Ng7lvyuB47fT5kUwSeXknbFWGKrMflyZbtfjx7yFEyUKmtkjjqOTVioFkBuPe9a+9b38KJF31Zdrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsfDmMyy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsfDmMyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773146729; x=1804682729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1pDp3Qkly2VVJyn5uS1f5Qf9t0lTLCceyj74xLhq9BM=;
  b=SsfDmMyyQZui5n92ZiFRjIr2GBJ4rmPn5mkESfc77mkpzC39wTG+7GEU
   m2iJHLLvjes2INSCj/Yp+Y6Acr7Vh5zSqyXnbokzp+XYsaPCOnV8kV590
   kexVEqGBaO54yjQOFxhxfX2qq5WetGRhVV7MciIo+SNnirUjAJIhuCjV9
   d587cLchGsYmNcrhLsVKs76fdzh+XgM5+YUp9Pd0CBwsG9ZjrR/u9KNma
   Bqzml7KFU98qUaXpzYD1kLqhsVg4ddW4vIy+8LWqTEi8RXE4VKXEuurCw
   FJXeQMxnRnrJd+JXI4Wbrbcw/DdOgjbE9fCWm2iTQ7JCylRbVy6PRL1Il
   w==;
X-CSE-ConnectionGUID: 4JB3aOucS7+rRZPmD3w4zQ==
X-CSE-MsgGUID: 2r4bhMYSS6qxlPILqncLig==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74268953"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74268953"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:45:29 -0700
X-CSE-ConnectionGUID: c51sHKIOTzGhiEjpaRNb7Q==
X-CSE-MsgGUID: DPpL6UDMRDmj5McuKSlZ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="225040250"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO alaakso-DESK.kioski) ([10.245.246.41])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:45:23 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hverkuil+cisco@kernel.org,
	sre@kernel.org,
	hao.yao@intel.com,
	jason.z.chen@intel.com,
	jimmy.su@intel.com,
	miguel.vadillo@intel.com,
	kees@kernel.org,
	ribalda@chromium.org
Subject: [PATCH 4/5] gpio: tps68470: Add i2c daisy chain support
Date: Tue, 10 Mar 2026 14:44:26 +0200
Message-ID: <20260310124427.693625-5-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310124427.693625-1-antti.laakso@linux.intel.com>
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tps68470 daisy chain make use of gpio 1 and 2. When in use, these
gpios must be configured as inputs without pull-up.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/gpio/gpio-tps68470.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
index d4fbdf90e190..729ad8e397fc 100644
--- a/drivers/gpio/gpio-tps68470.c
+++ b/drivers/gpio/gpio-tps68470.c
@@ -14,6 +14,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/mfd/tps68470.h>
 #include <linux/module.h>
+#include <linux/platform_data/tps68470.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
@@ -120,6 +121,17 @@ static int tps68470_gpio_input(struct gpio_chip *gc, unsigned int offset)
 				   TPS68470_GPIO_MODE_MASK, 0x00);
 }
 
+static int tps68470_enable_i2c_daisy_chain(struct gpio_chip *gc)
+{
+	int ret;
+
+	ret = tps68470_gpio_input(gc, 1);
+	if (ret)
+		return ret;
+
+	return tps68470_gpio_input(gc, 2);
+}
+
 static const char *tps68470_names[TPS68470_N_GPIO] = {
 	"gpio.0", "gpio.1", "gpio.2", "gpio.3",
 	"gpio.4", "gpio.5", "gpio.6",
@@ -129,6 +141,8 @@ static const char *tps68470_names[TPS68470_N_GPIO] = {
 static int tps68470_gpio_probe(struct platform_device *pdev)
 {
 	struct tps68470_gpio_data *tps68470_gpio;
+	struct tps68470_gpio_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	int ret = 0;
 
 	tps68470_gpio = devm_kzalloc(&pdev->dev, sizeof(*tps68470_gpio),
 				     GFP_KERNEL);
@@ -149,7 +163,14 @@ static int tps68470_gpio_probe(struct platform_device *pdev)
 	tps68470_gpio->gc.base = -1;
 	tps68470_gpio->gc.parent = &pdev->dev;
 
-	return devm_gpiochip_add_data(&pdev->dev, &tps68470_gpio->gc, tps68470_gpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &tps68470_gpio->gc, tps68470_gpio);
+	if (ret)
+		return ret;
+
+	if (pdata && pdata->daisy_chain_enable)
+		ret = tps68470_enable_i2c_daisy_chain(&tps68470_gpio->gc);
+
+	return ret;
 }
 
 static struct platform_driver tps68470_gpio_driver = {
-- 
2.53.0

