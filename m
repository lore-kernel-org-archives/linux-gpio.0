Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77534A99B1
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363939; cv=none; b=i6RtfaVv5QwdzKYVyD79+XHODzEEI9Ka/nY45HIU3GTXzRyFBjxC9gx5wt8kyH0KBfoHT053TLz/JRPK/Y7j8v1PkW2qPkoenHRm/f91/bHxIwynl1Pylcd7FC1ENsT/yfan9u0/DxPsS+es2gzDWF9ogLSnkk2gFWFgO7GbCSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363939; c=relaxed/simple;
	bh=/5wWvImcqPU1KITCKP06lfPB9gw/2Ddp3aenchuF3RM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ruyl87yjyQbbUoIGVcd5+Kz8ty3AXK5vEbxvtMEhfAjOVOSmxgo2kctyD+p+GGNqvkMLQjte8qfZJNtdv/ChDmrmxcFtK2LimpgAIg/bMvHlwPZrPYCsgyj8o+/s+Kt/hjx7FMFrKi/rN6xc5liWgTEh7VptA/Tk+Qkq1tgkqsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnYBB8EI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnYBB8EI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8687630fso9729995e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 08:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363933; x=1788968733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0+gl5U9/Zkul8WCUYt9BkcdFSYfVkFnGP/S7FNbanA=;
        b=ZnYBB8EIeo6N6t0qPmdKVxb7pxxLHPTqfw9E7OKVCexYZQrVNXkYcxxwXJrB8Sl8Pu
         qiuYKQQ99xil0a8kH6B0tyzrk9wickcXfpQo0EaLhrvVS8qxWDCkGbc657R3EsbO1vL/
         UglO7kMktzlJIxiLVpTLMiRueXMGvnk9HAOpTr+qn+Fjm+2SMk7Vq4U/5WuTq8d33pk7
         R8YtLWI3lyy+Z/+LyyS6gNnmkG2otnz9+54KVn76PyOFqTiuLvqOc3QTcixoRw6rdQG8
         4amJokYd43YSBXSRmOZeejJL2IRCtZjxXT8TzRPZOzbPD2yptkhsxBiQXN/In5hUtHyG
         E+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363933; x=1788968733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0+gl5U9/Zkul8WCUYt9BkcdFSYfVkFnGP/S7FNbanA=;
        b=fGo89yoe8KGuB55AIPD/Wb31ncVn90G4s6Fly8zcgadud4I260+m4n0UrwBAr/8j54
         hXkhK3TMF1B7FM09yPtUb6zKbpmRfg+1AmRV3Q5JQIVvp6p0coJcf7ubNr5cAxHcv17s
         OlzmCBm9ZMLb48x8z/Q9+OeN4qhOh3J3TN1OtBrZB/zln8UvuaD/CE5hBl5gayz1nd79
         GiRdKghHwGTTPApTAED34v4oevy9MNEopsbflXITWHZFdRrxefvyDSzaKHd+/gnn7vIm
         Mch50in+vtRhRCejHiLvf8wnUYyZS0DbBFWt/oA69GIDD1lF34z7nL1G819dOcP79yZG
         XUPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2pD6sDUlQ3dbh2N/INPrk6NHkr4iRik+JRG7L2qGIkQmvizMZ9oBcU7VbvCMJf2emmyVo12XXSEXH@vger.kernel.org
X-Gm-Message-State: AFuF++l4SP9E0ULEUXwbaDSSjX53UaKCDlMI6ZY1bCRAozPkgsBoYKIw
	jZ6nWXeQcXHj/bNa7UX1PxAMo2xN6XiPIB0biQETW8CZ/binj+beYLLG
X-Gm-Gg: AR+sD13Q3YMc6iqWqkYY4GahTaZbdtjmPGHt9vE/Z6t/1Gdg50an30u3irHCpiGCvUc
	NsJau6Zt0fgXgIjg5Bf8U6VoXgF6TB3gIF+IY0Lzqf6UhaVFFdJnplMKHMV9hXceO8HLP5wxyEw
	KdTFIRNKyWSclvAmZ5JSNtA7fTerWmHeqMD3xRHcO9yz9RP2+aEuhz7qIwuITJCP5b53WZ7Ig32
	Kqi2etyfHQnNPV0hiFGKzcVuMk7lniSVtJAdA1qcy2yqnPTM7oOSLhLBfpDZVkuKzN4sghSqjJd
	BvlSifqLUh24D9hIBGuRfjd/ogcgR+Q/ND2KWLiEb9kFj6rdX3SLK0cWyrNYvf8eRNgySbxsX8u
	mBxTjH8sOBoy7dLezhX6ieKV4pPkvqyneCWQsGULeuk9ekLu99QuGs63CKJcqaXs8b3OEdh3OAb
	A62//rbvD9dw58mE+1XOE2fRg70QEh2Dui1pRBXeVmdfpGurGdAlyNPlIDorj8hDh67g==
X-Received: by 2002:a05:600c:a55:b0:49c:d60c:74e0 with SMTP id 5b1f17b1804b1-49ce582a35emr107105125e9.13.1788363927404;
        Wed, 02 Sep 2026 08:45:27 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e686fsm530655e9.15.2026.09.02.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:45:26 -0700 (PDT)
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
Subject: [PATCH v3 0/2] [PATCH v3 0/2] gpio: mmio: report the line direction on chips without direction registers
Date: Wed,  2 Sep 2026 17:45:23 +0200
Message-ID: <20260902154525.4090276-1-mehmet.fide@gmail.com>
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

Patch 2 keeps the direction in gpio-mmio's existing shadow and installs
the shadow-reading get_direction() for the "pinctrl backend, no
direction registers" combination. The pad is asked once, from request(),
in process context, so it is safe for the gpiochip_lock_as_irq() path
that calls get_direction() under the irq descriptor lock.

Tested on a Colibri VF61 (Iris carrier) on top of gpio/for-next, with
DEBUG_ATOMIC_SLEEP and PROVE_LOCKING enabled: no backtraces, and
/sys/kernel/debug/gpio shows the right direction for every requested
line (the hogs, the SD card detect input, the USB VBUS regulator
output). Lines the pin controller cannot answer for keep the input
default gpiolib assumed before, so nothing that worked before is
affected. The initial direction scan in gpiochip_add_data_with_key()
runs before the pin ranges exist and still guesses; only requested lines
get the real answer.

Patch 2 needs patch 1 to give correct answers; taking both through one
tree, with an ack from the other side, avoids the window.

[1] https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

Changes in v3:
- patch 1: return -ENOTSUPP for the SCU based SoCs instead of letting
  the firmware call hand back the raw pad value (Sashiko review)
- patch 1: say in the commit message that the set callback stays raw
- patch 1: -EINVAL for a pin the device tree never configured, -ENOTSUPP
  only for unsupported parameters and SoCs; reject a pin index beyond
  npins, gpio-mmio is the first caller reaching this through a gpio range
  (local Sashiko run)
- patch 1, 2: drop two comments that only restated the code

Changes in v2:
- patch 1: decode the requested parameter instead of returning the raw
  register; debugfs group dump reads the register through its own helper
- patch 2: keep the direction in the gpio-mmio shadow, ask pinctrl once
  from request() instead of from get_direction()

Mehmet Fide (2):
  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad
    register
  gpio: mmio: track the direction of chips without direction registers

 drivers/gpio/gpio-mmio.c                  | 59 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.c   | 56 +++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 4 files changed, 113 insertions(+), 8 deletions(-)


base-commit: 1900b5a41493e7050c68c1e62780d6fb9a209457
-- 
2.54.0

