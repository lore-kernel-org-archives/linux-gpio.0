From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/2] gpio: add Technologic I2C-FPGA gpio support
Date: Fri, 19 Aug 2016 11:06:10 +0200
Message-ID: <CACRpkdYudcfdXcGi5o0EH-Tai7ZczoNLL2VrjdpGKLnuK4+Z=Q@mail.gmail.com>
References: <1471015009-5925-1-git-send-email-lucile.quirion@savoirfairelinux.com>
 <1471015009-5925-3-git-send-email-lucile.quirion@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471015009-5925-3-git-send-email-lucile.quirion@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, kernel <kernel@savoirfairelinux.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 12, 2016 at 5:16 PM, Lucile Quirion
<lucile.quirion@savoirfairelinux.com> wrote:

> This driver is generic and aims to support all Technologic Systems's
> boards embedding FPGA GPIOs with an I2C interface.
>
> This driver supports TS-4900, TS-7970, TS-7990 and TS-4100 series.
>
> Signed-off-by: Lucile Quirion <lucile.quirion@savoirfairelinux.com>

Wowsers it's *so* much prettier with regmap!

Patch applied, of course, great job on this driver Lucile!

Yours,
Linus Walleij
