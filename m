From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: iop: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
Date: Thu, 30 Nov 2017 14:41:12 +0100
Message-ID: <CACRpkdYwYn1TXhcCsCnU7p9++ya96V66tnVJUY5QePOMcMuvsg@mail.gmail.com>
References: <20171120205452.84185-1-jc@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171120205452.84185-1-jc@linux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jesse Chan <jc@linux.com>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 20, 2017 at 9:54 PM, Jesse Chan <jc@linux.com> wrote:

> This change resolves a new compile-time warning
> when built as a loadable module:
>
> WARNING: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-iop.o
> see include/linux/module.h for more information
>
> This adds the license as "GPL", which matches the header of the file.
>
> MODULE_DESCRIPTION and MODULE_AUTHOR are also added.
>
> Signed-off-by: Jesse Chan <jc@linux.com>

Patch applied.

Yours,
Linus Walleij
