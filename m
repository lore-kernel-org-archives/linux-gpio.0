Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D253D0BE4
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 07:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979107; cv=none; b=N4ehIDR5X6u4W4PRuwV3zcsXLfLOyEEB4+vI3U9xEosnj71o2RcknZax5KShS8XyGZMP22owK0oxfo3A8GJtmvLTo5wioi+T6sQEB7VlV2ReRIddAlRe/cHNa5ch4+ix5h5VfRE5SeC0epDBmt8BYFHSaSF4iorG7mfSo4HQ+IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979107; c=relaxed/simple;
	bh=/j3IiFTI8KXbBn2V4TIY590Yl/+UXf61a09lUwHxiVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5eZX1lCPcvx+SFglZglor9uIO1hE9vpm1AZc+lCzYo9HwZe7cQq0Iy4pggxCrJWBnIKwfPhoONrF213M5wh22bvFkIb2DlhYdxbKNm2H8XQHOUAKTI2TQkESFjdn/k49NXnluesoXnnJl0mqbDYMkqjAI160RopkfsboeozJcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PldCjYA4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PldCjYA4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED341F00A3E
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 07:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782979106;
	bh=/j3IiFTI8KXbBn2V4TIY590Yl/+UXf61a09lUwHxiVA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PldCjYA4RAUI1BMibujMNOxjGmbFPydGf0II6QKP9xPm/7Mfu2E0UGQ8Uay3yY5ji
	 o3fSpH4jkrayVoCaKT1SC9g1HdBQpoxagDJ9M4krNJdsFe+/tQFT0YmssoNMT/ysuY
	 CmKdXMo9q5q3jgAjJcVaYW8RrCCvI4VO0q5BsojPWvKdgBTOMQthaPh1ZQu9GXzSwk
	 RKEWmtdWN3AxAp2kJzNaodwlItKB/ZWIt6EM2hd1Fetd5Ht4awaKfFNc6O1BElvKmG
	 Uc0yNTyBLsn+ocnwV4tfxTeYhfLugVneGL08f81NFEGfqm+i7U8uIQPB64fAgQfWPh
	 aknCaTLiz4a2Q==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aebae2f310so1393479e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 00:58:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpkzHwRInFRnhvxFNlTRL4Y56u2XC9EBPgTOw+lgemIbwMbSjXjdj44/9VsGvAFAtmzNWDP2b5NlBXL@vger.kernel.org
X-Gm-Message-State: AOJu0YxHxnrSbG//tU8TGwnKDdALyOkFEwZ3hKbLNNiC3GMNjPGzJ5Lk
	emTKzmLXFG64n8BQ4fikzs9693dbq2TIw6885ppu5BEAs9FFrXcIorIgD+2EKtHkXC4k/dRHkD8
	5FdmeIqJMf+paAhn+01QMaVxT+BLEOyY=
X-Received: by 2002:a05:6512:8388:b0:5ae:b861:ac27 with SMTP id
 2adb3069b0e04-5aec6793d72mr856369e87.18.1782979105395; Thu, 02 Jul 2026
 00:58:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com> <20260701-gpio-nomadik-silent-v1-1-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-1-644d10316cef@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 2 Jul 2026 09:58:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLng0n4_YNy+Jfb+xwdi_qxWh_GrbYChwUEG4XtJrUz8pg@mail.gmail.com>
X-Gm-Features: AVVi8CfSGg0Rg88HPf4tmMDUA0VHM06H_sT-mgyoJj-QDfFPmE65E0qFzsN5iLQ
Message-ID: <CAD++jLng0n4_YNy+Jfb+xwdi_qxWh_GrbYChwUEG4XtJrUz8pg@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: nomadik: convert nmk_gpio_populate_chip() to
 goto cleanup
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 6:57=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:

> Remove duplicate teardown code that is found in all error if
> statements. Replace by goto-based cleanup labels.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
