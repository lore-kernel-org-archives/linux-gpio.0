From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH 27/50] pinctrl: stm32: Use devm_pinctrl_register() for
 pinctrl registration
Date: Thu, 25 Feb 2016 15:00:04 +0100
Message-ID: <CALszF6Bq4gK1bOJFVE3VAWjnX9eYpQeEVVO-_g2kv0O=iePJyA@mail.gmail.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
	<1456319775-3216-28-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-28-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, lee@kernel.org, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel@lists.infradead.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Patrice Chotard <patrice.chotard@st.com>
List-Id: linux-gpio@vger.kernel.org

2016-02-24 14:15 GMT+01:00 Laxman Dewangan <ldewangan@nvidia.com>:
> Use devm_pinctrl_register() for pin control registration.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> ---
>  drivers/pinctrl/stm32/pinctrl-stm32.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Acked-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>

Thanks!
Maxime
