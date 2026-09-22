Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784044F30C1;
	Tue, 22 Sep 2026 10:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073075; cv=none; b=X+eayQHC6zHaM7QlObu4CvF2ZriISDsYRej+UdLIREgeBO1UQ5DPxMph1/tCUfF0wW7iSrNbq1CgKyZiwPCkzzVobmcfXHEMQerzI5KXGf6PIg7wNd+kElvyAN0kUQYVViSPU9bQyUhpYHvhO82l0H5MAUjmiN//T1F1vpP0BbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073075; c=relaxed/simple;
	bh=c4d1nOjeNhT9jLZ3ARh7PAPB0tnZeYKkRoijwwRAcLs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oWTXqlFBq+HRgiO6xRbiPvvdwKUVhrOpPoLU3rwNYrh1hNNrCQjPVe3GZbNKJeVum8fLujmNs6g5+lblrw6y4LDnRCMaMqspc2PAcz9nmrUt0z+o85XWKt+//snaqxsUa3pnGvchRo0kJi11kfrqthMUAgISDdsyR3ax2P4Kx4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=pB0IRPSx; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="pB0IRPSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790073071; x=1821609071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FONXOdAXNzNqni0VAdej7KuuNZs3Z6zTLAiVVikiw4g=;
  b=pB0IRPSxUF4fcdQ+cBhCzS/jpFXum0gvOHZwtX2i8C+xcZj2wCaWSYQw
   GJh1+L9S1vnH6N8IOj1agqOUzvgn4TWSLDz1UtGo1GVGnygsKLCBiPt0D
   Gx6MlYRi2q/GmWseHbayjZxQxpX598D2h2eIEUzEB/ndtnzfKixkBeXwO
   msZ//DAayhtto4izQoYzAckYZIvARBTIJ6jpNoW71i+/shC4fX8qHICRy
   StQum3f+LW4BC1Oq0l69nvF5HtScbCEX9o6Kn62bLLeFOoAqubIvJL7+m
   BtP/r1f1JHvhPA9Ctx2Mvxef0Gk3rH/iN9huLn5yEbc2SWSHWvdtvatmM
   Q==;
X-CSE-ConnectionGUID: NxTJnMLJTK2c8xqeaZsx3Q==
X-CSE-MsgGUID: 2vI3SvBZTHudFbD7H3hicw==
X-IronPort-AV: E=Sophos;i="6.27,116,1787011200"; 
   d="scan'208";a="29109114"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:31:02 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:30287]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.60.208:2525] with esmtp (Farcaster)
 id df508233-3de7-495e-a6f4-504f7b83d2e2; Tue, 22 Sep 2026 10:31:02 +0000 (UTC)
X-Farcaster-Flow-ID: df508233-3de7-495e-a6f4-504f7b83d2e2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 10:31:01 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Tue, 22 Sep 2026
 10:30:59 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/4] pps: clients: gpio: propagate probe error codes
Date: Tue, 22 Sep 2026 10:30:48 +0000
Message-ID: <20260922103051.5257-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922103051.5257-1-farbere@amazon.com>
References: <20260919171157.5502-1-farbere@amazon.com>
 <20260922103051.5257-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D036UWB002.ant.amazon.com (10.13.139.139) To
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

