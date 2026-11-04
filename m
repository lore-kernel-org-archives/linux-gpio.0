Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776888;
	b=V30ssEp24nsxEQFZ68Y2PhkmG9t9gNJKAX5Qo4PP9AwXjPxAqLefSxLCrH8fT09AZHhY
	 CGei51gjIzizzz/G1GrWWClSXi4xDRatJAamvUwnk14HlpjEpFXe3ZJnQBB412Ka0LkX9
	 PWX2iKsIPJ0c9lkr5NexwVle4CqjKlMY7mutvMeeHrFfOQk+kwcszfq1jUVq336EpKyDl
	 cY72W4aG36ZnzTwF+6ozyUdmH+wpVWWOicsr1Rm5SxugNLastxBVstADHSRJUo41smwYu
	 49wpPwDeofYJLNUvQ5g6kfIMwiap/8Tp5eucdvV17rBzLHCJ2sSJQOmY1Pj1oexWV4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776888;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=0AhF5KlG+UnbOc3W/kQWIjGySJOo1aaKFPKqc9wGSsY=;
	b=PuXxKIszruwzcbCfK3kOwoOyHtW4kf9MvSRHMMcgzarMgtIZQnJq+upT9ZNfO8n/s4vf
	 KeE3MufMct/MNACGdfootCInvXhzh+GMkXjbs7Jr/tAfVvDy1bd1oPZNRoNP3LCcKXgVN
	 A9Ohlh7G1CU6sb5hwYdsMRBfKDnwBG+LB+7YaCDSgrrer5J+t8BAJ8wOm6fIrOfekgyyd
	 ds2+kxFg3MEUO5TaNIXi+cHK6gIv5oRqRWYWr97cyV6sAbDP2uAIyPgWnGFEnIio6LmO3
	 iARWB/hoWZCDOO5/RfIB3r0BO0cIMeL3FWKrXGXB+PePc5M27/qrMlRwJYftagotP+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oayveeWo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB22606A335;
	Wed,  4 Nov 2026 07:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oayveeWo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776886;
	b=aoB/6T8lBxOenyJiJyUwBhBOIlJNe8lPyasSnK6lC+K3HokUISe48m7zLog9NMBgVwFS
	 sWWWa2zwXME2KTa7v8VsEH+NZGcoTbgRB06qza8hK8tjK/Mynal/74MHq6f6qwOswEW0H
	 C4Jls5sdQPvQlKpxiwP19xVKn52NnVueRD+PXc3eQFBppYx2mD4e015itYoVOCZtwaMIM
	 UqGW1FRBwv/xkifGKdMMNMlsjwSA8azuqPoJusmp0sJ3cfClRXCi1dGxX0nHyePGTupbI
	 uOpw6O0RymZfMNh2OxKyiGF7BEDExe1QMuXs1EyhIHBA8iPHKff2ZyqJonfIbreMpeA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776886;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=0AhF5KlG+UnbOc3W/kQWIjGySJOo1aaKFPKqc9wGSsY=;
	b=r5PRMmnalTl4MPWNg5VjnrMm3E0iNXWoAqihciukimS4EJcWz5tmjBbZgM7eBUQuH+Of
	 tC4yruEF/oflh5m/z2kMcTwpXSv1AW+UmAM8wUoYqGOs8BdEK/43QxmabMH1pZIoDF3C7
	 8pJy5vgWIeI1z5rEM78X9Or3SRhvjVsDTEwkmDw8ir7Z4tbD5mAinyDtaRJVy0LbcV51g
	 m8xHjfPN0OHg6W4vopWKWjfj1mXRRcjul/GmfPYFWQDsRK3rCkK24o4Pi09I9cT8uEuWp
	 K3RkjKv77efcQ5lkc5Kfq97BpLoWCo1hU0j0JfkeKzv2AfLmIeBcXf3d47/ukgcPFDQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FB791F00A21;
	Wed,  4 Nov 2026 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776886;
	bh=0AhF5KlG+UnbOc3W/kQWIjGySJOo1aaKFPKqc9wGSsY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=oayveeWoqyu7BSn8BZ4Q9xzT65Idp6SCSHcVQp/KIv0dabiIcrhvWAhynQaUTX5N1
	 w7pYGh3+ftYyGrWarU81QYhQ4ctcuMRmc0Jk8yR8n/fesu+PiROcliLgPrQBQvN6Nq
	 8hCAcDDtcqyXP0XRyZxQb1xaChSszlh/t354XHuxzw/dnDbZEL43F3DwGnP6q3fJMb
	 HLrfejRgtLYhFKdXMlOh7KcD8DPq3MhRZlvpN34O9BhfFikhfNBbmcr3dOIuKHfFtb
	 /LjuicBbQK2ysX7UtK8Wrfha7DHuNcjG+gw2+dISEA5JpS7ZNZyo4RBBzVOSxGkMye
	 cfCWLJ0TravGQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0565046CED;
	Wed,  4 Nov 2026 07:21:26 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH 0/2] pinctrl: Add the Siflower SF19A2890 pin controller
Date: Wed, 04 Nov 2026 02:21:16 -0500
Message-Id: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAOzc6moC/y2NQQrCMBBFr1JmbSATMBqvIi5iMtURiXUmFaH07
 k21ywfvvz+BkjApnLoJhD6s/CoNcNdBusdyI8O5MTjrPKJ1RnsM0R2DNQOXVOVpko05+EMm3Ht
 ou0Go5++veb78Wcfrg1JdQ5sh9B7bWd20eV4AoyN4z4oAAAA=
X-Change-ID: 20261102-sf19a2890-pinctrl-c0ad967de156
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776885; l=2123;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=trQxyC9FnpPDYSg5QLUGaKvpgYZNU0c3D/uLunjy+mc=;
 b=cG2tGjvNZZfQ7+rF4DSN6J5m1V1K9pe3HskaPhBlnEQ4NuKy8YXfcWz42m+ZgI+QVXgPDK9fp
 tH7ds7ZtbaqDWad/X7L09Qybo2d69cxI8zjlMZ28Nj2sbsnklDVDj+J
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

The MAINTAINERS entry that covers these files comes with the MIPS series
"MIPS: Add support for the Siflower SF19A2890"; this series applies on
its own. That entry is also why checkpatch's question about updating
MAINTAINERS for the new files is left unanswered here.

Tested on a GL.iNet GL-SFT1200: pinmux-pins gives every pin its owner:
SPI, UART0, I2C0, RGMII and MDIO, and the GPIOs for the switch reset, the
mode switch, the SPI chip select and the reset button. The console, the
SPI NAND, the ET6326 on I2C and Ethernet work with the mux this driver
sets.

---
Joseph Telaak (2):
      dt-bindings: pinctrl: Add Siflower SF19A2890 pin controller
      pinctrl: Add Siflower SF19A2890 pin controller driver

 .../pinctrl/siflower,sf19a2890-pinctrl.yaml        | 113 +++++
 drivers/pinctrl/Kconfig                            |  14 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-sf19a2890.c                | 536 +++++++++++++++++++++
 4 files changed, 664 insertions(+)
---
base-commit: f33a24cc012d34f25bb9942681bd478a1757b806
change-id: 20261102-sf19a2890-pinctrl-c0ad967de156

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


