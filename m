Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F0B9463
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377637; cv=none; b=OBLZB1zHjvQYZLHQt+7LlyfiDiVsQuQqk/a7SazW2W4Pf6KCbFl2NCyf+fkIPgbcCnwDNKdwCWfBMy3SSdbd3lexevy2p+zAmwha2qLr3nXHLwVWgZIQCo1q9ahdr9CZ4s09Cx4553wv2WLVZLwC71D9PguUn8EhfyQVNHvLk0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377637; c=relaxed/simple;
	bh=eSQwvXbrhVlLDZxIrriKTdW+rss+Xx2YD8/ACro1PUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TNB7Z+28DAnJ/fn56LVELvnU6BcAjc9r2daWiXm0uWrxtNJAhJHhy5i0cI7cp3wW+XjxJ2J9QTGc/3Rvd+5klnNuEvzyfqtvnFgylrxwPp0sottrjQx7WHG3IZGkzVrHdJRNtpzXmRD93N1A6eBQsmUb+9+gvJaV9PV4LASAc/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7nOBQMp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7nOBQMp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287C91F000FF
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377636;
	bh=eSQwvXbrhVlLDZxIrriKTdW+rss+Xx2YD8/ACro1PUs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=T7nOBQMpu8MFJX3q5HikToJULayNVBtbpg834o4bVi4c8F+5QYQbHUc8NCAJevaiz
	 UNlR6cuGO6BUGhnos/Nq/yiSsMcJEvEXfQqEzPGdFULa9aB2TJ9yGNWdLg8+R1Fl+0
	 6bfqh3iY3KIS0OtPqFTqDReMp4P0lYqCKVYeeQE10tpMh28Mu6iaRrURlZZQT+bEtm
	 y4KsaDuy4kXLqXXtGTz5jQ23kftt9T6U5q8Ctajp/yvy6QUSLkPbjKuWqr+frSirYp
	 m/zNWEGCR9xeh6i/sjBLGGtQAxf3WIye0ZWanVosQ/3gcsTUqgniw4mOSHk8HMYY1M
	 5RwuIxWndA4fA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76668f4ddso825640e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 02:20:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzK4osXlExdIAN1/c8CXzL8cckIflbdDWKmz2Q1erggQxk7oCYJdDOEETpEhQVpLIKRIBbZ301xHMb3@vger.kernel.org
X-Gm-Message-State: AFuF++m9NW8bB2239YFgN4/QDhtxzPDo7BnZ+n9mOjhFzCPJvDB/xtCb
	q/CEMetbkpk1iVvhS3WiA7qJ8Wh0CDyOvI7di6h9IjFNYp5i1Z3f5TLSgIGCm1tieAyiS/jok3l
	rJ3o3KOg1Af2xqrJGhfsb82Wn+cjHmZg=
X-Received: by 2002:ac2:5681:0:b0:5b7:5cbb:661a with SMTP id
 2adb3069b0e04-5b8ae4df066mr421235e87.0.1789377634893; Mon, 14 Sep 2026
 02:20:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com> <20260901-pci-tc9563-aux-v1-4-dd9b80738e70@oss.qualcomm.com>
In-Reply-To: <20260901-pci-tc9563-aux-v1-4-dd9b80738e70@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 11:20:21 +0200
X-Gmail-Original-Message-ID: <CAD++jL=8FUodyGzBM3_1L2n1McL098h=CqXGQyqcunoYeJrtvA@mail.gmail.com>
X-Gm-Features: AcwNN1VdI7CJOO0ZcprZb2VpGFj8KzkqAPZgo_YE0VXWhh_YZRttmpamlhFeCrg
Message-ID: <CAD++jL=8FUodyGzBM3_1L2n1McL098h=CqXGQyqcunoYeJrtvA@mail.gmail.com>
Subject: Re: [PATCH 4/5] PCI/pwrctrl: tc9563: switch per-port reset to GPIO
 descriptor API
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:28=E2=80=AFPM Lorenzo Bianconi
<lorenzo.bianconi@oss.qualcomm.com> wrote:

> Remove the local TC9563_GPIO_MASK and TC9563_GPIO_DEASSERT_BITS
> definitions, which are no longer used after switching to the GPIO
> descriptor API.
>
> Replace the direct regmap-based per-port reset logic in
> assert_deassert_reset() with gpiod_direction_output() calls, falling
> back to the legacy regmap approach only when no reset-gpios DT
> property is present for a given port.
>
> Add the reset GPIO pointer to struct tc9563_pwrctrl_cfg and introduce
> tc9563_pwrctrl_parse_reset_line() to look up reset-gpios from each
> PCI downstream port child node. The lookup is done lazily at the
> beginning of power_on(), returning -EPROBE_DEFER until the GPIO chip
> is registered.
>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
