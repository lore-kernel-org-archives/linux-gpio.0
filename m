From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] pinctrl: mediatek: pinctrl-mtk-common-v2: Make eint_m u16
Date: Mon, 15 Oct 2018 16:18:00 +0200
Message-ID: <CACRpkdZAem09Qb_bUBk+QA5ngdjGTxqLxTtMMsSnO7rTME1Njw@mail.gmail.com>
References: <20181008191411.32555-1-manivannan.sadhasivam@linaro.org> <20181008191411.32555-5-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008191411.32555-5-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 8, 2018 at 9:14 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> For SoC's which lacks EINT support, U16_MAX is assigned to both eint_m
> and eint_n through macro NO_EINT_SUPPORT. This will generate integer
> overflow warning because eint_m is declared as u8 type. Hence modify
> the eint_m type to u16.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied with Matthias' review tag, thanks!

Yours,
Linus Walleij
