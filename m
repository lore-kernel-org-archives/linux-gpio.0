Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997383B9935
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 08:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459510; cv=none; b=C6p1aRr7vuQ7mpenQCZTpkon9slQ5Pc5dsKvsvxnG3nsg8Nayb2gnW6a+kzX9i3S3ipSAEbQlqN2FW3NtEOQEvjcDTlwM75TWR2+ogCWTKgxgkAK6UWZEOfWMCYgNVr34jagBn/wSfcEdg3jgu/Fil1mr9ElMyoNhaApe74EmV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459510; c=relaxed/simple;
	bh=LpqCIFagyU87XsIJrBPx+IM0qUEw6lg443KaQK4nqG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n5/cBVgwkJVSoJx0bhq+Nnb0kD5PIWFaRCCPOJjmuRGTbdld0kTBZFqoGpOpfHQa1yXWnaTa/L2quaJmLuimyohboesMPQq81z1nYCZMI/j8a8sz6Zip27+fPSBMbyWggOYgeX9IErojvK4TtDjNNMaEWPORjt9h2h+DFM6twhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8qDCzjk; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8qDCzjk"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so2830205e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 01:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459504; x=1790064304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jKg7zPw7lKK/zV2TerSGH2lZsZENXJkv8MUeOswc3dg=;
        b=B8qDCzjkB/e+kllmlARhxxgukezRR1lch75bWbTaQV6yOVM9+sOjvHi2aL8sJENAsn
         Li0328E0s1MBAkkt2c1RRxxaZExkKLnW/7/g6WiVTbtYVFj129MraQXKFpeAg4jxWEiL
         TC/dzz4feKmyPYIwVxKDNVtmsASyT7+mjF/9rgp1L0Rl2JMhSAJz7IMksbpxZXcP4SOT
         j9zsqM8UzmlMT+pLMSerfz5y7Xk884lghQeI3RT+uU0v+iMhrwOebnVhHBI89O7zrziR
         X6WWTL56CRifNwSG72z8esmn+VSOXxTcEWqKgxywmQu6FzshacigFaQ1CDe4xf2v/Bbc
         tClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459504; x=1790064304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jKg7zPw7lKK/zV2TerSGH2lZsZENXJkv8MUeOswc3dg=;
        b=YzU0VPEagCiHFQP4KLRz32BNgfOOwSLzfx2GvmcLRP9DBV1vcgsNZV5dcEpO392Drz
         s/WS71cU64D46iyvFf1crqx2HFqVgF5sI1thFmW1BL1GeSgfJXrLOSUwBNfHN9smdAyj
         iShbRYwyYuvqD1UWPPxbdl6AAzVHZYbHIHtu6ijAiThSaHb/PsMmhovZni1hIo32/p5U
         F85dE0GbsHfEXm03EfEq1sxILqw9mgNq4FbHBrq4Xb7G+/jA5jDY5CIroyvyqD6IsshG
         37DRpgV5uPXmuTkytB0S8XWM/7d6yXCZKlE2jjxYarw10I+pgOCm3XWhMylGrzZWo4J1
         KGkw==
X-Forwarded-Encrypted: i=1; AKwUvBxUailD8Vt9MM01E87C4iwcNptZTzC/7FJyRGdNhfVH9xtJaoR3bIZDmQIsna8GdvZajXWMNkFYn7rV@vger.kernel.org
X-Gm-Message-State: AFuF++ksp/GpZK7+W5otDSpIrgsxmkEjy4OrnzVBayqk9HcpMfg+wCiM
	3R9TH4pyLgHc1Tv+2cv5X7ZByJSA1/oINFtMQCUmApBNLqwO2OxIFNcC
X-Gm-Gg: AYBFou2qhwmuCpvibDQCKXjjDVVjs2SZCwgfDkMI1U5bV6nRLepJLVaZgSBENHosvxC
	1BtWwoxhWS2qpt74wpAB3weHPow+SoqZ5TuGqRh4Rr3ISVWKBalHWd2CH8mNnRj3jG9m1wLpZ6q
	+3FLzLDEnMmpS/JOskunBMnrvFYOGKfpMX//8Il8IPPxF/bv2JIXKmqn8Ve2yENPfzTTTwoyd2j
	Yn+qKvnLg5ExUtd3gjztSTNbTUvAiu1kf0zeQ3gTXWCkOmPE/rdovA6hzzKE7fgZb0soVfg5Z20
	gzQfRsKEi+3osIqMIv4sjbwNVbc97aig/c66qoGcsIywXbvjYiqFmtaqM2vg6S9AXe412zHw56f
	+9m6PgZr6gSNYUGWdIunPDgQdrcJCunex+McPreKWaLby+YMWiei27X8Dd+bhex6xbNE1JxfEbc
	MJNkk67M8KojronYrxsSPxR6mQRbuazRqsR3FDeQVF0/TafyxLAGL1tql1x0EAhf1xVr/4rla55
	pXG5g==
X-Received: by 2002:a05:600c:138e:b0:49e:7c8c:bc77 with SMTP id 5b1f17b1804b1-49e7d73329amr36502225e9.7.1789459503413;
        Tue, 15 Sep 2026 01:05:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:02 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
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
Subject: [PATCH v6 0/4] gpio: mmio: report the line direction on chips without direction registers
Date: Tue, 15 Sep 2026 10:04:57 +0200
Message-ID: <20260915080501.329424-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
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
lives in the iomuxc pad as the OBE bit). Today a gpiod_get_direction()
there trips the WARN in gpiolib; on gpio/for-next the i2c core does it
on every boot of a Colibri VF61/VF50, asking for the SDA line's
direction before bus recovery.

Patch 1 is new in v6, after Haibo's review: the CONFIG_PINCTRL=n stubs
of pinctrl_gpio_get_config() and pinctrl_gpio_set_config() return 0
today, success for a configuration nobody read or applied. They now
return -ENOTSUPP, which is what a chip without pin ranges already gets
from gpiochip_generic_config() with pinctrl enabled.

Patch 2 is the pinctrl-imx side. Bartosz asked whether the raw register
coming back from pin_config_get() is a bug in pinctrl-imx: it is, the
callback never looked at which parameter was requested. It now answers
PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_INPUT_ENABLE on SoCs that say
where those bits live (Vybrid: OBE bit 1, IBE bit 0) and -ENOTSUPP for
everything else, the SCU based SoCs included; the debugfs dump, the only
raw-register user, reads the register through its own helper. The set
callback stays raw, as the fsl,pins binding requires. Converting the
driver fully to generic pinconf is a bigger job than this fix needs.

Patch 3 is what Linus asked for on v3: an optional get_config() in
struct gpio_chip and gpiochip_generic_get_config() as its pin control
backed implementation, the mirror of gpiochip_generic_config(). The
packed parameter goes in, its bare argument comes out, as with
pinctrl_gpio_get_config(). No consumer API.

Patch 4 keeps the direction in gpio-mmio's existing shadow and installs
the shadow-reading get_direction() for the "pinctrl backend, no
direction registers" combination. The pad is asked once, from request(),
in process context, through gc->get_config(), so it is safe for the
gpiochip_lock_as_irq() path that calls get_direction() under the irq
descriptor lock.

Tested on a Colibri VF61 (Iris carrier) on top of gpio/for-next, with
DEBUG_ATOMIC_SLEEP and PROVE_LOCKING enabled: no backtraces, and
/sys/kernel/debug/gpio shows the same direction for every requested line
as 6.18 does (the hogs, the SD card detect input, the USB VBUS regulator
output). On a test-only pad handed to userspace, a line driven as an
output and released reports "out" to the next as-is request, an edge
request on it is still accepted and turns it back into an input, and
both match the OBE bit in the pinconf debugfs dump. Lines the pin
controller cannot answer for keep the input default gpiolib assumed
before, so nothing that worked before is affected. The initial direction
scan in gpiochip_add_data_with_key() runs before the pin ranges exist
and still guesses; only requested lines get the real answer. The
pinconf-pins and pinconf-groups debugfs dumps are the same as on 6.18.
Patch 2, unchanged since v5, was also booted on a Verdin iMX8MP
(6.12.107) with the same debugfs comparison. The CONFIG_PINCTRL=n side
was compile tested (GPIOLIB, gpio-mmio, gpio-by-pinctrl, gpio-aspeed),
and the Vybrid configuration built with W=1.

On trees: Linus offered to take patch 2 through pinctrl, and patch 1 is
pinctrl as well. Patch 4 gives wrong answers without patch 2 (an
undecoded pad register would seed every requested line as an output), so
I would rather the two pinctrl patches land first or in the same cycle
as the two gpio patches, whichever way you two prefer to split it.

Linus's Reviewed-by on patch 3 was given on v5; the only change since is
the dropped #else branch Haibo asked for, so I kept the tag. Please say
if it should not carry over.

[1] https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

Changes in v6:
- new patch 1: the CONFIG_PINCTRL=n stubs return -ENOTSUPP instead of
  claiming success (Haibo Chen)
- patch 3: gpiochip_generic_get_config() loses its own #else branch and
  mirrors gpiochip_generic_config() exactly (Haibo Chen)
- patch 4: commit message notes that dir_unreadable is now also set for
  a pinctrl-backed chip without direction registers (Haibo Chen), and
  states the dependency on patch 2
- patches 2 and 4: collected Haibo Chen's Reviewed-by
- patches 2 and 3: collected Linus Walleij's Reviewed-by
- patch 4: the backtrace count in the commit message is what today's
  gpio/for-next produces (one, from the i2c core), not the 21 of the
  earlier base
- rebased on gpio/for-next

Changes in v5 (patch numbers as in v6):
- patch 3: the get_config() documentation said the answer comes back
  packed; it is the bare argument, like pinctrl_gpio_get_config() returns
  (Sashiko review). Text only, no code change.

Changes in v4:
- new patch 3: get_config() in struct gpio_chip and
  gpiochip_generic_get_config() (Linus)
- patch 4: seed the shadow through gc->get_config(), no pinctrl call
  and no CONFIG_PINCTRL check in gpio-mmio (Linus)
- patch 2: drop the npins check, pin_request() already rejects a pin
  the controller does not have

Changes in v3:
- patch 2: return -ENOTSUPP for the SCU based SoCs instead of letting
  the firmware call hand back the raw pad value (Sashiko review)
- patch 2: -EINVAL for a pin the device tree never configured, -ENOTSUPP
  only for unsupported parameters and SoCs
- patch 2, 4: drop two comments that only restated the code

Changes in v2:
- patch 2: decode the requested parameter instead of returning the raw
  register; debugfs group dump reads the register through its own helper
- patch 4: keep the direction in the gpio-mmio shadow, ask pinctrl once
  from request() instead of from get_direction()

Mehmet Fide (4):
  pinctrl: make the CONFIG_PINCTRL=n gpio config stubs return -ENOTSUPP
  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad
    register
  gpiolib: add get_config() and gpiochip_generic_get_config()
  gpio: mmio: track the direction of chips without direction registers

 Documentation/driver-api/gpio/driver.rst  |  7 +++
 drivers/gpio/gpio-mmio.c                  | 60 +++++++++++++++++++++--
 drivers/gpio/gpiolib.c                    | 21 ++++++++
 drivers/pinctrl/freescale/pinctrl-imx.c   | 54 ++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 include/linux/gpio/driver.h               |  9 ++++
 include/linux/pinctrl/consumer.h          |  4 +-
 8 files changed, 151 insertions(+), 10 deletions(-)


base-commit: 7257c35db0fdb4fb02d857a8197a16afa84d92c0
-- 
2.55.0

