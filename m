Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85697379C26;
	Sat, 19 Sep 2026 17:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789837932; cv=none; b=BoC2WmqD16Conf2l4p3ukEDKkI1NwcKQzmSvaUwsi2Q5m6j7FwqbfGaCX04lelwd28/H7mYPPNoZsi4oBusE51b5w3p4ergnlyC/B43DWJEbTeaFj2n34wkKW0U4GvwK5Re6w9IePAJWLTp815oMNTJovZQOFuI3NaH4Ax6tE/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789837932; c=relaxed/simple;
	bh=3gMhXjYjJ18ytp21x/302M108LwhKkA9men9GIEkGQU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PDX9LxFoND3mabl188UwDMwnIC2h8uqd8liiUpG2t88dJhtxVkGuaqZQY9WKm4sI+089XidzOO8oDzVv13Hurtgc2deG+c2cxt6wZE5qplRu3ipo/5PKZICS0pdS2aUoKS4ipnsr8WSWolr6KlJ1cEqmLgNX1a+HfrrF2aSjjIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=VOP1wPoh; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="VOP1wPoh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789837930; x=1821373930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T3ndLXuPaRWRNNorRS1lXsRqCoiSkUTLuVESHyvcFuY=;
  b=VOP1wPohoWwv7CNOSr4klLsKjPmuT82Hji1dESduXHJaVfiYYZjaBiMq
   yMNHNIjg29XOqe8RI6t/AXj45fE5fy2BLILSE+IzUgWi1RUEmHn+URFmG
   4pdURzRbaC6FOSFmBKBMvPc7qUPoTxQLbV4hrGpD6p7lVz/wO51IY8hwb
   BU2k7YZtJfQgxDbBAno4RHY08Wq3CI9fQCToPXpOu1fK5fe3SZODAaX+L
   N6bohgJkPlQCShWQGscwwp6a0IDBjOAdxNq6yx80ZOpInJjb2cwzYCBS7
   0pJNcNEGM+KQD5FhJhU41duasl0s4FabKASVim2ApE8KsiB309ufAEkJs
   A==;
X-CSE-ConnectionGUID: fuBJYiU4QT209lvc5CCeUQ==
X-CSE-MsgGUID: jS0nVMj7RsuXGAoJw4VP1w==
X-IronPort-AV: E=Sophos;i="6.27,111,1787011200"; 
   d="scan'208";a="29116693"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 17:12:08 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:26008]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.49.70:2525] with esmtp (Farcaster)
 id 26b3a8a7-7408-41ac-95eb-1bb124c263e4; Sat, 19 Sep 2026 17:12:08 +0000 (UTC)
X-Farcaster-Flow-ID: 26b3a8a7-7408-41ac-95eb-1bb124c263e4
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Sat, 19 Sep 2026 17:12:07 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Sat, 19 Sep 2026
 17:12:05 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] pps: clients: gpio: propagate probe error codes
Date: Sat, 19 Sep 2026 17:11:55 +0000
Message-ID: <20260919171157.5502-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917075611.47881-1-farbere@amazon.com>
References: <20260917075611.47881-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D035UWA002.ant.amazon.com (10.13.139.60) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On the two probe error paths that map and request the interrupt, probe
overwrote the error from gpiod_to_irq() and request_threaded_irq() with a
hardcoded -EINVAL, hiding meaningful codes such as -EBUSY, -ENOMEM or
-EPROBE_DEFER from the caller. The request_threaded_irq() failure message
also logged the IRQ number but not the errno.

Return the actual error code from both paths, and add the errno to the
request_threaded_irq() failure message.

Fixes: 161520451dfa ("pps: new client driver using GPIO")
Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v4:
- Add Fixes: 161520451dfa ("pps: new client driver using GPIO") and
  Bartosz Golaszewski's Reviewed-by. The hardcoded -EINVAL on both error
  paths predates 4461d65176b4 (which only switched gpio_to_irq() to
  gpiod_to_irq() and left those returns as context), so the tag points at
  the original driver rather than the descriptor conversion

Changes in v3:
- New patch, split out of the pinctrl change: while converting the probe
  error paths to a goto, Takashi Sakamoto noted that the hardcoded -EINVAL
  discards the real gpiod_to_irq()/request_threaded_irq() error, so fix
  that separately first

 drivers/pps/clients/pps-gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
index 73ec2c7335e5..038c55c5f7d4 100644
--- a/drivers/pps/clients/pps-gpio.c
+++ b/drivers/pps/clients/pps-gpio.c
@@ -165,7 +165,7 @@ static int pps_gpio_probe(struct platform_device *pdev)
 	ret = gpiod_to_irq(data->gpio_pin);
 	if (ret < 0) {
 		dev_err(dev, "failed to map GPIO to IRQ: %d\n", ret);
-		return -EINVAL;
+		return ret;
 	}
 	data->irq = ret;
 
@@ -197,8 +197,8 @@ static int pps_gpio_probe(struct platform_device *pdev)
 			  data->info.name, data);
 	if (ret) {
 		pps_unregister_source(data->pps);
-		dev_err(dev, "failed to acquire IRQ %d\n", data->irq);
-		return -EINVAL;
+		dev_err(dev, "failed to acquire IRQ %d: %d\n", data->irq, ret);
+		return ret;
 	}
 
 	dev_dbg(&data->pps->dev, "Registered IRQ %d as PPS source\n",
-- 
2.47.3

