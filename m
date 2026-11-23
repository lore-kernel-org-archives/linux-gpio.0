Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795465630;
	b=c5/j2w9xXJONNTX7QS/3fFAZZnUlUe05+4kakMuT27nSttaQ3B/oper92eNfil5+rms2
	 4wDvfzzAkP67ixO9KSSXq90EgMpx23Hss25HHasrlTISIZXHepeYPBSnyOwQ7TSc8pAPs
	 9StvpLh7TRl8e355KLq8Nk1r2EqQY52KgiHzogES42wTjK0oP85Ht7JZceWlvG9fWMUcE
	 3uTjOEGhJ01FTxHQttLu+FdRVtxIEawql0VuliOy+SWgcs2ZujHQvikXN2EfVm11Ko69t
	 rSVnn3ohv77rv6HzeGj9Hs/RlvJphk4j2Y9AhTL2ergBmOtGCAmygGbhRVlHqhazEgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465630;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Nyuzjetp8OWy25Sl7SgxFkcjDXjThI6BWws7UxbNUJw=;
	b=EJ0l5Ux+BSXtYc2vw3/njfpJbK3vJ7U+8rZuKX7PVOGzEAHrddYic1TFzDd6CkG3vff2
	 kPY89mzIqbhfzeIbhRkqDw8SHLMRi+31nbsNHKtgcgex+NgNCSoNwwWgMyrc6iCuVg6tC
	 f+vI/yU7TDwidQnJFRri/o7x2x5G541pHdPGEINxcLGIx5WKh/6recygzKc1O/HC5lpys
	 rWiqTzuvOIDlfNE5DvCCQqXSiitd6/Sy6RLJv9ctHDupPVGUES7jBg4mGlYxjJ6tSFj03
	 8ecNWzZ3QJ3kPzw1Rz5cKZ/feduunUB8zFWHt06zZbl3cQj837DtQIQ28cnUoNokd/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BRbjGhUQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831A2606A685;
	Mon, 23 Nov 2026 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BRbjGhUQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465630;
	b=RsvS/5ZYpEy/3/Rs4snCPu5I/OZpNf9B6IBEmkC5/rfMxycX+ulEEkfqMnUCqhew5SlX
	 Ipo1sglQzY2RT7yI3wet1hxt1iTKHZ0vr7exoH1UhPOFM9d4U9K4JMXIGVyuMOdbCcfwR
	 SUtRbFVSZ33Milx3LZgsbWx8HfWXwik2McQ5kAG27BhdQ/Q9UC5rjKvYe4W1+PyeH41uB
	 Omk9oO+PfkKVHZeBHcXyMk8QJq1qtXov+prbm6BOklu+Xaj8VYI0kAx8tf+YGTg6eTDRd
	 Z55/miPZFZs/di6U2d0E0XF9bj/7e930UreKFx+qfHaygoMkgrIdjpIxWvZb5kBR11w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465630;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Nyuzjetp8OWy25Sl7SgxFkcjDXjThI6BWws7UxbNUJw=;
	b=l4XRgt9htF+3zPGf1GiCsKvPUP20+/8PX19TWgr+z8hZoZGckVKEFq7AZ7AnOO3cobVf
	 Yh7SIXtOOn25zU1/uoZbV0+5HSkY8hH8//WUiekqb5igvSY+lbMx/OuH5wElW5gTmxvtB
	 GcVjAeuouA2J20QNUd6bFjKcAqatkHoDNs91woCx/B5GjZS/FkWgbAYMkhvR7rcmODtft
	 zNUlIIpp1CtKY873sOI0gcjTd7wOI9PzmOm5bZfSUsy7cw1YTD/4o1MbeO8b6dpdWgJAd
	 dyiyN0kMfw3nJJaYSYYfZiG6cEFQf9BVWeK/x7j/mFuOVMtLGIR2I72Rwz5XnfLyErA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B52731F000C6;
	Mon, 23 Nov 2026 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465630;
	bh=Nyuzjetp8OWy25Sl7SgxFkcjDXjThI6BWws7UxbNUJw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=BRbjGhUQ7Omd16gkUCme4sE0gTgPqzEoISS7NqDyuAQcATQ6kpOd+sBXdRcEZdWAB
	 rxPnXGv0o7MRLE/fYTeX8Xb1qXSmURDKfJoAjhym5LgI3CqsSHXERWg16m68HmbemE
	 geW4aQWL5XXG+0YgoqvS66zUzs9nfOKJUlimAm6zCSG7Zq1CM6dTsXp4CFaOkzsBFo
	 5HNMEGA2flQeebTO/A30g75FsEayh4Q/9MjV06UcJKCsr51ptA/q/IvvLYkOXCpJQi
	 IkSN6hmTBRJj4twcr3LXH83OOJ8zBeP9kslueXOv2zMTR1N9yGOwY4ac8yf13It/Sj
	 C5LpCKsrUYvJg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 16DA14C6CD;
	Mon, 23 Nov 2026 20:26:58 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v2 0/5] soc: cortina: Add CS7542 global clocks and pin
 multiplexer
Date: Mon, 23 Nov 2026 23:26:54 +0300
Message-Id: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2ho6tDxc+R+GBZYBxgg1HSQSw
 r8LuHZ5knPPXUAoMAlcogUCTSzshw3wFIHrqqElxfXGgDGmWmOinGTWoJJZnB8UZkltjXVZ1SB
 sm1eghj9H71b+WN73B7lxj+xGxzL6MB+Hk969f+1Jq1iZIrc5pYk2pri2fcXPs/M9lOu6fgEQe
 veZvAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465614; l=6351;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=R/yyN0QJVRDc3/y2zCj1gHHS6hPg4w8TiYUJ56D5vBc=;
 b=SZ//oU/Zn/7iNOcxmOTHH0kSckOwmn8LDMhjPwo23SGNWbLWfLH5YawqxNEgvifKmn6tMj/Cw
 c2zmj7oe7GhDe0bXQh6yeo2/WPsXW4FSMUw1VKKuKUNLS0Io2OsZZhS
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
Changes in v2:
- Identify GPIO mux functions with function_is_gpio so strict ownership
  allows a GPIO consumer after the default GPIO state; UART stays exclusive.
- Link to v1: https://patch.msgid.link/20261123-cs7542-syscon-v1-0-49858e631449@gmail.com

To: Fil Dunsky <filipp.dunsky@gmail.com>
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


