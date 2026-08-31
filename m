Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895D541D62D;
	Mon, 31 Aug 2026 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186539; cv=none; b=r5trcIOb6v4Ik9XosWVXE0iHzLAah4jSVIKlF+oy04ChVShD0NbXJqnZuhOwFrETNFCiw0ckiVA8Yjr9u1qsshiHBkSJ6xryPP7izw1i744zIaD8d7leyJH9exgoj9aoV8Po7WH5XKz9oMoQAK068PUqGoS5ukRZsbQPZCLW98g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186539; c=relaxed/simple;
	bh=GooC60/DMSFgeOnqucCSaMCpvWO8Nxv29KbZrW05JeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YpYn9YSnvkjPEWoWTKrzinCFMw/fwk2bMTkfuzwS+/6n/x/Ea4Rt4tdeVkVLVYRC42BHzzepttzVTwc0cjaUKza34DGEUHxY5CdHTN2E81/uZ31jHQf3lkQhDEZFwrXveYJhNp2rBNVs4Vuj0yo/ZyQPp/LvabZBYNB3eCjJTUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUBKJy1C; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUBKJy1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788186538; x=1819722538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GooC60/DMSFgeOnqucCSaMCpvWO8Nxv29KbZrW05JeM=;
  b=ZUBKJy1Cnta+nKuPh6MK9+86to938hnAmYQJUV8AS4c219SfJAoRbQSK
   DiGO96WwpvQmuqBCC8KtgDvuXI1S5ArC4gmpyPjjesFPQxfffQYfwONEp
   cE0q2z86j7vkFl8dqxppbXy48TPwr3in9+QPGsE14riD1Ei/pYW9btag7
   3yFe4bA7KYxX94FO5P94OElWHzLxCF9M8/+/o07eq6J1FJbbrKGpyCJUO
   VltWlIkeuJGzDxNlWRAnuKnOJ+NhqzVWbssGx+x8YmamGRlmmQWBO5cov
   uxziZA4eHk7C5peIHs7i/o22rRx1IsrJxlAeqGZDFuPDSNLNSoo0Te9Q0
   g==;
X-CSE-ConnectionGUID: DsrmnNF3TWe7PSAeu7YVKA==
X-CSE-MsgGUID: JlXZ4IjcR2WZrBurAFmlwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99945720"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="99945720"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 07:28:57 -0700
X-CSE-ConnectionGUID: pqOGrTP5TG6WiupCeEI25A==
X-CSE-MsgGUID: Eea9oMmXT7q5xyLDQce9fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="267480379"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 31 Aug 2026 07:28:55 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7191F9B; Mon, 31 Aug 2026 16:28:54 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 1/2] pinctrl: intel: Move intel_pinctrl_get_soc_data() upper in the code
Date: Mon, 31 Aug 2026 16:25:46 +0200
Message-ID: <20260831142853.1995573-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831142853.1995573-1-andriy.shevchenko@linux.intel.com>
References: <20260831142853.1995573-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While it's exported function, move it upper in the code to be on top
of the local user. This brings a consistency to the follow change
that will introduce similar helper for the intel_pinctrl_probe_by_hid().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 981535e023aa..7aa7f81ac405 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1728,18 +1728,6 @@ int intel_pinctrl_probe_by_hid(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe_by_hid, "PINCTRL_INTEL");
 
-int intel_pinctrl_probe_by_uid(struct platform_device *pdev)
-{
-	const struct intel_pinctrl_soc_data *data;
-
-	data = intel_pinctrl_get_soc_data(pdev);
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return intel_pinctrl_probe(pdev, data);
-}
-EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe_by_uid, "PINCTRL_INTEL");
-
 const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_device *pdev)
 {
 	const struct intel_pinctrl_soc_data * const *table;
@@ -1771,6 +1759,18 @@ const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_
 }
 EXPORT_SYMBOL_NS_GPL(intel_pinctrl_get_soc_data, "PINCTRL_INTEL");
 
+int intel_pinctrl_probe_by_uid(struct platform_device *pdev)
+{
+	const struct intel_pinctrl_soc_data *data;
+
+	data = intel_pinctrl_get_soc_data(pdev);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	return intel_pinctrl_probe(pdev, data);
+}
+EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe_by_uid, "PINCTRL_INTEL");
+
 static bool __intel_gpio_is_direct_irq(u32 value)
 {
 	return (value & PADCFG0_GPIROUTIOXAPIC) &&
-- 
2.50.1

