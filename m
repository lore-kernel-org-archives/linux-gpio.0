Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=50.112.246.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813365;
	b=zjZNYVeiaFonTIzdjB8djlpaXw8oJ9tlQ8ZWXS347GMl2z3RBJWH8ujxVJPZkjlL6Vyq
	 HhARmOirAqtxDfZFE7fBfb9zeDo5QwLeB68/vN/I/wsajQrr8FNCiCJohxC2ockHLhfUP
	 7kgLyz0UuIasgfjz4Xz/4f12P9q/d94cCItgleqyxn2Po3XMUJ/Ls5NB8nXMehbQtMdy1
	 jDfUMa0o1/5DmpD0EHWlQSdSO8DPYbqZjm6NOtU02TEW6zIwaa7hZ+eQoONRMRVxuWewP
	 +Mcuc/pP4EBcIWilYWB9+69pg4Yiuop64f2vpUWZwVDZ/Z0aRYRqsjodBnUloc2dOIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813365;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ZxAj9qHzSQ9Ben1XpC6Z9pEnPWPFjxK4FOCT5xxkFNE=;
	b=LUFsRYbs1rKNPDOTBRSo2rCvyY3mB7W3Yn6TuvtpbJVaHpRplNUFnqsJsvde8rkeuiJg
	 sMEFqZxOEflOt6bk6lHzT/O7ghXMDDGGECpkLvmfuqp7Tzba74uO5TkkM319tNrQawYmZ
	 zCD3ImAaYzfCIQElLJe+UhTb5E/gTASf67oOL+0d/xolBXzpbYctoYfyMCXZKOmIwwjTM
	 9U1l5j5Zei7nhYDXA8JaP9+BClV+setXEa3EDVq6LpA68GvQ2c0SoLafdvWUUDG7vE5og
	 ORdtr2pUexCnmZS06DooCtoo19+5lQJ7t2SCYWcytNYDimoOXYON2y8WZ+8ji5kYdAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=KpuIVDlU;
	arc=none smtp.remote-ip=50.112.246.219
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D8E606EEAA;
	Wed,  4 Nov 2026 17:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D8E606EEAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=KpuIVDlU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793813364; x=1825349364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZxAj9qHzSQ9Ben1XpC6Z9pEnPWPFjxK4FOCT5xxkFNE=;
  b=KpuIVDlU44llUsXTd3Z5DZ7CxxODuFvlr9ivOI+IJxF8FVcb72KBoMxy
   A7WBgh6pBpqmEOD1KGoBQyViBxuDq53yLJVlGdtGzverkFpvzGQdEWDtw
   EmSAbu9HyBGsu6N/c41QhuUkvHpMh2Bu1yLhsGHs4AsbqSXRlOPpgVx0D
   pxlLqzOYg/zw7acgx3ctu9Odn9LkSWEFdBw35c8iOTLxNXUP+SUjFNPAf
   FtSrbQtKIEN5xeM+GEnZFMO0ty6w9NwqoFk9o5YE0PoxvhMbcSoruNPfa
   e6/KcUrgs60C3HgRl1mKwQLChSMi5id2w15w460le+x8gBW4jiEpYRWOq
   Q==;
X-CSE-ConnectionGUID: qj10TjIlQ6uLNjpOPVsljA==
X-CSE-MsgGUID: iyTbnCIOR6qbuOxEhu3Biw==
X-IronPort-AV: E=Sophos;i="6.27,195,1787011200"; 
   d="scan'208";a="32876172"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 17:29:22 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:3889]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.7.65:2525] with esmtp (Farcaster)
 id dbe68ce9-263c-4e9f-9888-948de8d07560; Wed, 4 Nov 2026 17:29:21 +0000 (UTC)
X-Farcaster-Flow-ID: dbe68ce9-263c-4e9f-9888-948de8d07560
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 4 Nov 2026 17:29:21 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 4 Nov 2026
 17:29:19 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, Rodolfo Giometti
	<giometti@enneenne.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Takashi Sakamoto
	<o-takashi@sakamocchi.jp>, Eliav Farber <farbere@amazon.com>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Bartosz Golaszewski
	<bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 1/4] pps: clients: gpio: propagate probe error codes
Date: Wed, 4 Nov 2026 17:29:09 +0000
Message-ID: <20261104172912.26456-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104172912.26456-1-farbere@amazon.com>
References: <20261104172912.26456-1-farbere@amazon.com>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
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
Acked-by: Rodolfo Giometti <giometti@enneenne.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v7:
- Add Acked-by (Rodolfo Giometti) and Reviewed-by (Bartosz Golaszewski).
  No other change

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

