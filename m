Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959553FE671
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781004966; cv=none; b=TXqlgmVLY7/0Qgu0x7JG3ByCG1hZr0HsA7O1Kg9PdkaIw9V6u+GqyMw8efNORRyTbZ7gd5Lk5+9KqPFPRrRMf5juGoHkCDrM0rFiKn3/vqdElDE534Zq95kJ1BBsoRF4+1VlKufieS9/Ldb3cCFYbPdHI7Tr8PETrV2BDB0pK9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781004966; c=relaxed/simple;
	bh=XA2v7aPlMmkmzLdLwuSgaRaX4HX7mndJNVUyGWRb3E8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dv7KF4S2xo//cBG59EjY6AcEJmmMgtRd3ZcDsFL9um5oGes17XyTKjrBTwWyaskCtGaHuJqxc9Rt07Tz3hBK/baacSQ06cgdqg+bSfpLPex7ROmIb0lO7P4gjb2suRlEo5Hki8Q0m6yw0k15HQXxClMa6cgEgTe1JR3KzfODXMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMKD0q2M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMKD0q2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414951F008A0
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 11:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781004965;
	bh=XA2v7aPlMmkmzLdLwuSgaRaX4HX7mndJNVUyGWRb3E8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AMKD0q2MjEad5ndSWA8OCio0/gt5x8D+43X/SoDF8PWuND8gavx/pzvHlsiz2Nh7x
	 vOrz3fwyPa9lAHpEHpzN9NfVxaJ69AIgxz5kVnNhMGaVYQCvya9y3EZdEnSHQS+gBW
	 nqhYiccDbBVC+ZbEyaApYXebkMiiDDrovctJ9m3pFbpxdbaTHxfjo4/y43h0B+e2vY
	 mUxJ1ekVLm8i2T6pwZmRhgvaf+RRV59Vp5wCfQNyzuRRqlG4npH4JRpieXlefeX2Ca
	 KY0CF4CeMTCcij43WibcUTj2xLI+NHSN0hjWr0RSdLwvrBl21qbFYbS582/3DQ02x+
	 h9ohHJUKhmLLw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa6c66e6c5so3282502e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 04:36:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/r4qF4m/FfBZcj0vtqrQxvKwdEBxJL91iHBFnIjRhNN58fCWGAnns5qlR29zQEGUwT+woPKOv1LLi0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2TjEdRIHI2+r7MHfsHYL0mtb+X/RdhDTtNANt/l1cdsyGh754
	GTJKerqtW7TgXo8R3nGNofijLm2gSnYsFynsL342fc1djaToSeSO648WA1EXqf+rfujFM1ny+/H
	UjPd1rEVDu7RvG4L9Sec/DyLWc+rBjqoSYNdoYlVAIQ==
X-Received: by 2002:a05:6512:1250:b0:5aa:7788:d1d3 with SMTP id
 2adb3069b0e04-5acf82ed86dmr674111e87.23.1781004963756; Tue, 09 Jun 2026
 04:36:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jun 2026 04:36:02 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jun 2026 04:36:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260609031118.2275735-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609031118.2275735-1-sergio.paracuellos@gmail.com>
Date: Tue, 9 Jun 2026 04:36:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mcg6aErmF8rVfM7hSNNyTs+2apJ2Tv6VPevx29Q_NUhJA@mail.gmail.com>
X-Gm-Features: AVVi8Ceb0OR6VKneRVi9IgRbUs02FqPjlKyH9BcvPM6WMTA5ChhiYhBp9JI-jfs
Message-ID: <CAMRc=Mcg6aErmF8rVfM7hSNNyTs+2apJ2Tv6VPevx29Q_NUhJA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: mt7621: fix interrupt banks mapping on gpio chips
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linusw@kernel.org, brgl@kernel.org, tglx@kernel.org, 
	grant.likely@secretlab.ca, anna-maria@linutronix.de, vicencb@gmail.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jun 2026 05:11:18 +0200, Sergio Paracuellos
<sergio.paracuellos@gmail.com> said:
> The GPIO controller's registers are organized as sets of eight 32-bit
> registers with each set controlling a bank of up to 32 pins. A single
> interrupt is shared for all of the banks handled by the controller.
> The driver implements this using three gpio chip instances every one
> with its own irq chip. Every single pin can generate interrupts having
> a total of 96 possible interrupts here. It looks like there is a problem
> with interrupts being properly mapped to the gpio bank using this solution.
> This problem report is in the following lore's link [0].
>
> Device tree is using two cells for this, so only the interrupt pin and the
> interrupt type are described there. Changing to have three cells to setup
> also the bank and implement 'of_node_instance_match()' would also work but
> this would be an ABI breakage and also a bit incoherent since gpios itself
> are also using two cells and properly mapped in desired bank using through
> its pin number on 'of_xlate()'.
>
> That said, register a linear IRQ domain of the total of 96 interrupts shared
> with the three gpio chip instances so the bank and the interrupt is properly
> decoded and devices using gpio IRQs properly work.
>
> [0]: https://lore.kernel.org/linux-gpio/CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com/T/#u
>
> Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
> Co-developed-by: Vicente Bergas <vicencb@gmail.com>
> Signed-off-by: Vicente Bergas <vicencb@gmail.com>
> Tested-by: Vicente Bergas <vicencb@gmail.com>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

This looks relatively good to me. Sashiko points out several issues in remove
path but they're not different from what many other drivers suffer from so I'm
willing to let it slip with the potential of fixing it treewide later.

I won't be sending it for v7.1, it's way too big for rc7. I'll queue it directly
for v7.2 and send it next week with my merge window PR.

Bart
