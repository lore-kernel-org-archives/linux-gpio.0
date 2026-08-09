Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4850351C20
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 08:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786262715; cv=none; b=VacMOnAXNgAggvOcWQDpu6VnyB+i3GxAJ7XOd+s2tzaGhnR337X6YddBl6BRDH7XOysYPobh5LJQeZVC4J2am7/DnlB1KPgLWwjJN4SAq1hljU70dzxRcJrUT5irYY+GAizLwBATG0U+PcREbLWgnXcE6Y4tKbkFCuB0dI9+IlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786262715; c=relaxed/simple;
	bh=yteOlTUdpPHroT4cAby2acVhYXY3N7v7a9qRL+PjAZw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FaoEOfUMma+E8DOBp6XPvMG+eE1pcod0ix3D7GjNx3ZGwLA9kLjCUb2Rg1hHU75ERINgex8St20Ts3/YGRa9V6yoNBtx8wCIIFipGneVnVPMSGEVXPu6B9dkWvA7cTJ3F/LvP2OOJ2xS7DgX3kT2FAJX9XQ/kqeUdFuOpw7nSDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6/vMjXL; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6/vMjXL"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so582568a91.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 01:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786262713; x=1786867513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNvAhMakBMCB2Za5yQlirrHhgtFAds445Zn94S2EPWw=;
        b=k6/vMjXLSGJbrxImh3pb1cwbh+CZczs6/zDxoGYtKLkG3pGt9y08AqAB+ucKe7qCeQ
         +vRLoU30hwtSZvkt8QUZJ2VyqqOaNWT2GwWMdguobkZrk0LOWIdvASbRsYuraNWqRcmi
         27Wrtm/yya7z5vQ9hLj4sIoQW3PIek2AjewvEVNHZOzg84To96SMmvBCuF0VltpY2VJo
         6X93m0OmjFepgEozbp4vT10MSHZy30lhypVm3gNruFkjSi70sxoFYKo9x7NuMULagH1C
         Sz75PN2wRW/ypJAJG6W6jSigeBWBvH6n2K+NxvQIr0ctLmG7Mim/qtjwfBd61S/k2IIN
         F5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786262713; x=1786867513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNvAhMakBMCB2Za5yQlirrHhgtFAds445Zn94S2EPWw=;
        b=St8+tuUwytNbr0V448BavvqGiLOxNKOZlCzm3aZ6X8ZsB9gQlXzKye2X1PGlySRNOW
         inIWLBFM2BsDaj3y/JEkVE+ZQt6HOSCmSJdomJUFurgTK5y9nsXQg8JIwsYfM2P2KuUV
         l0eXpYHCCM4uhPR5mO8bHiC3jHTSXd2z+Q4pFmKbNzOEOYgXJToNGvn8SBkSg/6LAIA0
         a+p/3ppRD7tBYDrevysbK0BuVfJk6g+T8Gp0chv8vmGa2jFhwx0hKn9EiwXhrNJfdVJE
         41FHnZpV58yG22/br8nQVuUXA8L0iQwNHB020cmfV1IBxAE8LkXq7X5vsU8jfQ1pa681
         rVdg==
X-Gm-Message-State: AOJu0YxADyo7tn68L2TPiawXEa5SNmTz6QF84wLwBqOIYdu04MSpFDvO
	AszltrsMthR4irYjkcRJm79b4ubiJycxaBbsI/jT4r7/CifCD0yblFzen1HhsH9I
X-Gm-Gg: AR+sD105zctoaCmPjnw9s8o4g1gioayl8PgAKDGi8dS8YZhdCxLeJikmwFUfrKAbVgW
	Eoql//MsFQH8XcVImKqNV9n4IF5nNr1ObgMsio4YWHj+I4BTGbjmbmGyg+i3HTvJjMUPjlDElBz
	Ml6znKFU1JIrbXd5M3A8PbteS5VtLsD+moB93L8RBEA0/MmpSWroATo4zMVeZFYKXiYpmV95pxa
	lntcyD9JndP3pETcjEPIkN4AgNenk7/2ugqpk0OwJMCIma3iRLMHuXOkuqauQFpGbFLAdmaofXr
	GpRKWEDMXHH689mZH2JsrysfEL+RBulUzTUp5Pz9Js3y33k0ctf/T1sV4rkKYkDkEWuBj4E0T/f
	I3AMLLvtYjyzSnrsOIPjBhT6T8oACFVQtbiOasn3rsCriqkzRZjpqouynHILC2XwSiwfTNvoFg2
	D2qbONbaMzTIM/4+4JjMavTRrpg6QTg6VWzbI9OX164yktKNgYiTXtN+iAEbH28h+8kp2+
X-Received: by 2002:a17:90a:c106:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-3909d8d5993mr21121164a91.16.1786262712632;
        Sun, 09 Aug 2026 01:05:12 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7b39bsm23315598c88.14.2026.08.09.01.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:05:12 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
Date: Sun,  9 Aug 2026 12:04:57 +0400
Message-Id: <cover.1786262697.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EcoNet EN7528 is a MIPS SoC that uses the same pin controller and GPIO
IP as the Airoha SoCs, so it reuses the shared driver code introduced by
the split into per-SoC drivers. Its register layout differs from every
existing variant though: all IOMUX mode bits live in a single CHIP SCU
register plus a few spill-over bits in IOMUX Control 3, EJTAG has its own
enable register, and every pin configuration register is at a different
offset than on EN7523.

It also differs in a way the shared code did not model: only GPIO0-GPIO15
are wired to the interrupt controller, while the driver assumed all
AIROHA_NUM_PINS GPIOs could raise an interrupt. Patch 1 adds a
num_irq_pins field to the per-SoC match data to describe that, bounds the
interrupt callbacks and handler with it, and feeds it to gpiolib through
gpio_irq_chip::init_valid_mask so gpiod_to_irq() fails up front for a pin
that can never be an interrupt source. All existing SoCs pass
AIROHA_NUM_PINS and are unaffected.

Patch 2 documents the binding, patch 3 adds the driver.

The series is based on linux-pinctrl/for-next, as it depends on the
per-SoC driver split and on the CHIP SCU lookup by "airoha,chip-scu"
phandle that landed there.

Tested on a DASAN H660GM-A (EN7528, Airtel), booting OpenWrt.

Ahmed Naseef (2):
  pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins
  dt-bindings: pinctrl: Add EcoNet EN7528 pin controller

Benjamin Larsson (1):
  pinctrl: airoha: add support of en7528 SoC

 .../pinctrl/econet,en7528-pinctrl.yaml        |  190 +++
 drivers/pinctrl/airoha/Kconfig                |   15 +-
 drivers/pinctrl/airoha/Makefile               |    1 +
 drivers/pinctrl/airoha/airoha-common.h        |    3 +
 drivers/pinctrl/airoha/pinctrl-airoha.c       |   33 +-
 drivers/pinctrl/airoha/pinctrl-an7563.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-an7581.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-en7528.c       | 1204 +++++++++++++++++
 10 files changed, 1443 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7528.c


base-commit: 87e787e591a82b9b324aa0968795b256f789d287
-- 
2.34.1

