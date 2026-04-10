Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16D53CF66C;
	Fri, 10 Apr 2026 14:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830539; cv=none; b=VA5/xvgRg1FO0Yf7l1bLDVyRyrQqxyPMcj1Xdlqr7Y1GyeA6q0ICckOh3QTadWy+wkukRpaYXmr5+Yjct2//8bL/c2nyNo7WQd8YCG/u9PZHkE/47VxXztVHUukmqOOkiEuzKGNvEBdvQ1EyJTn4r6Zt+aKghZU6e/qVWvsVSNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830539; c=relaxed/simple;
	bh=E97VIaajicEnzMUaaD5JT6++g1UpBprXz9TsK99IHJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WDIFjQmWPAhRvmkHgRHxmyRSj2EXkE78FTdCqQ8BfciynXLEBsqhScVCZXY9AflwDD6RIq56pH3HEUeM+S9LX25E4OB3JUWxKrHomDtXTw4nL7rn2nwYt15RcoaWz/FF8SDlmbRXnHVG7OXiEXMrc/Q07N7AYYzTNXgcYq7Yv0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WT2c5aC+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WT2c5aC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775830538; x=1807366538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E97VIaajicEnzMUaaD5JT6++g1UpBprXz9TsK99IHJw=;
  b=WT2c5aC+4vz/shMCCt4FhOMpzwTTHjup9x/RNvL6xg1mPZo1RLVnqAnQ
   cow7EndgpmAxq8/jy6Ke94CdOK/1YscIyNN1tGwV2OGDpmQ2QsydMgNO4
   gN1t0DYow2XW+CSQPg4mn5bpXpKOOsxUlGWcH62OxEH4xju4Rrugr3o/Q
   D2fKW6guVfq4gZ5gVoWfWTXPuq5HrIB4DyktpTDv4DE26Uwge3UZFuTo+
   qyw3A6UH6HJVYlP0KhLLaG2csWFClOpXhs0ctrRGnGwWWeKgilf7SnPcy
   Fld3jECJLGS9ECQGEO5qO3DlnklyezrbcIt/KTsfc2MULFBP7l/V4i46b
   w==;
X-CSE-ConnectionGUID: vzItCGVvSkiYCVeDKFFuqw==
X-CSE-MsgGUID: 5+WSbbJ/SrGp4e1BOVC/Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="80739136"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="80739136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 07:15:38 -0700
X-CSE-ConnectionGUID: H7w4YqEzQeGTzcEOgfgvsA==
X-CSE-MsgGUID: xlAD/kvQTNultQ3boncgVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="252468256"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2026 07:15:36 -0700
From: Arun T <arun.t@intel.com>
To: israel.a.cepeda.lopez@intel.com,
	hansg@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org
Cc: sakari.ailus@linux.intel.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arun.t@intel.com,
	miguel.vadillo@intel.com
Subject: [PATCH v2 1/2] gpio: usbio: Add ACPI device-id for NVL platforms
Date: Fri, 10 Apr 2026 19:38:58 +0530
Message-ID: <20260410140858.585609-2-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410140858.585609-1-arun.t@intel.com>
References: <20260410140858.585609-1-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device IDs of Nova Lake into gpio-usbio support list.

Signed-off-by: Arun T <arun.t@intel.com>
Reviewed-by: Vadillo Miguel <miguel.vadillo@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/gpio/gpio-usbio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
index 34d42c743d5b..489c8ac6299e 100644
--- a/drivers/gpio/gpio-usbio.c
+++ b/drivers/gpio/gpio-usbio.c
@@ -31,6 +31,7 @@ static const struct acpi_device_id usbio_gpio_acpi_hids[] = {
 	{ "INTC10B5" }, /* LNL */
 	{ "INTC10D1" }, /* MTL-CVF */
 	{ "INTC10E2" }, /* PTL */
+	{ "INTC1116" }, /* NVL */
 	{ }
 };
 
-- 
2.43.0

