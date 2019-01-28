From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: sirf: drop pointless static qualifier in sirfsoc_gpio_probe
Date: Mon, 28 Jan 2019 14:43:41 +0100
Message-ID: <CACRpkdb0V5e5=OgaFe=jPubEV-JaDNpEGNjE24SjZAAuEtMweQ@mail.gmail.com>
References: <20190123084140.16524-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123084140.16524-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: Barry Song <baohua@kernel.org>, Kees Cook <keescook@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 23, 2019 at 9:42 AM YueHaibing <yuehaibing@huawei.com> wrote:

> There is no need to have the 'sgpio' variable static since new
> value always be assigned before use it.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

I haven't heard from the SirfSoC people in some time, I wonder
if they still actively maintain this file?

Yours,
Linus Walleij
