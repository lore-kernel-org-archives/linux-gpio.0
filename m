From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: coh901: fix initconst annotation
Date: Mon, 15 Feb 2016 20:41:22 +0100
Message-ID: <CACRpkdYOq7C-wBktOMSuhkjfWwmH-8ukOPSnuX7ACcLuCUiH-g@mail.gmail.com>
References: <1454941800-2776480-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454941800-2776480-1-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 8, 2016 at 3:29 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> Clang correctly points out that the section attribute for u300_gpio_confdata
> is in the wrong place:
>
> drivers/pinctrl/pinctrl-coh901.c:130:37: error: '__section__' attribute only applies to functions and global variables
>
> This moves it from the type name to the variable, so it actually gets
> discarded.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
