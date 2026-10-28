Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158861;
	b=qAVv51QTqpDLIPRLGeVBrdWFevo+hH/O3iK2D5QYc0+nih11snzPGE9bSImVcXb/hJAM
	 x7SoCblPPnYvSe5XLQcilCtblr+w+2FgDNx8SpluouiTqKOvpqP3SkywgeUeHtaE7DGYy
	 oD/8rI08osessjZAewwPB8ZVJjIO3Pi10TTg0rnDx0LfTCQ6WkJd9LM13lhxC38LVSoiz
	 T8jqavACm47xdsZb+bnviDKjX1oEgdRgh17LLzSKZ0ymdSLZtREOdgn31HdfsGgtx60m4
	 OTEebbvToqBEqx7Q15L90f/3RWSNCbbHHZ1MicmvWfxDM7O8ZMMFLOIniS+Ts0yLEuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DFz26Eku7ZAlqmVMiKR0VvxuKqR6CneczdW4fGPibk8=;
	b=uqDMUyY+c7Je0fDslW7ZUJV+zOJSbOAsbm8/xqJLJbly7fe76Pbes6S1LJSU8VN7lIBt
	 BaiGB8zJwkjj40uZbgxLCwgCP/rYUWl8/4SxRU+cfkBjAyqevMrBQZkXz1KFxmLKn52RT
	 0e66bDwCp2KwnJvTv+vAsaHVyMMgkV0nFE2GFYclQgF1BdUh3/GvqcwhkHvlGYa1fQUKU
	 IQ/Kq2RdqImVyNG9uXweaLuYWjlacKqoUz+7N9vi+gvyKNyDh6ojjPVSjbf1hOR6xP/6e
	 wASWMJyKkhoGFYcDdavM7rAO35ZFVN5m4w5RSx7u2bmsgM7jRrBn612LA3ylwA/byOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KI1fFyCr;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB194606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 03:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB194606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KI1fFyCr
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso225530b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 20:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158860; x=1793763660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFz26Eku7ZAlqmVMiKR0VvxuKqR6CneczdW4fGPibk8=;
        b=KI1fFyCrQ6/xarfMSgFToJby/ICKLKjhUdNrft0pkdzl/Fp/VCteRjr7fHn+bqLLPh
         kBFGBrlTdVT5K/lk9cGG9YnGbToV76MKL3wl85LvLnAair9FceeTHffe6gJR+3+pY2xt
         YaHZPVdlyrV0Zv3EPGNj88rHvBzGkt+lkzF39H0GQpl195JVPBLORJHhGlY/Z6PTrp6D
         XHwI5PXECBihqVS2w7To/hffRaMvR+GsiOsGvPldGwoxY+PGv5vrHzpJb3sicT4Zjdkh
         ro8Okf6LIzVAH8noerCpRrlJ3yPuwWUPi+uGzgF3J78EbALrCRmVGVYdDkv7MrpYSAyO
         c3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158860; x=1793763660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFz26Eku7ZAlqmVMiKR0VvxuKqR6CneczdW4fGPibk8=;
        b=EMNvn/gW0cdHkFbFcmncLrlyMs2VhfgmRmVLgc0nK2Mz4pa+45kR9U7zQ8jz1WD3Wa
         17SrjbJbaSx1TtW/dq5RUKIdTEzOHZAbtxLtzLdudiNrCQa6Iz1hApYnrw78Om6llUE8
         2aCkyud9SISna097g0S4TMvq6xmLrv1PVfJCN9JqMB5ATOJrqvTu0ctl5AX6BR0foJh0
         wy/F0cMoySbVa4Reoez7+t5RIAxjPh//cV/0pjfU7NLTFxk4AFOPP4qre7J3dp0ljbgw
         wurlrd1xrg6n51Z+WuuL5E1KXMDfr1zLiMOOtbhHay1mXqlafkEPBsSvcnTiIW+bDnUX
         84mA==
X-Forwarded-Encrypted: i=1; AKwUvBwJ7M49k9nLRBzaX4Q6iFlHFlpdPaJkV5BrOVQw9+RKFwEoCBYbjL9nrNa+Tm734ypzIotvDDw+G7aE@vger.kernel.org
X-Gm-Message-State: AFq9FYLkWMEFvdjmCTeOt4x5CeyLNmM/gGS3DDypIDXDTU4+JhI+649t
	JA819dA0aXoOCOBSUWsmcimHlOEcEBqqPthJbUuzotf/lfAE6XuBKC1w
X-Gm-Gg: AYBFou1lD1KJrl5F+FEwL6PM13jiRBahAxZOpfB4Yfvx0WjC7T2JN/yw8puLZMsWE0K
	Ij/WqQLUmqmS72B8YP2uwf05ilqjOAfv9alG2sEhxaliyaOyYHAPkyd6GI0koeH4kMcdpRiyX1b
	ZlAu2nUedVRqYqtbYK6clNxgGS/a4KauI0dmKhoZr7kzb/Tq/cbCFwJBkJGoKUZpOv42OSLjAWO
	n7WLc7SPTElBTxcB8ve+WZ8hpfVCYObmth2nZ5Ov/5KOePLkyBtZ4ZmgPrThrQRiydsAVhi2qHJ
	ePdeYxMSnKamY47FoEZ3+yoNDNN0d4ti0fmouZbrta+OL8NGN3Or8O5HylQy1QDrAzodwD0YgjV
	Kz8StrbR8daNG42MZgvZyYuxtcVjVOYWWvvSMEtt4TXLCwCmFYOm3wWUOj6qrCWIti40Ewqvats
	yqvZYZLqdfLWcuVyrdveiBJ+wf/e1SlKYng92bnPgtdh4MGyQSg6pyhqRUXO2/EQFLnGc28/+6+
	Ls4dCzjteUD/t4/ClNMmtaLsCGBWmWGKluKkOjRnh3+70Qlqab8eXDW07JsTgE5fd4jz3ZcwYb6
	iybWxdEoxohGq7WabsVujenpMLYLQBqQA7i4R4RovUN9RBTvwlrN4H0QjzLop6voGFTNyl9CNnL
	fWRn7Ku/xUE+RGAwI0dk+ixqXNCqJnKC4UX6j6p2LAf/0SDivVacyHD0PEoOCwPhP/OeBJ5xlNz
	zyNA==
X-Received: by 2002:a05:6a00:ab0d:b0:8a0:7dc4:95c0 with SMTP id d2e1a72fcca58-8a6e6b175a6mr1061341b3a.15.1793158860024;
        Tue, 27 Oct 2026 20:41:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a73bf7efsm596875b3a.52.2026.10.27.20.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:40:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set))
Subject: [PATCH ath-next v2] wifi: ath9k: don't re-request the LED GPIO in ath9k_stop()
Date: Tue, 27 Oct 2026 20:40:57 -0700
Message-ID: <20261028034057.114021-1-rosenp@gmail.com>
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

The input direction was only added for symmetry with ath9k_start(); the
suspend/resume fix that brought it back only needed the output side.
On WMAC pins it also undoes the "LED off" level written just before it.
Drop it, so the pin simply stays an output driven to the off level.

ath9k_stop() still writes the LED pin, so free the pin after
ieee80211_unregister_hw() instead of in ath_deinit_leds(); otherwise
that write hits the WARN_ON() in ath9k_hw_set_gpio() on SoC GPIOs. This
also frees the pin when the LED class device could not be registered,
which leaked it before.

Seen on a TP-Link Archer C7 v2 (QCA9558, LED on SoC GPIO 12) when
reloading ath9k.

Fixes: e34f2ff40e03 ("ath9k: bring back direction setting in ath9k_{start_stop}")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove ath9k_hw_gpio_free in ath_deinit_leds
 drivers/net/wireless/ath/ath9k/gpio.c | 2 --
 drivers/net/wireless/ath/ath9k/init.c | 5 +++++
 drivers/net/wireless/ath/ath9k/main.c | 4 +---
 3 files changed, 6 insertions(+), 5 deletions(-)

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
index a7a11781d83d..d35460e352d9 100644
--- a/drivers/net/wireless/ath/ath9k/init.c
+++ b/drivers/net/wireless/ath/ath9k/init.c
@@ -1128,6 +1128,11 @@ void ath9k_deinit_device(struct ath_softc *sc)
 	ath9k_deinit_debug(sc);
 	ath9k_deinit_wow(hw);
 	ieee80211_unregister_hw(hw);
+
+	/* ath9k_stop() still drives the LED pin, so release it only now */
+	if (sc->sc_ah->led_pin >= 0)
+		ath9k_hw_gpio_free(sc->sc_ah, sc->sc_ah->led_pin);
+
 	ath_rx_cleanup(sc);
 	ath9k_deinit_softc(sc);
 }
diff --git a/drivers/net/wireless/ath/ath9k/main.c b/drivers/net/wireless/ath/ath9k/main.c
index 740a6fc7b067..07797cc89ee0 100644
--- a/drivers/net/wireless/ath/ath9k/main.c
+++ b/drivers/net/wireless/ath/ath9k/main.c
@@ -942,11 +942,9 @@ static void ath9k_stop(struct ieee80211_hw *hw, bool suspend)
 
 	spin_lock_bh(&sc->sc_pcu_lock);
 
-	if (ah->led_pin >= 0) {
+	if (ah->led_pin >= 0)
 		ath9k_hw_set_gpio(ah, ah->led_pin,
 				  (ah->config.led_active_high) ? 0 : 1);
-		ath9k_hw_gpio_request_in(ah, ah->led_pin, NULL);
-	}
 
 	ath_prepare_reset(sc);
 
-- 
2.56.0

