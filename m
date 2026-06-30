Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDDE401A26
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819742; cv=none; b=N5wGBIeTtMPPQnKqrDNuiJaV/2WKgwURJ94iPMkZBcZvJpNVBY4Qv1Hvgfz2zzByyvYJ5vD6TTxKktMJtx7vASXV3hXxkfr4M99OTXfplW9kvltmR6bxJGIx0wW9GlWD0zUTugv9lRIiik6EBfSOuYE8bA/FrmVxto0EVotw/dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819742; c=relaxed/simple;
	bh=LTM2FGFdsfj3aMK76LNUhcLlBo4dj8gtzXyYmNYMEr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GV8b2GhX8VtwEB1iGEwpsQl+MfNR5xKNziEw+Wv4mgQtKIS7kqYATCrVlIVkp4uxesM0QBwGQdSDyWpsu+12w3VImQxC51Zj/4LOb35ga35u9BEmmkM6ijYMZosIaCQ59URfrWe4VvCc4j3pjGabUfdCt7EbyVuXws2CYFKV7fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYikKDQX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYikKDQX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D27E1F00A3D
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782819741;
	bh=nxTCFNBV+5WgjeM90QEBSEZQuSb0NkbNyeqlQv5w/qE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LYikKDQXBLo0kCPnvLGoe73f3Ixeu+qKUg0BFdjZUIV+ou6MjJyQTaODaE8Yfauhy
	 R4ht/SukhvoD5+nxiHVBoi+PcAyNAutoSBMkJTexPpe59Wv/GneKvelaa3FAkduAnv
	 1vBtBDPj2/CXfER1XSgvaecIpBCGjPuLrxUahB8FjGq7Vux8Ff74JlXbi4tKaltNWh
	 fLTa1sAiDiK/ViVDgxc3kjLp71ugxsdeSSoaEiSLvGutahCzQqEXa77/riKfOmiXYm
	 JRlmnhDOsK/4pg2WW3i27iydAWwKE7auP9Q3FsxaiPW7HmbeB155NYStkTJP8WNXi8
	 NLJkvDWl2pVfA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aebd52488cso1337821e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 04:42:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro5R0x3eFA12eo31FiVJOyGhK2OnSDN6jW+8BqZmb6VapqJ4+AafTRoVxSkw15tPq6hpgt7Ki7F2isJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0t+sDvWFuSzT/YAERw2aVA3vSr7J2LGpm2rplbDzLX7S+fIke
	ceRakLByC6GRBdyqecTNLOQMwqZd2/xY5Df7CCPVybco69dUD1xFb7lrxjw7JSRFEtpiBmNjQ5R
	01j1LGbKm7lD+jCao/0qsynZouYQnzH8=
X-Received: by 2002:a05:6512:154f:10b0:5ae:b59e:aa45 with SMTP id
 2adb3069b0e04-5aec10a7063mr96918e87.17.1782819740197; Tue, 30 Jun 2026
 04:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:42:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLk5qmiCTebaor1h4MSRX0mM-oKH-CdbZU9SKq=f3aQVug@mail.gmail.com>
X-Gm-Features: AVVi8Cd7eCD649SnBV2WxKux4nyUueaUnvWYYumbluks4lrE1IUtvzMk-4VKDAU
Message-ID: <CAD++jLk5qmiCTebaor1h4MSRX0mM-oKH-CdbZU9SKq=f3aQVug@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle state
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 10:26=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:

> There are two modes PDC irqchip can work in
>         - pass through mode
>         - secondary controller mode
>
> Secondary mode is supported depending on SoC using PDC HW Version v3.0
> or higher.
>
> +------------------------------------------------------------------------=
+
> | SoC             |  SM8350, SM8450  | SM8550, Hamoa   | SM8650, SM8750  =
|
> |----------------------------------------------------------- ------------=
|
> | Version         |        v2.7      |       v3.0        |       v3.2    =
|
> |------------------------------------------------------------------------=
|
> | Pass through    |        Yes       |       Yes         |       Yes     =
|
> |------------------------------------------------------------------------=
|
> | Secondary       |        No        |       Yes         |       Yes     =
|
> +------------------------------------------------------------------------=
+

I don't know what to do with this hurdle of pin control and irqchip patches=
,
luckily it will be Bartosz' problem since he's managing Qualcomm pin
controllers now :D

I'll be fine with brining the irqchip patches through pin control if an
irqchip maintainer ACKs them.

Yours,
Linus Walleij
