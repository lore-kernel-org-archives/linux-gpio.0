Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291E03A168B;
	Fri, 10 Apr 2026 08:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808549; cv=none; b=cPx7D/OjiFjaH+LK02x5gZ37vEU2Lu7mDSVeYsShGx0BJ0vkhnCuF7oT9y85R16pUN/igR47Kur+ghQW97NtcKMvojbEOhHGImsI3Mtdyfdp9AR2MCAotRF4bgH28Mb72LgkRzTvuBX9P0ItKhPB9fEuxB5U8fsXIFtUX5LqkSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808549; c=relaxed/simple;
	bh=87Gau6glmZ4eEpeLVn1vpFOgZhxwkbTqe6rJ7nV/xms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k7GKPE6wR67xIQIbRWkKrixmctCZTvBaQZvFY0XbNQIenMHSQHAGfG8BvX7PJH1lo5Q5YpMXKFC+YRjuHBUCaAPEA0rFqMRpQ76VXo1HcMokQ/zxRTA+x8pTN+ALr8gelwkDeRpXIWUbzQDB49U0ZaA3UqXjL8eGOb/dNUh5dZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SS6kuWNR; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SS6kuWNR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775808547; x=1807344547;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=87Gau6glmZ4eEpeLVn1vpFOgZhxwkbTqe6rJ7nV/xms=;
  b=SS6kuWNRx/JBVS1LuX6kbzxLZI5K5mWwbcPPVEWMdVVw+ytkdjnILqrZ
   DhJonzONgck30cC0yGbEbg1BFIWyvtUrMp6yeqPgJKpBMJGEE8TpcIcsV
   fMJNQ1J9yGV40sRIcrQICeuErw38hWh5OaTi/pKfkDOvQWZ/sgELmECtz
   cL/gN+Mbjri6eqB/qN3Sx5x5LHVRWh4UoILu7i1EJ1TnZPyHI4mBzLYy7
   RFaY+7Y/h/hDrpJxIRUoRHizm/Ffuji7nfdedjLtXQt0TZUbjfz3U6Pk3
   5P9JkSPmPd48leY6k7ARBrlfFp6kDvVpWGaoE/trXm9/TuN7aap+zpYGx
   g==;
X-CSE-ConnectionGUID: A4aLONxHTVqqXON9G2XFRA==
X-CSE-MsgGUID: iL9EbS9bRBq4SjVB34uLzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="77009847"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="77009847"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 01:09:07 -0700
X-CSE-ConnectionGUID: rSr4J2XhQNu5aGKc1LCrMA==
X-CSE-MsgGUID: mSYUo0JXTGOWMNLzju1yyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="228946159"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa008.jf.intel.com with ESMTP; 10 Apr 2026 01:09:04 -0700
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
Subject: [PATCH 1/2] gpio: usbio: Add ACPI device-id for NVL platforms
Date: Fri, 10 Apr 2026 13:32:29 +0530
Message-ID: <20260410080229.562160-1-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device IDs of Nova Lake into gpio-usbio support list

Signed-off-by: Arun T <arun.t@intel.com>
Reviewed-by: Vadillo Miguel <miguel.vadillo@intel.com>
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

