From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFT PATCH] gpio: etraxfs: Fix devm_ioremap_resource return value check
Date: Fri, 17 Jul 2015 09:49:24 +0200
Message-ID: <CACRpkda7cVg48Ls2_cCMC6+--aVecvu5rJ17gzPSw2FycFF6Cw@mail.gmail.com>
References: <1436447993-24630-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1436447993-24630-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, Rabin Vincent <rabin@rab.in>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 9, 2015 at 3:19 PM, Krzysztof Kozlowski
<k.kozlowski.k@gmail.com> wrote:

> Value returned by devm_ioremap_resource() was checked for non-NULL but
> devm_ioremap_resource() returns IOMEM_ERR_PTR, not NULL. In case of
> error this could lead to dereference of ERR_PTR.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
> Fixes: d342571efea8 ("gpio: add ETRAXFS GPIO driver")
> Cc: <stable@vger.kernel.org>

Patch applied for next cycle, stripped the Fixes: and stable tags.

Yours,
Linus Walleij
