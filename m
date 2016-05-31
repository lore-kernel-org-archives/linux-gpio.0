From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: return -ENOMEM instead of -EINVAL for
 kasprintf() failure
Date: Tue, 31 May 2016 10:33:24 +0200
Message-ID: <CACRpkdZ97=TuKLa-UOSfCiCGdK7JAkb_GH8g_RTU_-yeh8bwhg@mail.gmail.com>
References: <1464174853-9297-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464174853-9297-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 25, 2016 at 1:14 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> -ENOMEM is more suitable error code because kasprintf() fails
> in case of memory shortage.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Obviously correct.

Patch applied.

Yours,
Linus Walleij
