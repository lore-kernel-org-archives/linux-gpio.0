Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEBA42B316
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 07:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420711; cv=none; b=AjXmWZBDZq9lsd1y4Sztnb/FP9sHf99o480xx7EhfEYUx0T7Q8ZwGXT0yhkivu7HiQsXo8YnKlSYA2awPyP9RILgBmDNVP1am9rI3rBfdExMR8LwVDfN5oC9qBhJH6K3EhIn9uaWAmbvGJ/mT1e+6BMnPVrMlqXGggxU6ovJZKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420711; c=relaxed/simple;
	bh=RMCay6EhyfNPfmdeBEWprGskhGN6GSyjB/W9kWpptBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKWdhxUy5fqtwbXwZ3JOq6TS0/hN4re4uOS910uo+nLtDFylumK6EPIgBrT19pjq3AQA4byWyaFDauZGzBVbzxtki5fbUdKGyXgVXa3qSswks0lS/fcdfq5S9WwrV7rXjVzmAux6iSHqYo3AP21FECigIhzahBsHak5WYgssvTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6vRR2Jb; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6vRR2Jb"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48431648f33so453798f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 00:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420706; x=1789025506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d9KwlyMIe2ffPTieEcQ159G8mFBwDIrli9vBOYObo7I=;
        b=j6vRR2JbjD+3BDxOxs3HAVOS+qVWSqqxHqRFlSY0jD8EW8Kt+lXM4PIqS52FiBIlBM
         80Y2eh7ojCKlLU1DFf/h+n19+cqYnPOlzxI2XgGgiObVkIe1Li0Uf0xyAeJVwnidLz1L
         krdpPV8N8Kw7I7OnE72JGQxhf5b4W6TnJ1AbcgTz06fAzem4o2VRpy71eCYpBqDtLGN6
         QPfn/e35O2V25pPBc75ZQI8//3HXUMxHay2JInBrfCdtJ05wJkHgIFrkkyMCdE5N/z/5
         lTjj1OqeM/WBwYhdLAhtuwyU+cSukS8JSiUt9QowHHxez7PQ4weChBIL73Kg07TfdQt8
         1p4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420706; x=1789025506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9KwlyMIe2ffPTieEcQ159G8mFBwDIrli9vBOYObo7I=;
        b=gSLXLgof+oQciU2P3FGqY32Khk2j1AnaSrw5rADJxCOOUoItfIvg7ub0RJGHNzjRh1
         FH/Nimd0hrNZ0b24tiymJgbEOiMskSmL74SLFVdDiSkDXxe2/RVejmpRPXVpjUIG+XTc
         Znc8HkX1OsFtX5zaofvN5SEAHpGc4sFwJC7N4EqLPacgo9tA+M8llxSHMfILyzt8JQef
         cSXSmHieAdngzeFb38Wrn2SRTJ9VfPiWTU1WL/l8psp0vQWqjKIhV7DEOI5w0TeMw83u
         HThlGwUkWQI8cD1dwzxGoR7lNlebDOTccF2x4mQTbx4/a+ThPaRIgigfZbC9wXKkAUCh
         ONbw==
X-Forwarded-Encrypted: i=1; AKwUvByvNHy8Q3KcWWhk8Yp20dxggn/kaFwghQwbjDkl8PkSJ8sVxnhu/UiDjoKFbn1yJqaammAzRSsybslN@vger.kernel.org
X-Gm-Message-State: AFuF++kacACT0ovmqPuA2XRI+r7BSPJHe+YfDpeLZkbQAnQScg774mLB
	SAgkDmmKFRYMO6YFnyoHgmuDIZJdAA0Frr85p8zLkOnhjZy13ctFszbV
X-Gm-Gg: AYBFou3E9wpfdK7bLPY3Fm3EwKKeAojSoeCEuT5lCo7BtrAW5WrrZMdyV4nqPAmVX3f
	K4ntKfnGA/xO6NX5atdad7ljnNWwPJGxTJ9BS66DNOsXnIs1EkR8i4CdHzeNi005f+qZRop6Vxe
	awNng+xaCzlqXCJPDTf/RqSAm3t1mVgRvWIB3NQi8jGfXA7ZXqI7ZGnt6Kroj0xR0lMxz32Uoda
	WpKNqFcUI+/E9Ut2RK1WMWCh9H86zrzuPXya67zRpPU3zk3yEgF6RigjeJatfcKPL/ExkES85qP
	F65P5tAcQrp9rjIsVvXAxZTf2ccrC7kjo8xnEwMFKiO3GvGwvvXFLIOcVqSntyTIrpDBWIqdWA5
	qDE2os7+jVwR89TbLAkZi6NsLKkHFYWgAIkXEa9anLRINCg0YNgsD+SaxQYYzkh2GfYhXaooyDC
	wC4SdjG/yJnVzzL8d9CpxLKOQf9o61hhGHJX77jT3w60vrToo8jtRNU6dipCTjaXgsCw==
X-Received: by 2002:a05:600d:4445:20b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49cf1577d23mr12892375e9.1.1788420705978;
        Thu, 03 Sep 2026 00:31:45 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm69369455e9.2.2026.09.03.00.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:31:45 -0700 (PDT)
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
Subject: [PATCH v4 0/3] gpio: mmio: report the line direction on chips without direction registers
Date: Thu,  3 Sep 2026 09:31:40 +0200
Message-ID: <20260903073143.2068494-1-mehmet.fide@gmail.com>
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
backed implementation, the mirror of gpiochip_generic_config(). No
consumer API.

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

 Documentation/driver-api/gpio/driver.rst  |  6 +++
 drivers/gpio/gpio-mmio.c                  | 60 +++++++++++++++++++++--
 drivers/gpio/gpiolib.c                    | 23 +++++++++
 drivers/pinctrl/freescale/pinctrl-imx.c   | 54 ++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 include/linux/gpio/driver.h               |  9 ++++
 7 files changed, 150 insertions(+), 8 deletions(-)


base-commit: 1900b5a41493e7050c68c1e62780d6fb9a209457
-- 
2.54.0

