Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30313BED31;
	Wed, 29 Apr 2026 07:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448699; cv=none; b=NSB+WhYb7/nHMM/L/8cIcaX2zxI88WRy2G1qOQy5xNYwsBZUR2VI60cJ0R9xPr4DglRfJc0niVkz4m9UGPuyTF1CKwyPesJnu9xUYTo37+0CRRJ+DcOllvpGWook/eErZaDOxcfzzg3HfXIbTX45Go0yBesW/VpiEBryb4Afdwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448699; c=relaxed/simple;
	bh=op2dyqGMPf45Zp004/cYcTotxRMgO+sGnvJdpRf3ngA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6s02KS3y0WMWsKsfciuR5ZxLXtptCFcXa3Cl2OB7qzPUlaa0GcFhMjhzJ6P43NIuAssYtnsMEbitby+GropJvP7dbyYmoqY7llrHDbb42K5QsAmyDwURp6GB3xXHbyML3IYEO3UkH5AkedNJKK5bk71xEYK9X9NM9K2R898j/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xsKLxOKV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xsKLxOKV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 71D921A3478;
	Wed, 29 Apr 2026 07:44:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4211160537;
	Wed, 29 Apr 2026 07:44:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E847B107298A5;
	Wed, 29 Apr 2026 09:44:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448695; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BBUTlQzRbcWMTsEb0Kt5D7Leu3NTlQjVFL2I0uveIu0=;
	b=xsKLxOKVcSg85hNBTKS1T7Eabf8uQw5GUSP1e7/cOxGcbansFbn49NMOE9HWf2S8XKMsLZ
	al4bol33Z8sRtOexztmqLkba9zKm2qF5IPJCaz70MfJOSkmySh79WKLEM9yI6OwDExsn2p
	9lCBFUFufyfmzefY1+FUE/vgvd+3dbQaVCqWpPSogx480/Oo3wAU9EDDG5+pNOyylMuQ+p
	DCVZIlZkTHZASlNeD70z0UVmCF89UiHYvGk1TKqWeLCaV9mjdREdwM0/Jys6P0/okgVe0y
	7c/vTRHlN8fRMZosrtFFUuTM4KGOSMEzERHq05Lcg/W91GVlHFceawl/5xB6HA==
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
Subject: [PATCH v2 17/17] MAINTAINERS: Add the ASoC gpio audio amplifier entry
Date: Wed, 29 Apr 2026 09:43:53 +0200
Message-ID: <20260429074356.118420-18-herve.codina@bootlin.com>
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

After contributing the component, add myself as the maintainer for the
ASoC gpio audio amplifier component.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..4bd360f7aa80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24985,6 +24985,13 @@ F:	include/sound/dmaengine_pcm.h
 F:	sound/core/pcm_dmaengine.c
 F:	sound/soc/soc-generic-dmaengine-pcm.c
 
+SOUND - SOC LAYER / GPIO AUDIO AMPLIFIER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/gpio-audio-amp.yaml
+F:	sound/soc/codecs/simple-amplifier.c
+
 SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEMENT (ASoC)
 M:	Liam Girdwood <lgirdwood@gmail.com>
 M:	Mark Brown <broonie@kernel.org>
-- 
2.53.0

