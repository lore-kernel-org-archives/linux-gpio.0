Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADF381732;
	Fri, 10 Apr 2026 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830536; cv=none; b=a/LIcuSsoRZPBbWTUyGzuYZ45p0ZhbZL0dCKZESmkOe3R5S6AAVDUjVTdj1JgEzCJRk4HEHwYcFBznJvGH+7K5VcoVJ8ItV1uGfdyam5t40DdcrSPF8DPUabFKIi3VWE6saI2dJZZkkvAzU1uGuNi1owFhxi6xPRwvpInXhU1p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830536; c=relaxed/simple;
	bh=sl+FzIBXVMlSZ/nJpC8urkN/gHCP6oH2evLkc1/HUSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kKHF3Kkd1FhJA0TANUsowCfPu5RsyEA9q2v2JEFdDSvGtxufRm46IrFxFGc0sgK5fyfcS7DMj9YBwsvTHGx5O5khwaAAwDGM6gDR0VziD0YD+NCzzTSo4wEQ1nDK8hnSO5XlF+hkEuZekOJXkAkbuUCL2DN3TdqR62WRrWIVloY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEMCBgs6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEMCBgs6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775830535; x=1807366535;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sl+FzIBXVMlSZ/nJpC8urkN/gHCP6oH2evLkc1/HUSY=;
  b=iEMCBgs648Jrr10qy08uhGRleBcgts+xPR4Xwxt5FgxVJ2UEw7YVROof
   zZRVwSN9HqnoQIpApnnilRpJJiVWFyN7bwkOHgKyP8WhGdRzem9Qt9lVN
   WHb1xQO5Y6DQeWRG0M6fNvZui/Uv+0y8x/eIwGYxw9GooUy1BiEAr7G1I
   KUbfT84TArxjnnfM5TqNcyL+pC1gt50+o5Ci7ZOiiKA1OD+hIwJEUoufB
   kGK8+73oi/QPfbXncgJJOV7IpYshFWN9nTMJWMEoRlL+NsKBQC5imUB42
   VPKkgYXcY16ojEjxz/9shrX8g21HcaShc1X1IPYV8A8dAueRvAgiZdE0c
   g==;
X-CSE-ConnectionGUID: LOI6bcoMS7ewwnuEAKXw5A==
X-CSE-MsgGUID: Eb8nciQ+RjqRX9LhN2V5wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="80739126"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="80739126"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 07:15:35 -0700
X-CSE-ConnectionGUID: JqsqtMEJTnSte6FCDoyhuw==
X-CSE-MsgGUID: x27BG8MrQYOwJ06ZlS+d6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="252468241"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2026 07:15:33 -0700
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
Subject: [PATCH v2 0/2] Add Nova Lake (NVL) ACPI device IDs to the usbio GPIO and I2C drivers.
Date: Fri, 10 Apr 2026 19:38:57 +0530
Message-ID: <20260410140858.585609-1-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series add NVL ACPI device ID to USBIO gpio and i2c drivers.

Changes in v2:
	- Updated commit message sentence end.
	- Added Reviewed-by tag from Sakari Ailus to patch 1/2

Suggested by Sakari:
	- Add sentences end in a period.
	- Add Reviewed-by tag. 

Arun T (2):
  gpio: usbio: Add ACPI device-id for NVL platforms
  i2c: usbio: Add ACPI device-id for NVL platforms

 drivers/gpio/gpio-usbio.c      | 1 +
 drivers/i2c/busses/i2c-usbio.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0

