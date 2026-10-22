Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635827;
	b=bbRSyHqtnzqdhrVo1U1Ra8WNYxr7tSS23W5DRHRnVxVQBYS7h8bUJB5p4lRvHRaKM/L+
	 eO76hhfNiYmxGptU3ve4+G9ZbfypoJKLLzIYPPRsdYQ6U5V+EcCz2tR+XYT40OHrU3R6n
	 SnKXKkiOj9K87eHTIDn4h5LK/faJn2hnnSbYcOhl9OxBRb4riOTSBgsObtQOPZXSWwdJe
	 NB3g25UmZdABqS4bCI0RJfXq0Sjq5GZWv79ZYIoDYA5dz4XLfLFxUeZx0NXBcC3Q6WNHl
	 P9YCvMoi4LQb58us3NPjYWERsaZofuy/qFVRCqVfq6ycinDDd4J3na5vuNKARQKbBug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BL3IHRvJ9+gWwxp3abRrWJFWvxWrWClVc4DpkC67oPM=;
	b=l7qsAi7D33mVfrvi+ASZ/KNZ78YVsuwTMVxLTa8q0kMpPKVG+QTggn26NsPvDHxtT74o
	 gM509QWM4A2H0hE6/Mzh/oJxuuL5Jr+uwktaD93ZStvAetpnXFg8sDt7FFf3PCZkzbVy0
	 q+DSR/KaJB2MvMrLgDbnpv+e9W4HWJtK/OaGEBoMAgapVlca5iSbMHrF9hBda+FT4fDfi
	 VsICH7cUzPH/Nj6ZfC0lRBlgCpWgLFZM4vvSd1OBma6E1X27gRqdlRxzF48+ze/px2Uvv
	 bPDZDXqVKYOgPSzsW5+zOSJ4asef13PlVaVxezp6pbS3rM9Ee1ODqt1jJaOfZzG8vTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jDW3F65f;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9809606A31B
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 02:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9809606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jDW3F65f
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so249083a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 19:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792635826; x=1793240626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BL3IHRvJ9+gWwxp3abRrWJFWvxWrWClVc4DpkC67oPM=;
        b=jDW3F65fISoaz7+amfP89O1a+TNphBoF8sXcXEbXqNHiXy05gjaPxmmP9qspk2t3Fe
         JuQCtSOIZh6fLy5lcF9Kter3YdL6FRhO/CO4tzPoK/DzJ/956HE5p99gDAJEvuqWjK9I
         6y27cGBiAxdHopYyhntNX6nkFY8E0t5VOpEYqWJBvTiIp/u//Id8fFNHFT2Ud2wIe6oZ
         ZV0fDoNkiPdJMqbJSJGGtEoBjSXRNT+3hxGTQXsApCGeJRL3YabEWqheiTZJC2XqwOoQ
         4hWOsmEdjS7+ffdURfEqu+v5M4I1nSwbx3uygcurNxU4OB9C34H1vX1lmI+DdqpFOsCj
         vQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635826; x=1793240626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BL3IHRvJ9+gWwxp3abRrWJFWvxWrWClVc4DpkC67oPM=;
        b=lW72EEaN33LX+eQjGQNzbN14qjWWdMuSoICwtcFPcmgByAkp/8iKyGk64qbvFzQeyz
         YATSYfZ61g1J4DGOnmgfEiqQiDnCFIG4rGAMp8c02uskD3YhZqb8r/DbqKCFDV+srLAy
         fGl/ilDbei5ore8v46oZZvRjQrJzqckYEh84Rhlzqw/RRMKY/wZPsUQHRSE516cW7XGC
         WTkKnYtS8daur+XLYRvOz4CT7IB7UDqaFXtcTIuj5nu1pBkKkgfP8Ca+vX24KTdIr554
         rVsX3BJsNr9Sy80Ppo0BYUXh7nrYGAaPVnO9atplw0OwwVJdyG7BjjYTosY+SaIckNdO
         mExA==
X-Forwarded-Encrypted: i=1; AKwUvBxx85n/osAhtS+8Wi7flQhtYzArH/HnPaAEVaw1CoSo9A/7vVma6379eogjOGp7Km95DOqqSNBzIKut@vger.kernel.org
X-Gm-Message-State: AFq9FYIHhrtzHIUpjx3Aa5EYm6l4jlcIUh368hoD40z8Hj7LcLY/bLpy
	ZgWlywRs8HH/avQ7n0xJd2ub6+WovwuR0i+970JGoqzwDKvYT/Cu/dKowWifTph1
X-Gm-Gg: AYBFou0tQAxbuG+Dxs9VS5xvg/c0BDr2F0Kc05p0+XWMBZc2NyF73aiB4QxSfC66xgZ
	6LssFp96rzi/ZPsJiEbOiNVekurbfiPapFEXIRsFhsHfnaHbbsR885mvta06MoaMnefdnyqzBba
	0ziSCGAcy+H2KQe31TnhxWqoKTBs7S6Cd4otqhATNbL3Obv3ECs6iremsEqyO6GWdbiqkkmcjMr
	xyFnuIzjBU8RG2RO+l/Wd+3hcFgIQGO6eWm0uwpbR4Az7YbUHb2z/nWL3ZDr5OFS9eoknKNeP6r
	IuYLc07AQTVkhPlxDBzdIk5hYJG/qEeIoV4UiIe/U0sKrqPUWqELZuCnNmc0q9UM1BPAAod7knN
	RPAhtxD4ZYFKmL15f4byRyFOJ7AdOXEVA3+mS1oszgaZ9qYLNNjQH8IcOEIYHQZ0COsl4gZtteK
	C0cUFYzXq8MK/+hH1Dte0DzaA4NgDnLxGQ7Do0a1Pt2fCxfE4pfe1sqUZFfuEzZdAUoZJserCGp
	Wl1hgaX6qqAHqHGxLJSmMttV/wfAmqI2sVv330LT0BEY8NLMYtAmLyIbQEoaGAxEWuN0WVOw8qH
	d86gQ4FxcJ1SchxMajq4YpzR6IvrR+5mrsVDOtbFB+ex2ztSCN5PoQKOlMPyPes3jpJmspmAuP7
	pZ74MjX3JOR3YfXM365p60G5zz1/n
X-Received: by 2002:a17:90b:4c85:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3ada6c8842emr643889a91.21.1792635825946;
        Wed, 21 Oct 2026 19:23:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4954979sm1783949a91.17.2026.10.21.19.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:23:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set))
Subject: [PATCH ath-next] wifi: ath9k: release the LED GPIO after ath9k_stop()
Date: Wed, 21 Oct 2026 19:23:43 -0700
Message-ID: <20261022022343.1409432-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath9k_deinit_device() frees the LED pin in ath_deinit_leds() before it
unregisters the hw. ath9k_stop() then switches the LED pin back to an
input with ath9k_hw_gpio_request_in(). For a SoC GPIO outside of the
WMAC, ath9k_hw_gpio_request() takes a new descriptor through
gpiod_get_index() at that point, and nothing releases it again. The
next probe fails with "request GPIO12 failed:-16" and every LED update
hits the WARN_ON() in ath9k_hw_set_gpio(). That request also runs
under sc->sc_pcu_lock, while gpiod_get_index() and
gpiod_set_consumer_name() may sleep.

Free the LED pin after ieee80211_unregister_hw() instead. This also
frees the pin when the LED class device could not be registered,
which leaked it before.

Seen on a TP-Link Archer C7 v2 (QCA9558, LED on SoC GPIO 12) when
reloading ath9k.

Fixes: e34f2ff40e03 ("ath9k: bring back direction setting in ath9k_{start_stop}")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath9k/gpio.c | 2 --
 drivers/net/wireless/ath/ath9k/init.c | 5 +++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/gpio.c b/drivers/net/wireless/ath/ath9k/gpio.c
index 2dbc7efdd637..d525d8ef9369 100644
--- a/drivers/net/wireless/ath/ath9k/gpio.c
+++ b/drivers/net/wireless/ath/ath9k/gpio.c
@@ -67,8 +67,6 @@ void ath_deinit_leds(struct ath_softc *sc)
 
 	ath_led_brightness(&sc->led_cdev, LED_OFF);
 	led_classdev_unregister(&sc->led_cdev);
-
-	ath9k_hw_gpio_free(sc->sc_ah, sc->sc_ah->led_pin);
 }
 
 void ath_init_leds(struct ath_softc *sc)
diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath/ath9k/init.c
index a7a11781d83d..f6aa2ec1683c 100644
--- a/drivers/net/wireless/ath/ath9k/init.c
+++ b/drivers/net/wireless/ath/ath9k/init.c
@@ -1128,6 +1128,11 @@ void ath9k_deinit_device(struct ath_softc *sc)
 	ath9k_deinit_debug(sc);
 	ath9k_deinit_wow(hw);
 	ieee80211_unregister_hw(hw);
+
+	/* release the LED pin only after ath9k_stop() has configured it */
+	if (sc->sc_ah->led_pin >= 0)
+		ath9k_hw_gpio_free(sc->sc_ah, sc->sc_ah->led_pin);
+
 	ath_rx_cleanup(sc);
 	ath9k_deinit_softc(sc);
 }
-- 
2.56.0

