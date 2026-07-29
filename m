Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97873CC33D
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 13:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331817; cv=none; b=fqJgjIinJZ3KeAx1gzoVwQYN7Q5wzXzGUNyTyN1l7VISSvS8FtZMSHl8ETwEIIGpBBuf16QXqDSQzAgYTitUSIW5TVO/yt6l9bUo4FWBHjwbnaSPKbLDTp7yZDkHwUr22xo+GDHSE6/ELAkTCG+pPxHuSFCHEFysjwJP73W6a4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331817; c=relaxed/simple;
	bh=u2fV3EodVoiKBYBSSkZ7rSi4GrahVqXoQ8reBH3JTf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YcMwFGI/IRJ0uPCS9ZtItobgXnLaU2hlietHwFy+8JoXlp0g2V2oWsVXBVJAgNWKTfcrRllIGCTuDv6wprgHxM64wjsl0CpNgeihNceDDtji4L0t9HDqIQIoRzzOX6d1O1lqPam3HWAt3a+iMvIqunMf9h3cEqbDb2wTAumhkHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E7EchbUf; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E7EchbUf"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-45837e52d8aso380288fac.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 06:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785331811; x=1785936611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vw1Uw662stFve8C9A4vfU5Hm7+9jYZ7QadKCZhiXKXs=;
        b=E7EchbUfgfpzoGVuZUFg7z8Ri9X2OOZpyOX05Qh7lCGx5l4lcsz4Yh3fsfWi5NBpYV
         RYPRUveah652fDKb8JpvhsF9BGnBH8o6Nj9i3D4PRJ5ihe2owYo3ip9uwoqUaWAUDwMh
         wQ5Gnb1rpXosl8ztQuwyfLfP96Pgq8hgJgCR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331811; x=1785936611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vw1Uw662stFve8C9A4vfU5Hm7+9jYZ7QadKCZhiXKXs=;
        b=ositm/rzticBpruvaQ6TmDR9e0F9xyA+jt16HlG1O8XNX8fOkyKOGN3/KVue365owQ
         mjlrJT15Y9uFJ5h364Bt4RtmDanUydrrzdE/LNGKr7WJFV4UTyRPbaxp7A7u8c8QyQE1
         MWfqaPu19sjecKRmvt1cZjPuIsORcL7/8W5EWW8xlP7yS2DRehY6HGm9u2BdWUe3OpYm
         rr4PSS3QQB/tKXq903yT9EYYerxQJvQbEZVBrTEzNb+MSxkY10O/LltkjDY5tLgJMoa+
         EvxtIG6x5SBetCH9aAzO1ghvaLgl4TiD8iW5kFr6/X4qGys7JMgZ3oEkfBfKD9GehrZy
         8IIg==
X-Forwarded-Encrypted: i=1; AHgh+Rqj6CXY7Rh4AtA0+j6LzT4soJutmFK+p/GluhT1tEWzCAKiRXl9RfzmYzi2SRKuVN5Yij/keOpM2Uer@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2/hKNucX8lZi5S1JNvL2HIFb9Te5I4YaSYa6QE0N/gxdibkty
	clj4hPTUV77v1O39wmpJr4Ww87NPx96MdFgP6wcBhrDF+Tnlx/IdIa5j1VGPUlCMkw==
X-Gm-Gg: AR+sD11U4Vcy+983ivXI0+7s36CxgnEzis16Pw/MaAabd/3EpOzfHZXbpeJBWnkloTs
	jSzgtZRT2P2EQehiCk+5cZunGbAmX8DIf/AhwBYNhcVeqrHecV/AnOrl0W2nMIE+YGLTX3z46oj
	SsmUTZjiFUQRSIaAmuTWQ2p/iSoO0R4vtp4iDW7AXrNVgnb1hVvWit+kKHtbMhCfmZR62FgXae/
	xBqMULc+DX2VDHrJJpKNNokPQCDzsglKSwSk2ZGBAcc8cLrycF7JEaIh09L+a4lb8bCwJkm1toO
	RAcvuHt+uWqR9dnXQ+0vMnN6j+pRa72kZexQov4bYL+GgkdQZQfAHA/9XnywMMCZ0ngMQOQl8hH
	hurssnH1TwKgu4uycru83Ok1p+gg7FpfMdsChP1Ra7iTu3LDXJ6pa01FDm9LHTowM8nHYygOt3E
	vn0wckMrD+lN97V9etjdbWlUY80qcbD7rVXXYqyLd3bT8fvK4O7umL2bw=
X-Received: by 2002:a05:6808:bcb:b0:496:e0:a46b with SMTP id 5614622812f47-4ad5b7fdbc6mr3443250b6e.3.1785331811275;
        Wed, 29 Jul 2026 06:30:11 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ef5d650sm1712932b6e.9.2026.07.29.06.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:30:09 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Ye Zhang <ye.zhang@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] pinctrl: Add support for the Rockchip RV1106
Date: Wed, 29 Jul 2026 07:27:24 -0600
Message-ID: <20260729132736.3807082-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds pinctrl support for the Rockchip RV1106 and its
RV1103 package variant, split out from the initial RV1106 enablement
series [1] following feedback to submit per subsystem.

On this SoC each GPIO bank has a dedicated IO control (IOC) register
block, unlike earlier Rockchip designs where the registers of all
banks share a GRF region. Following Jonas's review of v1, each bank
node now references the syscon for its own IOC block through a
rockchip,grf phandle and the driver uses a separate regmap per bank,
so no regmap crosses a block boundary.

This v3 is tested on a Luckfox Pico Mini B (RV1103): pinctrl and the
four GPIO banks probe, and the sdmmc pinctrl state is applied through
the per-bank IOC regmaps, with the SD card working.

The corresponding devicetree changes are part of the main RV1106
series, which goes through the Rockchip tree.

[1] https://patchwork.kernel.org/project/linux-rockchip/list/?series=1122658

Changes in v3:
- Add new patch moving the drive-strength decoding to the get function
- Declare the 8-bit level drive type on the banks so that reads decode
  correctly
- Return an error from the iomux functions when a bank has no IOC
  regmap, rather than falling back to the shared regmap

Changes in v2:
- Add new patch for the per-bank IOC reference
- Use a separate IOC regmap per bank, taken from the rockchip,grf
  phandle of each bank node and identified by the gpio alias, with
  block-relative register offsets
- Reject drive-strength requests for GPIO0 pins above 6, which have no
  drive-strength registers
- Specify only the first iomux offset for each bank, letting the driver
  calculate the increments

Simon Glass (4):
  pinctrl: rockchip: Decode drive strength in the get function
  dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf property
  dt-bindings: pinctrl: rockchip: Add RV1106 compatible
  pinctrl: rockchip: Add RV1106 pinctrl support

 .../bindings/gpio/rockchip,gpio-bank.yaml     |   7 +
 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   1 +
 drivers/pinctrl/pinctrl-rockchip.c            | 230 ++++++++++++++++--
 drivers/pinctrl/pinctrl-rockchip.h            |   4 +
 4 files changed, 223 insertions(+), 19 deletions(-)

---
base-commit: fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
branch: rv1106b3

-- 
2.43.0

