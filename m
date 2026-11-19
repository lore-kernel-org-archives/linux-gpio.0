Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795086189;
	b=kdwCJs0cH+lC859TBwMZqG5pyuu6SOvmLvS+OGGm2BaGJHq5xn1f3ZB60wkHkKXyAg+B
	 z4Ziy5GbnBmSKV/MfxHwahI2FRADvk6jTokSQ4jm4GzulRoF74REdEOzAvv+Hw6C/xRRE
	 Ovtlr7rbHZ+UnCTvnxp+wNTFJWU0FrOad2UTnsqxFWjBXC49/x/RBu6vSc4qSQAzCOWwS
	 1XxDVBoE038UKHRn+ex8AId7QOiTrJLhLz2NaKbXu1V7/mFskIbWoRVp0uZSHaq08l+FO
	 bfIKRbXYzG6dJSk9u9JmfTHSq1ht29rQEzMHVN8V0LHIiCaTNm14fEzOnDeG0NjrFFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086189;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=sLCD0hdTnv6Da453ywGRbhFkVAe80xOO0sEFoswojxk=;
	b=K2ve4NVNea88F506mf9wLhkD+bQZxHXCfQFIu4zSpP7ozos65L9pyUWLbeM/AKJdnb7W
	 RjG5BZTw54N9uOt3Z7d9WrV7O85ivxkIhDrJKK9hZuMZJ4Yw9j05EhaYWGMmtCrQeGRVa
	 vSWp6C3lkj6i8IZFw0hE3kptJZxVJ9dm8PWzumJYDXdSKAaQJx8M5PW6PBuEncTdftVzE
	 aJI/tDhnAg/FOt7khKchS6l4r+8dDPC46AGNb3plMLI1Kz/wiXumX9EYz8QYbfLHOryPx
	 BjZCe1YsUr5RMyUVrSyh3vX2W8bjtFOsu3WY4q2NfPxFLc8ICwcFIKj+D2cMBlCOxiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHi4rO8Q;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25FA606A330;
	Thu, 19 Nov 2026 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHi4rO8Q
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795086189;
	b=ViUR7r4AW67OyLXMSNpQqwq/36ZDjeKMmgwZQtsqwr9o7Yf3XlgAeJxGnSeLNbID9fYN
	 GrROmvGWGbZLsn6grrcc4eMhQTTcbTN9HQWhdJUDoqfwSKyOy3CfoRwn9KBRb4kweF0Bd
	 AEprxQ8SszChuKUG1r6CpGcOzLR2VL897tQsfCpmGRrLNDRVhzQWdN7Y2eiideyxc6I9z
	 xmWsGDRRWOuWKHnp42cHSO5/ukJjCENlVRqMBmbXLCPK0eVXsXiGZ3d6kbC48ogCM+kAX
	 nnqJEDgJrFUm7q+ysmyTI/hfP+jQLhNi44VSempZLI8sQ1T0apqZBzDpKzZvzgtRNhg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795086189;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=sLCD0hdTnv6Da453ywGRbhFkVAe80xOO0sEFoswojxk=;
	b=nqbmnwXS5BB9kt3/+eelmLVOH1LdZf6qRHu5NsqsCr+kUy7O2nZ+uJblpXtmMc0nsyrY
	 DhgAX5aMmzm4/JJ7kxnIATHXXh1en6xr+/t9u7UqzUCHkPmxE37lWk2ywgry2DzjBUMau
	 mEJXNDzp0QCHV5OmSh+BZObnzvCihVVLZ0q3LpktcMVPmj/m6s0BSfWrjaxOIcD0J0mIc
	 wfgmK5cIX4S70ottLKiX7IhvHh4Ivryj6R6ptEGnOKeJdIS8+8PXwMhHk+FvDIl83IGmK
	 9I8rC0hdM7bjx0xw3DCp0h1uFqSmNBy7urQJ78sFlNyySOnGEewDpg/twSHeyEwXXqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA0D11F000C8;
	Thu, 19 Nov 2026 11:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795086189;
	bh=sLCD0hdTnv6Da453ywGRbhFkVAe80xOO0sEFoswojxk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=RHi4rO8Q3TethLmELW9eofpbccexQauNRAX1pGsu+vat8emS0Pbc94HbZfXHPSmbx
	 0R4EF8gcPED7IUuEk30A/sfWEE4a27lDMe2Skb2/dYeZkHu/+ebGhD5Xff4q0SASUz
	 avI6sw5Vd2x+6xKBZUGG6kR9GL7mX25m+CiOX5vGQ47dFm5LGk5J83uaDKgb/j6gKq
	 KxMYyrOez+RGrSJzl8+G0oaIX9ubX/OpF/KzUk672b0jEJNBxmC4p14hAbUcEWKEa9
	 mFqWeuPp5cUH/4u8GijFSzo6AxkRlo/2FpaS/PN/1AVsw7ML+26CJ0QYDWHM/wsUx1
	 VQCf81PWRrSaw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 289EA4B268;
	Thu, 19 Nov 2026 11:03:08 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v5 0/2] gpio: Add Cortina Systems CS75xx GPIO driver
Date: Thu, 19 Nov 2026 14:02:48 +0300
Message-Id: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNwQ6CMBAFf4Xs2ZoWSwFP/ofhUMsKa4SSFkkN6
 b9b4ORxknnzVvDoCD1csxUcLuTJjgmKUwam12OHjNrEkPNcCS4KZnxZhMC6iSzDlutLiSi1qiA
 tJodPCnvt3hzsP48XmnlLbEZPfrbuu98tcvOOshDqr7xIxpluK65rKbFW6tYNmt5nYwdoYow/W
 rGDqbgAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795086186; l=4741;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=7ReSjLy5tQcxGd7K4Ei7RJhi7iM5iBMo99bERKuG4cQ=;
 b=GMU11+a3H1pgmVIv3jre/3NQqK6uKkdG80san6lNXNOMDCPdY2Fo6PxsLffpjtgpJjZ/iKDMu
 Tv1teZuuy9jBVzAOxkkdNTfAKsG24/VnFfS6mTK4TOgzsmMS/rjDF/D
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
split per subsystem. The driver can be built with COMPILE_TEST without
the platform series [2], which is under review separately. The other
Kconfig option, ARCH_CORTINA_ACCESS, is defined by that series in
arch/arm/mach-goldengate/Kconfig; it is not in mainline yet. There is no
code dependency on the platform series. The device tree nodes will
follow with the other CS75xx dts changes once the platform is merged.

There is no public documentation; the register layout comes from the GPL
vendor kernels. Tested on a Securifi Almond+ (CS7542): the reset button
(GPIO 37) works as an active-low gpio-keys input, and the SX8650
touchscreen uses a level-triggered GPIO interrupt.

[1] https://lore.kernel.org/all/20261012-dreamlike-hazily-19bb60326f0a@spud/
[2] https://lore.kernel.org/all/20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com/

---
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


