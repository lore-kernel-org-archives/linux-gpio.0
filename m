From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: davinci: Remove redundant members
 davinci_gpio_controller stuct
Date: Wed, 11 Jan 2017 12:00:14 +0100
Message-ID: <CACRpkdbVWHkRV_GNZ9meKD=A=tgtPu5+HLrtP6jJ=c4nxT=bAA@mail.gmail.com>
References: <1483518389-6200-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483518389-6200-1-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Tero Kristo <t-kristo@ti.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 4, 2017 at 9:26 AM, Keerthy <j-keerthy@ti.com> wrote:

> davinci_gpio_controller struct has set_data, in_data, clr_data
> members that are assigned and never used.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Nice catch!

Patch applied.

Yours,
Linus Walleij
