From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: artpec6: Make two functions static
Date: Thu, 4 Apr 2019 22:26:14 +0700
Message-ID: <CACRpkdYpGF+TqAZjOicoqRuuzbCDFTPAHeE2iT6EkEuF81xFVA@mail.gmail.com>
References: <20190321150909.3576-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321150909.3576-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yue Haibing <yuehaibing@huawei.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-kernel@axis.com
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 21, 2019 at 10:09 PM Yue Haibing <yuehaibing@huawei.com> wrote:

> From: YueHaibing <yuehaibing@huawei.com>
>
> Fix sparse warnings:
>
> drivers/pinctrl/pinctrl-artpec6.c:691:5: warning:
>  symbol 'artpec6_pmx_enable' was not declared. Should it be static?
> drivers/pinctrl/pinctrl-artpec6.c:705:6: warning:
>  symbol 'artpec6_pmx_disable' was not declared. Should it be static?
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
