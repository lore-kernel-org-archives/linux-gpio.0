Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615619;
	b=BZbBnaMgAecwxpmPBQOeawZx8fgwAeWPWfFmVem4rC+RAu7RJLWkCLGmKq/7LHK8sWL2
	 Z7LTJ3wyaf5YsdDTriKV+Pw7fLfxrAfYDqpFYt59MswJoZw71NMJQ090XI9NqkcDrKl91
	 f/vzJ6D4LoFZKNXO4YxtRd28EFYInbDz5Vmj7qThX+XPUD6Omc5UbSc3hEPbdUC9cwCGu
	 KSWtPZpXQGUhh+HHRaG/t1NbSWKmtNJ5ckhbB0uLJNOiFknN7/7ktGyuY0WrM4O0yfLCr
	 6er66iu4Dp+624MTMdLGGLZrO7lg+EPxPPBLPE/UDWbfz+t1U4h4WoWJa/uY9ThaGzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615619;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1TNmPjKpEIxPlxH6BJbH9HMyylvDkUu0PxXXodMrDog=;
	b=UvYd/KAJQAHqzyPxHWh+ZYEFVifj6HfbCDU2KVHHz43Xjt078wAzaM87XSiQiJyuI+h0
	 zZy7B8wybF+p6Px5k1M09VbsEXsOM1Piu3dqmbpDx0LiErIMSLZPEiZsJ7JX74hYXd4x3
	 kHFnXlyLGcOGwAT2aJcUQb5ZnUmYt9UqgowOreuMifNxdW4fQ7dYX1xlQyqY7DuQlv7wZ
	 1hPhCRZsdFNCIE9NN8ykoCt0vNg87CP4AP019zJbcbvi/vuGaZ29oOXWLJfThcjjAWEpP
	 mjZz+XWPfK3kt0yl/ODP6KLXgsHR0n6m98y49NkBVCXSa3S3jFJSIbjTY5vWbAZ54LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dq4V+k+w;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA86606A319;
	Wed, 21 Oct 2026 20:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFA86606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dq4V+k+w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792615619; x=1824151619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+puReX7cZcNQsPG3E+Z2+EIty2OZapjHvbmVeo5ErXA=;
  b=Dq4V+k+whrWrSfkAaxOJWSt7YVRj5FH1hdiLbZ9BA0uT5nq3lBNFMa1z
   46thYUv0W9xxHs43KETRI/qvqFIx/yR84riaegzFwCM3BupKWRdVxiVNk
   nxyckLINqfhr6Ctp5mbafU+Tm7HVt4T82dpT+AGoFRqUY7t7BlvIu/cy6
   PVYEgsit9x/1ejAnjhWZzIVXF3lc9oMKkYJ76KI+kQZrbYT3FBu8uXVon
   8xAoIqaSeqdA0ANszuJHIVTIxw5Th09Hk7Kjj909JXKZ64Gu0JA6PnFfq
   BB/xoqvnCLivGvdOnijeq1PGRyczD0MmoSpoUP9A98gu0Cvzx42qwyIUe
   Q==;
X-CSE-ConnectionGUID: FYT11ZixQA2x+T9I1cXSkA==
X-CSE-MsgGUID: T1ihdX38R8OQR7loaWGGjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1243658"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1243658"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 13:46:58 -0700
X-CSE-ConnectionGUID: KfyrAZ3DSlqHoJtmAElMnQ==
X-CSE-MsgGUID: lfW3R5IPTYaPYGsEUwMVnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3534465"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2026 13:46:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 553D79D; Wed, 21 Oct 2026 22:46:55 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Samuel Moelius <sam.moelius@trailofbits.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v1 2/3] gpio: mockup: Replace custom devm_gpiochip_dispose_irq_mappings()
Date: Wed, 21 Oct 2026 22:44:44 +0200
Message-ID: <20261021204654.1001101-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
References: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace custom implementation of devm_gpiochip_dispose_irq_mappings().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 1c6a2f3414f1..f782b55240b3 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -400,19 +400,6 @@ static void gpio_mockup_debugfs_cleanup(void *data)
 	debugfs_remove_recursive(chip->dbg_dir);
 }
 
-static void gpio_mockup_dispose_mappings(void *data)
-{
-	struct gpio_mockup_chip *chip = data;
-	struct gpio_chip *gc = &chip->gc;
-	int i, irq;
-
-	for (i = 0; i < gc->ngpio; i++) {
-		irq = irq_find_mapping(chip->irq_sim_domain, i);
-		if (irq)
-			irq_dispose_mapping(irq);
-	}
-}
-
 static int gpio_mockup_probe(struct platform_device *pdev)
 {
 	struct gpio_mockup_chip *chip;
@@ -473,7 +460,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->irq_sim_domain))
 		return PTR_ERR(chip->irq_sim_domain);
 
-	rv = devm_add_action_or_reset(dev, gpio_mockup_dispose_mappings, chip);
+	rv = devm_gpiochip_dispose_irq_mappings(dev, gc, chip->irq_sim_domain);
 	if (rv)
 		return rv;
 
-- 
2.50.1

