Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500003AB299
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448685; cv=none; b=qNhkL7XGHfflGfN+EVE8hwFI+nvhX7veVVs9G3Cnhs/WNxxUmn0E4iDn+MKCEWeen/LGhwQm1D7mbzgAz3HTvkdDqO1tbr3ORVjFTwWt06I8wq/jADxsZNOCGF9b1U8VbiqkSV5Y1lg8/IQ3L6iL+tOvpLkJXCkf8bk4h8tRabM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448685; c=relaxed/simple;
	bh=VUvxQjxqrGJ95aqwSTD02nv/W6p6NukiI/tlT9PyKbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eInkt3wjyoDzKgMTmCfO3Ia1DxDOgpNKXYPWcF8qxj7xzPq+lnQbO8PJprr5/hgu2po0II+Ipu+qQ0isCHXWD0xCxS5RtDzJvW7AKKUwo+Y0SA2SV1IpgZVkUdp8DmBDhGD3eRODj9qLcE0YKa4lj3VKioGFZw15tv+8eqTK8rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wf5qZ9pC; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wf5qZ9pC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 30F16C5CD50;
	Wed, 29 Apr 2026 07:45:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F2E4601DF;
	Wed, 29 Apr 2026 07:44:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0B561072826C;
	Wed, 29 Apr 2026 09:44:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448681; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wV/IA5SaUiFJcnHQD1RBlfYGOPSCgkC9o3PWpTHKxJ0=;
	b=wf5qZ9pCbJ38pZseUphuRMMR9ZhDO4lBBZxGjajsrdXiY2aErET8Tvb+v5W8vH3JE68dkV
	5bWNx6vG+/Qz23V4tWxRP4704TqnNPqOnpAQRhF4fI8/O4CcA9jdkmgAe1vjPzmUI7aSNo
	KVKF9vP0foP6krwFDf2g/x+hCuIksKRBPneMjPPWRSUFRBl6FfZOPpvEq9bz2e8ndcQN21
	MzkAyqUP2MpeBlyzIepbYe7rmydAM0qLx1jCx622JH/8zB7Ka9Q33XysxZJgbWNJlg8E4/
	AzFe3zA96w13kln1F6Hn1yWINGPuFQAQk5so6xBylDQZNFk3C8KPEi3aVn+uZg==
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
Subject: [PATCH v2 12/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for bypass gpio
Date: Wed, 29 Apr 2026 09:43:48 +0200
Message-ID: <20260429074356.118420-13-herve.codina@bootlin.com>
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

A gpio can be used to control the amplifier bypass feature.

Add support for this bypass gpio in the same way as it has been done for
the mute gpio.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 61d1cbb0661d..1c845272509c 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -24,6 +24,7 @@ struct simple_amp_data {
 #define SIMPLE_AUDIO_SUPPORT_PGA		BIT(0)
 #define SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES	BIT(1)
 #define SIMPLE_AUDIO_SUPPORT_MUTE		BIT(2)
+#define SIMPLE_AUDIO_SUPPORT_BYPASS		BIT(3)
 
 	const struct snd_soc_dapm_widget *dapm_widgets;
 	unsigned int num_dapm_widgets;
@@ -35,6 +36,7 @@ struct simple_amp {
 	const struct simple_amp_data *data;
 	struct gpio_desc *gpiod_enable;
 	struct simple_amp_single mute;
+	struct simple_amp_single bypass;
 };
 
 static int simple_amp_power_event(struct snd_soc_dapm_widget *w,
@@ -303,6 +305,12 @@ static int simple_amp_component_probe(struct snd_soc_component *component)
 			return ret;
 	}
 
+	if (simple_amp->bypass.gpio) {
+		ret = simple_amp_single_add_kcontrol(component, &simple_amp->bypass);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -352,8 +360,15 @@ static int simple_amp_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (simple_amp->data->supports & SIMPLE_AUDIO_SUPPORT_BYPASS) {
+		ret = simple_amp_parse_single_gpio(dev, &simple_amp->bypass, "bypass");
+		if (ret)
+			return ret;
+	}
+
 	/* Set controls name */
 	simple_amp->mute.control_name = "Switch";
+	simple_amp->bypass.control_name = "Bypass Switch";
 
 	return devm_snd_soc_register_component(dev,
 					       &simple_amp_component_driver,
@@ -370,7 +385,8 @@ static const struct simple_amp_data simple_audio_amplifier_data = {
 static const struct simple_amp_data simple_audio_mono_pga_data = {
 	.supports		= SIMPLE_AUDIO_SUPPORT_PGA |
 				  SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES |
-				  SIMPLE_AUDIO_SUPPORT_MUTE,
+				  SIMPLE_AUDIO_SUPPORT_MUTE |
+				  SIMPLE_AUDIO_SUPPORT_BYPASS,
 	.dapm_widgets		= simple_amp_mono_pga_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(simple_amp_mono_pga_dapm_widgets),
 	.dapm_routes		= simple_amp_mono_pga_dapm_routes,
@@ -380,7 +396,8 @@ static const struct simple_amp_data simple_audio_mono_pga_data = {
 static const struct simple_amp_data simple_audio_stereo_pga_data = {
 	.supports		= SIMPLE_AUDIO_SUPPORT_PGA |
 				  SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES |
-				  SIMPLE_AUDIO_SUPPORT_MUTE,
+				  SIMPLE_AUDIO_SUPPORT_MUTE |
+				  SIMPLE_AUDIO_SUPPORT_BYPASS,
 	.dapm_widgets		= simple_amp_stereo_pga_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(simple_amp_stereo_pga_dapm_widgets),
 	.dapm_routes		= simple_amp_stereo_pga_dapm_routes,
-- 
2.53.0

