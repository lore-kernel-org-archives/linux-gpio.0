From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH] pinctrl: sprd: Use define directive for
 sprd_pinconf_params values
Date: Thu, 1 Nov 2018 13:57:42 +0800
Message-ID: <CAMz4kuJg9gWtqy4mFsEV12c=kH_-999xeabPEJmb2P_usKRoMQ@mail.gmail.com>
References: <20181101004410.6893-1-natechancellor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181101004410.6893-1-natechancellor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
List-Id: linux-gpio@vger.kernel.org

On 1 November 2018 at 08:44, Nathan Chancellor <natechancellor@gmail.com> wrote:
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
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/138
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---

Looks reasonable to me. Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

-- 
Baolin Wang
Best Regards
