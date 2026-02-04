Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172781850A4;
	Wed,  4 Feb 2026 08:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770192089; cv=none; b=S6OoosZAKt7+QMD2uPehw2AQfRiUxcP0eDbWiMWY6PlPgZpxGU2Qtq11xExix3hTWW8cAblkl9uAePp93OzaWjLK55oMLWUAr2pCyGrratnemmyMZmg7plyStg3aCg36okaPxpufhDR1rWVr+MUAa//HXdC8gOdLRTEwSlucDIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770192089; c=relaxed/simple;
	bh=ljqFc/vsQxKFWzPVU6CMvdf8lGUro3oaLU9HdS6rWSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kvut3j4KKhhmpP7Gqc7Yg1VWobqPA/+19tMH7Rf2wF6HJpWOquMs4IH1r7FYM23D8dg9s14fmH2AZvGo6YmGPj+QgiefxqJtXs9cZKMPrWS9+vc8iQqwxMyf+owuXp6IPHP7knOUZGarT0QMOH6oHc55QaSojmJDK87IuDNtr6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZ2QCJoQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZ2QCJoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770192089; x=1801728089;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ljqFc/vsQxKFWzPVU6CMvdf8lGUro3oaLU9HdS6rWSg=;
  b=MZ2QCJoQituCATMv133Jls/YF0Fk3+eWQ273JnaA2DKPr+6jsQTWgOK9
   3bAPn/q/X2CihdZksKoVCopTvOK+KZu8+xnm/FH5CApVUGbMGiXANPymy
   78byqmt9ofK7AvEqrZmxvjLh4Tm3bIK3MAt9kU79lMnmr2HrD6IPOFq2I
   WtukDgJNkpSxNfX1kLbVpV8Mdl5LKLbJhJaIVdmLFetxNo4EcEIAREosO
   kO6i/P2WYEpqch7/3tFS3QP4EDa82Nfh6BCat04UYTKmTfKTMiZfJ5Hy4
   MZuPOrUVRtRqN3k2KuKguqjCQe0JZl+cjVe6S5zYNpuVBjNRnb6KRlzmx
   w==;
X-CSE-ConnectionGUID: 1HY28FjcTsOWPm/IhXdIhg==
X-CSE-MsgGUID: O+U4SO14QQ2g4JH48xa+4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82005377"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="82005377"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:01:28 -0800
X-CSE-ConnectionGUID: 3biRYGzXTjSPY5Ziy+UXfw==
X-CSE-MsgGUID: MOd0m0U4SBqxOfo8q3psMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209383984"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 04 Feb 2026 00:01:26 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 91EA795; Wed, 04 Feb 2026 09:01:25 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 1/1] pinctrl: intel: Align Copyright note with corporate guidelines
Date: Wed,  4 Feb 2026 09:01:22 +0100
Message-ID: <20260204080122.2300224-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Copyright note must follow the

	Copyright (C) <year(s)> Intel Corporation

template, where (C) is always capitalised and <year(s)> either
a single year or a range. Update the Intel pin control drivers
to follow.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-alderlake.c      | 2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c       | 2 +-
 drivers/pinctrl/intel/pinctrl-broxton.c        | 2 +-
 drivers/pinctrl/intel/pinctrl-cannonlake.c     | 2 +-
 drivers/pinctrl/intel/pinctrl-cedarfork.c      | 2 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c     | 2 +-
 drivers/pinctrl/intel/pinctrl-denverton.c      | 2 +-
 drivers/pinctrl/intel/pinctrl-elkhartlake.c    | 2 +-
 drivers/pinctrl/intel/pinctrl-emmitsburg.c     | 2 +-
 drivers/pinctrl/intel/pinctrl-icelake.c        | 2 +-
 drivers/pinctrl/intel/pinctrl-intel-platform.c | 2 +-
 drivers/pinctrl/intel/pinctrl-intel.c          | 2 +-
 drivers/pinctrl/intel/pinctrl-intel.h          | 2 +-
 drivers/pinctrl/intel/pinctrl-jasperlake.c     | 2 +-
 drivers/pinctrl/intel/pinctrl-lakefield.c      | 2 +-
 drivers/pinctrl/intel/pinctrl-lewisburg.c      | 2 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c      | 2 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c     | 2 +-
 drivers/pinctrl/intel/pinctrl-meteorlake.c     | 2 +-
 drivers/pinctrl/intel/pinctrl-meteorpoint.c    | 2 +-
 drivers/pinctrl/intel/pinctrl-moorefield.c     | 2 +-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c   | 2 +-
 drivers/pinctrl/intel/pinctrl-tangier.c        | 2 +-
 drivers/pinctrl/intel/pinctrl-tangier.h        | 2 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c      | 2 +-
 25 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-alderlake.c b/drivers/pinctrl/intel/pinctrl-alderlake.c
index 7bf1d5c285a0..dcb541976f2f 100644
--- a/drivers/pinctrl/intel/pinctrl-alderlake.c
+++ b/drivers/pinctrl/intel/pinctrl-alderlake.c
@@ -2,7 +2,7 @@
 /*
  * Intel Alder Lake PCH pinctrl/GPIO driver
  *
- * Copyright (C) 2020, 2022 Intel Corporation
+ * Copyright (C) 2020-2022 Intel Corporation
  * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index aec2f31eba7d..b733ec31ad9d 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -2,7 +2,7 @@
 /*
  * Pinctrl GPIO driver for Intel Baytrail
  *
- * Copyright (c) 2012-2013, Intel Corporation
+ * Copyright (C) 2012-2013 Intel Corporation
  * Author: Mathias Nyman <mathias.nyman@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c b/drivers/pinctrl/intel/pinctrl-broxton.c
index 140b29956340..3d3c1706928a 100644
--- a/drivers/pinctrl/intel/pinctrl-broxton.c
+++ b/drivers/pinctrl/intel/pinctrl-broxton.c
@@ -2,7 +2,7 @@
 /*
  * Intel Broxton SoC pinctrl/GPIO driver
  *
- * Copyright (C) 2015, 2016 Intel Corporation
+ * Copyright (C) 2015-2016 Intel Corporation
  * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-cannonlake.c b/drivers/pinctrl/intel/pinctrl-cannonlake.c
index a3ffd19fd5be..baa7c9a62ff9 100644
--- a/drivers/pinctrl/intel/pinctrl-cannonlake.c
+++ b/drivers/pinctrl/intel/pinctrl-cannonlake.c
@@ -2,7 +2,7 @@
 /*
  * Intel Cannon Lake PCH pinctrl/GPIO driver
  *
- * Copyright (C) 2017, Intel Corporation
+ * Copyright (C) 2017 Intel Corporation
  * Authors: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  *          Mika Westerberg <mika.westerberg@linux.intel.com>
  */
diff --git a/drivers/pinctrl/intel/pinctrl-cedarfork.c b/drivers/pinctrl/intel/pinctrl-cedarfork.c
index 2916f7d90090..578e1ee57acf 100644
--- a/drivers/pinctrl/intel/pinctrl-cedarfork.c
+++ b/drivers/pinctrl/intel/pinctrl-cedarfork.c
@@ -2,7 +2,7 @@
 /*
  * Intel Cedar Fork PCH pinctrl/GPIO driver
  *
- * Copyright (C) 2017, Intel Corporation
+ * Copyright (C) 2017 Intel Corporation
  * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index dd0b24343968..0309c9fcd6d4 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -2,7 +2,7 @@
 /*
  * Cherryview/Braswell pinctrl driver
  *
- * Copyright (C) 2014, 2020 Intel Corporation
+ * Copyright (C) 2014-2020 Intel Corporation
  * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
  *
  * This driver is based on the original Cherryview GPIO driver by
diff --git a/drivers/pinctrl/intel/pinctrl-denverton.c b/drivers/pinctrl/intel/pinctrl-denverton.c
index f492f73ba246..4a1d346fb30c 100644
--- a/drivers/pinctrl/intel/pinctrl-denverton.c
+++ b/drivers/pinctrl/intel/pinctrl-denverton.c
@@ -2,7 +2,7 @@
 /*
  * Intel Denverton SoC pinctrl/GPIO driver
  *
- * Copyright (C) 2017, Intel Corporation
+ * Copyright (C) 2017 Intel Corporation
  * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-elkhartlake.c b/drivers/pinctrl/intel/pinctrl-elkhartlake.c
index 0e8742f31cd4..8a24ef12141d 100644
--- a/drivers/pinctrl/intel/pinctrl-elkhartlake.c
+++ b/drivers/pinctrl/intel/pinctrl-elkhartlake.c
@@ -2,7 +2,7 @@
 /*
  * Intel Elkhart Lake PCH pinctrl/GPIO driver
  *
- * Copyright (C) 2019, Intel Corporation
+ * Copyright (C) 2019 Intel Corporation
  * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-emmitsburg.c b/drivers/pinctrl/intel/pinctrl-emmitsburg.c
index ba06a9ec239a..3b63b6dd2560 100644
--- a/drivers/pinctrl/intel/pinctrl-emmitsburg.c
+++ b/drivers/pinctrl/intel/pinctrl-emmitsburg.c
@@ -2,7 +2,7 @@
 /*
  * Intel Emmitsburg PCH pinctrl/GPIO driver
  *
- * Copyright (C) 2020, Intel Corporation
+ * Copyright (C) 2020 Intel Corporation
  * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-icelake.c b/drivers/pinctrl/intel/pinctrl-icelake.c
index 1516fe7b4e4a..daabc5288cbb 100644
--- a/drivers/pinctrl/intel/pinctrl-icelake.c
+++ b/drivers/pinctrl/intel/pinctrl-icelake.c
@@ -2,7 +2,7 @@
 /*
  * Intel Ice Lake PCH pinctrl/GPIO driver
  *
- * Copyright (C) 2018, 2022 Intel Corporation
+ * Copyright (C) 2018-2022 Intel Corporation
  * Authors: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  *	    Mika Westerberg <mika.westerberg@linux.intel.com>
  */
diff --git a/drivers/pinctrl/intel/pinctrl-intel-platform.c b/drivers/pinctrl/intel/pinctrl-intel-platform.c
index dd5dbede0f59..61dd579e3f97 100644
--- a/drivers/pinctrl/intel/pinctrl-intel-platform.c
+++ b/drivers/pinctrl/intel/pinctrl-intel-platform.c
@@ -2,7 +2,7 @@
 /*
  * Intel PCH pinctrl/GPIO driver
  *
- * Copyright (C) 2021-2023, Intel Corporation
+ * Copyright (C) 2021-2023 Intel Corporation
  * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 22b60ba3198e..f7007f9c9dc4 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -2,7 +2,7 @@
 /*
  * Intel pinctrl/GPIO core driver.
  *
- * Copyright (C) 2015, Intel Corporation
+ * Copyright (C) 2015 Intel Corporation
  * Authors: Mathias Nyman <mathias.nyman@linux.intel.com>
  *          Mika Westerberg <mika.westerberg@linux.intel.com>
  */
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index c1520797f895..2f37109d5860 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -2,7 +2,7 @@
 /*
  * Core pinctrl/GPIO driver for Intel GPIO controllers
  *
- * Copyright (C) 2015, Intel Corporation
+ * Copyright (C) 2015 Intel Corporation
  * Authors: Mathias Nyman <mathias.nyman@linux.intel.com>
  *          Mika Westerberg <mika.westerberg@linux.intel.com>
  */
diff --git a/drivers/pinctrl/intel/pinctrl-jasperlake.c b/drivers/pinctrl/intel/pinctrl-jasperlake.c
index c6e1836c69a7..a8f65c3dbb1c 100644
--- a/drivers/pinctrl/intel/pinctrl-jasperlake.c
+++ b/drivers/pinctrl/intel/pinctrl-jasperlake.c
@@ -2,7 +2,7 @@
 /*
  * Intel Jasper Lake PCH pinctrl/GPIO driver
  *
- * Copyright (C) 2020, Intel Corporation
+ * Copyright (C) 2020 Intel Corporation
  * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-lakefield.c b/drivers/pinctrl/intel/pinctrl-lakefield.c
index bfb8b565d15c..39872c352ac2 100644
--- a/drivers/pinctrl/intel/pinctrl-lakefield.c
+++ b/drivers/pinctrl/intel/pinctrl-lakefield.c
@@ -2,7 +2,7 @@
 /*
  * Intel Lakefield PCH pinctrl/GPIO driver
  *
- * Copyright (C) 2020, Intel Corporation
+ * Copyright (C) 2020 Intel Corporation
  * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-lewisburg.c b/drivers/pinctrl/intel/pinctrl-lewisburg.c
index 9fe651370f32..ebbc94047b6f 100644
--- a/drivers/pinctrl/intel/pinctrl-lewisburg.c
+++ b/drivers/pinctrl/intel/pinctrl-lewisburg.c
@@ -2,7 +2,7 @@
 /*
  * Intel Lewisburg pinctrl/GPIO driver
  *
- * Copyright (C) 2017, Intel Corporation
+ * Copyright (C) 2017 Intel Corporation
  * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index c80ddb5125b4..299ee4f22bdc 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -2,7 +2,7 @@
 /*
  * Intel Lynxpoint PCH pinctrl/GPIO driver
  *
- * Copyright (c) 2012, 2019, Intel Corporation
+ * Copyright (C) 2012-2019 Intel Corporation
  * Authors: Mathias Nyman <mathias.nyman@linux.intel.com>
  *          Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  */
diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
index 2f4d73dda41d..83b4d1862545 100644
--- a/drivers/pinctrl/intel/pinctrl-merrifield.c
+++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
@@ -2,7 +2,7 @@
 /*
  * Intel Merrifield SoC pinctrl driver
  *
- * Copyright (C) 2016, Intel Corporation
+ * Copyright (C) 2016 Intel Corporation
  * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-meteorlake.c b/drivers/pinctrl/intel/pinctrl-meteorlake.c
index b7395947569a..3f5070a339bf 100644
--- a/drivers/pinctrl/intel/pinctrl-meteorlake.c
+++ b/drivers/pinctrl/intel/pinctrl-meteorlake.c
@@ -2,7 +2,7 @@
 /*
  * Intel Meteor Lake PCH pinctrl/GPIO driver
  *
- * Copyright (C) 2022, Intel Corporation
+ * Copyright (C) 2022 Intel Corporation
  * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-meteorpoint.c b/drivers/pinctrl/intel/pinctrl-meteorpoint.c
index b7858c2b2c5c..bff7be1f137d 100644
--- a/drivers/pinctrl/intel/pinctrl-meteorpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-meteorpoint.c
@@ -2,7 +2,7 @@
 /*
  * Intel Meteor Point PCH pinctrl/GPIO driver
  *
- * Copyright (C) 2022-2023, Intel Corporation
+ * Copyright (C) 2022-2023 Intel Corporation
  * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-moorefield.c b/drivers/pinctrl/intel/pinctrl-moorefield.c
index 6a79207e6b2a..30f9a4481827 100644
--- a/drivers/pinctrl/intel/pinctrl-moorefield.c
+++ b/drivers/pinctrl/intel/pinctrl-moorefield.c
@@ -2,7 +2,7 @@
 /*
  * Intel Moorefield SoC pinctrl driver
  *
- * Copyright (C) 2022, Intel Corporation
+ * Copyright (C) 2022 Intel Corporation
  * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  */
 
diff --git a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
index b51befde9e8b..308651091d9c 100644
--- a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
+++ b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
@@ -2,7 +2,7 @@
 /*
  * Intel Sunrisepoint PCH pinctrl/GPIO driver
  *
- * Copyright (C) 2015, Intel Corporation
+ * Copyright (C) 2015 Intel Corporation
  * Authors: Mathias Nyman <mathias.nyman@linux.intel.com>
  *          Mika Westerberg <mika.westerberg@linux.intel.com>
  */
diff --git a/drivers/pinctrl/intel/pinctrl-tangier.c b/drivers/pinctrl/intel/pinctrl-tangier.c
index e1af1ddfc951..5fc13d369dd8 100644
--- a/drivers/pinctrl/intel/pinctrl-tangier.c
+++ b/drivers/pinctrl/intel/pinctrl-tangier.c
@@ -2,7 +2,7 @@
 /*
  * Intel Tangier pinctrl driver
  *
- * Copyright (C) 2016, 2023 Intel Corporation
+ * Copyright (C) 2016-2023 Intel Corporation
  *
  * Authors: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  *          Raag Jadav <raag.jadav@intel.com>
diff --git a/drivers/pinctrl/intel/pinctrl-tangier.h b/drivers/pinctrl/intel/pinctrl-tangier.h
index 955cc967c0bc..6af8eeeae943 100644
--- a/drivers/pinctrl/intel/pinctrl-tangier.h
+++ b/drivers/pinctrl/intel/pinctrl-tangier.h
@@ -2,7 +2,7 @@
 /*
  * Intel Tangier pinctrl functions
  *
- * Copyright (C) 2016, 2023 Intel Corporation
+ * Copyright (C) 2016-2023 Intel Corporation
  *
  * Authors: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  *          Raag Jadav <raag.jadav@intel.com>
diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index c0887596d113..ae231f7fba49 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -2,7 +2,7 @@
 /*
  * Intel Tiger Lake PCH pinctrl/GPIO driver
  *
- * Copyright (C) 2019 - 2020, Intel Corporation
+ * Copyright (C) 2019-2020 Intel Corporation
  * Authors: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  *          Mika Westerberg <mika.westerberg@linux.intel.com>
  */
-- 
2.50.1

