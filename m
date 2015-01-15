From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio/Kconfig: Fix X86 arch name
Date: Thu, 15 Jan 2015 17:17:44 +0100
Message-ID: <CACRpkdaqdw39CO5OuOaawf7rwiKc6uVqGoak=BOSowSpzBH9tg@mail.gmail.com>
References: <1421142117-16371-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421142117-16371-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 13, 2015 at 10:41 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> X86 Kconfig symbol is X86, not ARCH_X86.
>
> Fixes: c586b3075d5b47d8 (gpio/xilinx: Add support for X86 Arch)
> Reported-by: Paul Bolle <pebolle@tiscali.nl>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

OK patch applied, let's see if the autobuilders puke on us now...

Yours,
Linus Walleij
