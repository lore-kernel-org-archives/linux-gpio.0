Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5E33A0B05;
	Mon, 24 Aug 2026 07:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557605; cv=none; b=HIwCMEIkaMxSHLO/URaxHHmOyZGcD9woTuI/qsX8zDWvWPRcnEBNWu62EPWdYblU62DeC95l5lpIQRGc58C79j5x+1BcdHjJAQWPtPV+WanUh4FbkrW4D4+owEiBYAll8jg0OqkLgaUehqeImcbaz7oCVWs+DxD4NDY3obeJSLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557605; c=relaxed/simple;
	bh=SfYrQ2QKNXdOFKEip1SaXqsAWbFTT1Kd/H9i9iakMRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zk+O3Rg+GFfAHfA5ixlJJrzey6STZMdkYPrccKbRmCwzsbNyGX/698galV5inIQLReeUypX/6yUtzRu0D+MQkWekKV3L5sbPxP+U5e6YPMzy8dP068fs//8LJEsJYhlJk1w7TmU/qZ1I0hp80xs0EYSobXcUGuF69pBM1HWDOrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGeFRAJ7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGeFRAJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787557604; x=1819093604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SfYrQ2QKNXdOFKEip1SaXqsAWbFTT1Kd/H9i9iakMRg=;
  b=hGeFRAJ7+fEkB2sQh3t7/QwVwepfDmOuPrRRA10e7A5zIHqneSuzA8U3
   ucA7gQzV4F5dtKAQ4MdPvKlf13XsaolB7CQAYK3LjoCBeYq4hnRmDn8sX
   TQy4KNv7Q2fjAnRZz+6bPwPkwUkWJxS8LEq+OCcrblxgPIFmCe7N6U+nT
   sLfR2C4+jZGxtsZ/FJltSzqthQQtxjOorLd9POvgZF7NuBJCd0yYmajYH
   iNJIy9P1LAk9XLI8x4OIlqAI4SKYLqQDblqd4XW8EHzxEp6CxytJs5xtq
   oppGvLtPjXqO9ytbSxRnMdfeChTyVIIj5yKdf/8bh7Frwcr7tIY6FIe+S
   Q==;
X-CSE-ConnectionGUID: y5Oh+hSaTfKqCjBJ1IYcCA==
X-CSE-MsgGUID: mK3tGd1xSquukJ5r145AqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88203144"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88203144"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:44:31 -0700
X-CSE-ConnectionGUID: ElgUfOHJSCOAaDyh2ok0JA==
X-CSE-MsgGUID: 9f1Xj5qtT0uRzXnQIU+PVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="268887915"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 24 Aug 2026 00:44:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CE932A1; Mon, 24 Aug 2026 09:44:28 +0200 (CEST)
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
Subject: [PATCH v1 4/4] pinctrl: pistachio: Replace open coded fwnode_is_gpiochip()
Date: Mon, 24 Aug 2026 09:42:35 +0200
Message-ID: <20260824074427.3226457-5-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/pinctrl-pistachio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index cc5cd2a538c5..32463733f7d7 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1383,7 +1383,7 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
 			goto err;
 		}
 
-		if (!fwnode_property_present(child, "gpio-controller")) {
+		if (!fwnode_is_gpiochip(child)) {
 			fwnode_handle_put(child);
 			dev_err(pctl->dev,
 				"No gpio-controller property for bank %u\n", i);
-- 
2.50.1

