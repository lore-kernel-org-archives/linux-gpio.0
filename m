Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40771415B8C;
	Wed, 23 Sep 2026 18:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.245.243.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187777; cv=none; b=DUwET1gyz0zNDeBNK6qtA6gvjx8DbJM4/dkAjk5+loWARktSd9/Pc+jiYoGbuLEvqsXDKQJ7mrumXdr63mvURH6Yj2dakDtb0OxJcIdE+nwrMQckwrE49U0Dqcx/CFQz/piQCa13D1F3ic6qqhVlJaR3Tm82de7JqHt7etM8CwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187777; c=relaxed/simple;
	bh=C38gDig4/Ik06Wb7AhgNTaFugIKl9BdyefR6UVVJzQI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pj5ReC5JnXbkfYSoOccKIqPW2W1SORMHybSvaNRBHKpiBNmDZjYZ0qhUYO4o1asJUAUPdvIxm4pzEqJwhVCJ8JOluYifQ8uNFKrJd8nSTBDZWRwuxuOCo0AyKaOb9LWoFhlu5l7xpERUEwIDsgbH50Ma2kqlb02S2YvUF1orEf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=QvU31BzG; arc=none smtp.client-ip=44.245.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="QvU31BzG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790187776; x=1821723776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9et+np++yFZQcUSaKDx/0NpEF9Irh0RaktPUq82IMMg=;
  b=QvU31BzG/zNEIzK14KCawV18NX05xRMViR1+H6bBVvAm5aBuTf75A1+6
   nrBurbZY9hTsTLtod+0ysY+dty+cs0P/8lb7UZfAeJ+RhkKLi8bDt4nPl
   yqdEj/+ke5tAmld8UREgL29qsNc6Q2CZYeAwSkPVytIPKnjCn9nXBrBGv
   keUS3DtooWtoCvPSF2E2k67qE6cfCJE9pTDcX/eUom54bR8Kc5iNIZCMf
   2PkvFdxjTAuERzye39u+pPqAbyzmvozXfYIU3xkiBhDuvbmPNAa/L7EU3
   3Zr9Wgn3L9/0N56eE+CYhUBM4A1f1urI+QZBbVynCbJIT7/tkxFpl3+ZX
   A==;
X-CSE-ConnectionGUID: 0XzZRVKmRl2YTu+6Egwtkg==
X-CSE-MsgGUID: cdR9XVi4SXmHjgq67ZOJFA==
X-IronPort-AV: E=Sophos;i="6.27,119,1787011200"; 
   d="scan'208";a="28969801"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 18:22:53 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:12136]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.110:2525] with esmtp (Farcaster)
 id fc145c99-4087-473b-b9e0-b16a54f1d017; Wed, 23 Sep 2026 18:22:53 +0000 (UTC)
X-Farcaster-Flow-ID: fc145c99-4087-473b-b9e0-b16a54f1d017
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 18:22:53 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Wed, 23 Sep 2026
 18:22:51 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 1/4] pps: clients: gpio: propagate probe error codes
Date: Wed, 23 Sep 2026 18:22:40 +0000
Message-ID: <20260923182243.41060-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923182243.41060-1-farbere@amazon.com>
References: <20260922103051.5257-1-farbere@amazon.com>
 <20260923182243.41060-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D039UWA002.ant.amazon.com (10.13.139.32) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On the two probe error paths that map and request the interrupt, probe
overwrote the error from gpiod_to_irq() and request_threaded_irq() with a
hardcoded -EINVAL, hiding meaningful codes such as -EBUSY, -ENOMEM or
-EPROBE_DEFER from the caller. The request_threaded_irq() failure message
also logged the IRQ number but not the errno.

Switch both paths to dev_err_probe() so the actual error code is returned
and logged symbolically, and so a repeated -EPROBE_DEFER during boot is
logged at debug level rather than spamming the console. This also matches
pps_gpio_setup() in the same file, which already uses dev_err_probe().

Fixes: 161520451dfa ("pps: new client driver using GPIO")
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
Changes in v6:
- No change

Changes in v5:
- Use dev_err_probe() on both error paths instead of dev_err() + return,
  so a propagated -EPROBE_DEFER is logged at debug level (no console spam
  on repeated deferral) and the code is emitted symbolically. This also
  matches pps_gpio_setup() in the same file. Drop Bartosz Golaszewski's
  Reviewed-by as the patch changed materially

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

 drivers/pps/clients/pps-gpio.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
index 73ec2c7335e5..ccc2fb470b7e 100644
--- a/drivers/pps/clients/pps-gpio.c
+++ b/drivers/pps/clients/pps-gpio.c
@@ -163,10 +163,8 @@ static int pps_gpio_probe(struct platform_device *pdev)
 
 	/* IRQ setup */
 	ret = gpiod_to_irq(data->gpio_pin);
-	if (ret < 0) {
-		dev_err(dev, "failed to map GPIO to IRQ: %d\n", ret);
-		return -EINVAL;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to map GPIO to IRQ\n");
 	data->irq = ret;
 
 	/* initialize PPS specific parts of the bookkeeping data structure. */
@@ -197,8 +195,8 @@ static int pps_gpio_probe(struct platform_device *pdev)
 			  data->info.name, data);
 	if (ret) {
 		pps_unregister_source(data->pps);
-		dev_err(dev, "failed to acquire IRQ %d\n", data->irq);
-		return -EINVAL;
+		return dev_err_probe(dev, ret, "failed to acquire IRQ %d\n",
+				     data->irq);
 	}
 
 	dev_dbg(&data->pps->dev, "Registered IRQ %d as PPS source\n",
-- 
2.47.3

