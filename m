Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072185;
	b=CnoNjyne8G+5x/hIZNwJJjTHrIHAGwKIy0Qcw9h/EjNSR4WOFS3ll2KOAckU9mNpuPyZ
	 OtvSUmJZeDUVysflrp3rvHj0Ovc8GEZ1bN+MZZ8KfgO8mS4LT7VRugks2ubEKiaj9inK6
	 Z5cE+MzYeptWkwLXPuCsJaglS5G4IaFfXnG6P7yQknyJ0p/aw0EHWBU066g2rbxJ+yJVV
	 iFuTrNSqYvy+06kdBlhB7Euiv87bpfpnLNPZm+jQsRXYWARtS17bP2k+lYTUNaD2ABORb
	 bpZNUWNwbpZip6clAQXLevtjaC0i5cG19ycwe45MbutFOXSnvasjREYetsRrsO5T0iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072185;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Md4Ur9HQ90Z2syVNPgkLIza02Wg2A5THNK5BpayfC4g=;
	b=SY8ypadq5MStuI2VWiY2ZcLtwaQ4HKcbGrMlgMzYftyyNU8nGe1UMQTSKLPKXZci0TVK
	 q+fXSZhezyMAd+HN/OyWt1Oh8QQ+cpV/hDO3jXIv+7YSqkVX7I6vtdsAw5ClvsJCz62tf
	 RbVvAkfd4oU8lkadn+YAwHYsC+1f+PCi7OUMB8Hic3DadiyHZNnpY7gukiPMutEhAbm2A
	 hW0484KKPqj83m5LJXgWE0grQLkpcIg6Ri3sGW0/wOfzG7O3G4nUeMimJBVbiN5+Ge2zc
	 K0lnblJF+xHj1cCtf5kmLHOJtDL8QrmFIH8ZOXdIy5g6o61AV1ea5cv5zvPad3ba8ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YUqmaZkx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8430606A324;
	Thu, 19 Nov 2026 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YUqmaZkx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682421F000C4;
	Thu, 19 Nov 2026 07:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795072185;
	bh=Md4Ur9HQ90Z2syVNPgkLIza02Wg2A5THNK5BpayfC4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YUqmaZkx7TNHSa6byExLkPkPsmD8II610KHTjAlWVrOBpmmj/yvSUkCQhgOB+R03d
	 F8mCKIzbZpU6OhJtkRhiuJwFC4K45JId3/bFYc4Z+BkapZn0GBaS//slMS+zXStd7t
	 T4Z81F4vU/eL2NZDm4IdJ3cCKJGASetThLlJJ7UFtdoX2nD6Ern13ftpHcepE+uOn4
	 m4g+n1KVwY6VKV4GB/fLHp8uUaxzOY5BFX3gFSQR2JH7AswSH7tvq+/xfTXKGU/E6D
	 zwxunbeKtoucdqoKV+G4lP+ryhc9bTe2p/prCq1rwSHWEK4Qi+k2GBadr1J+YDVY/C
	 NuP0SBbOk75Lg==
Message-ID: <sashiko-outbox-222543@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] pinctrl: tegra: Add support for Tegra268
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prateek Agarwal" <praagarwal@nvidia.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119065249.2425224-4-praagarwal@nvidia.com>
References: <20261119065249.2425224-1-praagarwal@nvidia.com>
 <20261119065249.2425224-4-praagarwal@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 07:09:45 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] pinctrl: tegra: PIN_PINGROUP_ENTRY_Y hardcodes rcv_sel_bit to
  -1 on Tegra268
--

commit 504e6b9e2c6aa5bbd3e59fd78e4ff51426a7e008
Author: Prathamesh Shete <pshete@nvidia.com>

pinctrl: tegra: Add support for Tegra268

This commit adds the pinctrl driver for NVIDIA Tegra268 supporting the MAIN,
AON, and UPHY pin controllers.

> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra268.c b/drivers/pinctrl/t=
egra/pinctrl-tegra268.c
> new file mode 100644
> index 0000000000000..19f591061ec42
> --- /dev/null
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra268.c

[ ... ]

> +#define PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_io_hv, e_lpbk, e_input,	\
> +				e_lpdr, e_pbias_buf, gpio_sfio_sel,	\
> +				schmitt_b)				\
> +		.mux_reg =3D PINGROUP_REG_Y(r),			\
> +		.lpmd_bit =3D -1,					\
> +		.lock_bit =3D -1,					\
> +		.hsm_bit =3D -1,					\
> +		.odrain_bit =3D -1,				\
> +		.ioreset_bit =3D -1,				\
> +		.rcv_sel_bit =3D -1,				\

[Severity: Medium]
Should PIN_PINGROUP_ENTRY_Y set .rcv_sel_bit =3D e_io_hv instead of -1?

Every PINGROUP entry passes bit 5 for e_io_hv, and cfg_params[] in
drivers/pinctrl/tegra/pinctrl-tegra.c maps "nvidia,io-hv" to
TEGRA_PINCONF_PARAM_RCV_SEL, which tegra_pinconf_reg() resolves via
g->rcv_sel_bit.  Leaving .rcv_sel_bit hardcoded to -1 causes
tegra_pinconf_reg() to return -ENOTSUPP whenever a Device Tree uses
nvidia,io-hv.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119065249.2425=
224-1-praagarwal@nvidia.com?part=3D3
