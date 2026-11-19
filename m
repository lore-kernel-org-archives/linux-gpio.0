Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795100971;
	b=epkgVxMQ1P5sCFsoAHM0ITR8ZNGtL+uIEtDrhMP/HFhEKbWeLjwMkpAzJkn27Hkn01jm
	 AuH/x4KTk8SSJRvi+j1HNrpWd57QXJ9BwskPXCvvSAv3gkN6tmuLBY7l97s0BiHjd7LJC
	 Va/JkF26Gs+UXJvzc6zYY87peDwmJcUT0UDitF5wPxA7S+7ybPdmRGru49xwVGIVEhWl7
	 BbfDQTEgIlXbMS8A67ia6qulcjYQoR4ggP1yIRIHDSffqsNyNVSwl2D15LS6SZVuPCCEI
	 tokeHN0Izx2ZFXMMGuI2iN1d4AFAmMedpyvQkuZeO2J/X+pH8HaQBvK/Xpt+/dMViNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100971;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=2HmuUdZT8K2en2ekpI/R6Ttr8E15fmZ1FZ2hAdmTSsk=;
	b=yaJnUMbsRElZpExRzg7lX543x7O1xkIgfLiXSoZ4U/voBN3YtXHoTrHcvQ5TnBJHMgEK
	 uVRtbTQ3vZtXQXMGTcxQ99a7tTwE8ZT8W1ZQFiNfC2jICyB2nJE8FVkWkKCDbez7AXWtc
	 qLNhHNmmGGonsxfjlrTuc3n6fNRxypsQfTYpgxmbXD3OAbXktYKqQSYL46Pk3cXU2/xVY
	 BB57jgq4wG71zIfc4ld4yXl7zCy8TgykZQFBfueBs4ERsKcBlis5RUbDFTsAt9HKf7jus
	 6GsyvWX/kzVxO7Nf//rjx0ttu78RHyN/n6oG2pkfmwUBf1NiIMOIZkJvtsuOuMoVFqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ftrq/WTl";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E91606A330;
	Thu, 19 Nov 2026 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ftrq/WTl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795100971;
	b=Tta7vulMVLA1uPmHtjKiWbm1cBFMC/09m6YM8HiRcT9oy4deZWvWpeJz6QYLABlyLceT
	 0u2iUUMofAxXsK4+Hn9OXcorRoh9iJaglOEsVS29kusWcgUGn6nZeenao/S8DxKzqArGj
	 4u8o/2ux7cj9fiTlMAiIgimWBWMxGpfwkq53RB9OokSvXTvQ85vYEVbRbSWdxJG0AxyM7
	 yGPSY4CzA1RJwOvVxHufZAqdTGC81SOIp3pbVFlKJfO5t4TM9sw4nei2ARv72Cp8LNVAe
	 c8ddcrgpDa2h68sr4qWA8AzCsthCUzZVq6IFz8UlFX5Ai2AQJyixU1y0xx3Fo/E7pCg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795100971;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=2HmuUdZT8K2en2ekpI/R6Ttr8E15fmZ1FZ2hAdmTSsk=;
	b=W7j7DLfZHLNuRKqt5irsb4r75GT+DBjJ060KNKW7FiSalDHtlg8rZ0QJqYGQZbkuhlGN
	 BllZ0WW3925JVhiduRLCa5wkAx2KevLKQJFF7hc/J/+h3BpH8wY8xXSgBHIjO9xK3t5S3
	 AQrlXrQzBSdVls2qfRkqoSXE2vV6OPVR9GjPrYxNfBD+gwS8fHcUVRY5/uBZTBheiohGO
	 rs9W7E6b2HbhjgjekenRdu7VoRgF3vld/YEt9Q+DJzLSPEzbGYewm+B73efDtJpvtb1Ve
	 LYPssv/GxjOLcdSRHbTzybyOT60KJuQ3PGo0mMw9fKSL6V2HUCh2fJ7ruSwtnjZXWJw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B17A1F000C5;
	Thu, 19 Nov 2026 15:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795100971;
	bh=2HmuUdZT8K2en2ekpI/R6Ttr8E15fmZ1FZ2hAdmTSsk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Ftrq/WTlS5nyeXBNytDQh0Msv7Xob1sAuPzYRUgyov1OZPKmjhuzyPeXspYjcHl/y
	 7wVtd3UlCkq6654vkL2nRRIHjfk1kYfB33Pm23SPuyvcHCJM/+zcEnDxpsIUMOfgVR
	 vqExRY2jMng4iQcGwrp62jUCayt8m2HyWAInCuaHPZaa4t9vSTBPZ3E9TIePPLjyiG
	 GVsLDLgh4pfiCyvoqmuGs/06tyeQvo9SmK2XL7Vi3xcO4LS+s6rKVj/XO2dcZpcC9i
	 ZOJ4zn43Onc0gM2cOBch8OojDnaDlIxjCWcSBY9A52HDuaWy7JHLeTWZ6vm+ImIZGN
	 MYmEBqBJhfFvQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CF5144B304;
	Thu, 19 Nov 2026 15:09:29 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v6 0/2] gpio: Add Cortina Systems CS75xx GPIO driver
Date: Thu, 19 Nov 2026 18:09:07 +0300
Message-Id: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNQQ6DIBQFr2JYlwYsoHbVezRdIHyVpooBS2yMd
 y/oRpeTvJm3IA/OgEf3bEEOgvHGDhHEJUOqk0ML2OjIKCe5oIRyrHzB5xm3o7EYNJG3AoBJUaJ
 ojA4aM2+152tn/63foKaUSIvO+Mm633YXWNrtZUrFqRwYJljqksiKMaiEeLS9NJ+rsj1K5cCPb
 nV2eXRLTVmT17WgrD6667r+AUyfBGv0AAAA
X-Change-ID: 20261015-cs75xx-gpio-ed0a37ee4a68
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795100967; l=5049;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=EhUV4m3x5pqIox2QkeCyQxEVHdvQ1jHoNLjoIGNZ+IM=;
 b=94pauLRG9uL56SEoTCkAmBgHzcSmy8uKOHr8hKWTKkjibpQfNexqAlzhITdtBDoYEScHgog9z
 Px6RgrSKNSqCTy6J733wq9UskzxJar5h2vIAcwePP/Xp8QxljKDzMYV
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

The Cortina Systems CS75xx ("Goldengate G2") SoCs have five banks of 32
GPIO lines, each bank with its own interrupt. This series adds the
binding and a driver based on gpio-mmio; level and edge triggers are
supported, both edges are emulated by flipping the polarity.

Each pin is either a GPIO line or belongs to a peripheral (NAND,
Ethernet, UART, I2C, ...). That choice is made in the global control
block, which is not part of the GPIO controller: as discussed on v1 [1],
the driver does not touch the pin mux and leaves it as the boot loader
set it up, until there is a pin controller driver for that block.
Testing the reset button on the Securifi Almond+ requires selecting
GPIO37 in the global pin mux before gpio-keys is probed; the current
boot path does not provide that setup. The tests used a separate,
board-specific setup step. The GPIO driver does not program the mux.

The driver used to be part of a series with the interrupt controller,
I2C and watchdog drivers and the device tree changes. That series is now
split per subsystem. The driver depends on OF and the generic MMIO GPIO
and IRQ infrastructure, with no dependency on the platform series [2],
which is under review separately. The device tree nodes will follow with
the other CS75xx dts changes once the platform is merged.

There is no public documentation; the register layout comes from the GPL
vendor kernels. Tested on a Securifi Almond+ (CS7542): the reset button
(GPIO 37) works as an active-low gpio-keys input, and the SX8650
touchscreen uses a level-triggered GPIO interrupt.

[1] https://lore.kernel.org/all/20261012-dreamlike-hazily-19bb60326f0a@spud/
[2] https://lore.kernel.org/all/20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com/

---
Changes in v6:
- replace the dependency on ARCH_CORTINA_ACCESS || COMPILE_TEST with OF,
  so the GPIO series can be merged independently of the platform series
  (Bartosz); HAS_IOMEM is inherited from the MMIO GPIO driver menu
- build built-in and modular on ARM and x86-64 with COMPILE_TEST=n,
  without the platform series; the driver code is unchanged
- Link to v5: https://patch.msgid.link/20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com

Changes in v5:
- explain that ARCH_CORTINA_ACCESS is introduced by the platform series;
  COMPILE_TEST allows building this driver without that series
- correct the pin mux setup required for testing the Almond+ reset button
- clear the interrupt status after changing the trigger type, so that
  unmasking an edge interrupt does not fire a stale event (sashiko-bot)
- collect Reviewed-by tags; Linus, I kept yours over the one-line change
  above
- Link to v4: https://patch.msgid.link/20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com

Changes in v4:
- rebase on v7.4-rc1
- split out of "Cortina Systems CS75xx: interrupt controller, GPIO, I2C
  and TWD watchdog" so that each driver can go through its own tree; no
  longer based on the platform series
- the pin mux registers are not part of the GPIO controller (Conor): the
  binding has a single reg entry and the driver no longer switches the
  pin mux when a line is requested
  (Rob, your Reviewed-by on v3 is not carried because of this change)
- switch a line to input for an interrupt only when it is not requested;
  flip the polarity of a both-edges line after the ack, so that an edge
  in between is not lost (sashiko-bot)
- drop the gpio_chip owner, gpiolib sets it; sort the Makefile entry
- Link to v3: https://patch.msgid.link/20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com

Changes in v3:
- rebase on v6 of the platform series
- Link to v2: https://patch.msgid.link/20261013-b4-cs75xx-s2-v2-0-94f8c0a90cda@gmail.com

Changes in v2:
- rebase on v5 of the platform series
- do not include <linux/mod_devicetable.h> (Uwe)
- update the both-edges mask only for a valid trigger type and test it
  under the lock in the interrupt handler; refuse more than 32 lines
  (sashiko-bot)
- Link to v1: https://patch.msgid.link/20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com

To: Linus Walleij <linusw@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---
Fil Dunsky (2):
      dt-bindings: gpio: Add Cortina Systems CS7542 GPIO controller
      gpio: Add Cortina Systems CS75xx GPIO driver

 .../bindings/gpio/cortina,cs7542-gpio.yaml         |  65 +++++
 drivers/gpio/Kconfig                               |  12 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-cs75xx.c                         | 283 +++++++++++++++++++++
 4 files changed, 361 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261015-cs75xx-gpio-ed0a37ee4a68

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


