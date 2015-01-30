From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: max732x: add set_multiple function
Date: Fri, 30 Jan 2015 11:29:54 +0100
Message-ID: <CACRpkdZ4ZjLM4jUA=1kEv_3bJzRgpfcnogiKHWvfwHUP9DM6ug@mail.gmail.com>
References: <1421860669-9217-1-git-send-email-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421860669-9217-1-git-send-email-mans@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mans Rullgard <mans@mansr.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 21, 2015 at 6:17 PM, Mans Rullgard <mans@mansr.com> wrote:

> This adds a set_multiple function to the MAX732x GPIO driver,
> allowing for performance gains when using gpiod_set_array().
>
> Signed-off-by: Mans Rullgard <mans@mansr.com>

Patch applied, thanks M=C3=A5ns!
BTW: are you interested in maintaining this driver?

It needs converting to GPIOLIB_IRQCHIP so I'll cook a patch set for
this, if you're using IRQs with this driver, can you pls help out
testing it? Thanks a lot with sugar on top.

Yours,
Linus Walleij
