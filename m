From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] pinctrl: max77620: Use define directive for
 max77620_pinconf_param values
Date: Fri, 9 Nov 2018 16:18:47 +0530
Message-ID: <442c61c6-4a23-ae98-b017-cb129ba3af54@nvidia.com>
References: <20181101005021.8393-1-natechancellor@gmail.com>
 <CACRpkdY0YnUCFYahabGr7GBetBHs++QygDs3KVB=hMRBv0fGZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY0YnUCFYahabGr7GBetBHs++QygDs3KVB=hMRBv0fGZg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Nathan Chancellor <natechancellor@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
List-Id: linux-gpio@vger.kernel.org



On Friday 09 November 2018 02:31 PM, Linus Walleij wrote:
> On Thu, Nov 1, 2018 at 1:51 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
>
>> Clang warns when one enumerated type is implicitly converted to another:
>>
>> drivers/pinctrl/pinctrl-max77620.c:56:12: warning: implicit conversion
>> from enumeration type 'enum max77620_pinconf_param' to different
>> enumeration type 'enum pin_config_param' [-Wenum-conversion]
>>                  .param = MAX77620_ACTIVE_FPS_SOURCE,
>>                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> It is expected that pinctrl drivers can extend pin_config_param because
>> of the gap between PIN_CONFIG_END and PIN_CONFIG_MAX so this conversion
>> isn't an issue. Most drivers that take advantage of this define the
>> PIN_CONFIG variables as constants, rather than enumerated values. Do the
>> same thing here so that Clang no longer warns.
>>
>> Link: https://github.com/ClangBuiltLinux/linux/issues/139
>> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> Patch tentatively applied.
>
> This seems to be the direction we need to be going with a lot
> of CLANG business.
>
> Laxman: you weren't CCed, so tell us if you dislike it for some
> reason.
>
Looked changes and it is great. MISRA-C also happy with macros instead 
of enum.

Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
