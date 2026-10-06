Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595BE3D7D8E
	for <linux-gpio@vger.kernel.org>; Tue,  6 Oct 2026 10:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281811; cv=none; b=baZfm1yqEwcr64clwSgEL3OGfX+0Vn8ouSpCY3CWLmftE2dL8FXKRzcSeig6lqhwTLzo/Pe6h3hYwc1YX4gXU08f2sdStFvFv3LY24GhzP5HTgynDDEtZ3jTf4dCXtxNo5j94XG1LwrLwhtxiyeDlIjEIhad8GbgOAz7Wg2mKtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281811; c=relaxed/simple;
	bh=/yT5544sKHRC4UJIanLDlxMS/mhmwycCyd6tuBNwVOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQC4mhmprK9iWh0wr3ismTcb/U1mS9JRtrBngz6QpZGZxvPnww+1RpMq4I/b/Lob+dVaVH25QGNrvpVdLuZLvNWTYV3X7IoTuIspuJpBRBKUZPdPo9s7U5IUya/GxinLfbs9Gz/7n0D9rMm3T6CD5Y1SOsEfJzWeEzp74hOlwQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHNhDMlh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHNhDMlh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189D51F0089F
	for <linux-gpio@vger.kernel.org>; Tue,  6 Oct 2026 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791281810;
	bh=/yT5544sKHRC4UJIanLDlxMS/mhmwycCyd6tuBNwVOw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VHNhDMlh1OA+rNA30dbudY3rH8vebR9Wx9qabq4ztv9HecddI3IyL2Gf54ZMtQws6
	 51w+5F1mZnbP8fsgeUx0Kbcx4j5V9GZwhWFRaAoZb+2i7YQgBUosfmC8jkXsICK3a7
	 Zq/t2e1k/FOcPfJZeB0eChDmqPd8DflBR0GVgPmYA+Q1kfLD+NwCSomOQkl4rDWJw/
	 X+fFmJvdT6uIgsJApSN7U5cbeoj4hNxruosOgMISqmlz9I2+f6cn8YtMQVBF4s/jTu
	 sWiZ+0K6a//ZCrC2gqcoEuot01UkrRv2AQ3LtpJGjvcdobP8TNO45fNX56P1e1wN8y
	 uJIhuwijJCMag==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bad794b197so429838e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2026 03:16:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwK5y51q0JQl+dzQuaX4qQsueH6OHu8wlmZlnbyxGLVtmaCe7pnkCB8xt9jYwo4IAML8cNQQspNJvP4@vger.kernel.org
X-Gm-Message-State: AFq9FYKmAxP3SpaXc1zKfqLGDfdemHFBGMZ/L+feWD2YzUGinXIIiq9h
	iEJUS9kCemhFVMNFHkt3CBcas0myTi6Ac3MIacUBJ8i7zhov6DMjCi70JJMEK3NsJoPvzcNWlXR
	e0nLtlK5o6J3dkiLxDNwk7HW+LvzcYA8=
X-Received: by 2002:a05:6512:3b8a:b0:5ba:3c46:bc40 with SMTP id
 2adb3069b0e04-5bccc72009fmr448959e87.63.1791281808765; Tue, 06 Oct 2026
 03:16:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com> <20261005-gpio-mxc-cleanup-v2-9-bdc3afbb35e2@nxp.com>
In-Reply-To: <20261005-gpio-mxc-cleanup-v2-9-bdc3afbb35e2@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 6 Oct 2026 12:16:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLk_1xMmHBH-H31KoS1=FXhqnMNSC6=kwVDAN-9DbaDEzA@mail.gmail.com>
X-Gm-Features: AclHuK9V7e9CfZeeOp-0WXGtKf7q_zCnp_IeV6eED5pGDx-rwyMwOeYAwsAl9Gw
Message-ID: <CAD++jLk_1xMmHBH-H31KoS1=FXhqnMNSC6=kwVDAN-9DbaDEzA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] gpio: mxc: use BIT() macro for single-bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 4:25=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Replace open-coded '1 << n' shifts with the BIT() macro throughout
> the driver for consistency and to avoid potential signed-shift issues
> when the bit index is 31 (1 << 31 is implementation-defined for
> signed int).
>
> No functional change.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
