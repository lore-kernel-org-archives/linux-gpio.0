From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl-exynos5440: Use off-stack memory for pinctrl_gpio_range
Date: Tue, 26 Apr 2016 15:52:38 +0200
Message-ID: <CACRpkdYczBP58uS4nVpUGUevb7E+OCXmXA60SydigQo=AzX8Aw@mail.gmail.com>
References: <1461117257-27048-1-git-send-email-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1461117257-27048-1-git-send-email-andrew@aj.id.au>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Thomas P Abraham <thomas.ab@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Apr 20, 2016 at 3:54 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> The range is registered into a linked list which can be referenced
> throughout the lifetime of the driver. Ensure the range's memory is useful
> for the same lifetime by adding it to the driver's private data structure.
>
> The bug was introduced in the driver's initial commit, which was present in
> v3.10.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Fixes: f0b9a7e521fa ("pinctrl: exynos5440: add pinctrl driver for Samsung EXYNOS5440 SoC")
> Cc: stable@vger.kernel.org
> ---
> Since v1:
>
> * Add range member kerneldoc addressing Tomasz Figa's comment

Patch applied with the ACKs.

Yours,
Linus Walleij
