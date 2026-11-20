Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186851;
	b=I1ijduHGxqkX71epxDZOQvEXm9eorJ3w1llb2ij3qR8JL3+7dzcfjwNxU5jwMwGNj79C
	 QxGlYktLaWJ9LuYs+0OWicTtM1D88EEhEM+G9LubD3HqpW3V/5JzX+s1rhiZHmUYDJnge
	 VdeEwJelKRW8ZYMWWI2S+X8ukL65ZuQpbd95xIh0h6HQXhu09alAvpQrhNPOV8SnCEDJ9
	 70McRI/ssyilAh1KJBRplQBR64q7lLYcwd1rBc4x9ZnB3vfNVTheZRxuo3VSQYRUF4QDG
	 qraLUOnZCAaLIdEMKX7O8v91IfpeUdtqsEiLi4KqNQkEjFERrHb/azRA+QkF+TcxarA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7/iYOhMINhvEOk0ds7NRqLPwYU2L0FMs7KPyj2Wr1b4=;
	b=OFNHw8w4Dl3Ngu6MpnoV5NrD2sQvSz6SkvZDOfMGurgUBytk3ZQt2SK4zkYmXOaAt7mF
	 YDgEncXEIZ+T02gA0RkNKA6fAxqb917ET12Q+j3xLCaxohyyKxnYvAHEjt/OD7SsLJHp8
	 OHdTjqtQPjdF7ccgxkDBkfy6yOfWJKVsXmQr87tDtA44C9sGnDZ35y0AM2V89wvPFex4k
	 CTpO+qZ59TFqULodMDTKLCK9eCzPdVa69ef0Vwe/E3jB5yFwebQlAPtwS99hpkWs6ISPK
	 uF5cEYHV2RQ8hYeHUd2eVaJxAHtz43wj9CIc4XZ0iV/1T1Df7zpKSjxJxZKgOQwo51g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TiD8fojx;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6099460A382C
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 15:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6099460A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TiD8fojx
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb628232d2so562227a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 07:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186851; x=1795791651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/iYOhMINhvEOk0ds7NRqLPwYU2L0FMs7KPyj2Wr1b4=;
        b=TiD8fojx05fpXLGJd9ptfNKTEs7T1NdcBKTFQxZJA32CsSSfGN14cPiJwznki7FzKp
         sYCDFhKNdWYAR4j94D8GcjDNCD3r8lxF7c6NGErd6hf3MVTC4WMkKuYsQt94gqQkhUWr
         MihaNqOWjJWrvDn3GNcuFd/k3TpcDgEwbCcAexgxqFVfPteP1mQto3nS5rTd2nRu7q2i
         vwj5dSKkcafKqAkZ5ZT4xxEyZVhWUG7rFjQnGJhDXSj4eRarZxEVEs4iTAyccpGEboey
         mVjWfAifnh6mriCsuGm7lUCAenCELKxMHueLVQEBhyQFBVkSr48bN1OLLzzzvdHUMILV
         ECeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186851; x=1795791651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/iYOhMINhvEOk0ds7NRqLPwYU2L0FMs7KPyj2Wr1b4=;
        b=Qrqr0zT+g7dM8zhcNvwIYugspR2PZhkmNccTg6dzW0Jn/foaBhEWLvvD2p1vbL8qAz
         yunW+PUSYvwqpSJW13/paXrNY584ItmtuyKMYGQnUOS20x/ncNVqFSQF1e4XTCZ0Uw+c
         DFeFVXxnSwaYHZMw3vE9o6SoDD0vSwImxaFAes3RK+1FYCZLd96Stb85pVSPAx1CMc6p
         pNQtGWy/7ELZO3jSheFKdpWgf6E/43yOh/vgrQsNm9t5WP4txMVPm4bSB2HXSH4BWbwb
         P8v9xNkcviSwPK7HSH4R+GDSeJjCsxbU99n8FmvAYJgYy7cF0U8zATuIat3CPifDr8MK
         Rrpw==
X-Forwarded-Encrypted: i=1; AL+hErFrOX3YqaoQaWvW9QKvBcUKX8IlE0OOoyWzevhsI2J//5B9LBT/QNrLRoSJPk8lUJP5MDAmyCERx71g@vger.kernel.org
X-Gm-Message-State: APuU4Z+vY9RVCixEDjiHyaGfMXy7I/hl1+d1l5YfuB/s2JIrpUK0WAUA
	UI9FRJysf/j60dlHSLI6fnhKNnJuj5GxKePcJvNX7POWkSVY+2CiTqA0
X-Gm-Gg: AZFdTZdu24F5RVcEqiRQCeaNSwy01rw78il8q7a3fTX8VVvVM/gREZFVxRqXFA0njuX
	vKYhV9DwY3kBUwjDR7K0NCFe4ghnKdYf9047eGrD7S0TVIROMPtKEBMvVW6eqoxUabKtkyPYFN0
	oTlQXfvaCJYQjxbsDqqWsv0JOfUzmLtpsFr/2wmaspyyYi71q4QFRamBkUp8LdJLAyJYUL18C8t
	Fg4FpCnSuEkR9Ukj9gLMnuuFihLqlpz3ihxQ/2qB/BU32vIfuPykSbXRfxkmm+yaXBNbXeQajXv
	sv0MC52JNlqzxSjEsycxtBmlS5E2PjiQjbW9BKQAXbD4PjOn/+Y1tNrOsBRvDyJ5YG0khl6nXrW
	QGN9FANmMDgqzLKCHm+81dA5c0x1iCP++OFy3shCJc6pmiRkfueluqwsXqMUrG1dMAasPuhyQaB
	jvpXdhwpyTesZIwv2hp63kjW4f9UUMCeitjqAqPcg/1/eunmcjL/532odW3NRZKqk5yFcUOUFDk
	behrHREOcncckq65Mna25hN5M/XBzqc1KDAIqx8HMFD3/RTo5jG+rEsSlAOLLEv2AROHLR446MT
	xwWtCQAlJqIfkfYMj+YTVaRLGPYQgBHtB2j6WR2JmSoIEmbPOQ4IClxdkwtuzAObzb+z
X-Received: by 2002:a17:90b:2688:b0:3b3:cde6:d8c8 with SMTP id 98e67ed59e1d1-3b41c955b9dmr2998636a91.46.1795186850600;
        Fri, 20 Nov 2026 07:00:50 -0800 (PST)
Received: from localhost.localdomain ([115.73.20.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm7851802a91.12.2026.11.20.07.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:50 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nhat Tran <nhat.tranminhk2@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/bridge: tda998x: Fix CEC calibration with lazy IRQ disable
Date: Fri, 20 Nov 2026 22:00:04 +0700
Message-Id: <20261120150004.64033-1-nhat.tranminhk2@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The CEC oscillator calibration pulses the TDA998x interrupt line low for
10ms through the "nxp,calib" GPIO. Before driving the line,
tda998x_cec_calibration() calls disable_irq() so that gpiolib allows the
GPIO, which is also used as an interrupt, to be switched to an output.

gpiolib only allows that once the interrupt is actually disabled at the
GPIO controller. Since commit a8173820f441 ("gpio: gpiolib: Allow GPIO
IRQs to lazy disable"), disable_irq() is lazy on GPIO controllers that
do not implement .irq_disable, such as gpio-omap: the line is not masked
and gpiolib still considers the interrupt enabled. The direction change
is refused and the calibration pulse is never generated. On a
BeagleBone Black this happens on every boot:

  tda998x 0-0070: found TDA19988
  gpio-537 (nxp,calib): gpiod_direction_output_nonotify: tried to set a GPIO tied to an IRQ as output
  tda9950 0-0034: TDA9950 CEC interface, hardware version 3.3

Set IRQ_DISABLE_UNLAZY for the duration of the calibration so that
disable_irq() masks the line immediately, and clear it again once the
interrupt has been re-enabled.

Tested on a BeagleBone Black without an HDMI sink connected: the error
is gone, the GPIO is back to an input used as an interrupt afterwards,
no spurious interrupts are raised, and rebinding tda9950 repeatedly
reruns the calibration cleanly. CEC communication with a sink was not
tested.

Fixes: a8173820f441 ("gpio: gpiolib: Allow GPIO IRQs to lazy disable")
Cc: stable@vger.kernel.org
Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>
---
 drivers/gpu/drm/bridge/tda998x_drv.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
index 0b966c9844e7..0815ce283f49 100644
--- a/drivers/gpu/drm/bridge/tda998x_drv.c
+++ b/drivers/gpu/drm/bridge/tda998x_drv.c
@@ -495,8 +495,16 @@ static void tda998x_cec_calibration(struct tda998x_priv *priv)
 	struct gpio_desc *calib = priv->calib;
 
 	mutex_lock(&priv->edid_mutex);
-	if (priv->hdmi->irq > 0)
+	if (priv->hdmi->irq > 0) {
+		/*
+		 * The pulse is driven on the IRQ line itself, and gpiolib
+		 * refuses to drive a GPIO whose interrupt is still enabled.
+		 * Make disable_irq() mask the line right away instead of
+		 * lazily, so that the GPIO can be switched to an output.
+		 */
+		irq_set_status_flags(priv->hdmi->irq, IRQ_DISABLE_UNLAZY);
 		disable_irq(priv->hdmi->irq);
+	}
 	gpiod_direction_output(calib, 1);
 	tda998x_cec_set_calibration(priv, true);
 
@@ -508,8 +516,10 @@ static void tda998x_cec_calibration(struct tda998x_priv *priv)
 
 	tda998x_cec_set_calibration(priv, false);
 	gpiod_direction_input(calib);
-	if (priv->hdmi->irq > 0)
+	if (priv->hdmi->irq > 0) {
 		enable_irq(priv->hdmi->irq);
+		irq_clear_status_flags(priv->hdmi->irq, IRQ_DISABLE_UNLAZY);
+	}
 	mutex_unlock(&priv->edid_mutex);
 }
 
-- 
2.25.1

