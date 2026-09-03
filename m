Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B349D4963BA;
	Thu,  3 Sep 2026 11:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436128; cv=none; b=BrvVDoILi+vNz801XSOMNT2JlXx99u+oziAx8Mkj1Pl+0CXxBg9Ft6pYLe5pqhcetqa2qd6oKnFUQ77pwhDZyiTfCFMeEuJ9KekdCgUbJi1tkcfgr1J2/oVqh3MFUrGBxzQg0ECEpZ4rLCkzzLaDKKc0TH0gEqmxAqy4DAyYNn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436128; c=relaxed/simple;
	bh=bGa2/5JDzh3TVEiG+tkgj/DTA0QkKftaBg3BIIR7AUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YpW1k5Lrv7uM7a1QYq3rAV0L3zb92YVBYdbJTavUAsj9ljWyLW7cP6rs05enADUAl0r2ai2PP4BiW+moe6J9+qHU+DEM455sF8xP2YPv2WPvl2NN4zl0JkvV2YelU95tvUja7XtThQjqVnPI+C2KMU9MQR/M3sa4Qv6uiObouwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4kOH51Y; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4kOH51Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788436123; x=1819972123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bGa2/5JDzh3TVEiG+tkgj/DTA0QkKftaBg3BIIR7AUI=;
  b=k4kOH51YhqPVwSqUjXBpBfU3rvSCJlmIsG4np3SV9AicSXZ1t5jn4Hp9
   yWzVK0+UznpEoPL9sRk7dBZpZBYR3vn/mAREnSUcpiEA8dUiyqW4cWjHz
   OuhfwGaDMPmVxAFatI2HeN3UAwSG4i+TX+oALy+pWMp1ouTFNAfRY+YAC
   2SOdTG/FFlZpWSleXRefPdbwt5qnZSAjoaotuSuXnrFQ9fOqdQi4wYS1l
   Uyi/UN5LLJ4Nk/oYv7aenPxDfMuNtOvWME0VU4WaYoTNWxy6kAKOs3GdI
   C/4Vf/hjqn3Cw9vn1Kx4shludhwe2GbZHgqJnonwYN2DU01JKhc4yTii6
   A==;
X-CSE-ConnectionGUID: Ve+34ebERG2r14PElqzWBg==
X-CSE-MsgGUID: kt+5q32oSTykHe9FJe824A==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106436198"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="106436198"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:48:37 -0700
X-CSE-ConnectionGUID: qNNSb7JkSH+3d+RAwvBPWg==
X-CSE-MsgGUID: +6t5g5VqRTiAJaAik2juFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="270235103"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 03 Sep 2026 04:48:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3545B9B; Thu, 03 Sep 2026 13:48:34 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 1/3] pinctrl: intel: Move intel_pinctrl_get_soc_data() upper in the code
Date: Thu,  3 Sep 2026 13:46:12 +0200
Message-ID: <20260903114832.1996235-2-andriy.shevchenko@linux.intel.com>
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

While it's exported function, move it upper in the code to be on top
of the local user. This brings a consistency to the follow change
that will introduce similar helper for the intel_pinctrl_probe_by_hid().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 261ec2ee63ef..fd02409a2415 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1714,18 +1714,6 @@ int intel_pinctrl_probe_by_hid(struct platform_device *pdev)
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
@@ -1757,6 +1745,18 @@ const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_
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

