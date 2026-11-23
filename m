Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795397858;
	b=3OvLqXLsrM8nAS0aStSdBivxkYfFN8CZe6DY0ipjk/zK5BVJ83fzLEAdRTSjCFlUSXOH
	 BKFe+Q/SwkW3EDXC6JXglC9BIFhIHXCHc7Y5o9xCMGTfa9sj50oPiKbtH2SOpB6trh83i
	 uZxDuL1/1kB3JOyU35K5xRZtcQ9q1wOJZS5GniVcER+xh+O8Pd7p/dW5AxSUUL3S9skGu
	 D83HlxJA8xqcKhFaY50h/gNGcnUztXE8hoxxO7Ym0QwaelmUo+Xo6nhpgEUN/L+W2L6Fs
	 OMpgph2hHIK+4g0idy0DUkkLMTyAlcMH+nam54XyPVoA82lhuucNfEkQvJV7G7kU6ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397858;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=31eFJUUe6O2ZEIyfh+UG4Gn4F3WP5gMp7Jq9roE6ghA=;
	b=aQ932PYYeG+id0+bwQ9s9VGOuEWjqHI1lijQk0kyINGUV/6R3uv/v6KAXkJjwBo84j6T
	 RPy3/1zTvmvuwiiaara4dpwb5txcT0QUYbk2fG86RGlz1SA/xKe0OlkRSmwQ0LHtsBZRU
	 UhbdccDEgj6hGnogGd8/H0W0auxzZPUdnA3fIO6nTUkPL4kzUj+V8IjO8Zw0AeSu9E5yc
	 McI/msf/1LpqNppmfub3YZBJMpjeYY3TxQp3csVeBy2UCMJM8goOOIOZ8IVKsKQmD1mcC
	 zaES6dSzaZOEX7DOItrl35s3nSocERRpQfP3gZGYUOWOaBLZEWQYKFK/kh6O9prCGsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U6CQzaZP;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B83606A31A;
	Mon, 23 Nov 2026 01:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U6CQzaZP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795397858;
	b=BdqvaP+xmqdAO1OLy/nhmM3NtuGi1O7GWuvFLGzxGKJdd5RiHmeoon7cDtVqqqkUWIg4
	 O56ULE+/MiM82zZVln+KlovVtOnZk5LrBrkbi5RkkxSN9fLmSns6Gba0bZM/4mebpJbAG
	 UW5jDIcrryLVli+4c9zIZTYczyWZnhEoTgk0AgsHxAQXbICth5X/ONooPOYL2BXmMp2Wd
	 L8BksCBHBULRXvEJWvZ6oz9nMzShortBUq7MTQWZCrKUHsN/8CGDdF90L4BhpkbzYDFBY
	 aVxzXJIvabTolZfVvqAH8lzII2mBRQWCYuVnO+2AUlfXsVleiV+NmI+2CCpftqX+wjQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795397858;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=31eFJUUe6O2ZEIyfh+UG4Gn4F3WP5gMp7Jq9roE6ghA=;
	b=jc9DDiIh1RDsIYXpO0R3E/UbtChXMF67pidrYhB4wZWNxF+DtMvwBwvSMAKt2KRe8WWm
	 eCnJURZFFJTfEu9YZPAWOOB3j3eQ0d6jGiYOXKxSK/dJshUw9xqnn4bKMg4aac+kjmN5J
	 71OOmGaAzOYX/MZK3GpsgdpRlP6RFYRfiwrGbFEwABhi+85mN4/+tZNamIezgwkrMfSAV
	 sHJzkJm7wYfN+U2uT8TvLmLNn/MwUMxtqsWOyvoVWd8NhF3YMF2RdDj6Y8jibdzpIquFJ
	 JvbgwmmEhGcQXhUgKzz3JeQXWlAdOmP4+FfLe0G2sm4hAfCNeCgdk8bRfOFe9FSrBNA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 713AF1F000C6;
	Mon, 23 Nov 2026 01:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795397858;
	bh=31eFJUUe6O2ZEIyfh+UG4Gn4F3WP5gMp7Jq9roE6ghA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=U6CQzaZPpmoLsfi78kDjV5NGfe4xUdmxAuRYPgk/pwZ4CfHI36KdUEbfmtG6cvtox
	 octQfNpfml2PdfENXt9FNbsfGoPBVnwAhoF99lKfNQKfAjuwpP+XsP475b+zXNDzxr
	 tQ5zi+Up46wvOjeTArQ2eRSlXoXdXkOWKpGZukWjWSco9FyakWOe/SNcoAvEtH6kw9
	 UfXYwC4KvKCkEKTJIZczV3t9cKKo3i024aE5p2MEimNOqjosmbO5oZ8cHUNkac+wLV
	 yMf8kqv5wrsebafhTsEwTz49/qfi6RUV7LQ5c7A+dYwcQ2VQMtRvnA0a5WY4bm0a4X
	 pUQ4UsgrFIkfA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C507E4C2B8;
	Mon, 23 Nov 2026 01:37:27 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH v3 0/2] gpio: Add the Siflower SF19A2890 GPIO controller
Date: Sun, 22 Nov 2026 20:37:17 -0500
Message-Id: <20261122-sf19a2890-gpio-v3-0-3a4857ebc84a@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAM2YA2sC/2WOyw6CMBBFf4V0bQ0dChZX/odx0ZYBqgawhUZD+
 HcLanwtz+See2ckDq1BR7bRSCx640zbBEhWEdG1bCqkpghMIIaMsRioK1kuQeQxrTrTUgUszQB
 TKIUgQeoslua6FO4PD3aDOqLu55ZnwuJlCEv9O1Yb17f2trzh2Xx9LfLfRc9oTHmKPEs0FxsQu
 x7PUp7WBXoyd3n49PM/H4KvhEhLVQiuuf7yp2m6A6XtDeUUAQAA
X-Change-ID: 20261102-sf19a2890-gpio-b21562e52f88
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, Qingfang Deng <dqfext@gmail.com>, 
 Michael Walle <mwalle@kernel.org>, linux-mips@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Joseph Telaak <joseph@telaak.dev>, 
 Qingfang Deng <qingfang.deng@siflower.com.cn>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795397847; l=3796;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=AXm0Qoo5A885Q3LTnrRzlB7VaojIjbXk/hv1msZoJPo=;
 b=sI0vKKf/TJ9laYZhwu9XbhO4oc0WboOD0gtlj5K68soc3RYJ3Scpp5t/VFyLNvBJZgYvY8zy1
 C0SB5IqI6kGAxE8jYCWPNyxHi8NNJnnksPlmOrLf/c1TmeH6ilOMKek
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

This series adds a binding and a driver for the GPIO controller of the
Siflower SoCs, starting with the SF19A2890, a MIPS SoC for home routers.
Each line has a register block of its own, and each group of 16 lines an
interrupt.

The binding is Chuanhong Guo's and the driver Qingfang Deng's, both from
Chuanhong's SF19A2890 branch [1], with my changes noted in each. The
same controller is in Siflower's SF21 RISC-V SoCs; the binding has only
the SF19A2890's compatible, the one I can test.

The SoC support itself (MACH_SIFLOWER_MIPS) goes through the MIPS tree;
until then the driver builds with COMPILE_TEST.

Tested on a GL.iNet GL-SFT1200. Earlier, on v7.4-rc1: gpio-keys sees
both buttons on both edges (the reset button on GPIO 27 as KEY_RESTART,
the mode slide switch on GPIO 1 as BTN_0, 1 and 0 per slide);
/sys/kernel/debug/gpio lists the 49 lines; the GSW150 switch comes out
of reset through GPIO 0 and the SPI NAND uses GPIO 8 as its chip select.
v3 was run again on OpenWrt's 6.18 kernel, with the driver backported
along with the gpio tree's gpio-regmap: the same four lines work, and
both buttons raise their interrupts on both edges through the driver's
IRQ domain. The board's device tree sets no debounce, so the debounce
path was not exercised.

[1] https://github.com/981213/linux/commits/siflower-7.1

---
Changes in v3:
- Move the driver to gpio-regmap on regmap-mmio, with a
  reg_mask_xlate() for the 0x40 stride between the lines' registers and
  the debounce in set_config() (Linus).
- Put the interrupts on an IRQ domain of the driver's own, with a
  chained handler for each group of 16 lines, since gpio-regmap sets up
  no gpio_irq_chip. The chained handlers are removed with devm.
- Patch 1: add Krzysztof's Reviewed-by.
- Link to v2: https://patch.msgid.link/20261109-sf19a2890-gpio-v2-0-b885fbd84c4c@telaak.dev

Changes in v2:
- Write my notes on Chuanhong's and Qingfang's patches as lists, with
  Co-developed-by on the driver (Bartosz).
- Get priv with gpiochip_get_data(), drop the two else branches, and add
  a blank line after the header comment (Bartosz).
- Get the reset with devm_reset_control_get_exclusive_deasserted(), as a
  local, not in priv (Philipp), and drop the OF_GPIO dependency.
- Name only the SF19A2890 in the Kconfig help and the binding's commit
  message, since the other SoCs need compatibles of their own (Conor).
- Drop the ngpios property, which the compatible implies: the driver
  takes the number of lines from its match data, and the binding takes
  exactly four interrupts (Conor).
- Order the binding's properties and its required list (Conor).
- Add a MAINTAINERS entry for the driver and its binding.
- Use GPL-2.0-or-later, not the deprecated GPL-2.0+ SPDX identifier.
- Use readl() and writel() directly, without wrapper functions (Linus).
- No comma after the match table's sentinel, as Uwe asked of the
  clock driver.
- Drop the unused linux/pinctrl/consumer.h include.
- Link to v1: https://patch.msgid.link/20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev

---
Chuanhong Guo (1):
      dt-bindings: gpio: Add Siflower SF19A2890 GPIO controller

Qingfang Deng (1):
      gpio: Add Siflower GPIO controller driver

 .../bindings/gpio/siflower,sf19a2890-gpio.yaml     |  76 +++++
 MAINTAINERS                                        |   7 +
 drivers/gpio/Kconfig                               |  14 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-siflower.c                       | 344 +++++++++++++++++++++
 5 files changed, 442 insertions(+)
---
base-commit: d66b6b86d5a6278ca930112c634d03725beb7d9a
change-id: 20261102-sf19a2890-gpio-b21562e52f88

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


