Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218885;
	b=mABcaPXrezRPl7gul+kVMiWsgDscoRBojAL6o/jYDcHIoXRuv2kjPI+8M2Jpm9QppPiu
	 8M6Riw7MYu30ICd1d4GoiF/H9EB/PPR0uPXHB21KhyLb2RVcF4ntQUvfvbLBi4I0rjqKb
	 bxBsI/GOuvzDKTqc21ZI3ffi24su2B5B/lqwA5cZpZAhVsG3Fp2l7doF4GOJDgWupc00A
	 AM92jZNB23a7ZTeAal5AoU9ZWQuGYazJg2qc+67/+lkkNgQHJ9GHlUbVSobIIFD77BDPL
	 f+Hl3Q8bODwVOAAvrAPlAeB3L9MpmuWDhhTr4hel1ycdIr+s+uVR+foOu1wR98IuTww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218885;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MwCG8sW2sEHjBqVpj6OQh+uDvEKncr7+eWRt3AtS2+I=;
	b=ZrDAvxL3wDFCUNisOMW63s/DZDB7Ak9WG7PdJEx3CuiYsQ64xMX7nqGfJbwghy9N3NnV
	 0jNNq0Y3etV+xy5WY4t7Pg8LYl0nUIobwzJat+z1H0YTOqm1UP19HKWeUQJpjxlOy36u6
	 XXe54zG+qGr1Mc5dhvochWekNSGLLdQ8xmtTw1yQaWeFQgGnXRHqKOmi2JNed6p0/EsYF
	 bU9bqmV7/bUvX5ppo71/GACd+bDsnRDsoJFxklC6qGHyy8REoHvVX6QTvu4450kWq7/HC
	 xw+ODCVU13NdGHdiMcNMkaBg8GKtfNtRTCynXJSlgvmOF7wpOGp1Hg/lRfI5VTJjEew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gXllkEPr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738DC606A6BC
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 23:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gXllkEPr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EEDA1F000C4
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 23:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795218884;
	bh=MwCG8sW2sEHjBqVpj6OQh+uDvEKncr7+eWRt3AtS2+I=;
	h=From:Date:Subject:To:Cc;
	b=gXllkEPrGPKK5zKCqaBRtm3r2SHcApvvEeC9DzRADDoYiscJb7/1uyNNoV1VIyeuv
	 MShA13Ia3jF2iBaGv9cTlcaT2ZbGzHLRZHrC8cLe/NrOaTja1GIQBIGXVjyGzVCpZ4
	 vWcxdCwcXVZnDjJvVkJjRuCtqUlqWlEGcKykmSh0iJPdIfFDTv4bu2o+tZvtNuFnXk
	 fhjdbcKZkpw7X4zIPt6uUx310PGSdrmlGlC57nHkRh1bxX4fc0uSQCgoyzMWQKtKgl
	 p9vN4Y64cVGBByntC0+5J7WmFDcLbujLXbfjOhwpwZAio6WWmtMjy42wPGBPIb31b2
	 R5CMZ71yCaoxw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c15956ce07so2354934e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 15:54:44 -0800 (PST)
X-Gm-Message-State: APuU4Z9IAo/C4bnYWbg77fKB55l3CDRy4A0wUgvkJAjbKHnFvEVZLN00
	LKTdWsD+O7UOF0KMfZMxjGrRbAvrKG7sMt64S45p/qH+NnH+hkQIwjmlfbjQwFFwFAEID45HPXc
	SCCPDvCGNdJQJ80B4yFLxFyFLwreQyyw=
X-Received: by 2002:a05:6512:3a8b:b0:5bf:b96b:89f4 with SMTP id
 2adb3069b0e04-5c1b7c00ae6mr1966795e87.19.1795218883350; Fri, 20 Nov 2026
 15:54:43 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 00:54:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLm13UUobkDTbXLMeyOxVywhquqxRNj4T8+SyhAeXJ8CPw@mail.gmail.com>
X-Gm-Features: Aa3M54rKu6dLPqMYIvG_z8FK7SrC6xvbqamjvuUqYO9eGdjvDUdWd-LhshlhHY4
Message-ID: <CAD++jLm13UUobkDTbXLMeyOxVywhquqxRNj4T8+SyhAeXJ8CPw@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v7.4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

here are some pin control fixes for the v7.4 series. There will be
more coming, but let's clear the first off the table.

Details in the signed tag as usual.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4=
:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.4-2

for you to fetch changes up to 5cf0969621bc014b5305e6ff8b7e28f20060c3e8:

  pinctrl: ocelot: do not use the chained irqchip behind a sleeping
bus (2026-11-17 15:05:54 +0100)

----------------------------------------------------------------
Pin control fixes for the v7.4 kernel:

- Add strong pull-up for the Kaanapali I2C making a camera
  work on a tablet which is a good thing.

- Check return of of_iomap() properly in the Mediatek core
  code.

- Fix slew rate writing in the Realtek driver.

- Send strength in microamps, map schmitt trigger and
  interpret settings without argument as enabled in the
  SCMI driver.

- Use a raw spinlock for the GPIO regmap and do not
  use a chained IRQ handler on the sleeping bus in the
  Ocelot driver.

----------------------------------------------------------------
Baek Kyu, Kim (1):
      pinctrl: realtek: Write the encoded slew rate value

Cl=C3=A9ment Le Goffic (3):
      pinctrl: scmi: send the drive strength in microamperes
      pinctrl: scmi: map the schmitt trigger enable to its SCMI type
      pinctrl: scmi: send the settings without argument as enabled

Jens Emil Schulz =C3=98stergaard (2):
      pinctrl: ocelot: use a raw spinlock for the GPIO regmap
      pinctrl: ocelot: do not use the chained irqchip behind a sleeping bus

Joonhoe Kim (1):
      pinctrl: qcom: kaanapali: add the I2C strong pull-up bit

Linus Walleij (1):
      Merge tag 'pinctrl-qcom-fixes-for-v7.3' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into fixes

Saad Anjum (1):
      pinctrl: mediatek: common-v2: Fix of_iomap() error check

 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |  4 +-
 drivers/pinctrl/pinctrl-ocelot.c                 |  4 +-
 drivers/pinctrl/pinctrl-scmi.c                   | 52 +++++++++++++++++++-=
----
 drivers/pinctrl/qcom/pinctrl-kaanapali.c         |  1 +
 drivers/pinctrl/realtek/pinctrl-rtd.c            |  2 +-
 5 files changed, 49 insertions(+), 14 deletions(-)
