Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F5A2ED846;
	Fri, 20 Mar 2026 22:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774044355; cv=none; b=u9Mq/qYOWYcKSKXDoPrYeelw5Q6tMU9HKR8j3xFnzkghrf2pI8p4WCxKhmXV4nJzIyILcG4TR0FCjczALzQXauKamCEWSHUVi40Xh1MDyU6kWH/g7BwNTrFqDXK2BaoUIesk1Pmd+IDmVfj3fmKiOp6IPMNA0YTJAnuH00slQa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774044355; c=relaxed/simple;
	bh=dLPAwwpL2clkyv7PkUPbCRjKZi7OrJcWOoFZrYioqbk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=pmfTAijEvaI3aa6oUygU5LSAayphfgUARs5gv6FhRqUYKkFAV/xMD6QXAX3lIjV9xdVaVk2B+6Ns7vsTXpdBD+zr6pkkEy33J0LI9Y1ld4BACfgnBEE/rH+y1r9tSZD68HIV9AEcAUygro9aZBhKDona5+MSUNWALO1OGyeO0Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FrxIC+pL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrxIC+pL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774044354; x=1805580354;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dLPAwwpL2clkyv7PkUPbCRjKZi7OrJcWOoFZrYioqbk=;
  b=FrxIC+pLovHnJpcLdykdQf2deXBQyCgf5Xo7Tgr2qYrX2wDuCC0zi+Hr
   ZCJCpIJboQYEJNYgaoL2iafLkJsLIYZJr+kHIk99qVr+b46dyU8TPPk4d
   hVIogMYw6/tqJ1DbBB37ZZSKlJYWYENcqGRLuBqF23hQXuAfB/jaI2afx
   0tAdKt3kB/r11lQ0WwO8e3DxizQk2QjPAHBnJyx4C5xKA8T9VWgWNP6Hw
   LMBln5WCd+unphG3zXTBkl6BdpWjXCUfRgroUVeVOaG8ZwKpnylBbvqTG
   dy819QNG/yMzJUnpCo8vuW+Js/ce1S9x0zxMm3suJfJbiR9HJwnSc2Ctm
   Q==;
X-CSE-ConnectionGUID: SsNBE1KuQkmy2f3jUUKC5A==
X-CSE-MsgGUID: 6lS6veoJQ5yULiOkdFMsXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74841281"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="74841281"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 15:05:54 -0700
X-CSE-ConnectionGUID: IulTj5e/RN+YjkPWIRhZvw==
X-CSE-MsgGUID: vjzF89WOSo26JtBrWlVILA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="228347459"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 20 Mar 2026 15:05:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E355095; Fri, 20 Mar 2026 23:05:51 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] pinctrl: core: Drop unused include
Date: Fri, 20 Mar 2026 23:05:50 +0100
Message-ID: <20260320220550.3237142-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver includes the legacy header <linux/gpio.h> but does
not use any symbols from it. Drop the inclusion.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 254161d52da7..bec8ca8ec089 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -24,7 +24,6 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 
-#include <linux/gpio.h>
 #include <linux/gpio/driver.h>
 
 #include <linux/pinctrl/consumer.h>
-- 
2.50.1

