From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: of: remove unnecessary variable in of_get_gpio_hog()
Date: Mon, 13 Jul 2015 23:27:36 +0900
Message-ID: <CAAVeFuKJSUVv-pvy-zHHTPGyKV16UwejXK9SJWzoitw_oDrnmg@mail.gmail.com>
References: <1435825632-16103-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435825632-16103-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 2, 2015 at 5:27 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> The variable "desc" is only used for storing the return value at the
> end of the function.  It is is unneeded.

Fair enough.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
