Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1CB3DDB04
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367200; cv=none; b=dhSaSigxuDDamBLk6MDXh1JVhXwkjyfaGN15vhBmrAe8XsMPGAgY6oAaaGSF2qEe0pvu9bbNnhc1B/AJTmhY6N6Ku7lumS5mG1CZOZn37TjoG+AIh2m4NsVLkYcqp/3NP2foc9aQ4KAHqEBWf3ZSePpJcXr18apZfQTZfvVFVTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367200; c=relaxed/simple;
	bh=tQTTUSW7eUWfh15MDV5ZX7e6q64R5S4/Oqee01xSP2s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BcV/SBc0cAewfh/JLwx9tNsSU6JP1Bs3ju0HAtDfUyJnoRt1wJTk9Sgx4TAgtbCD9zCgeIKSegm1MWDILn6VUZAA7bp2ixYdzHp9q647+BudAVL1Dr0bHHTvDHD1dd6awbBxLl1PGPKce69k6zQqODANKeM+VKO0eWyVZZJ5ThU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mkmkl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sp1As5M7; arc=none smtp.client-ip=209.85.208.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mkmkl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sp1As5M7"
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-39f6a02edacso5160681fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 06:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786367196; x=1786971996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=95XcyuahfruBLeOEab+HwcmrCQNnVz9pT3RpyBKiDUY=;
        b=sp1As5M77qc5VzOvzQVcYl5Z0JFZ8yxli8Vcx+fO4rfCZ3y1W+M7WiAZq8kqZkLPn4
         DvNfDrCzTfVPzzGUVZVT2PWBY98WDCO8jvT+n222ufsFJYiNurwwf6uMgxt12o+GJ00Y
         d1qMjlSA9vaOXDUugs7dDfsgZvUAHbuLuHNCEiyQuAhA+U7M+fHufQVuSxp008cU8W1K
         1Zow4+Tm1sDSz1hXAj411SebE0PrXiajVHLwEmotNWGQ9NZnHcRsPXQBd9wC6jtAq+dI
         Pix2TVyEbROMxQ5eivUNmsIgr1Za20+qjNubuSuphvr1aDPuGFIGLKjaXl6R7Eijvv6U
         UByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367196; x=1786971996;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=95XcyuahfruBLeOEab+HwcmrCQNnVz9pT3RpyBKiDUY=;
        b=El1/MSsWzGk8FMYx2X+OPIj8wltH2+aWpeTf1KXwtXEDnlgY71kmeJpLlvK7xgwNGz
         N04Ov67MunW4Epf7yGZjZ/QfY2rDAb4Ei+IJxMt9ud3KLkDpj+vy+UsrPMVZrEbmXeF9
         1+YyuxZs9zNNAv/ADIoj5nq9c6Sqa9pq/LjTwfglElWjKw+RXP8YS5ptdmdbhItEa5eg
         FXLGy9PLlaDQIxVgWvRvAMA8vkFIt+ewIw1CyHwBz50t3ULY9GoxIoLm0/TuC5oYcchu
         3T3mHcXoOIIgQJaK3A7TqlY3cr7LDqUvbfikbS3huSXGTioyDtzXoI2rpY3VL+m/+baX
         1NbA==
X-Forwarded-Encrypted: i=1; AHgh+RphcDVqJcdPS6NDP/8XGCejmwW1xXzArhsvx47mSCyAzRCHlH1UDnePjeiKGRMLKgYamBqjjcWFAW9x@vger.kernel.org
X-Gm-Message-State: AOJu0YxavafylugOvHFptfo5lf7Dfd6Pqa2SV6963bY2+6dOU+tuywH8
	5krW/KNzvA/VO/WYWBpKQfYvkWJy5g3Y8XiJxrOXONCKM3INI8bKElblKMPHdIQuRT8kWwQT76C
	Tcw==
X-Received: from ljjo19.prod.google.com ([2002:a2e:9b53:0:b0:39b:50cf:4a26])
 (user=mkmkl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:651c:54e:b0:39a:fa7c:b152
 with SMTP id 38308e7fff4ca-39fe5648f40mr20830661fa.4.1786367196243; Mon, 10
 Aug 2026 06:06:36 -0700 (PDT)
Date: Mon, 10 Aug 2026 13:06:33 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260810130635.1166626-1-mkmkl@google.com>
Subject: [PATCH v1 0/2] pinctrl / 8250_dw: Allow drivers to keep init pinctrl
 state until first open
From: "=?UTF-8?q?Micha=C5=82=20Karda=C5=9B?=" <mkmkl@google.com>
To: Linus Walleij <linusw@kernel.org>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Douglas Anderson <dianders@chromium.org>, Vic Huang <vich@google.com>, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Micha=C5=82=20Karda=C5=9B?=" <mkmkl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

During device probe, pinctrl_bind_pins() binds pins to their "init" state
if specified in Device Tree. When probe finishes, pinctrl_init_done()
automatically transitions the pins from "init" to "default" state.

While this auto-transition works well for devices that are immediately
active upon driver binding, certain peripherals (such as power-sequenced
devices connected over UART, SPI, or other buses) remain unpowered until
userspace explicitly opens the device node or attaches a protocol driver.

On board designs where the connected peripheral is kept unpowered during
boot, auto-selecting "default" pin states (where signals such as TXD or
RTS may be driven high or pulled up) can cause parasitic back-powering
into the unpowered peripheral through its ESD protection diodes.

To address this without requiring new Device Tree binding names, this
series extends the existing "init" pinctrl state mechanism (introduced
in commit ef0eebc05130 ("drivers/pinctrl: Add the concept of an "init"
state")):

1. Patch 1 (pinctrl core):
   Adds pinctrl_keep_init_state(dev). When called during probe,
   pinctrl_init_done() opts out of the automatic "init" -> "default"
   transition, allowing the driver to keep pins in the safe "init" state
   upon probe completion. Updates Documentation/driver-api/pin-control.rst.
   Board configurations that do not define an "init" state are completely
   unaffected.

2. Patch 2 (8250_dw serial driver):
   Updates 8250_dw so that when an "init" state is defined for the port,
   the driver calls pinctrl_keep_init_state() and preserves the "init"
   state until the port is first opened via dw8250_do_pm(), at which point
   it transitions to "default" state and resumes normal operation.

Testing:
- Built and verified with CONFIG_PINCTRL=3Dy and CONFIG_PINCTRL=3Dn on
  upstream tree.
- Verified zero checkpatch warnings (`checkpatch.pl --strict`).
- Note: Functional hardware testing was performed on a downstream kernel
  tree where the physical back-powering issue was reproduced and verified
  fixed. The underlying UART pinctrl lifecycle issue and core logic apply
  identically to upstream.

Micha=C5=82 Karda=C5=9B (2):
  pinctrl: core: Allow drivers to keep "init" pinctrl state after probe
  tty: serial: 8250_dw: Keep init pinctrl state until first open

 Documentation/driver-api/pin-control.rst | 10 ++++++----
 drivers/pinctrl/core.c                   | 20 ++++++++++++++++++++
 drivers/tty/serial/8250/8250_dw.c        | 13 ++++++++++++-
 include/linux/pinctrl/consumer.h         |  6 ++++++
 include/linux/pinctrl/devinfo.h          |  2 ++
 5 files changed, 46 insertions(+), 5 deletions(-)

--=20
2.55.0.654.g21b8a5bc05-goog

