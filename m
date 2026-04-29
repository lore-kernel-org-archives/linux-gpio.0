Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B291B3A5E84;
	Wed, 29 Apr 2026 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448663; cv=none; b=bOnrxLDwtO7LJ5Alch2s6efjT8E3zx8lX8wZV8dmXewDPt/P+eKMgAh7u1ZhY6jHe6h9+8gCWc+uIkG7XifV3HEWbWgZIM2YxTkHxu87p3Ctt7TqPedZC+9CVR5SPcz9AbVUHAzUPelZB103nzy2p+WAuzDLmZkVeuJ0GhljcxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448663; c=relaxed/simple;
	bh=ReWwt6iaMYqdtIPhdkJViA/sCiJQgZnX+BqD9iMnbMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fyCctjcCEwe9XLyejhfUWKUotB28NgA5WqOlleiJfFGX+Rs2pxgJDqh9I/PnohzEtp4gchumEXP5dhEINwkipPjepbtjzwRpupCx8OdieS29CAaM/ATHBzKBA+DWayjR7SXFXlv59qeu5n0Vni8PyCwBdHoXMGFWylEXXlNL0oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PIFscuU1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PIFscuU1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 38D6B1A347C;
	Wed, 29 Apr 2026 07:44:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 08258601DF;
	Wed, 29 Apr 2026 07:44:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0246E10728FEB;
	Wed, 29 Apr 2026 09:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448655; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6b9GO4bt3gqfGSPPpPA2FX9bro+DbzrPQkDmfCWkm78=;
	b=PIFscuU1858CKMRFpyR3RpLpfM/ZbZx2g+q4gAhNF8lcixKRASq1/ZFF4ziBv2caVTSE7R
	pdspwggAeFXbPoq4KyIczhQuW1zVZYmnkT8n9aAJe+vT00Tj6/x1Yw8BOLwodqT+dfGbR4
	bvF7xNjtMdRi5w7FWuQcrv3g1l8meYVmrQGL1up2snoF2DGN64Z+iuhonlfOPC/j+4o0/U
	8qjn8g1MpPF6i3327C9fxX+YVSsjLIEnYfzhDaDEFWPu4cKQyOHgsUHOshPeQQDvRmF1j+
	mBMGeD9rW4SCfOlnd1YBMzB4QunW2oAiowdfgkQlVzZcksrTdKaLxhLzmU/k2w==
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
Subject: [PATCH v2 03/17] ASoC: simple-amplifier: Remove DRV_NAME defined value
Date: Wed, 29 Apr 2026 09:43:39 +0200
Message-ID: <20260429074356.118420-4-herve.codina@bootlin.com>
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

DRV_NAME is defined and used only in the simple-amplifier driver
declaration.

Remove the useless defined and use directly the value in the driver
declaration itself.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index d306c585b52b..41485445727d 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -9,8 +9,6 @@
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 
-#define DRV_NAME "simple-amplifier"
-
 struct simple_amp {
 	struct gpio_desc *gpiod_enable;
 };
@@ -97,7 +95,7 @@ MODULE_DEVICE_TABLE(of, simple_amp_ids);
 
 static struct platform_driver simple_amp_driver = {
 	.driver = {
-		.name = DRV_NAME,
+		.name = "simple-amplifier",
 		.of_match_table = of_match_ptr(simple_amp_ids),
 	},
 	.probe = simple_amp_probe,
-- 
2.53.0

