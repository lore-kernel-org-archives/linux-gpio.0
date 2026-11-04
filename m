Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796882;
	b=dqMopq5p3+9Xjk1MgaurWebuWfnG9ZEgZI8pJbwiGGfhvd7o9yW4yndU6aUJ3EM4tN5z
	 AKqFdNPv3dxhS27LQlglZoPvzHgndoxXrMf76BUmd85LVQhF8iwiPH696U1yLAaOEcgPU
	 WPjFqtxj9lmxhsx/NE9f7pN1R3jVBXy1qOnRXlYu9X8FkszFrx50yXRjDT+JbgPAjXQ7j
	 ddUqKfuKXFr0hlwXColPkqWyRSBRGCiEPQ5fZ0bd72pFBFGzW9X1QwuKou4wrEM40FcSm
	 9LjXdiSSZNamtezHvZzacJ0rDdE+MHqje1vjCbcO3WOTVat0lOhGichFJF4r1/RtJyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796882;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c8OLoXUADxmTIhb1ARQ3kSmrgr4mjHrNRuEWZTw6vgM=;
	b=otLeMBhLdRPQ5YzRdxnhVlka2ea0XdxymamfGGu1+U3ps5kT7Qb2o7gDsrFAO/0VUPlU
	 GJR4DDML1i+vmdIulO9n3Tsa54/f1kBioOfISrVmYBOhsCECQ4FGmdmSQ4E4Y3IBB2ynV
	 74v/bzqP6cIxXv0yieFW1uO0wmcIwqwb9at2cndVDTIh8cha0MCH47h3kLzGjJCbpKf0O
	 wuas2gFjxjKDlqJcvdzm1aYSYAeYRQ2H1lorh2aquIXU9Ix4uYSqma81CsbwbH6BLa73B
	 YS+hu0HbEfsGjy4NoJPsNZnEcQRUg+3Hrz/FCLWXtFGJP4nrSV0HBWuIt4ZkKPwqc/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mQtWwU57;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6DC606A328
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mQtWwU57
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217651F0093A
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793796882;
	bh=c8OLoXUADxmTIhb1ARQ3kSmrgr4mjHrNRuEWZTw6vgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mQtWwU570HRWwVBIJsn0PDSTB3JR5ujGhAe3RwRSf4gp7sIoS9iNOx3wVDA9Cjldw
	 SEWFm76qn4Xwfw0gM2tG+GU07r6txv7NuVFVkSxAG1Bjms3/qV+lkaQIIhken3m41h
	 pLpGhKUjsNY7Xkja+NvFM1x7ZGoBEo1QvJhq+6+39cNMABSLfWudR3ThE3X1LIM+EP
	 FBkddQToQZr8ebcdnPk+9hfpC0LUy2rtgxh3B7i7mQNE2cD9dW5bIF42CvrV8B5J4f
	 zG2pQzMvlFuBtEtyHGK109W6UZWlkYSNgi2i1CNBxXs2IXKIPD/F/20J+PHsWRd3fr
	 xHvn4l9pQYs7g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso438115e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 04:54:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwxWSnPiRzLStYyGKVpy+trt8uPVlNXbwfBEKhCtBnpB0OwU/Yq0fidYKZ5fIWEYsqi5j4OzbJmznLo@vger.kernel.org
X-Gm-Message-State: APuU4Z/BG2YpIB90IOrpXPM+9oe3YPv0RHqLHFPQx99kzZUmNSWx04ie
	CiZWOdXUyUbQBQRBWbP+Mp3sgsNuu5tSTfW4GZQfk5Oh8qQJ2ERXivvrr7uPcp+nqzc198sZrXS
	BIzf+7qygNH5rwWxfnGOIUhmRP1BqH98=
X-Received: by 2002:a05:6512:3b0e:b0:5bf:b5a1:390d with SMTP id
 2adb3069b0e04-5bfd9569843mr5461686e87.27.1793796880916; Wed, 04 Nov 2026
 04:54:40 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
In-Reply-To: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 13:54:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLno_ViL5X7+NLvpS5EQObXR9UpsphHH37iSKumDU76_SA@mail.gmail.com>
X-Gm-Features: AclHuK9G2TThs1q916LoUpjeeYNp5qScvCLIPbgAZ1ECJyTzREIgJY25tvkfh9c
Message-ID: <CAD++jLno_ViL5X7+NLvpS5EQObXR9UpsphHH37iSKumDU76_SA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Use of_device_id match table for per-SoC data
To: joy.zou@oss.nxp.com
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Ye Li <ye.li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 1:05=E2=80=AFPM <joy.zou@oss.nxp.com> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the hardcoded of_machine_is_compatible() if-else chain and the
> static string allowlist with a proper of_device_id match table carrying
> per-SoC data via the .data field.
>
> This eliminates the static local variable anti-pattern for daisy_off
> (lazy-initialized, shared across instances) and adopts the idiomatic
> kernel of_machine_get_match_data() APIs.
>
> A new pinctrl_scmi_imx_data struct captures the daisy register offset
> for future extensibility when new SoCs may not use register-offset based
> daisy configuration.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
> Replace the hardcoded of_machine_is_compatible() if-else chain and the
> static string allowlist with an of_device_id match table that carries the
> per-SoC daisy register offset in its .data field.
>
> This drops the lazily-initialized "static uint32_t daisy_off" local and
> lets probe do the compatible match and per-SoC data lookup in one step
> via of_machine_get_match_data().
>
> No functional change intended.
>
> Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>

I don't know if this is the latest version of the patch... if it is,
look into Fabio's review comment, rebase on v7.4-rc1 and resend,
thanks!

Yours,
Linus Walleij
