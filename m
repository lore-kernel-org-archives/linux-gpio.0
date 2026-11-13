Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565085;
	b=3lAS5UUVyQjVftsw0WLzOZsjpNRm22A6WqvreIRcxNfsLtvt0+VQwXa6J24An1M61Jxr
	 5kHUA+dfNJgvXml3k9cb4JTLnhaN+ux98Bg30P/HyslCopbmyS+vw8Ln5CTc6ENa3PF89
	 ckoTC/Krz1zxYVm32qtJr1c7s9gMHv9+EDvWO+hqhkvD3bM+6LH6X4K8d4LwSuk+VlOPw
	 s0pWo3v2RBQYnCEqpRTk6yT93cd3x+agrMfBcRwOriWR1NgxJH1WVgyCWs5rke4i6h3m2
	 cP3eR+f26gScAK8YyLilGLVzFSoLKwVamKoEiqVqPizHGhJ4EbxHpkWR5KtgRSPkfWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565085;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oWpj+fMcU0ldZMemXXF2GwJUPPqvOroaTzblSr6zsuI=;
	b=oS9oXo3r5fLjNERFAa7wb+s/+O1bh0hZtmU4OIQgS2w/BzhP8yNv0Tlmv7vKUmUKLkwJ
	 1FcRLEnixeGbGlJs9cpKDkTAXyCOKO2Z0PDG2GZmJ1kL0xx/Ap6wAFLRAoOPWqQodnvKI
	 /3EaciCFK5nZ4FSYmAJVqnWaQxddR9Q6JUautk2RIEW0qWQrQgRr3rKgOUff1+v9ZJ9ei
	 06zokDgyb+8zIcPOdoXw3wMZga5j7to8Y6Y+USsgSVMmLY2DBEnGfo8pV1frDorHjlYt2
	 rbF5SobzDixwfEyg24z4TvOlmvWHXfn/tLiI8thrtfw4ICMxJwtnY4Hn3pM+VLMV/hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IEGnZ9s7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C9360A2607
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IEGnZ9s7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840171F000CF
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565085;
	bh=oWpj+fMcU0ldZMemXXF2GwJUPPqvOroaTzblSr6zsuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IEGnZ9s71CxuM1FatGWVZ7MjS/Ksms7wsHnU0cCjvI8yD6ri1brzQWsOTKwvf9scE
	 1x6Ik/hWXwA68bNMOJ2qk0IELCj40VL2vurKZg2CBldMMMeZzCnayO4J2Gnj0Az3+8
	 sLcpEApwpShOgzgYGnsC5zQ/BTQA1pPyK8jNvC4x12yPuP5UtkKRgIIy+9jLBgNocB
	 L9MMZWBtHuoQNREggu7MnqN8y/aUPyWkH6bNpbqXdfg0nDqFJKcg78yywZyRRLPCde
	 WmTYkuNtdC17dgd1l0oq+eyfgjAcECX5WMpRB1C91OhxyakR/QzDsp75gUIpaHPi3l
	 K27CaA5AGXzPw==
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-702dedeb70dso1000186eaf.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 02:18:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFFYykVl2KcuzA20T6z2TEXGHyJA+U+JN/25vAKgU5H1/KEN0g0iF6MYASZTiERa5PudXutXe1YjBsd@vger.kernel.org
X-Gm-Message-State: APuU4Z/0ERxME1qQ/vc7V34uyqcHi08m1LB7Ti3PPvZCM1y9bc4lZrOx
	D+BDvLTxqQwOtcCV1ufB2tXJMVu2mZLWTdwk5D7q3ENMat6ohC0QYICbM4Uyp0jpZGvklG2KxQZ
	xMi9YcGfFTHVYUUWmPr9o+q5n2gEmXKg=
X-Received: by 2002:a05:6820:2228:b0:70a:1787:2696 with SMTP id
 006d021491bc7-71ab50522aamr1246436eaf.61.1794565084106; Fri, 13 Nov 2026
 02:18:04 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com> <20261022-add-board-ok3572-c-v1-8-0b0fd85a31ee@qq.com>
In-Reply-To: <20261022-add-board-ok3572-c-v1-8-0b0fd85a31ee@qq.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:17:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLkJsYtjKOF7wpiUqSLoBuiOe+C5sMEQo7XZ1dW773+pJQ@mail.gmail.com>
X-Gm-Features: AclHuK9FczXasoO8qxg9IxepytTJahNxlbbuShGYzvO1iLyvCzMkO5H7q2dWjZE
Message-ID: <CAD++jLkJsYtjKOF7wpiUqSLoBuiOe+C5sMEQo7XZ1dW773+pJQ@mail.gmail.com>
Subject: Re: [PATCH 08/27] pinctrl: rockchip: Add RK3572 support
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
> Support RK3572 pinmux, bias, drive-strength, and Schmitt controls.
> Enable input buffers during mux changes for the RGMII receive clocks.
>
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

This patch 8/27 applied to the pinctrl tree.

Yours,
Linus Walleij
