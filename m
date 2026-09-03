Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25AC495024;
	Thu,  3 Sep 2026 11:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436137; cv=none; b=BnWPCE7NU6+k832lg4W8f76HwR0zXTFKskUD96o5pZ9O4zuY1aT3DbsA451aAhxx7YDJg3OeRtXv6rwlO29JwEi1iBc17mDrsu2VHK9Voq2HbGDNYDPQGdD07KhQLnYqWXG8TfspPvJNp6k/vyHoPQd9YMjAxvZJ9auESHqSapw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436137; c=relaxed/simple;
	bh=hPsA9AGIzkcM8ijY/bT4wr6kElfRWTVev09ubwpCLHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t0we+6VTu8iaAsJSWimgTGUakCUJn/yLwi/QJXcjyK9ELjNKxNxXdniup906gKS95KCDybaW/7p47wMwZ/poxyD5dTP0gTOw0T9dWrKeG5iHQJ7pybRcKig7E8L3eA+6RK5KhSdP8Bd8p05REsIijZPqdd1orLhaNbmrcsK76ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFN6E/lL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFN6E/lL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788436130; x=1819972130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hPsA9AGIzkcM8ijY/bT4wr6kElfRWTVev09ubwpCLHU=;
  b=ZFN6E/lLqz7U8WgGiu7yxwwrDGGy4jDyoD7A+U3C7q2fNmBgDOReS5NP
   fC7/OBysB2aAQq1bZVSKTrX/Yo2yxsFNIkDo7cgmJHjLzPVFlNSf6EFOG
   lTuNnDDVQQE+HrfzkdlLLJuG2L1Y8yQ8p6P6aio8Vy187vYoESUjLpxGI
   2AnIT3u9LKasTOPbGI1l7TUz5mNdmu1ZN8XU59ecSX0twVGRyckjn1IRN
   fA/NE9Jj5wDehOxEbMeX1kYS+6KnfjuPhwJimzidrL01ozD2YVx5avqcR
   Bx6M1vhIRu6TmXOY7TuQOKKCEqO1ybK+rS0g8fD3+FujNguViXW4hedUw
   g==;
X-CSE-ConnectionGUID: 3/KOm8X8QgC8AwTYIRH+pQ==
X-CSE-MsgGUID: LClJqOh2Tyq8RvBrNzp95g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106436200"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="106436200"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:48:37 -0700
X-CSE-ConnectionGUID: 7xKhq2GUS8KKhwXnV6ki5g==
X-CSE-MsgGUID: ntu+y8nrSUmyGUu0Qv4AhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="270235102"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 03 Sep 2026 04:48:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3D4ED9E; Thu, 03 Sep 2026 13:48:34 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	=?UTF-8?q?Radek=20V=C3=A1lko?= <rvalko@lipicko.cz>
Subject: [PATCH v2 3/3] pinctrl: intel: Try to retrieve driver data for pure platform drivers
Date: Thu,  3 Sep 2026 13:46:14 +0200
Message-ID: <20260903114832.1996235-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260903114832.1996235-1-andriy.shevchenko@linux.intel.com>
References: <20260903114832.1996235-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Denverton pinctrl device can be instantiated by the Intel LPC
driver as an MFD platform device named "denverton-pinctrl".

On affected systems the platform device does not carry the INTC3000
ACPI match data itself. As a result, intel_pinctrl_probe_by_hid()
fails to obtain the SoC data using device_get_match_data() and
returns -ENODATA.

This might be also true for other platforms that can be enumerated
by ACPI _HID. Fix the above by trying the pure platform driver data
in case the firmware node is not set or doesn't carry the necessary
information.

Reported-by: Radek Válko <rvalko@lipicko.cz>
Closes: https://lore.kernel.org/r/20260827184259.32386-1-rvalko@lipicko.cz
Tested-by: Radek Válko <rvalko@lipicko.cz>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 08790bff2951..1363301098d5 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1702,13 +1702,32 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe, "PINCTRL_INTEL");
 
+static const struct intel_pinctrl_soc_data *
+intel_pinctrl_get_soc_data_by_hid(const struct platform_device *pdev)
+{
+	const struct intel_pinctrl_soc_data *data;
+	const struct device *dev = &pdev->dev;
+	const struct platform_device_id *id;
+
+	data = device_get_match_data(dev);
+	if (data)
+		return data;
+
+	id = platform_get_device_id(pdev);
+	if (!id)
+		return ERR_PTR(-ENODEV);
+
+	data = (const struct intel_pinctrl_soc_data *)id->driver_data;
+	return data ?: ERR_PTR(-ENODATA);
+}
+
 int intel_pinctrl_probe_by_hid(struct platform_device *pdev)
 {
 	const struct intel_pinctrl_soc_data *data;
 
-	data = device_get_match_data(&pdev->dev);
-	if (!data)
-		return -ENODATA;
+	data = intel_pinctrl_get_soc_data_by_hid(pdev);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
 
 	return intel_pinctrl_probe(pdev, data);
 }
-- 
2.50.1

