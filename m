Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B0B41D4F1;
	Wed, 15 Jul 2026 18:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141486; cv=none; b=qakyRm9iw3FiEPf2ajVEMosZZtX/TwtVvBbFmet74Qec2reFHmFGIMjI199XhlG95mNolyXKbY6ByfokB7Z/WoiKEgRK5HdyeaFEjqtQ6Siwb4C58boiGhtTcgmeta/JyrSTRSDIo/7zGLNLdrBZssoaGEr59G0XqXOrF0ub61k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141486; c=relaxed/simple;
	bh=FDPjXoCgRJnJSh11Yjsc76ru2V/iRZPQNxJkLKiuzdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNOXLdZKDXbAPV6/7CjmyJ9Sx8R9lBu2deDU1HHgTihewazJbghMj0JC5QgkGLTmd5BNTTNJHLcSxY2t8ByZa34Ajm4F4QT0nidqXQI2a1PmQO8MCIlzEv5vrwMtP6C2kUyTcSLSSolX6xW4wOBOVc/3Dc5ujUG/j275328Paro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdhOBcNd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdhOBcNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141483; x=1815677483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FDPjXoCgRJnJSh11Yjsc76ru2V/iRZPQNxJkLKiuzdo=;
  b=CdhOBcNdHhk0wRuECIJqo3s7qcMnCZc3F5VVvm+376mstOLNtRtS0z3m
   4LxkNCbPCcomnN1VkAV7Qune6EMgZkgHbSdrIUUZMTrIq2cvwi5yBtDEA
   89Xw8A7moJpT6kaBNONFf1N6hZLRmtiLr9KcDaMaxzqtKaIJH04wr1RRr
   e5Plo6nVKobhHVGJMZ+/JcgO3tjnSKdB02heOFxUFrQk8V6zgmrrqNZ7F
   8sVhX/P/G6evpZdIjXgulHJrpA7L+F+jbC6nbNlZZsAJ5J9R/jONb0ED2
   z7+xBugf51jCFQxETAb/5i6LwQnrrGFgs2K2lodKDc05wBNX1YqB/zYel
   Q==;
X-CSE-ConnectionGUID: cVWdOy7QRNiByj6Df3KDcw==
X-CSE-MsgGUID: aoOVFOIGTACQ11vHxIiVPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84887477"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84887477"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:21 -0700
X-CSE-ConnectionGUID: c0ePlU7xTLe50ZfQ5a0cZA==
X-CSE-MsgGUID: 2XWh0XIhRhen6eEpbG1r2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="280700291"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2026 11:51:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 039AE9D; Wed, 15 Jul 2026 20:51:16 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bradford Love <brad@nextdimension.cc>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 4/7] MIPS: BCM47XX: Open code gpio_request_one()
Date: Wed, 15 Jul 2026 20:46:44 +0200
Message-ID: <20260715185112.1323510-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Open code the gpio_request_one() call to be able to kill that API
in the follow changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/mips/bcm47xx/workarounds.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/bcm47xx/workarounds.c b/arch/mips/bcm47xx/workarounds.c
index 745c6228eb2c..9148d2c219d1 100644
--- a/arch/mips/bcm47xx/workarounds.c
+++ b/arch/mips/bcm47xx/workarounds.c
@@ -9,11 +9,13 @@ static void __init bcm47xx_workarounds_enable_usb_power(int usb_power)
 {
 	int err;
 
-	err = gpio_request_one(usb_power, GPIOF_OUT_INIT_HIGH, "usb_power");
-	if (err)
+	err = gpio_request(usb_power, "usb_power");
+	if (err) {
 		pr_err("Failed to request USB power gpio: %d\n", err);
-	else
+	} else {
+		gpio_direction_output(usb_power, 1);
 		gpio_free(usb_power);
+	}
 }
 
 void __init bcm47xx_workarounds(void)
-- 
2.50.1

