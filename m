Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795495336;
	b=39WMFEFFvRiipB0HFsdJRJFrAEb68wK3lAifHmZt+iawFWkY+9EIRdqsG9C6j7Vz86v2
	 uihwIbRLTWJ3fx9TMOodkFhaM1lVimWs6JG2rkK3LvbT59vCJfn/o62IobjSFYfhQ5WIv
	 TUDAYOV9BlG7sZkA8wjvokd6RthOlXd6OiHwQGHfUmaD8Dw76ZHaEzuz7SehHYmmOMiu2
	 MOGuQFekG5xLCINkv1VQcVn7RHYKYDOJsAeQCfvn5xYpFpYf4NYFWymhM5/rjybRFZjwA
	 72Q6gSIREvhULT7AraGbTR6kNOFuqoBUO3jQMWHvSwb/htsQRttGZaUNwLyhUZJEQuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495336;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=6WY3rcBN95a4Sy46Alx6r/LGWE8dSDCrUzvaMe18Id4=;
	b=O1K5VdAki79vH71GXCSRcmOvPSj/SG0Cati6/svgjw5eBvnWuQ72LmCczluVkTUr9FkP
	 gkgy1CAI26HcH98d9Xs8o7Ztyb6CcM/cwGfXRs3qMqAhUX7DKQBMJhu8OKZODDDxX8hL3
	 Wx+FMUjjd9+vnYv8cbRuROSgnkxXRgZov3dfl+QkZkcPsa8shno4KmbsC81deOqm4m5fY
	 Q3X3bPEOXOiTM7TeVMZ3g4Lj+WldErafVEQqpT5slBu4c7BSUXR+WexJs469+7ObNPMgw
	 dQjQuZ7V47pUJwguftfjXlbmsNOqlRD7+UXV3Ljmn/QqRhMmGpXvOuMPrL4tYY4J/Xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MMFr7a3I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716A3606A339;
	Tue, 24 Nov 2026 04:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MMFr7a3I
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795495335;
	b=0o8q4JWDSKMgXcAiK+jJIHNy93JdkHhroy5VKvZdh2tDTvWk4e8leS1ERsh7iPCKxx/N
	 UkAmx3Cm6mnmSYRomdzi2ZJG22HDWW4PFq28BU/xVmNspEb5BJLnoGocDrVYhGvCj8IO1
	 UBUXIZkT4vK0khrpChgB/ShCNDV1+y+hSv7JrU0mkrZJu7PmFonKzAoKQPemcb/wV86JT
	 /fUH+owZ5hcGitXDhNETgGN1lZG+Dhiy2trHL4kQN+F8T0wEC2ixgyCWUOjDWy7jnJol8
	 TXApmIIKwNqYYH1Cbp7dN9GgaRoq2NLdVqvJubQpDjE5DCbOpem6NG6YMrDn6wiko6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795495335;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=6WY3rcBN95a4Sy46Alx6r/LGWE8dSDCrUzvaMe18Id4=;
	b=HaD3uEfu3HT7F+iz5S26Lmy4lj4uDgBO5KavvQpZbAvI5Wqz7jTSmZYPQq3kslqP2cOV
	 5NwvabFCy6BtTKb2/6HB+zkH/P8EkEeeYkYaL6ZlsIklvwubbuVBhkS+sHNTZubAofkQR
	 IfJagsZ8+0i617IBv2p2vxGq0Q5+15ZzeyXYZocDH1ZnFTciVs9/7JnfKcDNsZUMTlUi0
	 j02HLSsbeXiGbxQ8mO4Nan6Bm54Vkt37e/tfc5RB2PhIoZJkE/MwWAI7uJVfVUM4wZQkt
	 kuiyAawBzAPGfkRDfauZ6FNzweYuLtgDDnskKBIUs5cg6RWIU+POK9T4NdxaG8EjZyQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA40A1F000D4;
	Tue, 24 Nov 2026 04:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795495335;
	bh=6WY3rcBN95a4Sy46Alx6r/LGWE8dSDCrUzvaMe18Id4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=MMFr7a3I/1QdOqKSCrJNzURhcWj78/Apors59rlmXsm7rFZkm/HwUPfjz49FiA/n6
	 zWOazO9RvXTOEGqgVP3JCFXdXt+vgZQ90UAbAGXAhLEj2NXPS9E1tNm3aUPZX1WpYN
	 MV3B/sp3rwhQtyGw9pLlNKUeQbd49YhZDlZoLbBEJhE0P4zJFEksf/4turLsXtPaeh
	 dk0WMli+nAEoUmsnqDt1N4UWicunon/iUkapi8jgIyWP/R2pWObQMpd15CdbQ4cv7e
	 kVclyXaBYOxzAFgRUov8BASCXfStA/QGj5wmA8XRpLBtKRNEyz6MU+GdStH/KHI6pg
	 Lh9/4rq7ek+jA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6FAD84C8AE;
	Tue, 24 Nov 2026 04:42:08 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH v2 0/2] pinctrl: Add the Siflower SF19A2890 pin controller
Date: Mon, 23 Nov 2026 23:42:05 -0500
Message-Id: <20261123-sf19a2890-pinctrl-v2-0-a10af32bc844@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAJ4VBWsC/22Oyw6CMBBFf4V0bU1bEcGV/2FY9DGVUQLYlkZD+
 HcLaty4PJN775mJeHAInhyziTiI6LHvEohNRnQjuwtQNImJYKLgnAnqLa+kKCtGB+x0cC3VTJq
 qOBjg+4Kk3uDA4mPdPNdv9qO6gg7L0Cfh4D4mWfjFGvShd8/1k8iX61ea/5FGThnNlSp30holt
 T0FaKW8bQ1EUs/z/AKXBjQD2gAAAA==
X-Change-ID: 20261102-sf19a2890-pinctrl-c0ad967de156
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Chuanhong Guo <gch981213@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795495327; l=2900;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=UI+HFCzlwsuHPDNUiBDjhxu5Nits6H2tsgExW6YLYlA=;
 b=lBf91TEU2OD9oLixUJ+GxBp5O6s4duspTqvuAyIzenYsZPfXCYGenr+7O5vR+xSVFto02pExG
 Vs+vIe8r+bfCVxs0I4poRlC59KUDYyfZiXwbhZoEcc1IjiDfwLAdBir
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

This series adds a binding and a driver for the pin controller of the
Siflower SF19A2890, a MIPS SoC for home routers. Each of its 49 pins has
a register pair of its own: one for bias, input enable, Schmitt trigger
and drive strength, one for the mux.

The driver is based on Chuanhong Guo's OpenWrt driver, which exposed the
four mux modes as functions "func0" to "func3". Here the functions are
named after the peripheral they connect, and each lists the pins it can
use with the mode that selects it there. The tables cover the functions
that the vendor firmware and the OpenWrt port use; the other modes are
not documented.

checkpatch warns about -ENOTSUPP twice. That is what pinconf expects
from pin_config_get() and pin_config_set() for a parameter the hardware
lacks.

The SoC support itself (MACH_SIFLOWER_MIPS) goes through the MIPS tree;
until then the driver builds with COMPILE_TEST.

Tested on a GL.iNet GL-SFT1200: pinmux-pins gives every pin its owner:
SPI, UART0, I2C0, RGMII and MDIO, and the GPIOs for the switch reset, the
mode switch, the SPI chip select and the reset button. The console, the
SPI NAND, the ET6326 on I2C and Ethernet work with the mux this driver
sets. For all 49 pins, the bias, input enable, Schmitt trigger and drive
strength in debugfs pinconf-pins match the pin configuration registers
read with devmem; this board uses 6 and 27 mA, the two ends of the drive
strength field.

---
Changes in v2:
- Order the example's child nodes and properties by name, for
  dt-check-style --mode=strict.
- Add a MAINTAINERS entry for the driver and its binding.
- Include <linux/device-id/of.h> instead of <linux/mod_devicetable.h>
  (Uwe).
- Prefix the register macros with SF19A2890_: REG_PC clashed with an SH
  ptrace header (kernel test robot). Convert the drive strength in one
  helper, to keep the longer names within 80 columns.
- Reference pincfg-node.yaml and pinmux-node.yaml the same way, both
  under allOf (Conor).
- Keep the named pins and the per-pin groups: the generic
  dt_node_to_map helpers take pin numbers (Conor).
- Link to v1: https://patch.msgid.link/20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev

---
Joseph Telaak (2):
      dt-bindings: pinctrl: Add Siflower SF19A2890 pin controller
      pinctrl: Add Siflower SF19A2890 pin controller driver

 .../pinctrl/siflower,sf19a2890-pinctrl.yaml        | 113 +++++
 MAINTAINERS                                        |   7 +
 drivers/pinctrl/Kconfig                            |  14 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-sf19a2890.c                | 549 +++++++++++++++++++++
 5 files changed, 684 insertions(+)
---
base-commit: f33a24cc012d34f25bb9942681bd478a1757b806
change-id: 20261102-sf19a2890-pinctrl-c0ad967de156

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


