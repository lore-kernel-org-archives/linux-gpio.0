Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0312F430310
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 12:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512403; cv=none; b=jHiQxlb0P9ORR5nP2ng+YfXVnkgwXkjbDq2tNPfBNzVs7JOwtwbZ1cPHLGMMNyE7zhObn7pVC5j7l51LVo2Wdvap1vI6Un9tYEjGCuExSO2beb6DDYzmYRShbxt88DkqemvW1rupLl6ZHvJnGYA6C6TZCgwLlxRwCkfhr1MvdNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512403; c=relaxed/simple;
	bh=91d/8a3TTUh2p1TALPb4oHDk9Ei1cIDo6w/Jtt8gY+Q=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvczVTEtNwj8OSSlJNj2vRb29I8oi8J7IzCWBlW4N+s5ZROGwiSBx1rcI73TLB9/+j2BHcJLRYn6mIpwBvjwzxsOmK9BZ8z8lLAYrZ4pYOfVsmulH3acqFAT1YVjGmZIvMmilP1kFOX5qL7mypwiv7yC/eD95mMjubCJBUOxnHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJqSeKVU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJqSeKVU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1C41F000E9
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 12:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783512402;
	bh=VfeAjdN+nIPQ+vDz+tkeIk9SNNOeUEXGRXMBMp2PdCo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=kJqSeKVUhFNwA2QjpgOW5Aegb2Z5v8C+sGJH27/OEUbo3DtRZJUMXJPLUqi6/6noV
	 xaXO0Scini1wIAXS0yUCZbgkcBaFNdYKTqQWLzm0HxrxYZiaYU1TNzPR9vbuklWtjX
	 NGCTjR52cYSaPAWjpMMdyCOgdITo0LvwmFu9vzSbYsGB7p8iuBJZtYBior2v9YCeM6
	 6IPkCyvAcZy5Se8bXr8MGRveIrPCWk4cKoJuu8V/vAg9VBdsKSZZWZ8cMvnvQqlJuH
	 O9U6mvls9mEM0Ibz0AmVOdNXGQLUAKl3+ph6jHKwSUPH6pGOKgZWkIpJY2yOUYDeh/
	 mMgfc85jx6Jxg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39b1eb7bde5so5156781fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 05:06:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqJIGsEAodjU7SMsuZIUOYH+twVxT/c5rIs4P0QyZ7FEJOtEi2DqyrRIlF1/TVceyeVdjFyfV+3VYAD@vger.kernel.org
X-Gm-Message-State: AOJu0YzDkj1tTnrjNBSeqturlS3DRx5NyaILvL/8D4I6bDELxFs2kW2M
	03IXaL5GmE+WGkCc5uo5p5w1QkijQwiVvQ2AxntGYmpujQAbOpMPUOgA8o8DaWSEvlxNfaZNSz6
	6B2UeyazLrHhftOQIT/tR6v4fKlvSIK1UdLilGmQzaQ==
X-Received: by 2002:a2e:9986:0:b0:38e:8760:2922 with SMTP id
 38308e7fff4ca-39c798cd475mr3525201fa.18.1783512401372; Wed, 08 Jul 2026
 05:06:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 05:06:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 05:06:40 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260707232742.1235008-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707232742.1235008-1-rosenp@gmail.com>
Date: Wed, 8 Jul 2026 05:06:40 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdKfO=v99DohN=64xc2PT6mxL3VNhnx7vRp+iNuKROYQQ@mail.gmail.com>
X-Gm-Features: AVVi8CdnnVwsAu34R58eU4dj7pWuLIl_043NR7l2-k74f1ggH-Bf5r774YcmjoQ
Message-ID: <CAMRc=MdKfO=v99DohN=64xc2PT6mxL3VNhnx7vRp+iNuKROYQQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: validate ngpios before use
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jason Cooper <jason@lakedaemon.net>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 
	open list <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 01:27:42 +0200, Rosen Penev <rosenp@gmail.com> said:
> If ngpios is read as 0 from device tree, it is passed via
> irq_alloc_domain_generic_chips() as irqs_per_chip, which leads to a
> division by zero in DIV_ROUND_UP(d->revmap_size, irqs_per_chip).
> Reject ngpios == 0 early.
>
> Fixes: fefe7b0923459 ("gpio: introduce gpio-mvebu driver for Marvell SoCs")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpio/gpio-mvebu.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index 39c1a13e1b65..c7cbfbfb4800 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -1175,6 +1175,11 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>
> +	if (!ngpios) {
> +		dev_err(&pdev->dev, "ngpios must be greater than 0\n");

return dev_err_probe()?

> +		return -EINVAL;
> +	}
> +
>  	id = of_alias_get_id(pdev->dev.of_node, "gpio");
>  	if (id < 0) {
>  		dev_err(&pdev->dev, "Couldn't get OF id\n");
> --
> 2.55.0
>
>
