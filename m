Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792482883;
	b=l4zuKm3YPynBoebPo1XxumcnrMHgdqa22Q4mVnbx9S2CvrRd866y2g1RRNuXYoszFSgA
	 DHmNYMP210Uv9AcahDZQmkkiOt7qyBl8uNtrHdjkCeeJ7jmiiEcNgUslyeeyPLGSApqtZ
	 BTPVOa4+7yvyBmZleJcTM+ZcmWqPSK0cbNBdZ+bQDUWtlQ+Yma7Pd80WDOfcsGiIOc/0g
	 QAkn4EbaK9nnnjIb33HwggdDtOyc/7xpptJ6eHhBfIP6JgvV/qt2AtMmilXAhLqORecLC
	 rdDgU6A1Rq3cjTDswX1Ude13ksyI+0P5i/bza4Jt/JfelBGMR+xiSKqH7KdekjYDMJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482883;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ygx2xTyULgW81+5ukwJwAXa8but2eNb/C+2AlsMj59I=;
	b=SjXvrN2IzCq4S4HR7pLWLCiS7VEKat3aXaU1TMchrxE/a4OgGgp68TP7OcimcSlKwx8G
	 stPawzl5m1BDJqirpdKdmzlAOdVo8r9tW0B7T/D0X+QFncibQ7vSlpy0WQDNXCfdWb3yM
	 BtRYWKtliKQ5mrw6klHLnaD1m20N9s+MqQ1WyT09WUK7SLIguXk7kw0AxMYsdt/AUoRhq
	 GoE6Nq5iPyEGZn495C1FxOFCYtOsWddNNrnR54uNwGG2G9cDkaDk5/PL8xrDZhYT9EP9n
	 JmsDnDRahhh1o5a7rbhg5blJp4bj3u/7tGKLs7l0WDmVsDDhh9nRmymCNE5FuZt7vpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYsYZ+kl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC31606A32A;
	Tue, 20 Oct 2026 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYsYZ+kl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792482882;
	b=p864lo4rDRpI0BzzWQno0mzj1rqRmp8BWXhLilC1KF8MxlbTS051pz0fs24rGH8R0gL+
	 lUeYC7LN+JSub4pnapoKCAFnHUmZwQ4juBrQKJEvxOFi0ZQpSopOBVUVgIl+APpoQezKo
	 JUF27MWBiy+v0tsP2GLnnCWTxfurDIIt0NWRx8WbhZnWy0oEsN36U+7IxkDu0mD0gXk0r
	 PM5GpTslsd777FzFBnMxO7AJc84mmPWOLuIDdeBAbtFfDiMHsrSCeY2in0n4KOi3LNdvx
	 aLHZraek72WRHqKp8eUz1eyfYeV2QXQSA5g9Y9L6eJPZaQpqvKDg0ZgXYohR+ZbFxGw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792482882;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ygx2xTyULgW81+5ukwJwAXa8but2eNb/C+2AlsMj59I=;
	b=2SFn83of7GIcpk+SwD0uszoUni6VlyWWDa+3YBbi5OtpvU7KebVseTxEC4vcMSrBEzks
	 TZIW7Gcjh37ERYuLUInje/rSjakHornYEaahihA3iATxYFIhlIS+NieTLabhPJItiE9+l
	 /ygAJsZoWPLB2brqiH8nFOsWY9dpJVZGUozVhzJV7STRXIPIudWVb2w4dIr6RKpH67uNG
	 PZXFg7pVWJB++TbUAGBlQEib1jimntIgSQeZdQCgCvtRqJ2Gna44QZsbYrZJPiDkZ2n5F
	 3Dk1l1pzBtHwweq3hgXJNWBGIE/dTpDHZm1bCCqpsU8X8xzJArxr4IDC5xX4xMe+HlA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C5AF1F000C6;
	Tue, 20 Oct 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482882;
	bh=ygx2xTyULgW81+5ukwJwAXa8but2eNb/C+2AlsMj59I=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=WYsYZ+klSavvWt3nrx+7MZj3V8omhmwnPPsErlEFnN3//CUMr5H5A24QYJuwEAQgW
	 NXQb+gj67+4+nosz34KeBYvR+hiMyzXkIl/n6Q9bsMI79uHuMvBWcaWKvbkNnoDSdb
	 /PGiqaf1ppAay5K9Zuw8XoHts09+OsfHvqUXWap3txo/PhFyxEs08E4TDSb0A6d8tr
	 ftalpkTPDpWT3GJXZSXOFLuxzRXs6euf8h222466HdjhxafCk1xaRxNKP+AHaqNx4W
	 zU3s3HFfYBUKWD/aQY+BTsjBvlC8n0i+qulDn357Gfy+S1nYwMkXKodj5+QGBlfShp
	 aymsZera4NPCg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6D5E643085;
	Tue, 20 Oct 2026 07:54:40 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Subject: [PATCH v11 0/9] gpio: add Ambarella CV75 PL061 support
Date: Tue, 20 Oct 2026 15:54:04 +0800
Message-Id: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
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
X-B4-Tracking: v=1; b=H4sIABwe12oC/12OzQqDMBCEX6Xk3JSsMf701PcoPcS4aooaSWxoE
 d+9iVKQwl5md+abXYhDq9GR62khFr122oxBAJxPRHVybJHqOixIwpIMGMup8rmg7aQN5ZzXuYK
 6QQAS/JPFRr832P2xa/eqnqjmCIiOTrvZ2M/W5svo+3Fh5/owJWU0LTKlkqKUaVXc5FBJi30vL
 8oMJJI9sEMYxOGpcAp53iDHioOQQvzn13X9AvZXqYH3AAAA
X-Change-ID: 20261007-cv75-gpio-333d7c1dfe11
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Chanho Min <chanho.min@lge.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482877; l=5381;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=I7DyG0tZsHP4plNSLEM7+EI6mShjfwLJ7vlTrOCKg0A=;
 b=zfW6OOhVMf6iTrQQoXTrdTQ2up1voojxRf6n5+fF0+Fo4N3Pq0g5A1BG6+5yVDnYgTh/qM8QT
 uTA30FCEv4vCxRpUq1oLB7tqEP/XZC8qX48fBOjMWY4B/i/DJb786aX
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

The ambarella vendor prefix [1] is in linux-next (applied by Rob).
The binding can be applied with this series.

Please take this series through the GPIO tree. The quirk, the PL061
conversion and the Ambarella layout belong together.

This is v11 of the GPIO patches from the combined CV75 series. The
posting on Oct 9 numbered them v1 after the split. That was a
mistake.

These patches convert the ARM PL061 data path to regmap, then add
the CV75 layout.

GPIO data path uses gpio-regmap with two layouts (ARM PrimeCell and
Ambarella). ARM PL061 sets GPIO_REGMAP_QUIRK_SET_AFTER_DIR. IRQ stays
a custom PL061 irqchip. The linear domain is instantiated with
devm_irq_domain_instantiate() using the PL061 private data and
attached by gpio-regmap. regmap-irq is not used.

Tested on the CV75 EVK. The board boots. gpio-hammer toggles gpiochip0
line 26 ten times, and gpio-event-mon on line 27 records alternating
rising and falling edges. unbind and bind work; the chip re-registers
and both tools work again after the rebind.

Changes in v11 (from Andy's v10 review):
- pending: keep generic_handle_domain_irq() on one line.
- convert: fit regmap_test_bits() on two lines, return
  regmap_assign_bits() directly, and put the new locals in
  reverse Christmas tree order.
- cleanup: fix the guard()() reference in the commit message and
  use scoped_guard() in pl061_irq_mask()/unmask().
- pl061: keep gc->parent in a local before the gpio-regmap switch,
  so that patch does not rewrite every log line.
- switch: keep the existing GPIO* register macros. Split
  reg_mask_xlate, drop pl061->dev for regmap_get_device(), and
  instantiate the IRQ domain with devm_irq_domain_instantiate().
  The remove action is registered before the gpiochip so devres
  unwinds it after gpiochip_remove() and before the domain removal.
- Drop the flags variable left unused by the guard() conversion.
- unbind/bind cycle tested on the CV75 EVK.
- Link to v10: https://patch.msgid.link/20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com

Changes since the combined v9 [2]:
- dt-bindings: explain that CV75 is a modified PL061 (Conor).
- gpio-regmap: move quirks after fixed_direction_output (Andy).
- gpio: pl061: Andy's review on the regmap conversion and switch:
  use regmap_test_bits()/clear_bits()/set_bits()/assign_bits(),
  drop the redundant if (pending) and fast_io, introduce the ARM
  regmap_config (including REGCACHE_FLAT_S) in the convert patch
  and leave it there, blank line after guard() plus the blank-line
  and reverse Christmas tree cleanups, and keep the upstream
  pl061_irq_chip name and unsigned irq_type() trigger without
  adding .name.
- gpio: pl061: cache DAT (REGCACHE_FLAT_S, not volatile) so
  gpio_set() does not read-modify-write the pin level (Sashiko).

Changes since the Oct 9 GPIO posting [3]:
- gpio: pl061: Andy's follow-ups since that posting: assign_bits
  for DAT writes, drop fast_io, name the ARM regmap_config in the
  convert patch, the guard()/blank-line/irq_type cleanups, and keep
  the upstream pl061_irq_chip name and unsigned trigger without
  adding .name.
- gpiolib: regmap: add Michael Walle's Reviewed-by on
  GPIO_REGMAP_QUIRK_SET_AFTER_DIR.
- gpio: pl061: restore Andy's and Linus's Reviewed-by on the
  Ambarella variant.

[1] https://patch.msgid.link/20261014-cv75-prefix-v1-1-fe95ed567880@ambarella.com
[2] https://patch.msgid.link/20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com
[3] https://patch.msgid.link/20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com

To: Bartosz Golaszewski <brgl@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Long Zhao <longzhao@ambarella.com>
Cc: Long Zhao <zl020895@163.com>
Cc: linux-kernel@vger.kernel.org

Assisted-by: LLM
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
Long Zhao (9):
      dt-bindings: gpio: pl061: add Ambarella CV75 variant
      gpiolib: regmap: add GPIO_REGMAP_QUIRK_SET_AFTER_DIR
      gpio: pl061: drop redundant pending check in the IRQ handler
      gpio: pl061: convert register access to regmap
      gpio: pl061: use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH
      gpio: pl061: use cleanup helpers for locks
      gpio: pl061: keep the parent device in a local
      gpio: pl061: switch data path to gpio-regmap
      gpio: pl061: add Ambarella register-layout variant

 .../devicetree/bindings/gpio/pl061-gpio.yaml       |  25 +-
 drivers/gpio/Kconfig                               |   2 +
 drivers/gpio/gpio-pl061.c                          | 538 ++++++++++++++-------
 drivers/gpio/gpio-regmap.c                         |  15 +-
 include/linux/amba/bus.h                           |   1 +
 include/linux/gpio/regmap.h                        |  14 +
 6 files changed, 404 insertions(+), 191 deletions(-)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20261007-cv75-gpio-333d7c1dfe11

Best regards,
--  
Long Zhao <longzhao@ambarella.com>


