From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] pinctrl: imx: use generic pinctrl helpers
Date: Mon, 2 Jan 2017 22:43:43 +0100
Message-ID: <CACRpkdYOq_v2N7q3P1C=Q2u8K1Jdhjem_Ry+v2r9f+ik_gKGqg@mail.gmail.com>
References: <20170102182022.2047-1-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170102182022.2047-1-gary.bisson@boundarydevices.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, ext Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 2, 2017 at 7:20 PM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> This series is a follow-up to Linus suggestion to use the generic helpers
> introduced by Tony [1].
>
> Mainly I've used the generic functions in pinctrl_ops and pinmux_ops and
> switched to the generic group/function_desc structures instead of the
> imx-specific one that didn't bring anything special.

Awesome job. Really nice!

> However I couldn't use the 'add' functions to add elements since the
> parsing is done at probe time in its own way. So I've kept the
> radix_insert functions. This could be modified in the future though.

Let's see if Tony has some ideas. We already save a bunch of
code by this which is very nice.

Yours,
Linus Walleij
