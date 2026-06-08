Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B04133064A
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929950; cv=none; b=ZkcuIwTU9xE9vzpnAsLVjuBqp7wu6j4yr+nYbT7mhnHVVGmvSy3J3sqBJHdEf072iSGpTCbI807QYH++D8Q5Ayctu/qWlZG+vUQ5+MsGAVm2Sqim78fMU6yzimF0Adp6STmnlCI87j59QJyQlltX2g55qD7GI6H9/SYytdp3fI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929950; c=relaxed/simple;
	bh=zioqbZ1fK6bIcIuMYSHWyT6ST2+bVeMRMT3lKy/lybg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hKBdN1B6z7r8AOnFovJzGv2v1JCmp4Q05uyES3p5G0XpMuJB29vDJ0wf/jdJWMbt77d0ou6pTHEMd2JK+MhYXzxpp/xUl98+udJQOdEMFZUd+/vLhriJzVY+VjklniKRKy2Ljy7fKbFcXk4o7cpoZwSXnHZYbFOjzo7HRYyYMWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0UML/X2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0UML/X2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06C41F00893
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929948;
	bh=C1ZKRAk+v5D8Fo7M4WzkBwmvVcnvQs40wfLDkqAg74g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=J0UML/X22q0xYMiMs+IBBC3yMy6GhyTPNIY4OZORGxP3k9qC0xR7U9KjrkcgiJetY
	 ppDrnKbYUHR0grKD/gtHfBbaWHV1f/29NHjEKZMuMPD98M33kaT7QPqS1QocaMPlsk
	 4k/9g7BpFMuOpjwL968hRyx/ICOjJTZwJcFq7LYdh/Lh6D9HZCJp7Lxq5CNnQlOy8O
	 6OGE3VVWaK/YgCp+HHGMmCWnUxQszo2zkKOx11B85al9ynxEkyHuqf67wH8UPlISJa
	 qQnUPotuOs2PsXyOjwH4ciHg3mvCDuaLh7Ado8PwqrJrYo49GYvMvR0evlD4MojljK
	 9MwvUdEYYbiDw==
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-137dd523634so6863108c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:45:48 -0700 (PDT)
X-Gm-Message-State: AOJu0YwNDxHW1efJKWVy/XspPN4Dh+5GNPi0okxV9NK8NejrRIiyW28A
	4UNW3CIokC15qDlxLae691FdxmrhTY2GWqymJqn/RVT9SaFL9qf1i2CRpRUGmmmj0I3z7C7lNkh
	w89cNppq2NUqhFStOz+hOaJ8dtfvWZBB3fqswsqpCEQ==
X-Received: by 2002:a05:7022:43a9:b0:137:f58c:3cae with SMTP id
 a92af1059eb24-138066b75femr7099909c88.1.1780929948188; Mon, 08 Jun 2026
 07:45:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:45:44 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:45:44 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260603055347.66845-19-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com> <20260603055347.66845-19-changhuang.liang@starfivetech.com>
Date: Mon, 8 Jun 2026 07:45:44 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md1z52A_JzMG=3Ce5nN-HMvwH0TO=t2jEqC3kdCQK8EwA@mail.gmail.com>
X-Gm-Features: AVVi8CfaVNjKqTQIxP4uDH7miQgJxqhIv2ueyrqcnqutmjGTDV0cuJZ3ZuCNFUc
Message-ID: <CAMRc=Md1z52A_JzMG=3Ce5nN-HMvwH0TO=t2jEqC3kdCQK8EwA@mail.gmail.com>
Subject: Re: [PATCH v3 18/21] pinctrl: starfive: Add StarFive JHB100 per2pok
 controller driver
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 07:53:44 +0200, Changhuang Liang
<changhuang.liang@starfivetech.com> said:
> Add pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK
> (per2pok) pinctrl controller.
>
> Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/pinctrl/starfive/Kconfig              | 12 +++
>  drivers/pinctrl/starfive/Makefile             |  1 +
>  .../pinctrl-starfive-jhb100-per2pok.c         | 97 +++++++++++++++++++
>  3 files changed, 110 insertions(+)
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
>
> diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
> index edc3b6d9c8d7..bf5915e0a5f2 100644
> --- a/drivers/pinctrl/starfive/Kconfig
> +++ b/drivers/pinctrl/starfive/Kconfig
> @@ -91,6 +91,18 @@ config PINCTRL_STARFIVE_JHB100_PER2
>  	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
>  	  and interrupts on input changes.
>
> +config PINCTRL_STARFIVE_JHB100_PER2POK
> +	tristate "StarFive JHB100 SoC Peripheral-2 Power OK pinctrl and GPIO driver"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	depends on OF

I don't see any real dependency on CONFIG_OF here, am I missing something? The
OF ID matching is available even with !CONFIG_OF.

Same elsewhere.

Bart
