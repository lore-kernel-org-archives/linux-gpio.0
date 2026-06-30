Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551B63FE674
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819259; cv=none; b=PhsLaal0WJpuFXFE3Pds+YOE15q2CUqsvPJx+7WT8Vi/YOEvzVJDXnf+vqzaWTCRxI5iW10cawGYez8yrLbojt50BrxBu6tYhsjmd+aq5Oht7jGWUQj36RG/O77UMMn3VXMP9Waz37bhYjIlJYgaMbuzvss8l58uWj1R7SzUR5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819259; c=relaxed/simple;
	bh=Kdhf9vD+dYkQjTWeBe1hcXjafw1ADL0AXNATeQiDSjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h731sM+2LYyQgCu9exkubQkZQYf2503zVj0s7L7d7AovkrchXI9x2swrqjCyuhNKfwlV/bPAGnrBhXJdthAKXZNnl+kAc4VokRF/dlo0YUL0fZCRepswZntKm2BjQSekKzaTIGi/Bm7frP3sGWaQKldAp9l9yQaviE6m0kg+B1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DA1kTFuq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DA1kTFuq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461451F00A3F;
	Tue, 30 Jun 2026 11:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782819258;
	bh=qyk073KQumrvqZBAurEF7vI1eniZ1VZL73h/QGt01jA=;
	h=From:Date:Subject:To:Cc;
	b=DA1kTFuqJ6U28ItxxA3pEUArmGAdZVh6NJevjDjx+ZPgNe/KFa4BX/fZ9QPokHKC0
	 JPvCqa+YJTO3n9oqQNQL8RtLKjDHDtuLWfAYlySP1bRzXoi6WPjtb6FNAjXJz8Ipei
	 6JJtPa/cIeNBRDC3MrgyNnseft+TDbzI8TJK2xjs0oruoYf8tBOw2biy51lsZUivlS
	 z1E1kE2QYpViH6og5tZaFwc7yGrPzMyNSPbwuBH4lEnvtbp99/lNTmQw74dKHB/7B8
	 DPD10Kzxxm/DBXfYDQK7Mm2EdKcDz/ISXhYlMRvvjUrokTNrbYPX6NivGLqAkI/1vg
	 Xwnrg8OmE8I1Q==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 13:34:15 +0200
Subject: [PATCH] pinctrl: tb10x: Mark base as __iomem
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-tb10x-v1-1-5d08d2dd3240@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM2MD3ZIkQ4MKXQNjM4MUUxMLS1MTIyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQCJHEkPaQAAAA==
X-Change-ID: 20260630-tb10x-0360d5489542
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2

The compile tests are complaining that this is not correctly typed.

Fixes: 1982621decaf ("pinctrl: Allow compile testing for K210, TB10X and ZYNQ")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606150641.cbQ05ZMM-lkp@intel.com/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/pinctrl-tb10x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 3f581404a9b9..b7cbd69dd877 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -479,7 +479,7 @@ struct tb10x_port {
  */
 struct tb10x_pinctrl {
 	struct pinctrl_dev *pctl;
-	void *base;
+	void __iomem *base;
 	const struct tb10x_pinfuncgrp *pingroups;
 	unsigned int pinfuncgrpcnt;
 	unsigned int pinfuncnt;

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260630-tb10x-0360d5489542

Best regards,
--  
Linus Walleij <linusw@kernel.org>

