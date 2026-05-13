Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E11F36F8F1;
	Wed, 13 May 2026 08:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660245; cv=none; b=cE0h7zsD7riftX2kUuBrgaMCzr/5ttKdyDXbk/x6AUszHrBaBPZf0TDM2k3vOqVtc4d5HOSuTtQcXRYo9qVVQQb/i5Ds94oM4ooLI7EHLjbSH/taz8yLsNiCiv87sR6f/4wLaZUOEVaOSRFUlSf2b64b84VEwKGWMtEltuK1xEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660245; c=relaxed/simple;
	bh=M8yMpSM7XjzbpOUAk/VXiEKzUTMHC2FDMGzb6F+x5hA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PFmKHhE6+67AqT91nt2uBNmky8yTYKvxUcgGPN1iujwTEBSfPSD+SUfpc2eIuzJBF+wqfL/Eq3XAqmpNesbfnp001OZj+kZr2GLtQmHal4WYl+hYYYzexdbrdXURxGA87bY4URl54ecA7aMbIIxBTPY13naM5uL+E0bi5+NFcQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rUfSPnzr; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rUfSPnzr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F05A4E42C8F;
	Wed, 13 May 2026 08:17:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15F2D606CE;
	Wed, 13 May 2026 08:17:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 621E011AF874F;
	Wed, 13 May 2026 10:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=poGw4kA3VMk0CdToUIWaWE8waPchBLM+U1QHUpsaDXg=;
	b=rUfSPnzrip5Yg0SC47U38h7u3cen5+rYwGClo2RigQb6HfzUuZebaYv/x5euaskAvC4Uo+
	HMPixW9bLggbjl3gL4o+rRW2BqFUBg+qg5UfutFBu6234+MuI+yq7Sd4rYf9HyIOoA9niH
	+ZgGrE1ody2OBTJuF7N3WNnPqMaEECYVT5YbP/e9kWoTMyOqhtm5oipNaoJ/N9RveSAfpQ
	RcGPV/7QUdes9qZtdkGXuhnpQ0qs3mjOm517m9Y+952lZfO24j3ZLXpR/CgJosPVE6lQ0R
	orZuS7g1vGPrLhnv3sBdDNRGXbayXJ7irFYt/YA60ThABF8WbIWcm9Pj47OGUg==
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
Subject: [PATCH v3 00/17] ASoC: Add support for GPIOs driven amplifiers
Date: Wed, 13 May 2026 10:16:44 +0200
Message-ID: <20260513081702.317117-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On some embedded system boards, audio amplifiers are designed using
discrete components such as op-amp, several resistors and switches to
either adjust the gain (switching resistors) or fully switch the
audio signal path (mute and/or bypass features).

Those switches are usually driven by simple GPIOs.

This kind of amplifiers are not handled in ASoC and the fallback is to
let the user-space handle those GPIOs out of the ALSA world.

In order to have those kind of amplifiers fully integrated in the audio
stack, this series introduces the audio-gpio-amp to handle them.

This new ASoC component allows to have the amplifiers seen as ASoC
auxiliarty devices and so it allows to control them through audio mixer
controls.

Compared to previous iteration, this v3 series takes into account
feedback received from Mark and also some comments from Shashiko.

In order to ease the review, I choose to split modifications related
to the merge of the gpio-audio-amp part into the simple-amplfier driver
in several commits.

Best regards,
Hervé

---
Changes v2 -> v3
  v2: https://lore.kernel.org/all/20260429074356.118420-1-herve.codina@bootlin.com/

  Patch 2:
  - Fix a typo s/rignt/right/ (Sashiko)
  - Use the 'int32-matrix' type for gain-ranges property. Indeed the
    gain value can be a negative value (Sashiko).
  - Add 'Reviewed-by: Rob Herring'

  Patch 8:
  - Fix error message

  Patch 11:
  - Clamp the value received in simple_amp_single_kctrl_put() in order
    to have a more robust code (Sashiko)

  Patch 14:
  - Return 'unsigned int *' in simple_amp_alloc_tlv_ranges()
  - Check for existing ranges entirely inside the new one in
    simple_amp_check_new_range().
  - Don't allow an empty ranges array. nb_ranges cannot be set to 0
    anymore (Sahiko).

  Patch 15:
  - Don't allow an empty labels array. nb_labels cannot be set to 0
    anymore (Sahiko).

  Other patches:
    No changes

Changes v1 -> v2
  v1: https://lore.kernel.org/all/20260330101610.57942-1-herve.codina@bootlin.com/

  Rebase on top of v7.1-rc1.

  Patch 1:
  - Add 'Acked-by: Rob Herring'

  Patch 2:
  - Use gpio-audio-amp-* instead of audio-gpio-amp
  - Introduce mono/stereo channel distinction with gpio-audio-amp-mono
    and gpio-audio-amp-stereo compatible strings (needed if the
    "simple-amplifier" compatible string is deprecated in the near
    future).
  - Reduce the maximum numbers of gpios used for gain setting to 16.
  - Use amplifier-N instead of amplifierN in examples
  - Introduce gpio-ranges property and remove the no more needed
    gpio-points and gpio-range properties

  Other patches (full rework):
  - Merge the new audio-gpio-amp driver provided in v1 into the
    existing simple-amplifier driver.
  - Slit modification in several commits.
  - Reduce the maximum number of gpios used for gain setting to 16.
  - Fix a memory leak in case of error in simple_amp_multi_add_kcontrol()
    (Reported by Shahiko).
  - Handle the new gpio-ranges property and drop the support for the no
    more needed properties (gpio-points and gpio-range).
  - Update author and copyright.

Herve Codina (17):
  of: Introduce of_property_read_s32_index()
  ASoC: dt-bindings: Add support for the GPIOs driven amplifier
  ASoC: simple-amplifier: Remove DRV_NAME defined value
  ASoC: simple-amplifier: Add missing headers
  ASoC: simple-amplifier: Remove CONFIG_OF flag and of_match_ptr()
  ASoC: simple-amplifier: Rename drv_event() function
  ASoC: simple-amplifier: Use 'simple_amp' variable name instead of
    'priv'
  ASoC: simple-amplifier: Remove DAPM widgets and routes from the ASoC
    component driver
  ASoC: simple-amplifier: Introduce support for gpio-audio-amp
  ASoC: simple-amplifier: gpio-audio-amp: Add support for extra power
    supplies
  ASoC: simple-amplifier: gpio-audio-amp: Add support for mute gpio
  ASoC: simple-amplifier: gpio-audio-amp: Add support for bypass gpio
  ASoC: simple-amplifier: gpio-audio-amp: Add support for basic gain
  ASoC: simple-amplifier: gpio-audio-amp: Add support for gain-ranges
  ASoC: simple-amplifier: gpio-audio-amp: Add support for gain-labels
  ASoC: simple-amplifier: Update author and copyright
  MAINTAINERS: Add the ASoC gpio audio amplifier entry

 .../bindings/sound/gpio-audio-amp.yaml        | 270 ++++++
 MAINTAINERS                                   |   7 +
 include/linux/of.h                            |   7 +
 sound/soc/codecs/simple-amplifier.c           | 918 +++++++++++++++++-
 4 files changed, 1176 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/gpio-audio-amp.yaml

-- 
2.54.0

