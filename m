From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: bcm2835: Use define directive for BCM2835_PINCONF_PARAM_PULL
Date: Fri, 9 Nov 2018 10:23:13 +0100
Message-ID: <CACRpkdZBtrwEdGQu_XfaYpFarn5x=HpXVj32uczgfJYTNP8kjw@mail.gmail.com>
References: <20181101004653.7552-1-natechancellor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181101004653.7552-1-natechancellor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 1, 2018 at 1:47 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:

> Clang warns when one enumerated type is implicitly converted to another:
>
> drivers/pinctrl/bcm/pinctrl-bcm2835.c:707:40: warning: implicit
> conversion from enumeration type 'enum bcm2835_pinconf_param' to
> different enumeration type 'enum pin_config_param' [-Wenum-conversion]
>         configs[0] = pinconf_to_config_packed(BCM2835_PINCONF_PARAM_PULL, pull);
>                      ~~~~~~~~~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 1 warning generated.
>
> It is expected that pinctrl drivers can extend pin_config_param because
> of the gap between PIN_CONFIG_END and PIN_CONFIG_MAX so this conversion
> isn't an issue. Most drivers that take advantage of this define the
> PIN_CONFIG variables as constants, rather than enumerated values. Do the
> same thing here so that Clang no longer warns.
>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Patch applied with Stefan's ACK.

Yours,
Linus Walleij
