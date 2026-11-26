Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716202;
	b=HidU9MZI1QEvGpEu+shxcoxr2AziWvMQAOenEbKQi9C6ecZTJ3F4SNg9rt3FRtytMhPx
	 nlaiuMQdVEklAS7BoFCZ5RklGUlTpvnnYKxwuFzdCDOGul2TvImowy7QJGR/gjV/Hv+/s
	 ljXbHmzL9DtgN6eUPKCz+i60iTCtVlDwPwIOlZ3cQKgytyijYahfuzrv6oA4C+UI+PeOq
	 H9zuzOuHEfUP05lY/LYTThhiAnySbw/KZi0LHqs+QohPhYfq7uxYlYh6zVsJHehrM9TzZ
	 TerdqzbYB4L8aZpj8pEIT1vpgGFAmEmVfy9QcVFbMXOZQbhba6fDXs/tOUTW0liujDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v7cRvxwD+0hh0qmm9vXifZdvwaUkz3iKlLP8yUjjZ/0=;
	b=dot7UiC4o6ir1NpTmCvts8l9DXfopXVtShX6NX+kcktAeFeYJ4yYPxXh3Zw5s1plb26U
	 jNr0lAAPSgVgFltB640W5OCbHBxZXXgVZyZ2Mwh0le1jU/QYJO80xUSku/Ehb8EeBlSfT
	 pqYAkCDAArAQzsjze52ckeFQrvqoWyRZTwk+8MxsqQjrlcluwnBEmq+Ff5dWkVeq53+kv
	 Kab+185I8lAYY8Bb15O8xP9wA43JBKZTwzHgd6R6Dde8QE76Bk3GAPctr2pkIgKTRjKtW
	 sB1qdsUw8O8Of08Kzvmo5sSMIgDagPWFX3s3mql0WaTQHqDg+mtP1M45qxqDjTItqpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7ZDkX2d;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33109606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 18:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33109606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7ZDkX2d
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso52385505e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716199; x=1796320999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7cRvxwD+0hh0qmm9vXifZdvwaUkz3iKlLP8yUjjZ/0=;
        b=G7ZDkX2dgIa6d3/OEv3BL66Iq6KGr09CxO85zG3wKRu0Ei7JjggIyTfuFk8Xej1EQc
         FHmZi/MDKupnvpHwf97HmNlGYX3rmBcGr7l7HeggVa092vuKvJgjbvNr+QM/1MCSRxHM
         08JE1aziOC0VSuoiT1aeUoxt0L2U2HFPAVdD/AGqllkEN8EtgnZRT0OE+1Css4llDRpd
         wdjNCVWbFy8++Q0XNeU2avrKuGWix9gOvn0MV405gki3UIcfEHLarrwjeCuGP3ABSs82
         dMyWnV05vOQ39lUAjpNhJrNnBiJIKKlqwsbRU5naRZHyUhCY0zoA44MR5CTKvLxUYaTm
         m+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716199; x=1796320999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7cRvxwD+0hh0qmm9vXifZdvwaUkz3iKlLP8yUjjZ/0=;
        b=ifTOEreZYeYWKW8sy6pvmTAYsUv+es7KmQc+IHdXpYUJfge6FVwZ39fADCt7oYUv9A
         DAcSuamWvrhFmdxwYefwBtjZMKTmC/+iqtlX1tbQte5dloac6TARK9vtaS65ZJ+kRx7I
         NT36SbO1vTu8pr9uDP6qxkg02J/jOSR5Xj98OPdoTtt4hKJPNZ0PIWKC5kpDKNZB+sx1
         AuAG3hjLKVOktfSlbj5eaZNmb48qxLNLCAEmR5XI7FK5ovtfgV/RsoJwuw3ZXa6Lcvf+
         OcwDUXD1KlG4LvV8F/c0GG7nalwm1Nj6LU+iS+m619aqtmRWzfx42/5ar5dAn3MyM7v0
         wDSw==
X-Forwarded-Encrypted: i=1; AL+hErFKweueIbXBJbKIJpqUCs22RqAIEOSuM/qIAyPrfOkKTi3zKLCdwXY9hisW8QJck2Dga99HBZfQfu0s@vger.kernel.org
X-Gm-Message-State: APuU4Z/6HKfS3EjG7pmCw2A6Tj3AQESLsTJU+5lywW1bJHuMiomRJ/sW
	V7W0fvb3Caipj6vWWwvhJ+0aykiHIqNuTydFhnhPYz5Ia7uiA9dCVpI=
X-Gm-Gg: AZFdTZcfCqItizXup5MDeZvHhl0bPL/Oj4KfzyDOfiZyYSihQh9QD5ODJYVXloN5WQS
	r0Q0dJX6Sx6vFOOTnz7rVy4NjTBT9rF9MXEVLP2pvoCK8voEOREOAUbSOHPJu8f9Yv5/0yZcyQ5
	UKJ36m8QvQSSRECqpZJZowJxqT9ls9PI5ASOHcdZ/NtIN/n42PIzMVbSKvz5PYaUPI35O3m9es9
	R8mtAgftMxlPjvV6UyxVHX43Z798wWFPxriYAp8F2oPFS3CH8fmiZkc2xvHVPajA9sLHhLRg9p1
	WMm8VzKjpnCcZ7RKUdn0ajGRmvs+3p/b8VjD5t7rYx2/HTMJUdWqc/pjgnDbH3fZ1qYTDvC2pWl
	gZ8fHFfyBgWc36Hg/vn7mXan48O7VrzAxWpxCjSMRLV8CU1JjDR5DqScsqEdLzQK6poLlzx/DAV
	WPRG59VrEgLlWdAV3d6jTcwV8CUnlWhTjz/WA/00nAzmZ9br0qysT7pNQjzjcD0YGfVwiXm1Ons
	+2pWkE/Sf/ayNnbWElFTcZqSJr2vpD/qQSURXG2qVqspgS/8t2MHzxq+L2DxRUyXinnIkJMufwb
	QizQM+VPV15d3bbg6TdtX06qjoY2A4FmRljuf/I5DszmWsndxe09CIknwrCITJ21+HnT1tTsfQQ
	x66U2GWH0Ru5Koh1N9vknXxe0bmTFhR/eLTusB1sGpiWcBA+Ctmy3whJCcqE=
X-Received: by 2002:a05:600c:1115:b0:4bb:a602:6c8b with SMTP id 5b1f17b1804b1-4bba60271damr88655835e9.14.1795716199310;
        Thu, 26 Nov 2026 10:03:19 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:18 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 0/5] gpio: fxl6408: Fix regmap ranges/bursts and add PI4IOE5V6408, reset, bias, and IRQ support
Date: Thu, 26 Nov 2026 19:03:10 +0100
Message-Id: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
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

This series fixes a regmap range / burst-transfer issue in gpio-fxl6408
and extends the binding and driver to cover its pin- and
register-compatible second source (Diodes Incorporated PI4IOE5V6408) as
well as the hardware features omitted from the initial minimal driver:

- Patch 1 fixes rd_range/wr_range exposing reserved even register 0x04
  (and omitting readable 0x07), and disables unsupported I2C burst
  transfers via use_single_read/use_single_write.
- Patch 2 splits fcs,fxl6408 out of trivial-gpio.yaml into a dedicated
  schema documenting reset-gpios, vcc/vddio supplies, and interrupt
  controller properties, and adds the diodes,pi4ioe5v6408 compatible
  with fallback to fcs,fxl6408.
- Patch 3 adds optional vcc/vddio regulator enablement and reset-gpios
  handling during probe.
- Patch 4 implements pull-up, pull-down, and bias-disable pin
  configuration via gpio-regmap's .set_config hook.
- Patch 5 adds rising/falling edge interrupt controller support using
  regmap-irq and gpio-regmap.

Hardware-tested on a Diodes Incorporated PI4IOE5V6408 (I2C register
access, reset-gpios, pull-up/pull-down/bias-disable configuration,
push-pull output, input status, and rising/falling edge interrupts).

Gianfranco Mariotti (5):
  gpio: fxl6408: Fix reserved register access and disable burst
    transfers
  dt-bindings: gpio: Split fcs,fxl6408 from trivial-gpio and add
    diodes,pi4ioe5v6408
  gpio: fxl6408: Support optional power supplies and reset GPIO
  gpio: fxl6408: Add pull-up and pull-down bias configuration
  gpio: fxl6408: Add interrupt controller support

 .../devicetree/bindings/gpio/fcs,fxl6408.yaml |  97 ++++++++++
 .../bindings/gpio/trivial-gpio.yaml           |   1 -
 drivers/gpio/Kconfig                          |   2 +
 drivers/gpio/gpio-fxl6408.c                   | 181 +++++++++++++++++-
 4 files changed, 278 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml


base-commit: c6d8ebd7324cefda867a701b4341605b681aa3f5
-- 
2.25.1

