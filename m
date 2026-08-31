Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD884A0913;
	Mon, 31 Aug 2026 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186541; cv=none; b=boLBPrQcgY3x9zYTYukt7n8m2ZpQ4j4YsKUJ+9CU77693qPeGqOFxAKF7JrWYsGmkmhzg7zromFYi9msWnanjIDkICceXHshV/mG+Hq+9qKBoywQUwmcBnh/NK7FdlfaDjshY9cSPYKDoSYFgOlKri8rG2LUln8CacC/FqZcp1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186541; c=relaxed/simple;
	bh=XAOqPuGIsWHCnyuRM3U+SglhaDFG6IGoZPIAO0WivLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Et8Dps+h5sfEO6o9VaCU897Co1c5/yQT0zm3XnmYv87klFI6iHGP1pCF+9ykcGnhCCA+W4qb35lEdG6U8yVIN/Ec+LnVXdG4oprxvapr+vyG2JCFeUWrXi98Ocqd5StzGu9B07yqFDC43vT2ahUUicnelMpvGXW1seQZJvIcnN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfYxJFGN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfYxJFGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788186540; x=1819722540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XAOqPuGIsWHCnyuRM3U+SglhaDFG6IGoZPIAO0WivLY=;
  b=BfYxJFGNwCOGWuCAgg1h/8S3KcapbjKUp2TMO6/n8ez433b5snR3WRC4
   FGOg6dCVI4zvW+i5fAc4ERJUcoTp7V1YY5uRcZRjTDw3ecBCcLSoYsgfM
   /FW+vse8RLG7zCfR3pCSeO11i6c0hm6ImrffkoV6VlSOxRfZvKqIn6khH
   rJKeKfPkDxCVkLCHQybpuHbN2s2lmDYXzzCOQLZIoJmMvyVCsdykX3jsv
   sNK2U+4c1OXqGqJCep3LqjffEB3wwVuuRKBIS0iFy+Bkaio6S//MWfbhG
   gr2YfbehUWbfn7Rm6o3cwQ+rZnt7B9rQAkkpocso+wTh4SJvXV1yNxBhU
   A==;
X-CSE-ConnectionGUID: busIAsE7T7SgMwkdmTsFDA==
X-CSE-MsgGUID: ptJhQK3QRuS02SDrBr260w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99945727"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="99945727"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 07:28:57 -0700
X-CSE-ConnectionGUID: 2cLhpqoBTTGNG6wY7aNtLQ==
X-CSE-MsgGUID: 5TjDtTUySkyKuj7Tfh1fuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="267480382"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 31 Aug 2026 07:28:55 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 75E779D; Mon, 31 Aug 2026 16:28:54 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	=?UTF-8?q?Radek=20V=C3=A1lko?= <rvalko@lipicko.cz>
Subject: [PATCH v1 2/2] pinctrl: intel: Try to retrieve driver data for pure platform drivers
Date: Mon, 31 Aug 2026 16:25:47 +0200
Message-ID: <20260831142853.1995573-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831142853.1995573-1-andriy.shevchenko@linux.intel.com>
References: <20260831142853.1995573-1-andriy.shevchenko@linux.intel.com>
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
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 7aa7f81ac405..50ffad6a7610 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1716,13 +1716,32 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe, "PINCTRL_INTEL");
 
+static const struct intel_pinctrl_soc_data *
+intel_pinctrl_get_soc_data_by_hid(struct platform_device *pdev)
+{
+	const struct intel_pinctrl_soc_data *data;
+	const struct platform_device_id *id;
+	struct device *dev = &pdev->dev;
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

