From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 22/50] pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration
Date: Fri, 26 Feb 2016 23:25:34 +0100
Message-ID: <8760xbun1d.fsf@belgarion.home>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
	<1456319775-3216-23-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-23-git-send-email-ldewangan@nvidia.com> (Laxman
	Dewangan's message of "Wed, 24 Feb 2016 18:45:47 +0530")
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Laxman Dewangan <ldewangan@nvidia.com> writes:

> Use devm_pinctrl_register() for pin control registration and clean
> the error path.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.
