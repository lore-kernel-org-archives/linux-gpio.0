Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E19E313520;
	Wed, 11 Mar 2026 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235204; cv=none; b=cPCTmgRNkuR2P5WoFWCqaI8aX5x/s2i/P91xSnl7eH1niudf1+JVsBdxJS6A/ia7wZWFOlHHOJUj/XBSBaNdeZu8kDwt80zTQB6xkhx0bcIsgqjzTXt9oXbgBWQvBW0bkJ8A2Q4vDeHJO+ZUFH+vQgPjasi+nkP6rz+a031dTuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235204; c=relaxed/simple;
	bh=Kqf/qEkZeZ46LGOR2VgVoMBdmGyw7onI/cRBOIpeOvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtyCclgs6OqRuecTrX7+0msYCG069f4JG1+gKblCpJOHW8a58gxPu0CuK1qFW2t+kLhAjO4Mk0gCX3wUvLuBIoAtqPzo7xbeHQx1D3jx9li+MkVpCKz7lhjzHeDp+pjmMrPvCdKr6O+6Qp2hk04Wo3gFGTkhfqKW7aSoTzUQoCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGd0Mlti; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGd0Mlti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773235203; x=1804771203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kqf/qEkZeZ46LGOR2VgVoMBdmGyw7onI/cRBOIpeOvE=;
  b=KGd0Mlti3ejgIoMre+XBCZX2x9d2+9szH7P9Orl62rmRGClWA+PxI8y6
   ynFHwLUH/VErYpYT3tD6YL4vBjR++ULS6Y3y0zZaywVmrCrfjd845A9Ft
   FeQ1G/L33dup9+NZ8XwjYSSqCrT8PxpGCibHAtZRk+7UH74PU7zm3elBh
   DgtJf5PyRjyN866JaMysXAisXuUN45EhnkxCU+0yf03ak3z0fryyDMraL
   P95iiU0w0MyOE5KGN7qUJ0yTL9UoU+MYB6YAh7oQLVi37mCDHIQgnEKPn
   +0bXa+T3nFt4pE4GlwyV0ay6dRScNNvsRDgGWfQnvWM66ZoSMusGj5wRY
   Q==;
X-CSE-ConnectionGUID: 5pFuUN9pRw2euMLxASw43A==
X-CSE-MsgGUID: un5yfAjpTlOPilxaZGt3Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74211589"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74211589"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:20:03 -0700
X-CSE-ConnectionGUID: p31x/BRaROK5w2PIk4hU0A==
X-CSE-MsgGUID: wg8t0clqSPyf4OV0/mhayQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="217131277"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO alaakso-DESK.intel.com) ([10.245.246.81])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:19:59 -0700
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
	jimmy.su@intel.com,
	miguel.vadillo@intel.com,
	kees@kernel.org,
	ribalda@chromium.org
Subject: [PATCH v2 4/5] gpio: tps68470: Add i2c daisy chain support
Date: Wed, 11 Mar 2026 15:19:09 +0200
Message-ID: <20260311131910.835513-5-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311131910.835513-1-antti.laakso@linux.intel.com>
References: <20260311131910.835513-1-antti.laakso@linux.intel.com>
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
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/gpio/gpio-tps68470.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
index d4fbdf90e190..8541acecfbbe 100644
--- a/drivers/gpio/gpio-tps68470.c
+++ b/drivers/gpio/gpio-tps68470.c
@@ -120,6 +120,17 @@ static int tps68470_gpio_input(struct gpio_chip *gc, unsigned int offset)
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
@@ -129,6 +140,7 @@ static const char *tps68470_names[TPS68470_N_GPIO] = {
 static int tps68470_gpio_probe(struct platform_device *pdev)
 {
 	struct tps68470_gpio_data *tps68470_gpio;
+	int ret;
 
 	tps68470_gpio = devm_kzalloc(&pdev->dev, sizeof(*tps68470_gpio),
 				     GFP_KERNEL);
@@ -149,7 +161,14 @@ static int tps68470_gpio_probe(struct platform_device *pdev)
 	tps68470_gpio->gc.base = -1;
 	tps68470_gpio->gc.parent = &pdev->dev;
 
-	return devm_gpiochip_add_data(&pdev->dev, &tps68470_gpio->gc, tps68470_gpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &tps68470_gpio->gc, tps68470_gpio);
+	if (ret)
+		return ret;
+
+	if (device_property_present(&pdev->dev, "daisy-chain-enable"))
+		ret = tps68470_enable_i2c_daisy_chain(&tps68470_gpio->gc);
+
+	return ret;
 }
 
 static struct platform_driver tps68470_gpio_driver = {
-- 
2.53.0

