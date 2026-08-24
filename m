Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCB339769A;
	Mon, 24 Aug 2026 07:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557599; cv=none; b=h6mhHLJZoaQkrv+2rkqNsPqIElLAmCQyxDMBj2bYLa9JAfgvyrr6t0K1lsn/cn7SkGj3lG1KP4CLrTyEbZAZfBPHZp8u4J4UzgZs0TRfpCk0qBllpLMhBI7cc9t1ok0KRMgSIAnE58JoJqye2zM0YJY8BVNM86rXtpovScgpbAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557599; c=relaxed/simple;
	bh=Olxp+XRfKg6I0jsffga9X3Ar1aUW0Q6hGRO0bE/66jE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLLSO7b78ftiajWDtgXPQR1yDYkXACQhIldWJw3589acrduDvNMTaARTQmVS/8ac4K6B/Whc5tiTj7W+QTXSnDJImgIdt5wmt80GRuZGZ9rUPGUKrcoRm733XRL4Gf8H2oRyndyQtq+OW5WN8UsmnGcsSNGTmkrILpulbKCpjHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlDWTztn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlDWTztn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787557598; x=1819093598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Olxp+XRfKg6I0jsffga9X3Ar1aUW0Q6hGRO0bE/66jE=;
  b=PlDWTztnCvB/alV8+SyINs9gsqdBN2R+mtIeDl3SOF1c6jcYN6e92Khd
   9XycMvL5l8RKV1KcSVNa4TqIFBNlweJQwsFJC9hjIkBEqw3RXP+MEmtAR
   FTL9ZDFRCMEBsDh82ldGRVij+szqtaGiHzvTZbCDH7w6MwdcGkAeuLqd0
   zzFH5xe4+FF5XleMr47EJkFszbZYThaynakI7RbvZn7VfkOXDNeRCMrOZ
   fIiP0psEEQoIOHEfT5vfVlwlSsDkudMNKE+vrRyEtuMC5oXzCQdtWSKZz
   We1xHtLK81salA79mc1YtakYFKWWzGHwWfBZB7hV5xf8zy5JReANmBB40
   Q==;
X-CSE-ConnectionGUID: kzraTkp3Qz2wtPEl9H9/gw==
X-CSE-MsgGUID: ElU1hxwOQeqrmTgET+GSPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88203132"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88203132"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:44:31 -0700
X-CSE-ConnectionGUID: 1f9grLjMSU6YOJJSj8zBaw==
X-CSE-MsgGUID: e+SJP58XTj+0lDzAWmldlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="268887917"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 24 Aug 2026 00:44:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CA7259E; Mon, 24 Aug 2026 09:44:28 +0200 (CEST)
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
Subject: [PATCH v1 3/4] pinctrl: ma35: Replace open coded fwnode_is_gpiochip()
Date: Mon, 24 Aug 2026 09:42:34 +0200
Message-ID: <20260824074427.3226457-4-andriy.shevchenko@linux.intel.com>
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

Since GPIOLIB provides a helper, no need to open code it, hence
replace that piece by fwnode_is_gpiochip().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index dafa85c105a1..922b727c4b6c 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -1075,7 +1075,7 @@ static int ma35_pinctrl_probe_dt(struct platform_device *pdev, struct ma35_pinct
 	int ret;
 
 	device_for_each_child_node(dev, child) {
-		if (fwnode_property_present(child, "gpio-controller"))
+		if (fwnode_is_gpiochip(child))
 			continue;
 
 		npctl->nfunctions++;
@@ -1096,7 +1096,7 @@ static int ma35_pinctrl_probe_dt(struct platform_device *pdev, struct ma35_pinct
 		return -ENOMEM;
 
 	device_for_each_child_node(dev, child) {
-		if (fwnode_property_present(child, "gpio-controller"))
+		if (fwnode_is_gpiochip(child))
 			continue;
 
 		ret = ma35_pinctrl_parse_functions(child, npctl, idx++);
-- 
2.50.1

