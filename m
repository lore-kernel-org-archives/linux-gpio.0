Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A263AC0EA
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273171; cv=none; b=KK9XSDOc8ydDGsjYaTNiA3bGhdcLtbQVAzk8zir2rmhXaJ18jIs4O7A1OZdM5di9eilJqMJlKxqYhrEoUFg4Ttm4XtmQgK0uowgPiUQT4J+YnA3Ilr8Fp9q9RNUKbjhejSi2Q5mn48qmHvni6x4Y4+hMU9DGatxG/T5DAfCQOuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273171; c=relaxed/simple;
	bh=jkCUIidsz7gwYxrlA4jSqte/TYWbtveVTLHXjkLdtKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IWjgYTgdtWfPKPKSvk8TYWiC7AYdSc41LijpdPB99jA0gqoaSySp/WhLXB8RsyklD1ViPs8o21S2mEcU3TkZlYNwLGJHl7UENa7vQLPJYCg98DPZ7XS7PPNDOdKn26MhrU1Fj0MwmvJMsLYEnW7KiqJTtnfy8nYsyD6Bq18/7Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mx9l142j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mx9l142j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987A3C2BCF4
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 13:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774273171;
	bh=jkCUIidsz7gwYxrlA4jSqte/TYWbtveVTLHXjkLdtKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mx9l142j9/m0UI46OOb+GWAW1pORGNXxaDBuc9v6ZkakFQbzroNLCavqBJqh1RAjm
	 Dw1zr5ANEorif8nAfn1I6Icu+TzvNKp/YRggzNo7Qmrfj1UhhPAFUPMQRJCngTQVET
	 jZNxpVTD6YKXRqCdhLIUvq9UOpXy2K0ETB2nqWl43pSEskVkLJ4m9Yg9oBrFlAZ3Mc
	 EmSQ+/RbbbRdPXRrPv/1N/uhKnWDoiJ7HD7lDQP/I47QDrFGVHLT/6SKfSpD8iyQLg
	 axqzmSdYlSgx330ba43p93g20+p41gV4eI2w4TjX1qWR1392Li/APrPuy76fICRvjv
	 xSDL/C15IkqTA==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64e9f79cae8so3143980d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 06:39:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUABukECFK+cft/sI3LttLIglJERwYb4NCz/Hw99DYX6iGlq/Zdr/pcx0AEgfVI+/3mmzgfvVfQwEnn@vger.kernel.org
X-Gm-Message-State: AOJu0YxJpaEC4qbor53CW4i1UXj8r/q1j1QNVCnXufOHt058ncViGBeT
	4sdHY/61C8usvmfki4RFN46GIIFe6wmAhnHAd7P42Z3z+o7GaBIQbXJGy0nObsUB4wRdfCNdclU
	IUIJxPbbXTH+HF6uER5QQm/fzNegsoaM=
X-Received: by 2002:a53:ee4a:0:b0:64e:8baa:3b09 with SMTP id
 956f58d0204a3-64eaa8245a5mr9789768d50.76.1774273170889; Mon, 23 Mar 2026
 06:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1774087290.git.dan.carpenter@linaro.org> <CAMRc=McyeeEaagvkoU3MDAof_N_e+f-sVwCDak5Y7F5cQZd-7w@mail.gmail.com>
In-Reply-To: <CAMRc=McyeeEaagvkoU3MDAof_N_e+f-sVwCDak5Y7F5cQZd-7w@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 14:39:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLnmRHZ+0UFp9EppfmwLf71Qnyq40SNpvweFELdJJKeSYw@mail.gmail.com>
X-Gm-Features: AQROBzCbLfOCkGBtA0I38z2oF7Dbu2aCapqqw5ne1lBSzv9Hd8XJ8sI2hrdw5Zs
Message-ID: <CAD++jLnmRHZ+0UFp9EppfmwLf71Qnyq40SNpvweFELdJJKeSYw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] gpio: introduce a gpio driver for SCMI
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Dan Carpenter <dan.carpenter@linaro.og>, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
	Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 10:58=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Sat, Mar 21, 2026 at 11:13=E2=80=AFAM Dan Carpenter <dan.carpenter@lin=
aro.org> wrote:
> >
> > This basically abandons my earlier attempts and goes back to Takahiro
> > Akashi's driver.  Here is the link to Takahiro's patchset:
> >
> > https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@lin=
aro.org/
> >
> > v5: Addresses Andy's cleanups to the driver.
> >     Adrresses Krzysztof's comments about the dt spec file.
> >     And almost all the subsystem prefixes were wrong.
> >
> > v4: Addressed Andy's comments about kernel-doc
> >     Addressed Rob's comments on the spec file
> >
> > v3: Forward ported Takahiro's patches and added some fixes ups to make
> >     it work on current kernels.
>
> Once ready, how should this go in? Immutable branch in pinctrl and
> final two patches through GPIO tree?

Sounds like a plan, let's do that.

Yours,
Linus Walleij
