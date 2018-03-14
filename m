From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] pinctrl: uniphier: add PXs2 Audio in/out pin-mux settings
Date: Wed, 14 Mar 2018 15:07:09 +0900
Message-ID: <CAK7LNAQwr1OqhmeyL1ZqRABRuUzk+mh=bDKgDMVV0ZhdyFGxAA@mail.gmail.com>
References: <20180314051137.6091-1-suzuki.katsuhiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180314051137.6091-1-suzuki.katsuhiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

2018-03-14 14:11 GMT+09:00 Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>:
> The UniPhier PXs2 SoC audio core use following 25 pins:
>   ain1    : 2ch I2S input : AI1ADCCK, AI1BCK, AI1D0, AI1LRCK
>   ain2    : 8ch I2S input : AI2ADCCK, AI2BCK, AI2D[0-3], AI2LRCK
>   ainiec1 : S/PDIF input  : XIRQ17 (for AO1IEC)
>   aout2   : 8ch I2S output: AO2BCK, AO2D0, AO2DACCK, AO2LRCK
>                             PORT226, 227, 230 (for AO2D[1-3])
>   aout3   : 2ch I2S output: AO3BCK, AO3DMIX, AO3DACCK, AO3LRCK
>   aoutiec1: S/PDIF output : PORT132(for AO1IEC)
>   aoutiec2: S/PDIF output : AO2IEC
>
> Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
> ---

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>



-- 
Best Regards
Masahiro Yamada
