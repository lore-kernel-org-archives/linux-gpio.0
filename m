From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/5] Add initial pinctrl support for MT6797 SoC
Date: Tue, 16 Oct 2018 10:36:56 +0200
Message-ID: <CACRpkdbOpfDMGhUFAwXUX=-fhGNfhvQq6NgtFtAoTsu8Vo+BQg@mail.gmail.com>
References: <20181008191411.32555-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008191411.32555-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 8, 2018 at 9:14 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> This patchset adds initial pinctrl support for Mediatek MT6797 SoC.
> The pinctrl driver is based on the vendor binding as like MT6765 and
> implements only GPIO and pinmux functionalities.
>
> The devicetree binding doc is not added because it does not exist for
> MT6765 and I'm not sure about the structure of it.
>
> This patchset has been tested on 96Boards MediatekX20 development board.

I'd be delighted to merge the pin control bindings and driver
as soon as I have an OK from Sean Wang.

Yours,
Linus Walleij
