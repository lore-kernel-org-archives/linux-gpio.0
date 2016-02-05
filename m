From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3 5/5] pinctrl: sunxi: Use pin number when calling sunxi_pmx_set
Date: Fri, 5 Feb 2016 17:45:12 +0800
Message-ID: <CAGb2v67Wd_ZSJEdKm7b6dRzqAzGO3i61c1akVH+62xYnRF8Sfw@mail.gmail.com>
References: <1454542430-16572-1-git-send-email-k@japko.eu> <1454542430-16572-6-git-send-email-k@japko.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454542430-16572-6-git-send-email-k@japko.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Adamski <k@japko.eu>
Cc: inus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Jens Kuske <jenskuske@gmail.com>, Fabian Frederick <fabf@skynet.be>, Vishnu Patekar <vishnupatekar0510@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 4, 2016 at 7:33 AM, Krzysztof Adamski <k@japko.eu> wrote:
> sunxi_pmx_set accepts pin number and then calculates offset by
> subtracting pin_base from it. sunxi_pinctrl_gpio_get, on the other hand,
> gets offset so we have to convert it to pin number so we won't get
> negative value in sunxi_pmx_set.
>
> This was only used on A10 so far, where there is only one GPIO chip with
> pin_base set to 0 so it didn't matter. However H3 also requires this
> workaround but have two pinmux sections, triggering problem for PL port.
>
> Signed-off-by: Krzysztof Adamski <k@japko.eu>

Acked-by: Chen-Yu Tsai <wens@csie.org>

(resent as my mail setup failed to deliver)
