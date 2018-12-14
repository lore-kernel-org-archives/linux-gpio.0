From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Fix return value of gpio_to_desc() stub if !GPIOLIB
Date: Fri, 14 Dec 2018 16:06:17 +0100
Message-ID: <CACRpkdZf2pqS04H0DVvQAig2WGFcD9i-kwK=LExT_Nar4Lyu_Q@mail.gmail.com>
References: <1544089549-23629-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544089549-23629-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 6, 2018 at 10:45 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> If CONFIG_GPOILIB is not set, the stub of gpio_to_desc() should return
> the same type of error as regular version: NULL.  All the callers
> compare the return value of gpio_to_desc() against NULL, so returned
> ERR_PTR would be treated as non-error case leading to dereferencing of
> error value.
>
> Fixes: 79a9becda894 ("gpiolib: export descriptor-based GPIO interface")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Patch applied. I kept the Fixes but removed stable, I do not know
of any regression it is fixing.

Yours,
Linus Walleij
