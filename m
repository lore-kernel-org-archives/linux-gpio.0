Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794794898;
	b=Lwcf/t9TcC377mdbJ+5OP88wGkLaQuE6xiQFg0ogTJVAmoH9rGRW866bhrBmiZX4w/2E
	 v8ZDBQRt4Je59BggDzhvJCdsN2XLpTW+d4C0Q5O4UJ5aMU7GgamVN1nL1XQUrcH+lr/lh
	 r6TZhrq2+XseTVuvkuC8Q+IobQ+M5Y2EhU7N1UciWlFa+Vl46EQhhYqeKuokZMcMRQ9+v
	 MNr6BxozoMUum/9d1/ypM+xZrMAn51+n0QkKdNJEX+YqVnlXDsaRJhFYkZGCrkNMV3A1E
	 ay0W8FCen7rU9oa+CcQZFxzKLD2AjT4pXNZcBCupvwWZnfJzt6ulhVY8o0c40Oz1o6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794898;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=aNbeHIOxMQPLepxSce2mbuC+TYH2Z2cBB/5NjFX2Su0=;
	b=Z5G0vK0sFGbdo6qC7PauPxwKixXEtVhqII1l0nPm0kjxgysnbrYbyLDIIxYfLKMjHFDt
	 SMA3EGZfqvMjY1REK3kYj6BGbKLr3O3yxb0PdpdoTxgg10N63ictrYpPX1cYExNTcFIW2
	 QRkgfnXtmJ5OH/IzqG9ZfTLNE6CZKbs+MiFbrsjBLuHTye9s0gBMt7S2IlDu65yU+zhL8
	 xbB2QRApQ8/rfZXa8+OI8ZIsyLl6Ss9hplqBcNriL8vEQlLYhZk6JdGbx6ORWpNtsa+W8
	 I+PcVTZhSIoEVF6Mu0Xcf8LNSYIIocn4FTjduJT8fvAqjy/pAn/cV7vpw4CTYLRjneQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nDE4tuuk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C401E606A32F;
	Mon, 16 Nov 2026 02:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nDE4tuuk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794794898;
	b=N8teNYoetKOTFmpv9Dz9hGm6xesH/u9nuPOP5Le6rRiEo+KJHAo9jTBy8I/NIslnsUhu
	 II6pCLblERHF97Nn8VSWa4vy1+Z7YtVdFZPjnTXM22iaft/PGJwpIynLCqs1vtgYbRRsd
	 +F+7WmgRsYkE9t/3zyT6Yugyx/vSZISzClKB/xMyfzIpWMXOu1BxWihVJNQ1Qz1KxdyPQ
	 jSKkjOPatRVE/AybOAq4j3JN57KagwzZO7ZN75YaoioCgXw/i1oGap0ayJm8QWD3WQe9u
	 euZpJOa9rzqSe51yaRjwjXKTxcoXbs1ilElig44k1eyRiBM7YJ2HhnMTnY6g1GVmzYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794794898;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=aNbeHIOxMQPLepxSce2mbuC+TYH2Z2cBB/5NjFX2Su0=;
	b=US8D/HGVybjrrlt+IxZBPK3xZ4Tz35/PZngw3EN1pq2ZI7zGX9dYiV9zfy3XFVz112HZ
	 UhT5dyRAs1v0Vir84FIMx+G9n3Hj5nd4yE8nU9LhBdCtD6QIhD93EU7/YjAKVkl2Bt5z1
	 t9sfqiPywI1PU7tSZy7akrYzJ+q83aL3eUx4tdplMqOu1jWO2ER5no2qagzOAB7hfeizw
	 XjimsyOb/PdJS0mpou1c/08cMoKArwOnZrEpzJ9XWuE7mrH0PB/i9JqKPRAFxwQFVBbB7
	 +aod+ON7MtO5HwoWbCfEmiDIh3AK98OGyW6/zOd7SpaLF+KHzotB3KOmWu+Ricta8nQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACFC61F000C5;
	Mon, 16 Nov 2026 02:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794898;
	bh=aNbeHIOxMQPLepxSce2mbuC+TYH2Z2cBB/5NjFX2Su0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=nDE4tuukZQ7TEpW4xLMYshXpqkKNoBgR6zzOfc5zBx3C0nHhVsKzdvaB/y3crM1yM
	 bvT+BmXjMZKi/TPRYyDaHtxND08ahxe4jS/LjmdtEkDA3RsWbNjsyDgUI4W0Q5pWyZ
	 Q17pRWQzEFSWURdFgUha/d492h2P4UFmLqspz5lQd6ZidyKIAA+4vwOCNdjD5/BaIQ
	 YVeSSTiSVJ+QErao6xgq4qpztLzWuzipb/rv/KA8nx5jfikNDU4kVe1myfAbBq4+32
	 xwV4LxAFpyFwuXb19SZH+z3v4KpKuvCXZye8pk93XAHMJuagzhLXyWK3/oX0tDKFwV
	 1gHQrMaJDx2UA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0D8EE4A2B3;
	Mon, 16 Nov 2026 02:08:17 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v4 0/2] gpio: Add Cortina Systems CS75xx GPIO driver
Date: Mon, 16 Nov 2026 05:08:15 +0300
Message-Id: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NT3eRic9OKCt30gsx83dQUg0Rj89RUk0QzCyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgBrK2ZdbwAAAA==
X-Change-ID: 20261015-cs75xx-gpio-ed0a37ee4a68
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794794896; l=3868;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=4cLtFIrRgarbcVyxItPiz+PrfRuS8IJeSDoXQqO9BOU=;
 b=lCyCsg+aC1jJMKeUwe+oxSY0gsvieaHuJyyc+SOKTHg0meMmqful9Ah0rFPDY2OJ0o7JQL8mr
 401NpSq44meDZh7GhL7U9igOsvBMjcyDDDgxBNdYp0KQOl3upby3SRQ
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
set it up, until there is a pin controller driver for that block. On the
Securifi Almond+ the boot loader already leaves the reset button and the
touchscreen interrupt lines in the GPIO function.

The driver used to be part of a series with the interrupt controller,
I2C and watchdog drivers and the device tree changes. That series is now
split per subsystem: the driver builds with COMPILE_TEST and does not
depend on the platform series [2], which is under review separately. The
device tree nodes will follow with the other CS75xx dts changes once the
platform is merged.

There is no public documentation; the register layout comes from the GPL
vendor kernels. Tested on a Securifi Almond+ (CS7542): the reset button
(GPIO 37) works as an active-low gpio-keys input, and the SX8650
touchscreen uses a level-triggered GPIO interrupt.

[1] https://lore.kernel.org/all/20261012-dreamlike-hazily-19bb60326f0a@spud/
[2] https://lore.kernel.org/all/20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com/

---
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
 drivers/gpio/gpio-cs75xx.c                         | 281 +++++++++++++++++++++
 4 files changed, 359 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261015-cs75xx-gpio-ed0a37ee4a68

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


