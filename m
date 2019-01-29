From: Dmitry Voytik <voytikd@gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: fix dependencies for PINCTRL_MT76XX
Date: Tue, 29 Jan 2019 07:22:35 +0100
Message-ID: <3e1acf90-9975-12cb-5e78-24e4bd03b507@gmail.com>
References: <20190128223521.2690-1-voytikd@gmail.com>
 <CAGp9LzoVZQx2fb-ETY=sGBB3Xx81jC8t2krczv7h=dVNE-ph2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGp9LzoVZQx2fb-ETY=sGBB3Xx81jC8t2krczv7h=dVNE-ph2Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org



On 1/29/19 6:02 AM, Sean Wang wrote:
> On Mon, Jan 28, 2019 at 2:35 PM Dmitry Voytik <voytikd@gmail.com> wrote:
>>
>> How to reproduce the problem:
>> $ make tinyconfig
>> $ make menuconfig
>> then enable:
>>  CONFIG_COMPILE_TEST=y
>>  CONFIG_PINCTRL=y
>> and any of these:
>>  CONFIG_PINCTRL_MT7622=y
>>  CONFIG_PINCTRL_MT7629=y
>>  CONFIG_PINCTRL_MT7623=y
>>
>> This combination causes build failure.
>>
>> Fix the problem by making PINCTRL_MT76XX to depend on CONFIG_OF=y.
>>
>> Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
>> ---
>>  drivers/pinctrl/mediatek/Kconfig | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
>> index 1817786ab6aa..a005cbccb4f7 100644
>> --- a/drivers/pinctrl/mediatek/Kconfig
>> +++ b/drivers/pinctrl/mediatek/Kconfig
>> @@ -45,12 +45,14 @@ config PINCTRL_MT2701
>>  config PINCTRL_MT7623
>>         bool "Mediatek MT7623 pin control with generic binding"
>>         depends on MACH_MT7623 || COMPILE_TEST
>> +       depends on OF
>>         default MACH_MT7623
>>         select PINCTRL_MTK_MOORE
>>
>>  config PINCTRL_MT7629
>>         bool "Mediatek MT7629 pin control"
>>         depends on MACH_MT7629 || COMPILE_TEST
>> +       depends on OF
>>         default MACH_MT7629
>>         select PINCTRL_MTK_MOORE
>>
>> @@ -92,6 +94,7 @@ config PINCTRL_MT6797
>>
>>  config PINCTRL_MT7622
>>         bool "MediaTek MT7622 pin control"
>> +       depends on OF
>>         depends on ARM64 || COMPILE_TEST
>>         default ARM64 && ARCH_MEDIATEK
>>         select PINCTRL_MTK_MOORE
>> --
>> 2.20.1
>>
> 
> It seems the commit 2d2d478576d71000b29c52668c5712c825ee9af8 already
> fixed the problem or is there something I'm missing?
> 

Opps, sorry. Should have checked linux-pinctrl.git.
Sorry for spamming.

BR,
Dmitry.
