From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 09/17] pinctrl: uniphier: support pin configuration in
 sparse pin space
Date: Tue, 31 May 2016 12:47:58 +0200
Message-ID: <CACRpkdYw=YCT6xtEdxXfxfSX-OWoGfzv2vbY5_+gKQ_uoDsjFA@mail.gmail.com>
References: <1464681923-7469-1-git-send-email-yamada.masahiro@socionext.com>
	<1464681923-7469-10-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464681923-7469-10-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 31, 2016 at 10:05 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Unfortunately, the pin number of the new SoC, PH1-LD11, is not
> contiguous.  The base frame work must be adjusted to support the new
> SoC pinctrl driver.  The pin_desc_get() exploits radix-tree for pin
> look-up, so it works more efficiently with sparse pin space.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
