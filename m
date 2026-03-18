Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818F53E6DEF;
	Wed, 18 Mar 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846788; cv=none; b=FjjArnK+OalU3OUYbQ8xezMT3LgyMuKapCWuD0zVol1MJFAhuDFBVliO2vNE11EjkAY/vWILcUnYviOxTWswdDAe1X3pCoD0HrybvW7he5HEujyfx3KfN/OCO4+kaoWCKL60JhWvar9RR59VD/hvhXpFSZ2m77sIjWifSymeKnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846788; c=relaxed/simple;
	bh=A2HPRLU22tLaQPROKcuT+EewNl+vqKrAxH13T8m/A6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P88hgtCywn0VOCq7VEecx/+XpVw9JCpr1nDrwNnU1AH5Co+cGOB92Z1yqcvr6Gd2EgCUo+qA4CvKIOm1RDe9UnPQtv2HD5mno+lxrw2prSblRZNruStAol7S+u6pbFPEC1pgTb4z2LcIuagRp6kdYetKWzog9sLSfGLVv306aVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+2bQMXz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+2bQMXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773846786; x=1805382786;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A2HPRLU22tLaQPROKcuT+EewNl+vqKrAxH13T8m/A6Q=;
  b=Q+2bQMXzPez1zWI6Dm7gpWa6y6n8pO+8W+M2V9VUD4jM7Um9Fkt6CJN3
   RPxCPi2cahZv2bcwefcd5j2Fdguud9Lr3iEHUjW9/kDAp7GdnyfiE0I2I
   YCpyAEdk4/dP+cBIAE9xUAFz7BuWMXEX3sZ52uf3MQ6lxOOCsH1o086TN
   ASt8zYdGjjRCGCE7hg9KkWz+3VdlIYao0UFrl7XnXMHefuj4T8gb4L/4R
   9AHVEiA4kuMp0Bg7WT61owUMmDnsmz1WF0p9gcjIr+5VoOTejHiO33tsA
   x83FvoryVB3JNS1zqn3eW4YDxhZ5mm9qoYU05/ItcZs2iOK7IG8KIol86
   w==;
X-CSE-ConnectionGUID: CZbIpzhXS3WdAJonZcsLmQ==
X-CSE-MsgGUID: rQsnxEUXRJ6M++3H8upC9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75084544"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="75084544"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 08:13:02 -0700
X-CSE-ConnectionGUID: 2j/rT7HTTxKkpDDexNPmqQ==
X-CSE-MsgGUID: K0fmXP2uSQqVvqzpQrwwpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="247122454"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2026 08:12:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 10A2C9B; Wed, 18 Mar 2026 16:12:58 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 1/5] pinctrl: intel: Improve capability support
Date: Wed, 18 Mar 2026 16:10:15 +0100
Message-ID: <20260318151256.2590375-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The register space of a certain capability starts at the offset just after
the respective node in the capability list. It means that there are no fixed
offsets for them from SoC to SoC generation and they have to be calculated
at run-time. Improve capability support by adding the respective calculation
algorithm and in the result enable PWM on more platforms that currently may
use the wrong register.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 9d32bb8bc13a..adaa37a42754 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -53,8 +53,6 @@
 #define PADOWN_MASK(p)			(GENMASK(3, 0) << PADOWN_SHIFT(p))
 #define PADOWN_GPP(p)			((p) / 8)
 
-#define PWMC				0x204
-
 /* Offset from pad_regs */
 #define PADCFG0				0x000
 #define PADCFG0_RXEVCFG_MASK		GENMASK(26, 25)
@@ -1549,8 +1547,10 @@ static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
 }
 
 static int intel_pinctrl_probe_pwm(struct intel_pinctrl *pctrl,
-				   struct intel_community *community)
+				   struct intel_community *community,
+				   unsigned short capability_offset)
 {
+	void __iomem *base = community->regs + capability_offset + 4;
 	static const struct pwm_lpss_boardinfo info = {
 		.clk_rate = 19200000,
 		.npwm = 1,
@@ -1564,7 +1564,7 @@ static int intel_pinctrl_probe_pwm(struct intel_pinctrl *pctrl,
 	if (!IS_REACHABLE(CONFIG_PWM_LPSS))
 		return 0;
 
-	chip = devm_pwm_lpss_probe(pctrl->dev, community->regs + PWMC, &info);
+	chip = devm_pwm_lpss_probe(pctrl->dev, base, &info);
 	return PTR_ERR_OR_ZERO(chip);
 }
 
@@ -1595,6 +1595,7 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 
 	for (i = 0; i < pctrl->ncommunities; i++) {
 		struct intel_community *community = &pctrl->communities[i];
+		unsigned short capability_offset[6];
 		void __iomem *regs;
 		u32 offset;
 		u32 value;
@@ -1622,15 +1623,19 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 			switch ((value & CAPLIST_ID_MASK) >> CAPLIST_ID_SHIFT) {
 			case CAPLIST_ID_GPIO_HW_INFO:
 				community->features |= PINCTRL_FEATURE_GPIO_HW_INFO;
+				capability_offset[CAPLIST_ID_GPIO_HW_INFO] = offset;
 				break;
 			case CAPLIST_ID_PWM:
 				community->features |= PINCTRL_FEATURE_PWM;
+				capability_offset[CAPLIST_ID_PWM] = offset;
 				break;
 			case CAPLIST_ID_BLINK:
 				community->features |= PINCTRL_FEATURE_BLINK;
+				capability_offset[CAPLIST_ID_BLINK] = offset;
 				break;
 			case CAPLIST_ID_EXP:
 				community->features |= PINCTRL_FEATURE_EXP;
+				capability_offset[CAPLIST_ID_EXP] = offset;
 				break;
 			default:
 				break;
@@ -1653,7 +1658,7 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 		if (ret)
 			return ret;
 
-		ret = intel_pinctrl_probe_pwm(pctrl, community);
+		ret = intel_pinctrl_probe_pwm(pctrl, community, capability_offset[CAPLIST_ID_PWM]);
 		if (ret)
 			return ret;
 	}
-- 
2.50.1

