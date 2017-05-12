From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] gpiolib: Add stubs for gpiod lookup table interface
Date: Fri, 12 May 2017 11:27:42 +0200
Message-ID: <CACRpkdbjFys_1j0QocZPLCgbbQ0_w+pahhA2WNyO7WD4wiNV2A@mail.gmail.com>
References: <1494527071-6412-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1494527071-6412-1-git-send-email-agust@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, May 11, 2017 at 8:24 PM, Anatolij Gustschin <agust@denx.de> wrote:

> Add stubs for gpiod_add_lookup_table() and gpiod_remove_lookup_table()
> for the !GPIOLIB case to prevent build errors.
>
> Signed-off-by: Anatolij Gustschin <agust@denx.de>

Patch applied for fixes with Andy's Review tag.

Yours,
Linus Walleij
