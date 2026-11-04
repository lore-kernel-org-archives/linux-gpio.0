Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797527;
	b=kSdFgQfIFx9L7R/SGJAQi+rSpo1t9XTE2x9jMWZwXYpa9nX+Ee3+47c3fgfDnpood1jG
	 w1TDGx9LydeuK3kJubYU6cZOznT1685IBcv/vqb5R74yusp1ZRxlisG/oZYiUXe7NUKAE
	 yQD4hqm/MsccQbSPRLtn6qIPODGlEic665KR0W8lMPmqq+/8LbiRv5+hHstdRh4Qd8HlG
	 4Y5YG5UnILP9jpK4uRkr/kV2lo/cLHjkXRCrjVv7BnmP6Zc92JyExoiAwMLl381EFUyKc
	 XLMjaF3QvLZCqlipJHdQOAmZOnzfTqmLRbZ87k5pD7nQ3BBZzka58q1iA7+3AF9dpmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797527;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LPKBxmhyg89L22fIaf9IQyOx1ftYYGNVMEyFVHYOx+w=;
	b=DSpNiPHIsjCXfSBizODGn+VULNTFhbVVCoXWRxOCee2ECOH0ex9/nrClmwNZ2ZwxJVV4
	 7zuS2CNk3o4D9R7ZM9axELmnJNQbNEaJ6+uBciaZ8d0iWJQIxJuKe8sObljCfMXr69L8F
	 St40nmiYeKDW7GgJ/v5z8PRQdAvVoU5iLdSPWojt7iDzqDckkwW584Hd6otg+hOFnX/Bg
	 R5Y19bPz/F53YX8k8Bp2M/MfqjPda7QM1+iKSlbQMsPhfyDtDmLFu12ftt+bJGKPmR83Q
	 bWZaI4r9MzaQ8DSslXjoiB2uOukLT2YOeWDFnWjtAzRLc/lPif0XLYQdeFmY/U0lM4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WLqSLvYw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA36606A336
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WLqSLvYw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3FF71F00ADC
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797525;
	bh=LPKBxmhyg89L22fIaf9IQyOx1ftYYGNVMEyFVHYOx+w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WLqSLvYwRuBRb2z2uy097jLLlVZenw1O0Ud3+HdLZPMW2W/yzMsw4PoGFqDOIDUwu
	 bYeTnemOekwxxrWyrcu3N1/2zGODfTWspcTCv2AIYLDuBbLuQUV8lPQQYsoeeaXIZo
	 s9pxZA4n1vrlJHdLmklh37T+D8AiUXYc4GVoPjPUCjjcMlonowAys/U2PRW90Kfnup
	 tuf9hIDTCB7oNt5tvVL+asbU98CD4ARrQUGqF8Nf8SlgNeuq/Vl88CJ3YEo52TiM8A
	 criMClDoEAWjWwpB9F04k/fO5WKv51xfXn5g8+JQfVgeQbC0d/BD2BPOItMFG3+Cjh
	 JM4GUMBVSYcnA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso656445e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:05:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx+ovurRpYA83jeaM0N7wiloR2Rae/o4zMUE/Slt2Yt8F3IkyfMwuJF/5dZBVxki1vUka4SI5fE3hP3@vger.kernel.org
X-Gm-Message-State: APuU4Z+/3XNsXPrWnZo02uAIMR2chIqcmtmkRQiSDHBiLibd6EoV8Tx4
	QqMrdFx800/hSsSpo6Gh3qdENaD8Z6olzJehqU7DMjcDZyJGDdFhWSUOG6X/umFh49gS9PvYx5Z
	4dnYRxz5x7lyAODJd5o+T0lswfnNNiz4=
X-Received: by 2002:a05:6512:3a89:b0:5bc:c446:760c with SMTP id
 2adb3069b0e04-5bfd956f3c7mr5830020e87.48.1793797524594; Wed, 04 Nov 2026
 05:05:24 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com> <20261022-add-board-ok3572-c-v1-6-0b0fd85a31ee@qq.com>
In-Reply-To: <20261022-add-board-ok3572-c-v1-6-0b0fd85a31ee@qq.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:05:11 +0100
X-Gmail-Original-Message-ID: <CAD++jLkfnsnqr9DeJG1UY1BNPmXV=L1fh0o1fRgq2N70k3Aq2A@mail.gmail.com>
X-Gm-Features: AclHuK_mv5t_ofBXXvFmTtsscxk8ZZZWMu9yfbYuWEEuKyuLUDpVdyNQz1Is1sQ
Message-ID: <CAD++jLkfnsnqr9DeJG1UY1BNPmXV=L1fh0o1fRgq2N70k3Aq2A@mail.gmail.com>
Subject: Re: [PATCH 06/27] dt-bindings: gpio: rockchip: Add RK3572 GPIO banks
To: 1579567540@qq.com
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Lee Jones <lee@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Wu <david.wu@rock-chips.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mfd@lists.linux.dev, linux-gpio@vger.kernel.org, netdev@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 6:12=E2=80=AFPM Cunhao Lu via B4 Relay
<devnull+1579567540.qq.com@kernel.org> wrote:

> From: Cunhao Lu <1579567540@qq.com>
>
> RK3572 GPIO banks have four parent interrupts and a separate debounce
> clock.
>
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Perhaps Bartosz can just apply this one patch to shrink the series?

Yours,
Linus Walleij
