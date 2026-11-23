Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459286;
	b=n7u5k5AVomCGzZ7wWhaum3SH5nrpuMa4VqeJ+y1qbG+ogYnH67aldVHjL7w+XKrWeTX/
	 PDRHzqKzmK9deDg5A3rvKCSJlNYDVf/EUGwb2em82rAacQLMlyF3tt31/Tkuimr7iNKnM
	 VwGLZ+E9wUkvhTXhL0NHjGs3xtfkPycqbIWXv3dFnp5gNvXQ7Hd2Q/ssojDcDgRrprflP
	 ekPYBzlM8kTmw84gNdKL6eMXQXYShGRiP3G/55IaW15wCoc+xrWMF5OYq2BjS1VpQMMgM
	 x7dkjNVPXEvN6ilSA79a5OEXBj0PovtMA/TUJw/WrWKyJ37wAAs7/Rjrh2HWBIHGR5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459286;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=twUyRhBshbrEBOGIbZ/h1ZxAGNCXOY5epw5r0M576JA=;
	b=tSjM9LSS07grVvU0in5NvsU142z1SgNosoTSt2p4aSLzRrYeGfnXq28z9QZIxcyRHfKh
	 i3DvD99DYlVQUMYUeFRD6ieDL/1J3soUArtO88dgNu9Clj9VRMDt4VlGT23J1GOmj1ael
	 WgBLJdl/RABs8ufHHwOvoQjJzA+jE42fNbyzCu4P55wFjkwBj0hdgLKJb0U4oUvnHt4qC
	 CVUeNK/MkNgq6yapRf6wNrfO9uWKTJip1RjPOcwavZZDDzVfVa9nY6beOHgL2r5Y4LEIi
	 oBJbsBe0TnCVXYDcjIASqnQJrt5RU3zHLy9JAVU+WKR3uIF3xW2iCxP/bKU23shqpzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=My0Mv6u3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D778606A33A;
	Mon, 23 Nov 2026 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=My0Mv6u3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459286;
	b=e+to8u6ruWixMl7rHpguqYWi2qlR0eSVSLALA5kOYeYNmHPiLPxUpWfL+ApiwyRJCvxX
	 4l5uHrW0tyxfGdMHgPJm320/M2cHvrvWf7DYmvXOTa2Lk4eKElsK7CZxHgr9sv/3oP/bh
	 XLsp71yVrwXkpMT9rt2n/cR7dsNKULRVEMDTbpdA1gQh+qTSMQMOKrcvOOPSxekUOE1b6
	 CNXietY9KWb2441yCUkIG4uOLu3X/r39qvNXmSsJyTAFKzFZaxSOxZGUwOxVFn9c0H01V
	 YJW8bKOSA57kjJ/eZz4lmzfCLqaW3jvK5iXp+vhMaDsPILPjhp1W392PB7/2qXiGBVg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459286;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=twUyRhBshbrEBOGIbZ/h1ZxAGNCXOY5epw5r0M576JA=;
	b=yVGq7cU4KX1saxt/pkEv2mj8T0Qh67Y+EyNqEswLHzQG6j31IndxztdZcuITYAsrueFx
	 FpbqM96bjuAz5v0P9NCG6Hil+dLNG+pg0HUwXDgRGOE7hlRBb0PFKqhIJxVtS5FLunak4
	 FoBdvuvBldBgMXcLoJNm7C8w6SCFpO3qYWuRNEvn7nXo1fIq2khyTR1ENMKMb2RpwhAz1
	 7VzonHpNQuEw+w/IN/xgCKi2uMy2d3Zif/d2PhGChBMlUTjzrQAi4FszdLnQMcn8lJzO/
	 GIBi1k9P+/7ZtFtbiI8V0gMc7Ri4a7qO6e6AvNPD6w1AOpaT9Q2aVAF9ON2JMp+yJGA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C2E31F000CF;
	Mon, 23 Nov 2026 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459286;
	bh=twUyRhBshbrEBOGIbZ/h1ZxAGNCXOY5epw5r0M576JA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=My0Mv6u3SLULxvU4tyL2x9Advcej+MrUgH4Nr09DrpFpEdT86642t9Gp3Eeu5oB1e
	 H9NxQUSuDeoZKh7dmM5jwvr2evc/EzGTqqhqXe/mcN+zJ2vI87C9PHRHfN2iqxDy4f
	 MH3lGrhUyOAY80hvzPtTRyXGbeutiXdCKL+Zv1uU6TBk+9n25nw3vfm7jCjYugylBC
	 oEN/9hdehLEW1nbzvUl+buYhST8vuCWcXMyXBnnmTFPtImJmnx4zq0tXjigZ3Jg9P8
	 P+ovGtQ5ipbMSsBs0tDeL3X8VaLZ8dI2PSvMF4hSacdvrgvRlfRPOCXm0ca1uqnSAD
	 ixZ89Jntmu7Uw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0C6B74C5AF;
	Mon, 23 Nov 2026 18:41:13 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH 0/5] soc: cortina: Add CS7542 global clocks and pin
 multiplexer
Date: Mon, 23 Nov 2026 21:41:11 +0300
Message-Id: <20261123-cs7542-syscon-v1-0-49858e631449@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxA0asgz41EDCFSr4I6pMaAOwQU0wqEu
 HsDjG/4fwflJKzwLHZI/BOVKWbYRwE0hjiwkS4bsMTGWqwMqXc1Gt2UpmjQV52rHfnQI+RmTtz
 Lev3a1239vj9MyzmB4/gDnpSg8HEAAAA=
X-Change-ID: 20261123-cs7542-syscon-273d545c7af2
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459271; l=5783;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=S35UkrNFrlQex9/2aBwHnbLGqIK7v0fFjmBC7JaKmXw=;
 b=xkmVuEGdHIbZ3A5YRniy+6A9wBiqwaJI0BU3lsSLFQcxSuagpN7C3lTzhz+GCIDWQ627wtkH/
 T6O3L3i0VNIDU/FTXxf/oseTa1S42JaobYMfF6Z2tBV+Cs7LIkDlxLw
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

The exact new clock and pinctrl sources have now booted on a Securifi
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

The production OpenWrt 6.18.64 image has also been installed, preserving
configuration. The default mux and clock rates were confirmed after
boot; GPIO37 press/release and IRQ-backed hotplug events, UART1-3 termios
configuration and watchdog keepalives/20-second expiry reset passed.
The protected bootloader/environment, retained UBI volumes and
configuration hashes were unchanged after the upgrade and reset.

The same clock/pinctrl sources additionally booted in a Linux 7.4-rc4
RAM integration kernel with platform v9, the accepted watchdog and
local RTC/TRNG drafts. Both CPUs came online; the final RTC calendar,
TRNG and watchdog harness passed 16 checks and returned to OpenWrt.
This is an integration boot, not a repeated physical-button or UART1-3
test on 7.4; those source-level hardware checks above used 6.18.64.

To: Linus Walleij <linusw@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-gpio@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

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
 drivers/pinctrl/pinctrl-cs7542.c                   | 188 +++++++++++++++++++++
 include/dt-bindings/clock/cortina,cs7542-clock.h   |   9 +
 10 files changed, 454 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-cs7542-syscon-273d545c7af2

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


