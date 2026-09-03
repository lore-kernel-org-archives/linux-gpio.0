Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3D93932F9
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 07:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422386; cv=none; b=GGDwiP4F28m2EswcujqLrLi4F4X9OP2nnGit9IxJDxEzDz3oEVyoV17HCGTwzqr1/6m0WbF0/cofJMpJ56mV3ZuOLOJufP4jx5+gCCj/K5ymBr3MOhb/bcyzN/h9W7U8WcYhqTSei4KprAaSDjUtR8TxbVxNq5nfmYOHTErUGPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422386; c=relaxed/simple;
	bh=NeNCtJHz+DsigUgw0FfFsojwamStrqN0Mt328cAbfHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EufQBwqSQgc01F9um5k/ExipJwchAYjJTWjM35GFMuQWE6T3+iINDcLw4VyHa1fbZ9674mYehv2c7BXjlmZki0XXcA/XM1Cguu242vAUJZYvryMPGOsvl2eJ8jpvmQIpUQp0HcB65g/Ut1uPfaKiQCPPsjbanhuOrHKmdI77wAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcP/KFxS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcP/KFxS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso14740405e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422382; x=1789027182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oqE1Nf1WUkJjJ59VGvv07xVmOKIQ1xkyIMzuh64BMn8=;
        b=QcP/KFxSj6ccBL+cWAoP8wEkUw7gErHrnr1HBTQbEA9V9hnvJ7+IfmSUHPK7wlXRb6
         oM158/oDlbElevXxDfbffQQXiHKVa/8c8/+iB4egB9OScGB9XRCaZpyZh50RUi+KEGdV
         +NPvve2lGPPJjboWzof9ILPSIzMqS8MSGztFvOGwXrNR5kOzGrLcGCxXnRYLr3YpBNGV
         qPiF+EWqEXOJnjgOjU1/5uvl+ZRX0R8/KKvh4O0c/qnumytyjZZ+PeXm1i1QH85ncqHZ
         Smy29chQaEAvqq39MONUveA6nQn+crBb2FeH2gYXJacor5MmNMGrIDw4SLZJUWMV0hUh
         YoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422382; x=1789027182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqE1Nf1WUkJjJ59VGvv07xVmOKIQ1xkyIMzuh64BMn8=;
        b=cS7LuX+xQ6WQ9M+BwkBJFXJAPpzNSxwMU1G7nJKODGRr+ttXGrOHfkhqDj0PdUeiOp
         m5o86GOSCN8jbP9vU5nJjcq/kTEQh20iA1jgejEJCAEyAPC4IOiClwWYTMZREuvKJ4NZ
         H3ldQdFjo8xP/yR01O1LfI7ctSWVpN+M3NKcpC2TNxsWTy21VzuLcUdtV1rX0jbH5qjX
         lHg4773Es+boiTokO9JaatUnoyxX4zDojgUFuTXBCpbXDyyvNONReUdTgwpHCh77vuvc
         DcOT5/GB5ZtWIaUKpLNDWWk9wZnaM6NQndCrtKz10bv+tcf5S53mHv/7s2HAqBOegahl
         agjw==
X-Forwarded-Encrypted: i=1; AKwUvBxADDb8RzdcvZ6zj1qus9mZN/MeEKCNoRob0ReG6TBEPYI7hs470V8aWjhF7B3Epudo/szW9emd8z7g@vger.kernel.org
X-Gm-Message-State: AFuF++kyzqro9bsFV3KToV2C3jwgTLbg7dMifDELL/rbH4959jMIrxwI
	Tr8smmAkmZu6qmybPzzZnh0jAi/ehamshYxrijExb3cTNI2PLJNoZg0v
X-Gm-Gg: AYBFou1i5ZJ+JblRGq5kusQ7TlsJvOSSKxjtq4JWV4TyXL5x39/ObnaxxSKLtb9OjpN
	3FBAVTcKQorDoPUx44yW1xXs+InCw1NJxpf1lmC62/7atIZXx5QBjRyoGXz/scatsMkJEtB61hc
	MDYPhq0HsYGo6rPFkt6w/qVfuOw/0GJZptD2WbXZLepTmb+SNRsajLNafbLZ6Dufi8C+y3qONlQ
	SjZf0LL2lzL6SbeL1DSuHyejvNrXHqCVYqvCpyqXVn7ZwJj+aEk26hMcP4UVdv+YqdOgNlLQC+c
	liBff+bKtYZHjbli3FrqlnoN90FiOmKziUA4RcZV0vQOtmH03N2LdOjKLKZBA8uJ+hvXisbmCdf
	pzzHm/k5PEWOJt5QjkG5X9VHSB+IgzDPtJsgXF/C9JGWvEjVgGsSRX6haVexGChBQWNibUeXB9z
	EVRUfoYvfzumncZClrh6Yqfxp3kHAq3ewXfQfj51paSV6Y77c4/eLmAYJwIpE/lNUSGQ==
X-Received: by 2002:a05:600c:4f0b:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49ce581316dmr148614405e9.6.1788422382300;
        Thu, 03 Sep 2026 00:59:42 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee3b0af8sm52373275e9.0.2026.09.03.00.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:41 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v5 0/3] gpio: mmio: report the line direction on chips without direction registers
Date: Thu,  3 Sep 2026 09:59:37 +0200
Message-ID: <20260903075940.2089367-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Bartosz, Linus,

this replaces the gpiolib guard patch [1], along the lines Bartosz
suggested there: instead of teaching gpiod_get_direction() to stay quiet
when a chip has no get_direction(), give gpio-mmio one and let the pin
controller tell it what the pad does.

The user is the Vybrid GPIO block (gpio-vf610, a generic mmio chip with
GPIO_GENERIC_PINCTRL_BACKEND and no direction registers, the direction
lives in the iomuxc pad as the OBE bit). Today every
gpiod_get_direction() there trips the WARN in gpiolib, 21 backtraces per
boot on a Colibri VF61/VF50.

Patch 1 is the pinctrl-imx side. Bartosz asked whether the raw register
coming back from pin_config_get() is a bug in pinctrl-imx: it is, the
callback never looked at which parameter was requested. It now answers
PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_INPUT_ENABLE on SoCs that say
where those bits live (Vybrid: OBE bit 1, IBE bit 0) and -ENOTSUPP for
everything else, the SCU based SoCs included; the debugfs dump, the only
raw-register user, reads the register through its own helper. The set
callback stays raw, as the fsl,pins binding requires. Converting the
driver fully to generic pinconf is a bigger job than this fix needs.

Patch 2 is what Linus asked for on v3: an optional get_config() in
struct gpio_chip and gpiochip_generic_get_config() as its pin control
backed implementation, the mirror of gpiochip_generic_config(). The
packed parameter goes in, its bare argument comes out, as with
pinctrl_gpio_get_config(). No consumer API.

Patch 3 keeps the direction in gpio-mmio's existing shadow and installs
the shadow-reading get_direction() for the "pinctrl backend, no
direction registers" combination. The pad is asked once, from request(),
in process context, through gc->get_config(), so it is safe for the
gpiochip_lock_as_irq() path that calls get_direction() under the irq
descriptor lock.

Tested on a Colibri VF61 (Iris carrier) on top of gpio/for-next, with
DEBUG_ATOMIC_SLEEP and PROVE_LOCKING enabled: no backtraces, and
/sys/kernel/debug/gpio shows the right direction for every requested
line (the hogs, the SD card detect input, the USB VBUS regulator
output). Lines the pin controller cannot answer for keep the input
default gpiolib assumed before, so nothing that worked before is
affected. The initial direction scan in gpiochip_add_data_with_key()
runs before the pin ranges exist and still guesses; only requested lines
get the real answer.

Patch 1 was also booted on a Verdin iMX8MP (gprarray, 6.12.107): the
pinconf-pins and pinconf-groups debugfs dumps are byte for byte the same
as before the patch, and nothing else changed.

Patch 3 needs patch 1 to give correct answers; taking all three through
one tree, with an ack from the other side, avoids the window.

[1] https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

Changes in v5:
- patch 2: the get_config() documentation said the answer comes back
  packed; it is the bare argument, like pinctrl_gpio_get_config() returns
  (Sashiko review). Text only, no code change.

Changes in v4:
- new patch 2: get_config() in struct gpio_chip and
  gpiochip_generic_get_config() (Linus)
- patch 3: seed the shadow through gc->get_config(), no pinctrl call
  and no CONFIG_PINCTRL check in gpio-mmio (Linus)
- patch 1: drop the npins check, pin_request() already rejects a pin
  the controller does not have

Changes in v3:
- patch 1: return -ENOTSUPP for the SCU based SoCs instead of letting
  the firmware call hand back the raw pad value (Sashiko review)
- patch 1: -EINVAL for a pin the device tree never configured, -ENOTSUPP
  only for unsupported parameters and SoCs
- patch 1, 2: drop two comments that only restated the code

Changes in v2:
- patch 1: decode the requested parameter instead of returning the raw
  register; debugfs group dump reads the register through its own helper
- patch 2: keep the direction in the gpio-mmio shadow, ask pinctrl once
  from request() instead of from get_direction()

Mehmet Fide (3):
  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad
    register
  gpiolib: add get_config() and gpiochip_generic_get_config()
  gpio: mmio: track the direction of chips without direction registers

 Documentation/driver-api/gpio/driver.rst  |  7 +++
 drivers/gpio/gpio-mmio.c                  | 60 +++++++++++++++++++++--
 drivers/gpio/gpiolib.c                    | 23 +++++++++
 drivers/pinctrl/freescale/pinctrl-imx.c   | 54 ++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 include/linux/gpio/driver.h               |  9 ++++
 7 files changed, 151 insertions(+), 8 deletions(-)


base-commit: 1900b5a41493e7050c68c1e62780d6fb9a209457
-- 
2.54.0

