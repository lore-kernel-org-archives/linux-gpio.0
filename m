Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795467292;
	b=brZtxC3Lw4j+B3fwpnfQoc25gmvjovUniNwYU662D8bili/XmzidAjCmw0qmCcBoKdA7
	 v0CeQISn70muIxuPWZ9cuoja3rL50SX7O9mOBqquGs2SUsmvJKmPcUHKhgOSLzu2wl13U
	 Dg5+VepjIG1mrdoHrCVxeRRCoNTR8Kg78qrZyBbE4EQEliwCySsrIdWiHBU1NmUw5ZL92
	 OuOWAzlvBpQAbL4cyqHGjCl8tEzbjmyZfchrRAZlIU4ViRazTOqmGNKXKp45ZVwG4UI/e
	 u/Csr33H1Um3o2TUaM2hNe9qso4gWTQBmhfqadeK2DbiPRE6+9Ocwi0PEb5t2srKzzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467292;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=A0YTBy/W+SUFmK+Hl3VoQmZULDHkeCwzNeeRV4jCKxs=;
	b=twZ3D1zzxcUmCEeI4xpsOZH5JGWt3rUysC+Pfvj+vYdQxUWXRpbFsW5YB8/iGAjGQY3C
	 EM4/vklaEIGPzI+DMGaC8uTghDI8o4fPEGL6tsOyNtlBGsqf389sI3c9TXRzMwT35l2AL
	 L3MCYRt6A+VqO4dm2jdIbiPgKiRy75A7gDQagB4441ISTcl0qTekjHN7xh145Gfh6RPFm
	 VCdhoAsDGD5dYLqYmZ6yjcA60ffsW1ng6Mdz1VgXrdl6Q0ctGVZt0XuFvwsraUBcxZyr0
	 vOp1kyde3fonLBLjWPv7bnG8zt+B9zqhDCm7aTevOce670EZeocd2cwXjvtUBIFKehA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O2WEmFT7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DF7606A31E;
	Mon, 23 Nov 2026 20:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O2WEmFT7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795467292;
	b=Uw9YDCqL6U6uVGGQyfuF3wv2IOf6NyYgfWyUVtWnX+uKdGvKLZONtz4tN4+OoVRl997s
	 Bh8KYb84OZYG8b3BSgdKSBg3XsJSlbyd/NTk8r8voRD2xm9TPZDG8/5POGbukTnM9Ncj2
	 v61r4JQbcF9NuRFeSSDsnTR4U63709ru0iDtQTsp5vFqC7rgkkcKS2Yn/vMG7Y2bfReR6
	 wmscq5Q1Iiby9SQp6DCvQBXJeJBXIStsj3JngTHN4VmO0S8apU5/091qUyJPlxyht8DYl
	 L/XhUGs+lI5JrgpHH99aPSUgK+IIj/gvJP8ajVXM3ZPYm4zH/anOhZZ9UBDpwjRUDIw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467292;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=A0YTBy/W+SUFmK+Hl3VoQmZULDHkeCwzNeeRV4jCKxs=;
	b=Yb73Qgxl7aDKp6WO3Aj0b6uGm1/mpGmfUi9AzMnRMzQKfheEK7Cy4K7IsyOwI2MRbi1T
	 JV0+U4rJlYaCF/R51OqyLMMVXsbJD8VPoGVdw/r2Dr4fVL/0Z79tFOoQ8orPK6ijqGjTS
	 PXdcP5S5jX9P8fsFO1ZO8wcqguf+mnilVrroKcwNz48Qkxj7AWUwDFmsZWwWqkzFwqL+6
	 A0U0HFm6HrO9YXmgTbTP9KqKRl2TOxhrlYj5sC2D46ycgkKvQlNTOWg73o4CC91W9fsSd
	 i9bSbDu5bP+VNdngTl8ioAmOubUr3qGfVMRfmDhhIMQtfwZBw5rt+z6LDTM+kcfXoKw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 638891F000C0;
	Mon, 23 Nov 2026 20:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467292;
	bh=A0YTBy/W+SUFmK+Hl3VoQmZULDHkeCwzNeeRV4jCKxs=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=O2WEmFT7U+5XfPWgvGXBLHQYRL7zbQdg/V89YxVxVchTcpGSbuCb79fZN098JjLVN
	 bOtC3Lma1Ay174Nhz6xcMx9hmKLFkbdNY+UyqpeOJ+VnItJqnAK0ThFtn1dmixRw1F
	 bHLZtfJgosCqQYo2NR8nG81yBwGyTt5lSMqPeVIMDkkqGCxvfXnoZoTGhYmd8QRXbU
	 IrFEvb2EDQ5yy0ky+jnOGYI2NJSUP3yN8o9jqVYh6J3le2s9iPFdJlIGP3aVCIQecg
	 5AW97p7rK7pvAwytbWS4rhf1r9anXOjtbUms2R7DQKKkhZjTvivGfdLV1kuMvxSCCr
	 6LZJf6kjrQEXA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EC7FC4C73E;
	Mon, 23 Nov 2026 20:54:45 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v3 0/5] soc: cortina: Add CS7542 global clocks and pin
 multiplexer
Date: Mon, 23 Nov 2026 23:54:43 +0300
Message-Id: <20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBQFr0K6tob+thRceQ/jAkqBGqGmHxsJ4
 e62uHKhy0nezFsJGm8NklO2Em+CReumCPyQET3UU2+obSMTyKFgDDjVqKQAigtqN1FQvJVCalV
 3QKLz8Kazr713uX4Yn83N6DlF0mKwODu/7IeBpd2vdmA0p6IqZWkKzoSozv1Y2/tRu5GkdoC/N
 kSb6VaJBiRA92Vv2/YGBm0My/oAAAA=
X-Change-ID: 20261123-cs7542-syscon-273d545c7af2
To: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467283; l=6694;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=QRL/g7NyZbKEnItT7uE9gapG2EnLemm/zVSeB+Gi9Po=;
 b=cGvIF6g30hWeXseI39ASuNut8i8HOn6rXp7oQF3tHa44T2ynRE19x5LB24/hHPq/RGCGTzKp1
 dFUV975CN8VB4/IcbTXe7sxMQgSO5giaWXpx5sTCAM1XY6DY0B2Xybk
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

The CS7542 global control block contains boot strap status and five
GPIO/peripheral mux registers, alongside reset and SMP controls. Add a
shared syscon binding, an early strap-selected clock provider, and a
pinctrl child using that same regmap.

The source material is the GPL vendor kernel and the existing OpenWrt
port. OpenWrt previously used a board-fixed APB clock and a temporary
machine initcall to select GPIO37 and the UART1-3 pins. An older port
read the strap to publish APB, CPU and AXI fixed clocks. This series
replaces those mechanisms with subsystem drivers, without moving mux
writes back into the GPIO controller.

The clock provider only reports the seven known strap configurations;
it does not program PLLs, dividers or gates, and does not implement
DVFS. Reserved encoding 7 is rejected. It is initialized before ARM
timer discovery, while keeping the syscon node available to populate
the pinctrl child.

The pin mux driver supports GPIO on the five 32-line banks and the six
UART pins (72-77) used by the OpenWrt workaround. Other peripheral
functions, pulls and drive strengths are intentionally not exposed.
A GPIO/peripheral selection updates only its own bit through regmap.

These five patches are based on v7.4-rc4 and do not depend on the
pending platform, GPIO or INTC series. A separate peripheral DTS series,
based on platform v9, adds the syscon node, replaces the fixed APB clock,
connects CPU clocks and selects GPIO37 and UART1-3 on the Almond+. The existing SMP
release register remains accessed by the platform code.

Validation:
- full ARM multi_v7_defconfig vmlinux and modules builds with W=1:
  GCC 14.2 clock=y/pinctrl=y and Clang 21.1.8 clock=y/pinctrl=m,
  COMPILE_TEST=n, without the pending platform series; both passed
- final linked kernel symbols and pinctrl module/modpost checked;
  no warnings in the new drivers (other kernel code emits warnings)
- dt_binding_check including both examples; positive GPIO/UART cases
  and rejection of invalid UART37, GPIO160 and unsupported pin config
- host harnesses running the actual clock init and mux routines with
  failure-injecting mocked APIs: all strap settings, registration/error
  cleanup, every mux pin/bank boundary, neighbour preservation
- component and DTB/schema checks of the separate integration tree

The v1 clock and pinctrl sources booted on a Securifi
Almond+ in an OpenWrt 6.18.64 RAM kernel. Before entry, GPIO37 and UART72-77
were deliberately set to the opposite mux state; the default pinctrl
state restored them. APB/CPU/AXI rates were 150/750/150 MHz. The test
recorded a physical reset-button press/release with matching IRQ-backed
hotplug events, opened UART1-3 at 115200, read the I2C device at 0x48,
received the expected NACK at 0x49, and exercised watchdog calls from CPU1
and 20-second expiry. All 27 checks passed. Raw I2C checks used a test DTB
with the touchscreen consumer disabled; production OpenWrt keeps it
enabled. The device returned to installed OpenWrt 6.18.60 with unchanged
configuration hashes. This is hardware evidence for these driver sources
on 6.18.64, not a boot test of the standalone v7.4-rc4 series or of DVFS
and suspend.

The v1 production OpenWrt 6.18.64 image was also installed, preserving
configuration. The default mux and clock rates were confirmed after
boot; GPIO37 press/release and IRQ-backed hotplug events, UART1-3 termios
configuration and watchdog keepalives/20-second expiry reset passed.
The protected bootloader/environment, retained UBI volumes and
configuration hashes were unchanged after the upgrade and reset.

The v1 clock/pinctrl sources additionally booted in a Linux 7.4-rc4
RAM integration kernel with platform v9, the accepted watchdog and
local RTC/TRNG drafts. Both CPUs came online; the final RTC calendar,
TRNG and watchdog harness passed 16 checks and returned to OpenWrt.
This is an integration boot, not a repeated physical-button or UART1-3
test on 7.4; those source-level hardware checks above used 6.18.64.

Additional v2 validation: the actual pinctrl core pin_request reproduces
the old GPIO-hog request failure and passes after the callback is added,
while a UART-selected pin remains exclusive. The updated source also
boots in the combined Linux 7.4 Almond+ RAM kernel.

---
Changes in v3:
- Introduce the parent pinctrl property and schema reference together with
  the pinctrl binding in patch 2, so patch 1 validates independently.
- Re-run dt_binding_check and examples at both binding commits. The final
  source tree and driver code are unchanged from v2.
- Link to v2: https://patch.msgid.link/20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com

Changes in v2:
- Identify GPIO mux functions with function_is_gpio so strict ownership
  allows a GPIO consumer after the default GPIO state; UART stays exclusive.
- Link to v1: https://patch.msgid.link/20261123-cs7542-syscon-v1-0-49858e631449@gmail.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-gpio@vger.kernel.org

---
Fil Dunsky (5):
      dt-bindings: soc: Add Cortina Systems CS7542 global control block
      dt-bindings: pinctrl: Add Cortina Systems CS7542 pin mux
      clk: Add Cortina Systems CS7542 strap-selected clocks
      pinctrl: Add Cortina Systems CS7542 pin multiplexer
      MAINTAINERS: Add CS7542 global control support

 .../bindings/pinctrl/cortina,cs7542-pinctrl.yaml   |  84 +++++++++
 .../soc/cortina/cortina,cs7542-syscon.yaml         |  49 ++++++
 MAINTAINERS                                        |  10 ++
 drivers/clk/Kconfig                                |   9 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-cs7542.c                           |  90 ++++++++++
 drivers/pinctrl/Kconfig                            |  13 ++
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-cs7542.c                   | 195 +++++++++++++++++++++
 include/dt-bindings/clock/cortina,cs7542-clock.h   |   9 +
 10 files changed, 461 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-cs7542-syscon-273d545c7af2

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


