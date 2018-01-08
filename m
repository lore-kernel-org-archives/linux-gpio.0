From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] pinctrl: meson: use one uniform 'function' name
Date: Mon, 08 Jan 2018 09:52:24 +0100
Message-ID: <1515401544.5048.67.camel@baylibre.com>
References: <20180108073328.205769-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180108073328.205769-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Xingyu Chen <xingyu.chen@amlogic.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, 2018-01-08 at 15:33 +0800, Yixun Lan wrote:
> These two patches are general improvement for meson pinctrl driver.
> It make the two pinctrl trees (ee/ao) to share one uniform 'function' name for
> one hardware block even its pin groups live inside two differet hardware domains,
> which for example EE vs AO domain here.
> 
> This idea is motivated by Martin's question at [1]
> 
> [1]
>  http://lkml.kernel.org/r/CAFBinCCuQ-NK747+GHDkhZty_UMMgzCYOYFcNTrRDJgU8OM=Gw@mail.gmail.com
> 
> 
> Yixun Lan (2):
>   pinctrl: meson: introduce a macro to have name/groups seperated
>   pinctrl: meson-axg: correct the pin expansion of UART_AO_B
> 
>  drivers/pinctrl/meson/pinctrl-meson-axg.c | 4 ++--
>  drivers/pinctrl/meson/pinctrl-meson.h     | 8 +++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)

Hi Yixun,

Honestly, I don't like the idea. I think it adds an unnecessary complexity.
I don't see the point of FUNCTION_EX(uart_ao_b, _z) when you could simply write 
FUNCTION(uart_ao_b_z) ... especially when there is just a couple of function per
SoC available on different domains.

A pinctrl driver can already be challenging to understand at first, let's keep
it simple and avoid adding more macros.

Regards
Jerome
