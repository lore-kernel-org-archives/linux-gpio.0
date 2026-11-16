Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814781;
	b=qRR9n3g1mi3MmYcsauO0wkzg+MWozRUoAGnBc6rRZdHtSCc1nspRanrng/mVRLnEGAYa
	 WpXqD9lAt3DUeoi4QPm69UVOAIN4neBg8zM/Tp9ZoHJkwf3ei4q1UdJ6koi1vC6Gksww2
	 CvK+579JmvfWQx1GzJ09LeJ3RBTcaXojwAPvIkaqdWbC6s6Qkf3tbkNE1uliP8ZxAca9x
	 xAihLIfOuclz7zUqXsn1PU4xDO5xy1fGBChbzzCeKfCGBPS2ShvFoZ68lMvbvRcjbRc2l
	 dK3/FHzOG9wMY7xVfBMCbAZRzo2Qsiz93yPeGASf1U1cnEux+wJt1O58hLBchky6Cew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814781;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=zSSLr4i2Vm9DkoHzyxYDR96iikVPR64PgaZKkewQW2Q=;
	b=YcrfWpah87GXIEDlbXRo4fhMMWRYZPz22JgtXaEdGCQ2GHWgiBX2Cwhxln/p50AElB5W
	 DSXOFwXDvDcPb99lLN4+OPoiRR/Hr2lEHUJR3IrqqEtBhOket3lDzJDkmwMgajQHN5W1k
	 foBS6XVig8XmXs33U+athGkbXtASTJm0bNfofO3Ioetw8MU+p9EnC8UoPMEoCTUdVW9Dg
	 38mrYCZTkRUNa2toEjWnDcICRZ1C6kSGrric09ADJOkxhieS2YSUWaxGsSI3I57YGRMRl
	 WzdqGAETD+Xc7zYKWzxZA1i8o7i0TOfkIiR3E8+ncCXzckr3YlFxSQjSWgC+xlD/A9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dphUsDFI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0955E606A323;
	Mon, 16 Nov 2026 07:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dphUsDFI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814780;
	b=f/GRoM6nIOE/HuEobsScpy+mLbV5F8yHzI9Wbrtm3ZZXHITIZlCmugNWm7b2Chkr3sgi
	 Lk8uX+OHAQLIta6dgY0YwF2cW4OhiEz0EwL3JQHn9bYIjcjkXtMnY/jggGVkslLsqa2wk
	 NRzHsXXvBh5EIuepTI2X/Z2+4ZsJ/4MZ8eWAt2M5wVC95xnVXrD3qfawwEz6W792fsBCq
	 f4waL6Er/v1uPTT+IdCGyU4c9VqSQRSd4PY/CVkhBZfTTBTQWxD1xps2BLX13Gp+T/Huf
	 CMhKL0lAMd8YhMlkJo/aH4JlJSqzKuGQhGj66JcjpS2hFc4shPyKNdm8AyJO4hpPJBQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814780;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=zSSLr4i2Vm9DkoHzyxYDR96iikVPR64PgaZKkewQW2Q=;
	b=yAuRgkyjlgvlYbi68pt2kQV3VwYCXc7c/sagpYiEhF3rEWMi+kMUJMIzUfPGO/slg0nR
	 CrBJcJ6G5NK4oAYJ22YX25QRnW1RsrOngVFz4/EXlzG6pA9HcfGVVdGlDr+h/q27ksW8H
	 OgSv6lHnyqjwwV9U42DEtEdhjYPKD+cMFeuA7Hp9FS5wgWmly5GEIe8i671xmif/SBiue
	 pR7k7PTOX2HP3JJstowGza1gjXzPnO+tuXP2nSJuullp49I6/SQisd+JaSOtxwOfixgFC
	 4OJAOHNc6gvUhr1XqDVclCYFY1dHLBoASYnekV7xuIXkB7b9jYOjdOM31Ksz80MaT4A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30C9D1F000C4;
	Mon, 16 Nov 2026 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814780;
	bh=zSSLr4i2Vm9DkoHzyxYDR96iikVPR64PgaZKkewQW2Q=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=dphUsDFIa//LIiZaRWee5I4nKn7+wTH5qhYlMpeFrqClexNtIwGOe/DfcITm1j6ED
	 dDdQk42G6IO08eWsYS1p3gho9qblNISw1lwWMx+AVitc3yTjS9zrYQrBWRcaH5q0WP
	 GPCGLcvEXGrS5XEBKvSGtG1V+LOS2B77k7+qG2wOs3v2z7iAxYsi1KSfROMvWQnTwu
	 Il4u5pJURqIGWWlBaYAia8DvCis/LdPUlPTI8+HOdi/PLgS9/lKLs0w0mRaCsmAMir
	 kPouumM/QMCNRoudQLK2zSdQRo+JRJMWannMDAmXZmYHGdekNmJdymQelg7DRXUkqv
	 nMC1nC/6LtSkQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B40514A37C;
	Mon, 16 Nov 2026 07:39:39 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH v2 0/2] pinctrl: qcom: Add the Molokai TLMM
Date: Mon, 16 Nov 2026 13:09:38 +0530
Message-Id: <20261116-molokai-tlmm-v2-0-429f8c8d8eb1@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0JmbU2nIDGuvIdh0dZRRilj2kokh
 LsLuHb5kvffnyBRZEpwKiaINHBi6RcwuwJ8a/s7Kb4uDEabGhFrFaSTp2WVuxCUs5qowpoOWMI
 yeUW68WfLXZofp7d7kM9rYzVaTlniuP0NuHp/0gMqrUpnq2OltTbenUfbiuy9BGjmef4Cia1aV
 roAAAA=
X-Change-ID: 20261116-molokai-tlmm-ba0ee416e513
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814778; l=1884;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=GOXVLtgvL48PtdDLtd/2/l9Zes0/ErubbpXewA/ss5E=;
 b=TRfOGI5BfWbgGRIml8jfYTs77E395OgY1VqlNo0eznOniUHDtO2/DtFlGFQDDMWU6bErD1g9a
 tE/wQd+7+g9ClcrDwCw36D9XuFPLqf5uFlWp6WDfOSPyvdZiY694SLi
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com

Molokai (SM8845) is a Qualcomm SoC derived from Kaanapali (SM8850), found
for example in the Motorola Signature. Its TLMM has the Kaanapali register
layout, but 205 GPIOs instead of 217, different functions on every pin and
a different GPIO to PDC wakeup map. With the Kaanapali tables a
wake-capable GPIO interrupt is routed to the wrong PDC input and never
fires, so this adds a binding and a driver of its own.

The SoC and board devicetree that use it are sent separately in "Add
support for the Qualcomm Molokai (SM8845) and the Motorola Signature".

Tested on the Motorola Signature: the UFS reset, the keys and the GPIO
interrupts that go through the PDC (touchscreen, amplifiers) work.

I used an LLM (Claude) to help write these patches and their commit
messages. I reviewed all of them and tested the result on the device.

---
Changes in v2:
- Binding: indent the example state node consistently.
- Driver: mark egpio as a GPIO function (MSM_GPIO_PIN_FUNCTION) so GPIO
  requests on pins muxed to egpio are not rejected.
- Kept the default 3-bit interrupt target field: on Molokai INTR_CFG[11]
  reads 0 out of reset and the target resets to 0x7.
- Link to v1: https://patch.msgid.link/20261116-molokai-tlmm-v1-0-3ba4840002cb@yahoo.com

---
Venkat Yadlapati (2):
      dt-bindings: pinctrl: qcom: Add Molokai TLMM
      pinctrl: qcom: Add Molokai TLMM driver

 .../bindings/pinctrl/qcom,molokai-tlmm.yaml        |  128 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-molokai.c             | 1679 ++++++++++++++++++++
 4 files changed, 1818 insertions(+)
---
base-commit: 7bbad7337a81d1d73559b783280a76a65a9de191
change-id: 20261116-molokai-tlmm-ba0ee416e513

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


