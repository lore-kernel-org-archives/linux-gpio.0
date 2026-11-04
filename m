Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799936;
	b=5RP1yB6CcMMmqO08EzACR+KmIAekytFFkUizJd4etz7vzFt2Y8rmGCIY3p7ijYWj7tpy
	 SLWH/0ZYB2rnhVn33wRGuFgOtUJYi7qmcdsgR8mQVS4eUcfcnZBWPMUGaLnFHHRMTXaNt
	 Eu6Qp0MH/eV9LrLssQporkS39mZo+VTe6ZRKy0r9hbLfWtYpiL1b59+lFF4SPhdLzpMkV
	 5KFwURr8erfv2nPl48RgZFl0b30TxeKR0xPTqJERVfZkBKXyp5Ell+XvUBsnN9lFXRIZ0
	 uZVy5b7sASuVCSKGNlNkJeKo9x3q40JPobMHJW2KjTA2E8DNFV3TKSm5hjGrOk7N/uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799936;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pZa1DyQ5dhNm7IcWztDUNPVGU8LXVDzTyG5czYuorX4=;
	b=Gk4PwXGBEtlxeG9lnezaS9ftrHXSwU+3TavEPf3ZivKTQyWGkUYhhUQJsBuAczXWnQu/
	 9RbN2PSOF4FofxaFcOL42AKcIyhT41pyrllLBrB1PuCA+D/b+InrdTPy62gG71ciUYS8n
	 grmA0GpOQ76yz7SaqMc4VhsXt4YDwVhvu0ZHxmPcm4/L/fzX/oRePNx8ZVHNguhHS+V5W
	 Li1iYb0N5GGJfBKz45dxqrs8nM0o8f/0891sIG+RQyACGtEwCmkWrg2GedaQpreI2hA4r
	 TNrLWcqfzV+XFljroCHQYlWFTXr+Yuba1vJHJ3Odx22I0OUZGZGeNxfuBVIme07l8vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Lu+/V23W";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9AD606A332
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lu+/V23W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A536B1F00A1C
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799935;
	bh=pZa1DyQ5dhNm7IcWztDUNPVGU8LXVDzTyG5czYuorX4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Lu+/V23WSycXM249y8TFrnUl6pnNNAczyEkfJCPCcFSEDGnHvAN7R47uN0Rm5YOlb
	 ksG0DWFJDoGQ+XKsxZoHcJhImNa1vUI5mxCJtznQwwm/t4wIw5e0tI3Yg9k/G5Q2L4
	 fFOeO1onHFqwKzLY6BOr+KyXDJBhmwRRPEGZsgexcP7HEkhp7/CMW3ntJanVhf1YZo
	 5WyloPwOjAsMwCQDPkAohS4CsCRQgv2FQ37+rA546fb0XUaQ/t5gQkWVarjo16xSYG
	 5NARaUAeW/UeaP+rLZbakxwAbDsZ/H+MwVTMzvs+TyERdbiaZITZCeOw5ej/Jq7sIA
	 PvV9EmRDWCvEw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bccecba199so591002e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:45:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzmA9xcNRXwIxeUGUxpzDnezXLyBPwGnLumyw7aozBeqbcqkeQPPaup9IGB511OQ8XW40wIbduEcG4R@vger.kernel.org
X-Gm-Message-State: APuU4Z9MBF+mKeXXCxMMCYQR6R+xuW69L0pRdq3n1oRwT7dsp+909jVo
	j0auUUyr0qa88Xi4RYk/yRAxiC8fW48v28G3kRIGsp3S/KiFBigFUWFqYdv8BOnpostU01d/IaX
	4qg8ReDAO7Ij+u/wEwF2f/MjcEm8zzyQ=
X-Received: by 2002:a05:6512:3089:b0:5bf:f559:2d10 with SMTP id
 2adb3069b0e04-5bff5592d49mr943044e87.63.1793799934435; Wed, 04 Nov 2026
 05:45:34 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026040230.22338-1-xiaoleiwangxiaolei@gmail.com>
In-Reply-To: <20261026040230.22338-1-xiaoleiwangxiaolei@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:45:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLk9BUeA6KEiER16ZEemBkV_k_EdUDmbEf=DLjbSsyO=5Q@mail.gmail.com>
X-Gm-Features: AclHuK9G39re6JxrJ1z-ZGqu808jbf6f0YNR9rG3WzY_Xw8qXMct9UAID3GD4J8
Message-ID: <CAD++jLk9BUeA6KEiER16ZEemBkV_k_EdUDmbEf=DLjbSsyO=5Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: scmi: replace custom dt_free_map with pinctrl_utils_free_map
To: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
Cc: aisheng.dong@nxp.com, festevam@gmail.com, Frank.Li@nxp.com, 
	ping.bai@nxp.com, kernel@pengutronix.de, s32@nxp.com, s.hauer@pengutronix.de, 
	sudeep.holla@kernel.org, cristian.marussi@arm.com, peng.fan@nxp.com, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 5:02=E2=80=AFAM Xiaolei Wang
<xiaoleiwangxiaolei@gmail.com> wrote:

> From: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>
>
> pinctrl_scmi_imx_dt_node_to_map() kmemdup_array()s the pinctrl configs
> of every pin into map[i].data.configs.configs, but the driver's own
> pinctrl_scmi_imx_dt_free_map() only frees the map array itself. The
> pinctrl core releases maps through pinctrl_dt_free_maps(), which calls
> dt_free_map(); the duplicated configs are therefore never freed and leak
> every time the DT node is parsed, e.g. on each (deferred) probe attempt.
>
> Replace the custom dt_free_map with the core helper
> pinctrl_utils_free_map(), which frees the configs of each
> PIN_MAP_TYPE_CONFIGS_* map before freeing the map itself. Its
> signature matches pinctrl_ops.dt_free_map(), so the driver-specific
> implementation can be dropped entirely.
>
> Detected with kmemleak on an i.MX95 board (FRDM-IMX95).
>
> Fixes: b755521fd6eb ("pinctrl: imx: support SCMI pinctrl protocol for i.M=
X95")
> Cc: stable@vger.kernel.org

No way I'm sending that to stable, it's no regression.

> Signed-off-by: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>

Patch applied as a nonurgent fix.

Yours,
Linus Walleij
