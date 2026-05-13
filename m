Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D613A4F37;
	Wed, 13 May 2026 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660265; cv=none; b=M8OP7QGZCdjZQZE737eSAWAQNOW+hNaF3uJUvhIlhRWdNm81cxD61pHYUgDrcXq1iNk3uPzPEpvwdr+oIZykRlp0Lo3Zf7vPoeDGrbievKIIZCrkbH42JoisGM1MvTdjTsLdBorNN9wQ08KbEwn8aqBJvBUJy6ZT4IIKDWYWRrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660265; c=relaxed/simple;
	bh=SfKTvet7I9Yd49AwQ0fendbCDIXL4cK54A5ucMc0lbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4oGKyyorgzm98bVxCzpQB0VffA9ptYSUmSE8XyuqE1dWUiwM9X1WgjwouNTYKaAfciQADvgrM16UiWTWAnrf/Ew21VPqy2isY0IpSA9MeNyFZG+uBLGyvEEd6ULH6SGCPgIuI/Ic4IgVf+pKCfYmeNs2H8y4kk7gB9agZ8h/pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iggvSsA9; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iggvSsA9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5ECD5C5E175;
	Wed, 13 May 2026 08:18:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 071B2606CE;
	Wed, 13 May 2026 08:17:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 474DE11AF8D8E;
	Wed, 13 May 2026 10:17:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660262; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8T3355NEiGiFMMQ+Gq+ntvtR7OJGdhXwgC2fxHQznpk=;
	b=iggvSsA9fRr4v/shwsrgMcpPud3l/43uVVoO4XnLUcYNWR2r87jhrPXwH2I8gTKMfVIkFv
	DZ6VRFMTspEVZw7Z+Qemcr9aC4orae+ShNLsUeM3tkLdiSUgjvsyTpRsm9fHLuRmisqmxk
	V5Iw5FYnk9RA773vSKm1nXktUMN2o0WkAHF/1K/9G4KHqMERMN/oHs43qVwKCk/rAJDcdl
	KssQ5xM7vzEEnatzA3WlDEF21T/wM77pfZhOfRlNIBb5BaqUyGkKoqXQ9sagDA5Yy7q/Zt
	mMpcm4XkhVx2/iEI98xpbxl0iB/MqtiK9Z9zBZzq+LfkJiimTWcNaP+UdBCOFw==
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
Subject: [PATCH v3 11/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for mute gpio
Date: Wed, 13 May 2026 10:16:55 +0200
Message-ID: <20260513081702.317117-12-herve.codina@bootlin.com>
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

A gpio can be used to control the amplifier mute feature.

Add support for this mute gpio.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 127 +++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 89e7e9e53b03..c8991e340def 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -12,10 +12,18 @@
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 
+struct simple_amp_single {
+	struct gpio_desc *gpio;
+	bool is_inverted;
+	int kctrl_val;
+	const char *control_name;
+};
+
 struct simple_amp_data {
 	unsigned int supports;
 #define SIMPLE_AUDIO_SUPPORT_PGA		BIT(0)
 #define SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES	BIT(1)
+#define SIMPLE_AUDIO_SUPPORT_MUTE		BIT(2)
 
 	const struct snd_soc_dapm_widget *dapm_widgets;
 	unsigned int num_dapm_widgets;
@@ -26,6 +34,7 @@ struct simple_amp_data {
 struct simple_amp {
 	const struct simple_amp_data *data;
 	struct gpio_desc *gpiod_enable;
+	struct simple_amp_single mute;
 };
 
 static int simple_amp_power_event(struct snd_soc_dapm_widget *w,
@@ -103,6 +112,78 @@ static const struct snd_soc_dapm_route simple_amp_stereo_pga_dapm_routes[] = {
 	{ "OUTR", NULL, "PGA" },
 };
 
+static int simple_amp_single_kctrl_write_gpio(struct simple_amp_single *single,
+					      int kctrl_val)
+{
+	int gpio_val;
+
+	gpio_val = single->is_inverted ? !kctrl_val : kctrl_val;
+
+	return gpiod_set_value_cansleep(single->gpio, gpio_val);
+}
+
+static int simple_amp_single_kctrl_info(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	return 0;
+}
+
+static int simple_amp_single_kctrl_get(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct simple_amp_single *single = (struct simple_amp_single *)kcontrol->private_value;
+
+	ucontrol->value.integer.value[0] = single->kctrl_val;
+
+	return 0;
+}
+
+static int simple_amp_single_kctrl_put(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct simple_amp_single *single = (struct simple_amp_single *)kcontrol->private_value;
+	int kctrl_val;
+	int err;
+
+	kctrl_val = ucontrol->value.integer.value[0] ? 1 : 0;
+
+	if (kctrl_val == single->kctrl_val)
+		return 0;
+
+	err = simple_amp_single_kctrl_write_gpio(single, kctrl_val);
+	if (err)
+		return err;
+
+	single->kctrl_val = kctrl_val;
+
+	return 1; /* The value changed */
+}
+
+static int simple_amp_single_add_kcontrol(struct snd_soc_component *component,
+					  struct simple_amp_single *single)
+{
+	struct snd_kcontrol_new control = {
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = single->control_name,
+		.info = simple_amp_single_kctrl_info,
+		.get = simple_amp_single_kctrl_get,
+		.put = simple_amp_single_kctrl_put,
+		.private_value = (unsigned long)single,
+	};
+	int ret;
+
+	/* Be consistent between single->kctrl_val value and the GPIO value */
+	ret = simple_amp_single_kctrl_write_gpio(single, single->kctrl_val);
+	if (ret)
+		return ret;
+
+	return snd_soc_add_component_controls(component, &control, 1);
+}
+
 static int simple_amp_add_basic_dapm(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
@@ -207,6 +288,21 @@ static int simple_amp_component_probe(struct snd_soc_component *component)
 			return ret;
 	}
 
+	if (simple_amp->mute.gpio) {
+		/*
+		 * The name of the GPIO used is mute. According to this name, 1
+		 * means muted and 0 means un-muted.
+		 *
+		 * An inversion is expected by ALSA. Indeed from ALSA point of
+		 * view, 1 means 'on' (un-muted) and 0 means 'off' (muted).
+		 */
+		simple_amp->mute.is_inverted = true;
+		simple_amp->mute.kctrl_val = 1; /* Un-muted */
+		ret = simple_amp_single_add_kcontrol(component, &simple_amp->mute);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -214,10 +310,26 @@ static const struct snd_soc_component_driver simple_amp_component_driver = {
 	.probe = simple_amp_component_probe,
 };
 
+static int simple_amp_parse_single_gpio(struct device *dev,
+					struct simple_amp_single *single,
+					const char *gpio_property)
+{
+	/* Start with the inactive value */
+	single->is_inverted = false;
+	single->kctrl_val = 0;
+	single->gpio = devm_gpiod_get_optional(dev, gpio_property, GPIOD_OUT_LOW);
+	if (IS_ERR(single->gpio))
+		return dev_err_probe(dev, PTR_ERR(single->gpio),
+				     "Failed to get '%s' gpio\n",
+				     gpio_property);
+	return 0;
+}
+
 static int simple_amp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct simple_amp *simple_amp;
+	int ret;
 
 	simple_amp = devm_kzalloc(dev, sizeof(*simple_amp), GFP_KERNEL);
 	if (!simple_amp)
@@ -234,6 +346,15 @@ static int simple_amp_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(simple_amp->gpiod_enable),
 				     "Failed to get 'enable' gpio");
 
+	if (simple_amp->data->supports & SIMPLE_AUDIO_SUPPORT_MUTE) {
+		ret = simple_amp_parse_single_gpio(dev, &simple_amp->mute, "mute");
+		if (ret)
+			return ret;
+	}
+
+	/* Set controls name */
+	simple_amp->mute.control_name = "Switch";
+
 	return devm_snd_soc_register_component(dev,
 					       &simple_amp_component_driver,
 					       NULL, 0);
@@ -248,7 +369,8 @@ static const struct simple_amp_data simple_audio_amplifier_data = {
 
 static const struct simple_amp_data simple_audio_mono_pga_data = {
 	.supports		= SIMPLE_AUDIO_SUPPORT_PGA |
-				  SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES,
+				  SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES |
+				  SIMPLE_AUDIO_SUPPORT_MUTE,
 	.dapm_widgets		= simple_amp_mono_pga_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(simple_amp_mono_pga_dapm_widgets),
 	.dapm_routes		= simple_amp_mono_pga_dapm_routes,
@@ -257,7 +379,8 @@ static const struct simple_amp_data simple_audio_mono_pga_data = {
 
 static const struct simple_amp_data simple_audio_stereo_pga_data = {
 	.supports		= SIMPLE_AUDIO_SUPPORT_PGA |
-				  SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES,
+				  SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES |
+				  SIMPLE_AUDIO_SUPPORT_MUTE,
 	.dapm_widgets		= simple_amp_stereo_pga_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(simple_amp_stereo_pga_dapm_widgets),
 	.dapm_routes		= simple_amp_stereo_pga_dapm_routes,
-- 
2.54.0

