From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 00/12] ARM: davinci: fix GPIO breakage after v4.19
Date: Tue, 27 Nov 2018 17:50:19 +0530
Message-ID: <6eb91ecb-47b1-8f77-afcc-9ace3cb15b82@ti.com>
References: <20181121093523.12503-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181121093523.12503-1-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Hi Bartosz,

On 21/11/18 3:05 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This is the entire set of changes needed to fix the broken GPIO support
> for DaVinci boards in legacy mode after certain changes made to the
> GPIO driver in 4.19, namely: commits 587f7a694f01 ("gpio: davinci: Use
> dev name for label and automatic base selection") and eb3744a2dd01
> ("gpio: davinci: Do not assume continuous IRQ numbering").

I applied this series and sent a pull request to ARM SoC too.

Thanks,
Sekhar
