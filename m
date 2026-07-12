Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC9A194A6C
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783848718; cv=none; b=tvOOb+qu/FQO4nIApFCodXayXC8Rzch4IUDSM8Qh4F3CDUTPi9NToul5WyAfKOA1TU0/iBN4ZsOCKXUY2VoepUL4TP/AruDQoaTW4nIBhMlYNqFH6XNF5rCtOCnm4cg8Y+hXPmEeBDgs1Bt3Qj4SojfxioKh+hrzuESzzEYGlTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783848718; c=relaxed/simple;
	bh=uOHV6GeWeJxMoeQVeCFfwBjwXBS8G4Vko/F0a3VyftI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LY6r/6BGJ5O2mimMZ+eEGoghPsWkem2YmxU/15mBa1mQWvhHeDsjfeE65/fHbeObu0T14oAPytjS9gIwuqEoEJTF7YH4X+GG+0kLSIcL9CjXxmVzCwEbqEizUSXX2/POayZ2rmq1/D4QM4p1Nt64Bb3VFyRQP1R+Huhj/U8f8NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jUt1TQwl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jUt1TQwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=9dKe0bFkJgWBTt
	ums8uQV2GtI1zJa6OLV0ZzK7az+n4=; b=jUt1TQwlfiVUC4OOgHT9ygj5aLEsWx
	K2kl13ki180b5MAfAcyR/STJbM/Z2fj093J0go4OB7an6+ajijab1S7aw/W8eVyC
	ZsT3tnqGXTQEIu14yoqypWJoooI0WLJMOByjhmfGoWTy/+r3V9qdOZSs1k90vonY
	OnriMp/JroQ1zC1oXKhr0tLA4FRKeWabOK50l549xnIZHDru4Io2C1SgqTgYzFlM
	6K6IWMTqxBwHLPqvAX1bRj7wu0BsI54LZFfc5pVgDXLbQTSo8rzbjzXM74B1+Ib0
	gG37DFBbXF1itQD4UekWPhV0PL7bRseK54s4qaAFAgt9cFpXSEjjarCQ==
Received: (qmail 2179342 invoked from network); 12 Jul 2026 11:31:53 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2026 11:31:53 +0200
X-UD-Smtp-Session: l3s3148p1@/ifqpGZWnpAujnun
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: sloppy-logic-analyzer: add a comment explaining the buffer init
Date: Sun, 12 Jul 2026 11:31:48 +0200
Message-ID: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To avoid more false positive reports of "leaking memory" when
fops_buf_size_set() returns an error.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpio/gpio-sloppy-logic-analyzer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sloppy-logic-analyzer.c b/drivers/gpio/gpio-sloppy-logic-analyzer.c
index 2bbd308ca08e..6748ddce3c19 100644
--- a/drivers/gpio/gpio-sloppy-logic-analyzer.c
+++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
@@ -237,6 +237,7 @@ static int gpio_la_poll_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Initially allocate a buffer. It currently is NULL */
 	fops_buf_size_set(priv, GPIO_LA_DEFAULT_BUF_SIZE);
 
 	priv->descs = devm_gpiod_get_array(dev, "probe", GPIOD_IN);
-- 
2.47.3

