From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sprd: Use define directive for
 sprd_pinconf_params values
Date: Fri, 9 Nov 2018 10:21:47 +0100
Message-ID: <CACRpkdb_zHuTshzaHYUbkEnSdYhk1Moyu1QWTRzwXOELLNoV1A@mail.gmail.com>
References: <20181101004410.6893-1-natechancellor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181101004410.6893-1-natechancellor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Lyra Zhang <zhang.lyra@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 1, 2018 at 1:44 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:

> Clang warns when one enumerated type is implicitly converted to another:
>
> drivers/pinctrl/sprd/pinctrl-sprd.c:845:19: warning: implicit conversion
> from enumeration type 'enum sprd_pinconf_params' to different
> enumeration type 'enum pin_config_param' [-Wenum-conversion]
>         {"sprd,control", SPRD_PIN_CONFIG_CONTROL, 0},
>         ~                ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/pinctrl/sprd/pinctrl-sprd.c:846:22: warning: implicit conversion
> from enumeration type 'enum sprd_pinconf_params' to different
> enumeration type 'enum pin_config_param' [-Wenum-conversion]
>         {"sprd,sleep-mode", SPRD_PIN_CONFIG_SLEEP_MODE, 0},
>         ~                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
>
> It is expected that pinctrl drivers can extend pin_config_param because
> of the gap between PIN_CONFIG_END and PIN_CONFIG_MAX so this conversion
> isn't an issue. Most drivers that take advantage of this define the
> PIN_CONFIG variables as constants, rather than enumerated values. Do the
> same thing here so that Clang no longer warns.

Patch applied with Baolin's review tag.

Yours,
Linus Walleij
