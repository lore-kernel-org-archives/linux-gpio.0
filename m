Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DBD49364C
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551767; cv=none; b=TOoAB5PvKNkEQGu29vZhgdruyXfUckinp0zx1LKqQ0L/SdgXDJ9YQBeorPA1im4ZgiWo7WLfgB4uk++7+JfaXnLxIcQLD4Fz12gB533cZdRZMa+HuXxsjaT4eBWLzbQlhZBVQN60oPcnM6thi3FYG4TkMAkSH5DN3mJYjgXbad8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551767; c=relaxed/simple;
	bh=cqFwpLQ8DQqnuEuDbC3MvqV/smDD3aMRxr/k52wr/tA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W/R2hCDQDANvD0zW6Vbgkk+Z1bthHcd7K+ETl7I0a3u/S3NDeiCephDqlAb2/ih/papYFvXl0R8X3MVU6xNM8yr/Saz4m5O5phlnCm5xNIjbdQciOoi8m8H9VgVLhLf2ooTBg8+9HZ6aEk1cw+gbCH1fbCCrS8McarMsf74AUfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7eU4G/q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7eU4G/q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B0E1F008A2
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789551757;
	bh=cqFwpLQ8DQqnuEuDbC3MvqV/smDD3aMRxr/k52wr/tA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=V7eU4G/qrJYsraslV6xwAcefnxEd00KhIxhPEEXG0ZuENbAkBucxaFewyR2UTGxa0
	 9ydt/ClWnz185qyQ7fd4yeJrwDinu2SKt7ryBVdt+c0McLlNcCYV1Bkv/sZ28uttnK
	 KZbkvPrNlGdv+B3qYqkMPq9M3rU3YQ1L6yCOELVnQ2TagAwNUVShxFaue6DWqChOoq
	 FDIVvzekshgLL9so84s+ideUO50YTnopKWCytdGygPqghQro1DMSIPsNcEfFaj4Mxv
	 LL6ah6mijWVBZxMoMZxZIE44e65n7I7cL2BDpmSeynGgJ5CJvXKdFZ3CB4cNfE6fP9
	 0py1tNBKuJWoQ==
Received: by mail-lr2-f41.google.com with SMTP id 38308e7fff4ca-3a2ff176d7eso6267451fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 02:42:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByXNhXlO34K54cg1mKx7g1822roKkBXX7BTf7mi7na5j2FpAfU9OkYhQM3ub4zn2JqGwk5W4k4WAnh4@vger.kernel.org
X-Gm-Message-State: AFuF++msu2occLCaEXkeiKvg6YaI3B1hgrXEdU+wv+4dLRKjfAedq+rk
	yMbKC6dTKZ05OU3WG/cyIhKEV4+1o0p26TA5QX6lT9evR5osMqLM2ei5T3MpQcPa6IF0pXjNtJK
	p++7gkGgkmxMU+tacAshfJBIuNcYl+eiSN7q/z6rUCg==
X-Received: by 2002:a05:651c:a10f:10b0:3a4:9881:8ded with SMTP id
 38308e7fff4ca-3a5dc9b4b1amr5756261fa.5.1789551755778; Wed, 16 Sep 2026
 02:42:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 05:42:34 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 05:42:34 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915080501.329424-2-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915080501.329424-1-mehmet.fide@gmail.com> <20260915080501.329424-2-mehmet.fide@gmail.com>
Date: Wed, 16 Sep 2026 05:42:34 -0400
X-Gmail-Original-Message-ID: <CAMRc=Md5hu0ec_vNOy4mK8F4cw7Rz6qONVZ5jRH87JaRbjMLiw@mail.gmail.com>
X-Gm-Features: AcwNN1VnRspipPNfEKlhy5QnZsTJ24KTRx6W07m7ha1B5smjeCWweV0ATyt3qGE
Message-ID: <CAMRc=Md5hu0ec_vNOy4mK8F4cw7Rz6qONVZ5jRH87JaRbjMLiw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] pinctrl: make the CONFIG_PINCTRL=n gpio config
 stubs return -ENOTSUPP
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 10:04:58 +0200, Mehmet Fide <mehmet.fide@gmail.com> said:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> With CONFIG_PINCTRL=n, pinctrl_gpio_get_config() and
> pinctrl_gpio_set_config() are stubs that return 0. The getter reports
> success without touching the config it was asked to fill, so a caller
> reads the packed parameter it passed in back as if it were the pin's
> state; the setter reports success for a configuration nobody applied.
>
> With CONFIG_PINCTRL=y the same callers already get -ENOTSUPP from
> gpiochip_generic_config() and gpiochip_generic_get_config() for a chip
> without pin ranges, and gpiolib treats that value as "the backend cannot
> do this" and carries on. Return it from the stubs too, so a kernel
> without pinctrl behaves like a chip without pin ranges instead of
> claiming success.
>
> Suggested-by: Haibo Chen <haibo.chen@nxp.com>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
