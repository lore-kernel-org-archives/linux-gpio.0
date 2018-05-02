From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH][next] pinctrl: actions: Fix Kconfig dependency and help text
Date: Wed, 2 May 2018 13:49:18 +0200
Message-ID: <CACRpkdbvMSJf5C8cymsRnQts9AX3VrDbSszL0ak6=JcYP7q1NA@mail.gmail.com>
References: <20180501030047.305-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180501030047.305-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 1, 2018 at 5:00 AM, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> 1. Fix Kconfig dependency for Actions Semi S900 pinctrl driver which
> generates below warning in x86:
>
> WARNING: unmet direct dependencies detected for PINCTRL_OWL
>   Depends on [n]: PINCTRL [=y] && (ARCH_ACTIONS || COMPILE_TEST [=n]) && OF [=n]
>   Selected by [y]:
>   - PINCTRL_S900 [=y] && PINCTRL [=y]
>
> 2. Add help text for OWL pinctrl driver
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied with Randy's tags.

Yours,
Linus Walleij
