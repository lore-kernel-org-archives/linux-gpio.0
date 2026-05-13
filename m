Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBD939A4BA;
	Wed, 13 May 2026 08:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660259; cv=none; b=fTowVCZ3jcwbdXjH5YKe1VZaTA8g6KJnOUeou4jrkZI2BUu2xtsT593jl6pNFczGQmim51AMnlbrNlh2KwC+3vSmgaqjagdcp2NtNQUHaA1D4pGDo0v97EABaNtgrqCwy/HxRoUFhjwOBVDRBxxfgsHb/tMjBk6WR0ak/xk5hlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660259; c=relaxed/simple;
	bh=8GJOpBRFIR3Q6Jjms4aMWKWm4vNAmFqwrHNEBT1DlaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTzVGvAS73wKuAHTqhJvxGTlHmBHyNjOFB0rpc+bABe+cepXg8FyWYB61T5dFcXVXy4rJELfLwHQwl8m6sK/oNG1Tua3GpCtKU8+JmVdLl/Y2GjLml3urlMJvGj6upJbwr/JDKKEVEO2coVaZXm090HKYfsYbz8b5d2m/Akil90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BvzfyxZ4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BvzfyxZ4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4D49F1A3596;
	Wed, 13 May 2026 08:17:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13BE2606CE;
	Wed, 13 May 2026 08:17:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27BD711AF8D79;
	Wed, 13 May 2026 10:17:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660255; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QmhmB5OxdeBRRp/GKwqgGtcFFCxGWD8fFdPxKo0LR/k=;
	b=BvzfyxZ4zhZ6i7aocXLH/mstS1SMrL6IncXvSE5RZG2OrVswroUNyemGDy+qGZqmNCrh34
	vODMbENFXZZPtJFdv4C6FzWrPUuF5GPjzeFWKXyQoYDogkpp2G7hy0ozx15SXy1NwvH3FB
	2NvpZA5dcv+oi+zjYHY3f09xBeOouRCcYzMB6BNQgF8NPCxV48Dzc2TQ7XldTSuLFkPanY
	v8uLw4JnzUt1czsOWD91xbuTjTPYrZ98g8hMKz5hmzBehmstHC/l+u0c2vkFM8tzTdvOsB
	CfqX7caeNO02bL6QswKiF0mHa9p69xTOxA7NhsQAdZxopVZ4fRYIAY4VE8B0Pg==
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
Subject: [PATCH v3 08/17] ASoC: simple-amplifier: Remove DAPM widgets and routes from the ASoC component driver
Date: Wed, 13 May 2026 10:16:52 +0200
Message-ID: <20260513081702.317117-9-herve.codina@bootlin.com>
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
index 231e84ab4c0e..3e644c1c2696 100644
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
+		dev_err(dev, "Failed to add basic dapm routes (%d)\n", ret);
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
2.54.0

