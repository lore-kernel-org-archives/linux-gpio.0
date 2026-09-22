Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864CF4DDB32;
	Tue, 22 Sep 2026 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073075; cv=none; b=qfiED9aQm3FmOL3t7NEG68WPV9F1+y4yqP4phkyggXcEHH5iDipe3sn/8k/u7An1qR5/j8R3O5iFYeMtQKXVhqbJxOesTolOZNKGI2A1QWSYKSP8EB9Y0HtMaOzOd3lrwVPsJTiaf6bFMkV41COA00OHphDoJ4jakL40WZ2e/ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073075; c=relaxed/simple;
	bh=rABX0WanbeFHc+GJ7Lvu3lndigrD+X4eaT7URR7WlHU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hJW3hYjHThEEPh+Pck7KCv7a4sYMe4Bmc7fATQdKfPvbWTAVYIgVOLDr/J/0IQBRzEa2X6ntgQTQn6MaLLwaMJD/v5dKX6/wDPihXaEBfIbN9wUpSPe2DWhkIjRoZO1/ih5+HFWDp1fjhlFg1HmJrZYUf55nbqwtlmNi3adV0EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Eb1wXVn8; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Eb1wXVn8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790073071; x=1821609071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nyFsqbiJe894vApQkWC51dQ7yzSu7fFDyoRKdXI6MtQ=;
  b=Eb1wXVn8nPtPjNsmhA03ao7pOp9mPTOGsSBtRxApIHXvtAP0tZVkvBIS
   YPT35Ix43kgrVjma9jObKYb0yr6tgPULPmpe3x0ZAMMviVJXbMSy10jrs
   lyTKhrSbtVgsWX/8ok2ncKXpy79mu2HqIQ8wLL1Oyra9MdQ/fKjD6o0yR
   IvOZrpS8QyqzDYlp0/TfZW1XPtxZC5rfVl08tv0jUUaeT1FKvA0AAwdOC
   86ndzx7NIQX4SdRmnx1n3Cklypf5HvEcWAN2DgbNWMqb6ZQFuQb82FzFZ
   RXRPzcRJJ+WzVR9Xpsrjj7p2HGt9FW++jPr62YsS3AL5VxPJo8FNi1cRG
   Q==;
X-CSE-ConnectionGUID: CCvTHDrBQC+/wjcoKiV9Cw==
X-CSE-MsgGUID: jiQZ0B9GTF2YShaW4tPzHg==
X-IronPort-AV: E=Sophos;i="6.27,116,1787011200"; 
   d="scan'208";a="29130432"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:31:04 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:11204]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.46.137:2525] with esmtp (Farcaster)
 id 5f7692ac-4d1a-408f-95ca-967d748d0ba9; Tue, 22 Sep 2026 10:31:04 +0000 (UTC)
X-Farcaster-Flow-ID: 5f7692ac-4d1a-408f-95ca-967d748d0ba9
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 10:31:03 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Tue, 22 Sep 2026
 10:31:01 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 2/4] pps: clients: gpio: only tear down the echo timer when it exists
Date: Tue, 22 Sep 2026 10:30:49 +0000
Message-ID: <20260922103051.5257-3-farbere@amazon.com>
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

