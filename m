Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B4F3537FE;
	Wed, 23 Sep 2026 18:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187781; cv=none; b=CRDzmTHYnMK64mpOwUixC1+IARW6dcolLAtDX3XSOOz6k1FJG0xs2DOXSUOlVBFUjiQ6lYJbj4QuSNX0KzRjjNqcarKsoZWu/xcsiUe6AbloXhAtz/TLBIwApBgPFWqhdm8dODVC3MLrT4WzMrOk8vlWKLymyOb45a+QTkXdz3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187781; c=relaxed/simple;
	bh=djn25xBrn7uEtP9dY529GPpeUVdodm17tSSBU+EXP50=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZF8dVaxgPWnFAhWCTE6lpZkb4a8sdT/feIwPYjJ2ndgvEHA/7Mg4fJiLH0NhSdvpn+Rz6dMDIgv2rLkkqfeb5FcYnDVsze5qsLwkA/6XEg8YbleQJ88BrftoEf+I7boa0k2aLDHlzyaQ0T93yOwtBJUo6QyPcth7kNZ8w2hPL4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=RsRPK9LC; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="RsRPK9LC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790187779; x=1821723779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BoCNwh+FpT+JBv5bKc5aZSUihgZ8R4V8vbPiKDnj064=;
  b=RsRPK9LCwt0i+4wEXLChq1l62U/Zo5p54ylBulSvar4m1FcGST1t4/rO
   P0P1fmcplshiV3N1EkmkiJEZ0IiTks9sUp0GkPNN5Cz/SLHWA9rD0KTdz
   ltu/ocBNkX6zL2DqwPyUN86qxgGSpGO6XOXREGrsu0fAZPtrq23Y4q3en
   Er3ChJX1jvQjAxN7XjJQQvM8fsCuztUH4ZpJCcDhGS4N6FgPB2p66uZqV
   t4NaOKlfDQqQS8yz2GGgfCwxnI47wH4dFlfoCo2+Gw4L2/B7DRgqWr4Yi
   OOBwWCu6xmmJBIBMvQKJy0ypLeC/8oqFceMIPx0ZyuZN7kO8rsWc5cgtC
   A==;
X-CSE-ConnectionGUID: kcm28mclR0G83fokwkVtvw==
X-CSE-MsgGUID: bGTlJVMbTt22S998lJHUZA==
X-IronPort-AV: E=Sophos;i="6.27,119,1787011200"; 
   d="scan'208";a="29440618"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 18:22:56 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:19189]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.15.186:2525] with esmtp (Farcaster)
 id 033e18a7-352a-4499-94c8-ab604e6d2887; Wed, 23 Sep 2026 18:22:55 +0000 (UTC)
X-Farcaster-Flow-ID: 033e18a7-352a-4499-94c8-ab604e6d2887
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 18:22:55 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Wed, 23 Sep 2026
 18:22:53 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 2/4] pps: clients: gpio: only tear down the echo timer when it exists
Date: Wed, 23 Sep 2026 18:22:41 +0000
Message-ID: <20260923182243.41060-3-farbere@amazon.com>
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

remove() calls timer_delete_sync() on data->echo_timer unconditionally,
but the timer is only initialised by timer_setup() in probe() when the
board describes an "echo" GPIO. On a board without echo-gpios the timer is
never set up, so remove() operates on a timer_list that was never
initialised.

The guard used to be there: it was dropped by commit fde046a8c490 ("pps:
clients: gpio: Remove redundant condition in ->remove()") on the grounds
that "the timer along with GPIO API are NULL-aware". That is true for the
GPIO API - gpiod_set_value() is a no-op for a NULL descriptor - but not
for the timer: timer_delete_sync() on a timer that was never timer_setup()
initialised trips the debug_assert_init() check and emits a debugobjects
"not initialized" warning under CONFIG_DEBUG_OBJECTS_TIMERS.

Restore the data->echo_pin guard around the echo teardown, mirroring the
condition under which the timer is set up in probe(). gpiod_set_value() is
kept under the same guard as it only makes sense together with the echo
timer.

Fixes: fde046a8c490 ("pps: clients: gpio: Remove redundant condition in ->remove()")
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
Changes in v6:
- No change

Changes in v5:
- New patch. Split out because patch 4 mirrors remove()'s teardown in the
  new shutdown(); guarding the echo teardown here first keeps that latent
  issue out of both paths (Rodolfo Giometti)

 drivers/pps/clients/pps-gpio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
index ccc2fb470b7e..aec534c246af 100644
--- a/drivers/pps/clients/pps-gpio.c
+++ b/drivers/pps/clients/pps-gpio.c
@@ -211,9 +211,11 @@ static void pps_gpio_remove(struct platform_device *pdev)
 
 	free_irq(data->irq, data);
 	pps_unregister_source(data->pps);
-	timer_delete_sync(&data->echo_timer);
-	/* reset echo pin in any case */
-	gpiod_set_value(data->echo_pin, 0);
+	/* reset the echo state, if the board has an echo GPIO */
+	if (data->echo_pin) {
+		timer_delete_sync(&data->echo_timer);
+		gpiod_set_value(data->echo_pin, 0);
+	}
 	dev_info(&pdev->dev, "removed IRQ %d as PPS source\n", data->irq);
 }
 
-- 
2.47.3

