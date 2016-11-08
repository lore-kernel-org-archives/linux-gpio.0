From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 11/15] pinctrl-sx150x: Improve oscio GPIO functions
Date: Tue, 8 Nov 2016 09:45:50 +0100
Message-ID: <CACRpkdYuJhUTYy7r1obFXybswV5a4qGGNAUhTcbmhXJ7si_fbg@mail.gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com> <1478537603-23653-12-git-send-email-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478537603-23653-12-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 7, 2016 at 5:53 PM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> Move actual code that configures oscio pin into a separate function and
> use it instead of calling sx150x_gpio_set to avoid calling
> sx150x_pin_is_oscio twice and correctly propagte error code in
> sx150x_gpio_direction_output.
>
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Patch applied!

Yours,
Linus Walleij
