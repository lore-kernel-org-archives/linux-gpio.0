Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C763AEF5A;
	Wed, 29 Apr 2026 07:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448677; cv=none; b=aCRWItzxjXvA5Uiucr/2963iGfjewIfXz3lX4FG6s6uKmBrLSE6M5TtsSLVoSCqE4r2z9V8p4Qa7t2YiCa8xil8uMB+vsj/WRMBEwF8Xar2iBSzGBXNmk/LeDFO/Eqh5AYHFTXfTxxmk/B8gVETAzT5vs78krvsfF2pC9RDqcp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448677; c=relaxed/simple;
	bh=vVKKVyKp/qwA8AdVso5ibgvuvR7GBzwqC4CkNXDx9wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FSh1La/ZGeB2IVWavECg5BXKoZ349ON6dZ0X2iORrJ+WUkvnvUHwrptMH+Gnvg48i6BJRl4IkEkgax6PFf9rAFSiZ5N7y69Y127CfdVLfdgpxTz8P6DK1lw+FNZY7rPIQg2OxXYjpyhC9m3I+PksJZZHaXB3BLFaJUdgyVXedHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AT29UGus; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AT29UGus"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 40AA31A347B;
	Wed, 29 Apr 2026 07:44:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15C14601DF;
	Wed, 29 Apr 2026 07:44:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22AB51072989D;
	Wed, 29 Apr 2026 09:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448670; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IImuxyRt4AUe1c5zMGGQ7zAe+xjD+QDQeQvNd5COxME=;
	b=AT29UGusHqPwkfJDaIZCZYwes3PUpu85Q+HtryPhqc4Gl4PSZR7+J9xvkUG18/JbzKPXp+
	vKioYCc0VghPxQd9SGYXucl7ULQusW0q49O9BUmRiqq36sJS7wPvs48fgZws+A8RZiEyr+
	UgevavtRFab0NWneW2W6jxkBs8mcPKyizBvrmGU7EUpKZyUvRp4NZ2Qo9PQuyubIhp8I/a
	krSCDxNXSn8wJm6j+t4xfrNknz68ESSg55WAC+mtljrreuDmdyZrMiFmexl36hpPJveguq
	u1aW7vs2GFxPcJfsjaLGbea7kpbzEfMd9hIlnJcIsSc9JIBqcjHf6SFNd4SgDA==
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
Subject: [PATCH v2 08/17] ASoC: simple-amplifier: Remove DAPM widgets and routes from the ASoC component driver
Date: Wed, 29 Apr 2026 09:43:44 +0200
Message-ID: <20260429074356.118420-9-herve.codina@bootlin.com>
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

The simple-amplifier set the DAPM wigets and routes table in the ASoC
component driver. This is perfectly fine when the component has well
known DAPM tables.

The simple-amplifier is going to handle several kind of components based
on the driver compatible string. The DAPM table will not be the same for
all components supported by the driver.

In order to have different DAPM table based on matching compatible
strings, move those tables from the ASoC component driver to the device
compatible string matching data.

Add those DAPM widgets and routes dynamically during the ASoC component
probe operation.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 59 ++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 231e84ab4c0e..a70f70566340 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -11,7 +11,15 @@
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 
+struct simple_amp_data {
+	const struct snd_soc_dapm_widget *dapm_widgets;
+	unsigned int num_dapm_widgets;
+	const struct snd_soc_dapm_route *dapm_routes;
+	unsigned int num_dapm_routes;
+};
+
 struct simple_amp {
+	const struct simple_amp_data *data;
 	struct gpio_desc *gpiod_enable;
 };
 
@@ -58,11 +66,39 @@ static const struct snd_soc_dapm_route simple_amp_dapm_routes[] = {
 	{ "OUTR", NULL, "DRV" },
 };
 
+static int simple_amp_add_basic_dapm(struct snd_soc_component *component)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	struct simple_amp *simple_amp = snd_soc_component_get_drvdata(component);
+	struct device *dev = component->dev;
+	int ret;
+
+	/* Add basic dapm widgets and routes */
+	ret = snd_soc_dapm_new_controls(dapm, simple_amp->data->dapm_widgets,
+					simple_amp->data->num_dapm_widgets);
+	if (ret) {
+		dev_err(dev, "Failed to add basic dapm widgets (%d)\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(dapm, simple_amp->data->dapm_routes,
+				      simple_amp->data->num_dapm_routes);
+	if (ret) {
+		dev_err(dev, "Failed to basic dapm routes (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int simple_amp_component_probe(struct snd_soc_component *component)
+{
+	/* Add basic dapm widgets and routes */
+	return simple_amp_add_basic_dapm(component);
+}
+
 static const struct snd_soc_component_driver simple_amp_component_driver = {
-	.dapm_widgets		= simple_amp_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(simple_amp_dapm_widgets),
-	.dapm_routes		= simple_amp_dapm_routes,
-	.num_dapm_routes	= ARRAY_SIZE(simple_amp_dapm_routes),
+	.probe = simple_amp_component_probe,
 };
 
 static int simple_amp_probe(struct platform_device *pdev)
@@ -75,6 +111,10 @@ static int simple_amp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, simple_amp);
 
+	simple_amp->data = of_device_get_match_data(dev);
+	if (!simple_amp->data)
+		return -EINVAL;
+
 	simple_amp->gpiod_enable = devm_gpiod_get_optional(dev, "enable",
 							   GPIOD_OUT_LOW);
 	if (IS_ERR(simple_amp->gpiod_enable))
@@ -86,9 +126,16 @@ static int simple_amp_probe(struct platform_device *pdev)
 					       NULL, 0);
 }
 
+static const struct simple_amp_data simple_audio_amplifier_data = {
+	.dapm_widgets		= simple_amp_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(simple_amp_dapm_widgets),
+	.dapm_routes		= simple_amp_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(simple_amp_dapm_routes),
+};
+
 static const struct of_device_id simple_amp_ids[] = {
-	{ .compatible = "dioo,dio2125", },
-	{ .compatible = "simple-audio-amplifier", },
+	{ .compatible = "dioo,dio2125",		  .data = &simple_audio_amplifier_data},
+	{ .compatible = "simple-audio-amplifier", .data = &simple_audio_amplifier_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, simple_amp_ids);
-- 
2.53.0

