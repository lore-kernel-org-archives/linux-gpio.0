From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: of: remove unnecessary variable in of_get_gpio_hog()
Date: Wed, 15 Jul 2015 11:49:00 +0200
Message-ID: <CACRpkdZTvPWXs1kUykfuQqvtH+gHadH_S4hoDTzZonLjRTz-Jw@mail.gmail.com>
References: <1436835704-6371-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436835704-6371-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 14, 2015 at 3:01 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The variable "desc" is only used for storing the return value at the
> end of the function.  It is unneeded.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Yours,
Linus Walleij
