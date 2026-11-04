Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.162.73.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813367;
	b=nVcZPitD+WpDcpuvXSfPd+pWui/ryODPuJbSY9kvPFwM7iH9WOd8hid44du8lmBaIidH
	 +sy4SvGnX0yIp3BkR2EupBxTNNj98lF22SnS4OJXWiRNAp3A01Y11OoB9Mfhqtj9+rVFu
	 9/EhokV+ZHd68nTSJK1EQu8Nx4dcKv9RsLmQ4WEH1p4FnrdfZ2f8udDak+mVnSMh2QF+D
	 eLcDyQBb7IwzqiFIzUgsYrfg2HHq5MEVP/mYSZsXqp65m5IHpTsa/fNPWQUXbjo8KEqmX
	 c3eXdPqPaSGC/OCjVxhr1uEsx5fsLPXfYAWeBPwNwLJj66MxlKduNgivmvzz+7lBUAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813367;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=J2fta6fGO49Jx4QC05VL7a8/b2oQthcVMx0k/6RCTvQ=;
	b=frsyLFlIp18qdkM8FHWV9MGrjIz1qs2ZRNxh9lVlqswUlhav8k9QN3L9K7wxW2uEVCZA
	 BN1hDalSYlyNZxQ+XW6DaaOnVUvT6Dwas70Fpz+52MkJoqUNfNAol1I98P47QnN0oTXbc
	 pBcC/9/B0VS464DAu55lKlvyYuO1UURzJV0163lPvWgixcnd1lx8tDd6DiDumuhV/WZk5
	 TEJ1Uvr/5fsgNaPg+O+7GVkDG6TX+m8IIhVDU4e3wjeb9aZeh6dekour1Q+stGSngJfHD
	 ohHDNHxbh8CN5lfQXtedJKwgB8Ne8OkvtGt4tKJvKKdn7B6s/CVWxu3uyMN/fDacruQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=cNaqe+52;
	arc=none smtp.remote-ip=35.162.73.231
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16219606EEA8;
	Wed,  4 Nov 2026 17:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16219606EEA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=cNaqe+52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793813367; x=1825349367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J2fta6fGO49Jx4QC05VL7a8/b2oQthcVMx0k/6RCTvQ=;
  b=cNaqe+529n/+AGwfeVGzikRhwklYYrIvExCXfcLr4iMkHr7GiVFCg4GC
   4RGWdmiGjx2Qp7bKe5YrZHlJY1ltGyQQBESp7REGs4oU6VYOlGfod/I7t
   etStxTHVfU9WFcisGaUexJjM4rQhT19MdE8qKFhxoNbakL9uyev82T/1t
   DOI8mDMms2ZGSTDCpzLj3Uoa8zZfiL1FjqWkulRvB3mq2s80ixCv4E0X+
   pi3Rp5RYTdR2KldpnXtmriUipsaRUyKJkwBH+e18lJvHpk+zoBV9Ztsdq
   27lTYR1Wo6paOxvR/228ikEzhyvupqOAeY510fEwzGIrSTY3nklNMQDib
   w==;
X-CSE-ConnectionGUID: fg63A1u2RNyvDrEiLtY4rw==
X-CSE-MsgGUID: sCfFRxI+SAeRQ81YcRXdCQ==
X-IronPort-AV: E=Sophos;i="6.27,195,1787011200"; 
   d="scan'208";a="32909559"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 17:29:24 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:29068]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.18.155:2525] with esmtp (Farcaster)
 id 3b28f09e-4301-4bb4-b37d-316a0f9aa006; Wed, 4 Nov 2026 17:29:24 +0000 (UTC)
X-Farcaster-Flow-ID: 3b28f09e-4301-4bb4-b37d-316a0f9aa006
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 4 Nov 2026 17:29:23 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 4 Nov 2026
 17:29:21 +0000
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
Subject: [PATCH v7 2/4] pps: clients: gpio: only tear down the echo timer when it exists
Date: Wed, 4 Nov 2026 17:29:10 +0000
Message-ID: <20261104172912.26456-3-farbere@amazon.com>
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
Acked-by: Rodolfo Giometti <giometti@enneenne.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v7:
- Add Acked-by (Rodolfo Giometti) and Reviewed-by (Bartosz Golaszewski).
  No other change

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

