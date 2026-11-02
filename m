Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629478;
	b=NqMmffrBo+bPSNrdJ+zAfQ46EYa8Ivnj/l9eB2Mw/ojoD7euqRtKJDqV0bN4X+grwSKj
	 N2wXlsvMjINHW7cApYHGg3Aw5AhbePlwnsHY6QndDM53Tk1REfex4G/rskijSSdpJiL8W
	 SFc2RLx0oSUgBz2nWYsiWBi7JSIs6cVKaWbbbspOa0wS7gpUeXWYT/ui+3ElAJNXUeW1N
	 WO0TzcAjMdngWyZCRioI56IaGm6pmhGuVxCXSPtzqNg/OV1hvAOW7nAhkA+ZzN6Zmvz6K
	 I0UaBJ9Fd3+e19qhiV7ETP08YJZgUKEDsdiWljTvLSsk0xPapEG5pp+/aMmpNoeOcfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629478;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UAE+EXa2m8qZYQHjXbDMZQ7NH0V7cyRl19PP1GlhUu0=;
	b=XLh8goHUU2tCTQ9DHHfPxlrJTm6R9jD9SXufcprmVRsup6xT6sMCc441KwnajmdV54Q+
	 L0UeGo1U+o3yOlNzuiiuNXs7dcTGiVs5c7XI1PNa4fu9wvLE0HgHXpgy9112n+ADsKxNc
	 0IYjOJm2UGyQD746apQxhJi7vGVxMqj8Dni+ANxjz0ZogalZosNSFsBDtPyj8HeUPVIxD
	 EpkR5IWpyYa3RJQnTaahynVHF7MbuhSvTnPksoXHc5Pb/Qg59xGM63qcdfJ0xEcAAXrYm
	 s4w2mmsX+HuGPNdZWTmD/hjaD6o7o7VYauyL2FKNG53w8tgKLpTr/yXqgMRfIzDJzUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tp0L74ts;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531A260A381D;
	Mon,  2 Nov 2026 14:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tp0L74ts
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CDA1F00A16;
	Mon,  2 Nov 2026 14:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793629477;
	bh=UAE+EXa2m8qZYQHjXbDMZQ7NH0V7cyRl19PP1GlhUu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tp0L74tsn9ZbGinp3afTlLuPKdsUT53/tzF8WGLTz1KnqL41FhK3fDQpPTMTo+t3L
	 pWCaEEuTBt1SmDmsF83slzeXX0byZtIBB3f6decq62kGbM1rjH+xzbY2Rg0CU9A4Mz
	 BHUm1RIR7dDA3ZWuCawZxCMdtXoqwpT0FOuZ8z58=
Date: Mon, 2 Nov 2026 15:24:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: Enable PINCTRL_S32G2
Message-ID: <2026110233-unlocked-outclass-9584@gregkh>
References: <20261102141635.3768024-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102141635.3768024-1-khristineandreea.barbulescu@oss.nxp.com>

On Mon, Nov 02, 2026 at 03:16:35PM +0100, Khristine Andreea Barbulescu wrote:
> Enable the NXP S32G2 pin controller driver in the arm64 defconfig so it
> no longer requires a manual "make menuconfig" step. The symbol selects
> PINCTRL_S32CC, pulling in the common S32 pin controller support used
> across the S32G family.
> 
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7b4985b29b21..545a2b7db8a5 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -704,6 +704,7 @@ CONFIG_PINCTRL_BCM2712=y
>  CONFIG_PINCTRL_SKY1=y
>  CONFIG_PINCTRL_IMX_SCMI=y
>  CONFIG_PINCTRL_IMX91=y
> +CONFIG_PINCTRL_S32G2=y

Why?  Shouldn't the normal platform-specific defconfig work for this
instead?  what defines the arm64 defconfig to require this now for all
arm74 platforms?

thanks,

greg k-h
