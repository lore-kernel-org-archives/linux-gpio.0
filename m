Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0843A6B6F
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 07:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448663; cv=none; b=nkfl981p4Rj7+EWJ0lk/1BS8C1zVIGaJm4kTcxwmaUeRWanMxYyDyuHtvI6vmabhCNG4vuRdhAd1ABczqIpIEGszpCqAKgf5nGTKNM9xFT38SmM3Ft0KaSZnM/tEcteLrQsdtCCnE0ruUk4JHC9cnuqjJeqeeFM7ZHnts7W4PzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448663; c=relaxed/simple;
	bh=/7MK0+7D2zQ9okqF45iERYyWi2zb50kZTdI6f1eNHhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ji8AYHpMHH9GlyU5OsTbXD8Bbku3AD17CUtSdfTAUPAhv/JTxreYzBvKHrsFptn2Bj7WouRg+dQllZe5DxdrU7DsVlVG3vQOoz3unBEhc5OpToNXyomA+Vy23zuHRPAoqp7SvBw4vqpC37lsJemNi0VyQe3J8MHRhH1pmpnnvJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rIY51K/E; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rIY51K/E"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3BABC4E42B68;
	Wed, 29 Apr 2026 07:44:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A030601DF;
	Wed, 29 Apr 2026 07:44:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 715D8107294F3;
	Wed, 29 Apr 2026 09:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448658; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=UpX1RydAe9Wy6x8sEQ6RoP1Wnj4DBzp1DQXcqrkR8BM=;
	b=rIY51K/ELMp4p01WgmvPG8AmU93dnznt1mattjfCZwSjFIFGGtKqs5QJ+9fvC8sPoPMFCb
	FC1szJqbK1VMyhGteLyw1fqHeDwohQllqI3tEGwC6GZeV3dhB8YH98vOWZFzKJ00XM51Bu
	pCP+l9WBAS7Fivhu9OWTQ/G4Ebq+uOORYjW8eLD1mjKJsmo9m6RQPV8cJhTNoig4xizvNV
	Fqcl44z6ZNjTLo3cjfvWqQOoqQk41+c0ZFQ28KsUBR59y6W2UOOZ6NJ9SrwvxhKzYk0kbU
	hXeToX+7Ghonvr/V/c1nGX88jvN9sYKOtZn/beHroehUE7/K3dTRIhVPlZ+PVA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 04/17] ASoC: simple-amplifier: Add missing headers
Date: Wed, 29 Apr 2026 09:43:40 +0200
Message-ID: <20260429074356.118420-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429074356.118420-1-herve.codina@bootlin.com>
References: <20260429074356.118420-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The simple-amplifier driver is a platform device driver.

Add missing include files related to this kind of driver.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 41485445727d..5b44bcfef49e 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -5,7 +5,9 @@
  */
 
 #include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 
-- 
2.53.0

