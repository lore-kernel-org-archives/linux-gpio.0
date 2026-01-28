Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9592C21FE;
	Wed, 28 Jan 2026 12:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769604829; cv=none; b=ZP3Tjx08s6ZhXzEmUgGt1NbvFlc4VWAxavkD3DBbJ+oMr9/EkS00gehJK/8qfA7cBPc8c3tuyzQw9Ezd07yDuFMWx8ds5y9JSioImyVsFCk0Lw5ZCFV9ATd+fsGskTkAY7Jfobe3f7d/BadUrUOOi7goSjzhY/OImZVQ322Xvys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769604829; c=relaxed/simple;
	bh=w/jGj3bLdk0pdFiWDlTtqpjGUhmiDKF+LmArVJiI0No=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YHuswQ+Ef0rJIA3/pymYoJvG8zZOR/dFRgP35RnRSpFu+AjT8Y8eEGtchZM0HzqQ+PNNdCssh16+/xFpBQGhkbU/JfMwFGdAqYwu2MD86Vs0d3OoW7xxtftTJsdT4J/IGNPOH7+0QrfJ25HrV0cyxuvnnxsVqlEDBoyQeyQLAd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWYJXH0Q; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWYJXH0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769604828; x=1801140828;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w/jGj3bLdk0pdFiWDlTtqpjGUhmiDKF+LmArVJiI0No=;
  b=XWYJXH0QN+2n5dOXRYINk+TOCcArvBsvZLCh9vJwza36vQwvdDeKPE3M
   L+LkTJahWM1nFi8pwFXe+dXkUREdOlEjCMQRdkORt/r1Nw4flqrY1WNN4
   c3cRrBYB9smJ77kW5sMOB0C/6KmEKd+kKe9bvT2mbhumDAixro33nk+ic
   vpWGaDTLxz/pCW4GMJiV7sSP/JqxLcVGH2SgbLk9S9Eui+ZYrfP2ZXU5z
   xMzXhX78BoFXRmNS8Wg2Aec2oLZW6pIPDqcqneienM4UpYKy42wp/HMop
   YLJGi3RQ1TNp4Y2oZE5HH/gh2+X2KU3wLzRTprf4v3ArqE1rGODwdV0HS
   g==;
X-CSE-ConnectionGUID: 4Ded2ooYQUOvaWdet8k0ZA==
X-CSE-MsgGUID: Jj/l4eP8Q2CrnV2L5Yj+3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88388338"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="88388338"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:53:47 -0800
X-CSE-ConnectionGUID: k6IF4JPYRB6W8iJfYaHfZA==
X-CSE-MsgGUID: rkVvmKXxScuWLsb/7LI3Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="212358360"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 28 Jan 2026 04:53:45 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1FB4B98; Wed, 28 Jan 2026 13:53:44 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 1/1] pinctrl: cherryview: Remove duplicate error messages
Date: Wed, 28 Jan 2026 13:53:43 +0100
Message-ID: <20260128125343.52497-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pin control core is covered to report any error via message.
Since that it's not needed in the callers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index d72e50486370..dd0b24343968 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1648,7 +1648,7 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 
 	pctrl->pctldev = devm_pinctrl_register(dev, &pctrl->pctldesc, pctrl);
 	if (IS_ERR(pctrl->pctldev))
-		return dev_err_probe(dev, PTR_ERR(pctrl->pctldev), "failed to register pinctrl\n");
+		return PTR_ERR(pctrl->pctldev);
 
 	ret = chv_gpio_probe(pctrl, irq);
 	if (ret)
-- 
2.50.1

