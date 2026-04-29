Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C857A3A7855;
	Wed, 29 Apr 2026 07:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448671; cv=none; b=bUygwhcB09PBCqexKZs03fTpXkJMT0OsN+bm2WJ8mcN+KBD3roJstXRqbgICxGwpKTXfg17KXAgXBIS8WI47Iq+IiiUeb3OTgJ+O/KCt1KB6YvLEA4+k8GPpIJMt9fvtEINz+NZmPMhRj3Sh7yP18pMU01TszwHOl7grIGMh67o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448671; c=relaxed/simple;
	bh=Hgc2uiWzscD7t/E3wgC9iKLt80BoqxNLjQKgfvNVCIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AP/eQv85hlcdlDwsHOtqwAanVW/jjrkOIcXt9cnKYaq/9qi5VcxbTVJ09Z7lug0nM9ZxqTLssHfWAazWUhCL/rRFEunLjGS5JVuPlHjF8fIwMKbv+5trO2+wEqwXsqSdV+hF88ztUddESA2UpaHKVGfKza1ZjU2t+fmwKqlwRdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ex7TX76q; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ex7TX76q"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 490F3C5CD5A;
	Wed, 29 Apr 2026 07:45:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46DD7601DF;
	Wed, 29 Apr 2026 07:44:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05BCE1072989B;
	Wed, 29 Apr 2026 09:44:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448665; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MDWbndD0MDPCeru1OfQ7pxS5JaPa/gaaif8SAMi6MO8=;
	b=Ex7TX76q53iLj9ujUT51zN0Qh4luveldr+SCzvFBKzPk0pxUbJ9tym8dYPN0eLkpls5l+5
	tvgvDGj0Mw1A7GKs22CJkYamdYqC7uqJoQmKId9yQnUbIeUy0btJaVAj71NGfsLGAyabVR
	+86P6V2c7klbQK5bhCSPVs5wRhmF8JX+lr3xHQHqrQyLS7gcR3QFvzWlEigfPCz3+UXxV6
	xpdsSf3Q6rba7izjZypcAh39pyxZnmVR59QWACIxj8jCx5MH4uMczTOtnf0greIesTtPZ/
	ynFrdhvZkwW3U/Oa3h2Wm09cSUBWK0wEzKc8mSq7jgcvc2x4mbm2+GUrH9Tjfw==
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
Subject: [PATCH v2 06/17] ASoC: simple-amplifier: Rename drv_event() function
Date: Wed, 29 Apr 2026 09:43:42 +0200
Message-ID: <20260429074356.118420-7-herve.codina@bootlin.com>
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

The drv_event() is used to handle power events related to the DRV item.

Later, with the support for gpio-audio-amp, this function will be
also used to handle power events related to the PGA item.

Also, more functions will be added in the driver and it is a common
usage to prefix functions based on the driver name.

Rename the drv_event() function to simple_amp_power_event() to follow
common usage and get rid of the 'drv' term.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 215318ff62fc..8f2daec55134 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -15,8 +15,8 @@ struct simple_amp {
 	struct gpio_desc *gpiod_enable;
 };
 
-static int drv_event(struct snd_soc_dapm_widget *w,
-		     struct snd_kcontrol *control, int event)
+static int simple_amp_power_event(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *control, int event)
 {
 	struct snd_soc_component *c = snd_soc_dapm_to_component(w->dapm);
 	struct simple_amp *priv = snd_soc_component_get_drvdata(c);
@@ -42,7 +42,7 @@ static int drv_event(struct snd_soc_dapm_widget *w,
 static const struct snd_soc_dapm_widget simple_amp_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("INL"),
 	SND_SOC_DAPM_INPUT("INR"),
-	SND_SOC_DAPM_OUT_DRV_E("DRV", SND_SOC_NOPM, 0, 0, NULL, 0, drv_event,
+	SND_SOC_DAPM_OUT_DRV_E("DRV", SND_SOC_NOPM, 0, 0, NULL, 0, simple_amp_power_event,
 			       (SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD)),
 	SND_SOC_DAPM_OUTPUT("OUTL"),
 	SND_SOC_DAPM_OUTPUT("OUTR"),
-- 
2.53.0

