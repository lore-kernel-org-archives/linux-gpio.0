Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3ED39769A;
	Mon, 24 Aug 2026 07:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557604; cv=none; b=guF25Ixc7VvCNIXg1kFW7hKyMJ7Nr8ildZEBOkT6YoNzxZ7pLRjXfcDDwK9LeXLLZGbNess7FtNBo0BE8QK+ckamyFc37U+Q8DwmdfF06A//fISAJzXOFz4LFmFyXc13QjEESaMwDKS/6gAVItq1VxvMtNTL3VTVpFpW0hXeDQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557604; c=relaxed/simple;
	bh=shENYTa2oPiiOJhdZNkTjFnK33jhWrhsujx4yV3HpSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BhwSj6f9tVCteYOvRwn1btdfFuwHLkcZO0OpvDSr9BVfr3Ej6ex8mvl2Ee6IAmAgyaQIe972B/TtJrkHr4zsrcDvNMc6aA24V55F2N9/f+dSodw5ve+UJs3xBYG9zmftSHmIsfVvUMrWd57t69oivAAZ4ee8DJJrvZdHcZQieME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFZzEWJV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFZzEWJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787557602; x=1819093602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=shENYTa2oPiiOJhdZNkTjFnK33jhWrhsujx4yV3HpSE=;
  b=BFZzEWJVjiZHH4iqtQ18wRTyOtIJF0CFy8xHZuDIWltxD9cJUOmeSZCo
   MLNnzRqFboyKcrFPONKA4QliKnLr2hP+qqlQ9QMk9qzkDfBTwYf6VBMjl
   l1IxR9svpIO3rBrVBpVc8t12nGIzffhzMj9M6egkgzf8qYqf1RwukDjIW
   f6+RKvT5KM7DNimDiONBD7Jv3s3+ffc5aF+tFCK68S4DmFcGD2SNBOa/H
   hWVFtWm/IeLgADn2069PA4m//i22qUQXBszVsgMnfxtUF7/Ve/Po/gIwy
   5rMpumGYLcRpQf3hsG1lCqtKMOmgCpVaxpjyG6Yw8rrnwpJ+7huPFGlPk
   w==;
X-CSE-ConnectionGUID: MK2L0NWQQEybept55W1kUA==
X-CSE-MsgGUID: GBgy4R1ZSPKDplQ8ToZX0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88203138"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88203138"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:44:31 -0700
X-CSE-ConnectionGUID: XUSh7ZStQ3y/GQjWBqS0dA==
X-CSE-MsgGUID: JLOlDW5jTxukvivMpH9cMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="268887918"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 24 Aug 2026 00:44:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C55ED9D; Mon, 24 Aug 2026 09:44:28 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>
Subject: [PATCH v1 2/4] gpio: shared: Replace open coded fwnode_is_gpiochip()
Date: Mon, 24 Aug 2026 09:42:33 +0200
Message-ID: <20260824074427.3226457-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
References: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since GPIOLIB provides a helper, no need to open code it, hence
replace that piece by fwnode_is_gpiochip().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-shared.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 495bd3d0ddf0..be90926dffcc 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -203,9 +203,8 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 			if (ret)
 				continue;
 
-			np = args.np;
-
-			if (!of_property_present(np, "gpio-controller"))
+			fwnode = of_fwnode_handle(args.np);
+			if (!fwnode_is_gpiochip(fwnode))
 				continue;
 
 			/*
@@ -222,7 +221,6 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 			if (args.args_count != 2)
 				continue;
 
-			fwnode = of_fwnode_handle(args.np);
 			offset = args.args[0];
 
 			entry = gpio_shared_find_entry(fwnode, offset);
-- 
2.50.1

