Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746690;
	b=ZFIqpHvYedYL1JAhMlKHIVTSFWTxjje5KOEdiTf84q61Gpxa69vfvsf4ggujgDxWSkXx
	 8qayE+vygok1F/8S/2m8yc2Y0xgIz5bcwWtz6LtiWrFOqz/TFmfQXkFOTS3ya/AQTwXNt
	 4wJ1GV5OpPbR9kGbra9HsBEK+hrWdgJuODf3zfAT8cbjdu2sigME4oD3rPx6jda4XHwMT
	 lhxY3CGEjfQxdsFx0ll8Wb510vY8aFxwpqyMADlrKPAvxgkV2PBKuGGEFPGRa7v3hQQ5e
	 dHvFOpcEcWXGx61E7vNkAx+ReMZ6hwrP5HW3YLRbY0Ec8FNzPYAwYpAMcPT/d4HuKbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746690;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer;
	bh=eSC/IavhEKD/jocr6HtDgEw6LyL8PtYnkl9GbB/wsAs=;
	b=AjaQIxexfE//UOD+rJVIXAh2jXuDz8veXDIi40P1M+i0TSQ4Epzdtl4uciZVQ4SpkBWh
	 5eYYefg1s8HcPoD1zIY2oMu1ksu23SRmhlcLnAHcQJnOwPL/AZrIx/UGRtGARBeBxbUjX
	 hFKIeM0iSPFOmQYQRVWTEkvXYyu7cb7dYecL9mKAZwVtvD+XxXZ1i3bnXBnP2AZm4GFxF
	 pdi/J9gbwnG7IZ+zCAWLaSmualL0seK46Ctz5+4vSHPxS/Vu1T/JwkZSNq3rSgWKiPBCB
	 yFilOChPAPoJmsjfACARmCyph2Ob487kaIXnHlRCYYxp33DhgctgfrgxIHhHbaf2t+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aa6vOZah;
	arc=none smtp.remote-ip=91.218.175.225
Received: from mta0.migadu.com (out-225.mta0.migadu.com [91.218.175.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47100606A324
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 02:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47100606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aa6vOZah
X-Envelope-To: linux-gpio@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jL4HqBe3D5kj1fDFSZf+Q/Cum3V75XKW6K6TrEyTK9U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795746688; v=1; x=1796351488;
 b=aa6vOZah75HUcSQGXHkpgtXfAqhuddV2Nv+grXbNtHwI5qB6ejbb/sq2eLotHuyxekcq3HSj
 XB7Zhm900eiXqJ+xXI5Bu0YhPiptLZapWjGhSPHbA5VAeS8hyLnXFU6Nbo/OKeLjFsA20ippyKQ
 suJBI0uX9PMOVwB0kcoSZkI0=
X-Envelope-To: linux-gpio@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 34e7e2ce6f4617a5;
	Fri, 27 Nov 2026 02:31:28 +0000
X-Mizu-Trace-ID: 34e7e2ce6f4617a5
X-Migadu-Flow: FLOW_OUT
From: Zqiang <qiang.zhang@linux.dev>
To: linusw@kernel.org,
	brgl@kernel.org,
	paulmck@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qiang.zhang@linux.dev
Subject: [PATCH] gpiolib: Use srcu_dereference() in gpiod_get_label()
Date: Fri, 27 Nov 2026 10:31:23 +0800
Message-Id: <20261127023123.28459-1-qiang.zhang@linux.dev>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

The srcu_dereference_check() already evaluates 'srcu_read_lock_held(ssp)'
internally, so passing srcu_read_lock_held() as the extra condition is
redundant. all callers of gpiod_get_label() hold the desc_srcu read lock,
so replace it with srcu_dereference(), which provides identical lockdep
coverage.

No functional changes.

Signed-off-by: Zqiang <qiang.zhang@linux.dev>
---
 drivers/gpio/gpiolib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5dd4d142cf52..47ce89bfb578 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -124,8 +124,7 @@ const char *gpiod_get_label(struct gpio_desc *desc)
 
 	flags = READ_ONCE(desc->flags);
 
-	label = srcu_dereference_check(desc->label, &desc->gdev->desc_srcu,
-				srcu_read_lock_held(&desc->gdev->desc_srcu));
+	label = srcu_dereference(desc->label, &desc->gdev->desc_srcu);
 
 	if (test_bit(GPIOD_FLAG_USED_AS_IRQ, &flags))
 		return label ? label->str : "interrupt";
-- 
2.17.1

