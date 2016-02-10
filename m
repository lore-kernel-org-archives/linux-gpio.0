From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] gpio: ath79: Move to the generic GPIO driver
Date: Wed, 10 Feb 2016 11:07:13 +0100
Message-ID: <CACRpkdb4jQ=jW9VEj_W3JiXc_YsK4X+a0Hj7mJOFeMYgBuB4yw@mail.gmail.com>
References: <1454010273-21513-1-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454010273-21513-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Antony Pavlov <antonynpavlov@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 28, 2016 at 8:44 PM, Alban Bedel <albeu@free.fr> wrote:

> Drop most of the code in favor of the generic MMIO GPIO driver.
> As the driver now depend on CONFIG_GPIO_GENERIC also add a Kconfig
> entry to make the driver optional.
>
> We leave the base pointer and lock in the data struct because they are
> needed for the IRQ support.
>
> Signed-off-by: Alban Bedel <albeu@free.fr>

Patch applied with Alexandre's ACK.

Yours,
Linus Walleij
