Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D2D388866
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660248; cv=none; b=t/gOlzuN8yaJO9T5a9ya5jDugqBAnVChP+EXyDL0vxytdwqUwrlpBw4LPKGxndfPkA3xL/kzXS0mRZNo5srDYZydoLlDTliZ5dvPY3Pk4sUhmOWaDvVPxMDzNYbaPmKdodl/4znE2F1Zx6Ccjjielh7SgMR2Zhmao9pM0cwRqkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660248; c=relaxed/simple;
	bh=T1w65KOywt6Aem2GhCbJmOJlyoLknLOfFIhNHMwkQ2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nbdygplbC+G/bT50YeN8U0y9ddZh/2WC/XHPHp6kXdWJrDSvXIRjUu8TK0ImSa8hbPQAFhba8YrKj6qsahBilRLSqtQFsAg0QWBW8wUYt1m3IkuXDzW2u+px34kbFL8tffzXrQLMpuuWV3kDM8vAQ/lfDyCUwV/55jb7hEJGFI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K8B+4nQY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K8B+4nQY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CE8CA4E42C92;
	Wed, 13 May 2026 08:17:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A15AD606CE;
	Wed, 13 May 2026 08:17:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5185411AF874F;
	Wed, 13 May 2026 10:17:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660244; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sKypgypZ6D+IKIIZxzDHFHASGVM/SOc1W5Wd/depBrA=;
	b=K8B+4nQYAYF+KrlYvqdWE/8FTHLd9XoG5JgN4zB/XWzA2PXG542ZnBv5Ooe4GPXMpakqJe
	7LI0rmY0BlxP9QtbnnbkX5M5LzBDo3FQc7E7q8GD8xEPflZBvmB8ulzAjKHXJpRucq3tBa
	Kjig4OPsHaPq32Cp2YnK0L1ejY29LgKsN/HNeeVIEh9Fly58/PxJjwV4V9siGkKCoW3K9e
	k8/nsmStQpEyaHehYiVmzuvAUW3504cvXQiuzpg/rphqQet+KsuaOzCOhF0U6zqwYdkoOw
	2Mujj6/IvKN2MmwuBTbau5bde/EAGXDSY6S7P+ImNeGpqU1IppRREAuxKpqO/w==
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
Subject: [PATCH v3 03/17] ASoC: simple-amplifier: Remove DRV_NAME defined value
Date: Wed, 13 May 2026 10:16:47 +0200
Message-ID: <20260513081702.317117-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513081702.317117-1-herve.codina@bootlin.com>
References: <20260513081702.317117-1-herve.codina@bootlin.com>
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
2.54.0

