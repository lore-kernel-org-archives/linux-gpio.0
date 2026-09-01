Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26EE483811
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 17:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283243; cv=none; b=hLSyOSbiqgDulV/ZNjsJN+XfwVKHEL1gnEGyt/hLtY2qNIk380Rrv4mlOuUzMqXemjJ5FuzRmYxIa2WAZAcZ4izgNogokmX++UZXVu8zMf2gM0HXb8Rgh4WA+zg31MLsw3wGl1gzQjnuOemKl9ipNfHA9pqPuVNKBFQM0vd4fjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283243; c=relaxed/simple;
	bh=UllhrlLmOAfFzPyIojyQGGCMu83Ko6IwJv3zmf06mWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9eai6qUhsutqUbikg9KLyj60uRz85qDjEdR7srUKNViRMzSKGoLDBvNkS5d3uvq5NTXgKCXu6TugSp8LpOVcFcbTMaMST1/wa31q45tzj+YDE2yEGaQAKmaQakv6G9kLj0qnrXm8W9K6KXxCxfN35gk2MLqcTukenpUL7cPnno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PA6xlTOD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PA6xlTOD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4533C1F00A3F
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 17:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788283242;
	bh=UllhrlLmOAfFzPyIojyQGGCMu83Ko6IwJv3zmf06mWE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PA6xlTOD4sb1TE+o03p94DXGN7bS3pmjOyR/wTCkvrwe4upm85CJS/8J2JmOUCqU4
	 xo+mnCT8Shn+SnVIvf9izZS1YUaMEVL7lWTcQqOveby8vn9wveRkcZWn8e81NPjbB/
	 BBtRHLfbkT13/E1H1ObV5EVKmV9AQ7JJwlfABsmTo5cp0qCcJhQ4rc6PL3SrOusA+T
	 GV31k5TjGaOE8sYdQ2IS30a6V/aQb4pJjiIbesXY8NPd56/jHubg+lP5bBXm78BXkP
	 cPPGzR/V0b4K3604afbpK5i+1Mf/CGK4vxAd3zYiWC8nZOIP4rH1pcTaYGXwmj+6eq
	 4cBJvxyJF0zNQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b5ef26b92dso5191061e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 10:20:42 -0700 (PDT)
X-Gm-Message-State: AFuF++kmSJzXc1OC7eC2fK42Ymx1xYNFCRfgBkE466BYaoo+A6IxhGqe
	c2/ClrDzgySV0gZ5VG6e20x2nGUaa4/ZXWqN+DJm04PYbdDY5dV6iQ0HWYzgK4YUmu8umf3jUzh
	NLleinR5Dehus/9hKjxxfdNV+cFUuIsU=
X-Received: by 2002:a05:6512:3416:b0:5b4:86ab:5236 with SMTP id
 2adb3069b0e04-5b6041fd0femr1465397e87.19.1788283240807; Tue, 01 Sep 2026
 10:20:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787931313.git.naseefkm@gmail.com>
In-Reply-To: <cover.1787931313.git.naseefkm@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 19:20:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLnhyfzwGzBfBhvcC-O_h=3_PMXjjW8n7SgGJkd13Fpr0Q@mail.gmail.com>
X-Gm-Features: AcwNN1VqFbxXyBOJuD2XIsoLQW-odLvTK5ffKBS21jFx1QEHMohAQQcQssx2viI
Message-ID: <CAD++jLnhyfzwGzBfBhvcC-O_h=3_PMXjjW8n7SgGJkd13Fpr0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: linux-gpio@vger.kernel.org, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 5:35=E2=80=AFPM Ahmed Naseef <naseefkm@gmail.com> w=
rote:

> The EcoNet EN7528 is a MIPS SoC that uses the same pin controller and GPI=
O
> IP as the Airoha SoCs, so it reuses the shared driver code introduced by
> the split into per-SoC drivers. Its register layout differs from every
> existing variant though: all IOMUX mode bits live in a single CHIP SCU
> register plus a few spill-over bits in IOMUX Control 3, EJTAG has its own
> enable register, and every pin configuration register is at a different
> offset than on EN7523.
>
> It also differs in a way the shared code did not model: only GPIO0-GPIO15
> are wired to the interrupt controller, while the driver assumed all
> AIROHA_NUM_PINS GPIOs could raise an interrupt. Patch 1 adds a
> num_irq_pins field to the per-SoC match data to describe that, bounds the
> interrupt callbacks and handler with it, and feeds it to gpiolib through
> gpio_irq_chip::init_valid_mask so gpiod_to_irq() fails up front for a pin
> that can never be an interrupt source. All existing SoCs pass
> AIROHA_NUM_PINS and are unaffected.
>
> Patch 2 documents the binding, patch 3 adds the driver.
>
> The series is based on linux-pinctrl/for-next, as it depends on the
> per-SoC driver split and on the CHIP SCU lookup by "airoha,chip-scu"
> phandle that landed there.
>
> Tested on a DASAN H660GM-A (EN7528, Airtel), booting OpenWrt.

Patches applied.

Ahmed, Benjamin: if you think there is something to Sashikos
hopless ramblings please simply follow up with fixes.

This is one of those cases where I definitely prefer to fix things
in-tree, Sashiko is hampering development with all it's comments.

Yours,
Linus Walleij
