From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: digicolor: add missing platform_set_drvdata() call
Date: Tue, 31 May 2016 10:31:16 +0200
Message-ID: <CACRpkdZMZvV6fYsr0Dx8Fiu-W8uYrqK92tzHkMG4BOECRbbHkA@mail.gmail.com>
References: <1464155932-25344-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464155932-25344-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Baruch Siach <baruch@tkos.co.il>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 25, 2016 at 7:58 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> gc_pinctrl_remove() calls platform_get_drvdata(), but I see neither
> platform_set_drvdata() nor dev_set_drvdata() anywhere in this driver.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied with Baruch's ACK.

Yours,
Linus Walleij
