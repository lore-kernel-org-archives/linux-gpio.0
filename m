Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24220494A10;
	Thu,  3 Sep 2026 11:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436132; cv=none; b=MN2Be+KwlGILZd+RddDV2kZp//EsaDdHKDwQ3mWLJuTt10gHdw6d9FR1kFJKn7pPpc/5jMKGyLhaAKlgoA2gw5CGx2qazU426X3dsP6Zy3xDYr0EndXJaT5JhFZhDcthmnC5d2UwXyMf8jwRJhYTcET6qzKL8+xzwPoX1cMUzOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436132; c=relaxed/simple;
	bh=E93yCynpB4MkNLpRhDyIDYbO4DNgZdIchrcTLxIanL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNKHPOYSohm9yX1Vs0TFoRDnpw53I1M26uICQoA9T6sruqNhupebAz2lx5xbxAOAD+YqPse3CyK3Na/SRZ7q0dRMd5FU5WG7rr6C+zSDSJ8+r7wP1wMA+A1Xc7ac9t3yuUfeGYosHwI8lwA0xRBs4tU4NHHVGQyR1JNCW2NLLzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2GbqnXT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2GbqnXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788436127; x=1819972127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E93yCynpB4MkNLpRhDyIDYbO4DNgZdIchrcTLxIanL0=;
  b=g2GbqnXTGjmhoautrDKKDO2DYORNROS488xYVhPt6bawiVcpciIB1LxI
   BgVsY0DVnBMBJrN1eaM+r1Mf5K1B3A2Ycr8B/o39fHyu3ngZLiWJ8PDjR
   2i6c5sxteOcSHj4nMKII2xgKv/763k3AbtC+BZ/NYJeBRY9QDz864DfgB
   Smgw96miNNVHIlQNAnzyWDaaSZNHp4bHBktOD3ZAGm/kvbU8/b+wPmqwX
   13szUyyyHo8jcV1I0H5dnZb/ilIgEkxV0y6H2AkfSaLc67kEsiEpQwAVG
   u4OVm0+3bTDqtxoc/RscrEjLxjrK+tlJyYAampAC2hjZS6bJksf9SNxT2
   w==;
X-CSE-ConnectionGUID: 5JGZ5TJMRcebix/vpGKlCQ==
X-CSE-MsgGUID: jZbd4UG6QO+T6FnpwUuzLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92616604"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="92616604"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:48:37 -0700
X-CSE-ConnectionGUID: ArKCaQO0RRKyrhpHGUV6/A==
X-CSE-MsgGUID: 6QyCYrUpT+GsubKRHywAlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="267939182"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 03 Sep 2026 04:48:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 392AB9D; Thu, 03 Sep 2026 13:48:34 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 2/3] pinctrl: intel: constify parameter in intel_pinctrl_get_soc_data()
Date: Thu,  3 Sep 2026 13:46:13 +0200
Message-ID: <20260903114832.1996235-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260903114832.1996235-1-andriy.shevchenko@linux.intel.com>
References: <20260903114832.1996235-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameter of intel_pinctrl_get_soc_data() is not going to be modified.
Mark it with const qualifier.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 4 ++--
 drivers/pinctrl/intel/pinctrl-intel.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index fd02409a2415..08790bff2951 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1714,11 +1714,11 @@ int intel_pinctrl_probe_by_hid(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe_by_hid, "PINCTRL_INTEL");
 
-const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_device *pdev)
+const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(const struct platform_device *pdev)
 {
 	const struct intel_pinctrl_soc_data * const *table;
 	const struct intel_pinctrl_soc_data *data;
-	struct device *dev = &pdev->dev;
+	const struct device *dev = &pdev->dev;
 
 	table = device_get_match_data(dev);
 	if (table) {
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index b5476b9de0db..b7ee7fd0c5f2 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -225,7 +225,7 @@ struct intel_pinctrl_soc_data {
 	size_t ncommunities;
 };
 
-const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_device *pdev);
+const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(const struct platform_device *pdev);
 
 struct intel_pad_context;
 struct intel_community_context;
-- 
2.50.1

