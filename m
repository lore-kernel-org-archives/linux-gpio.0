From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: dwapb: Add support for a bus clock
Date: Tue, 27 Mar 2018 13:32:23 +0200
Message-ID: <CACRpkda36fEirnmyJpSs1a=QXvwr_8uRBrpAx2+6hx1R7XSi2Q@mail.gmail.com>
References: <1520879456-14777-1-git-send-email-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520879456-14777-1-git-send-email-phil.edworthy@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Hoan Tran <hotran@apm.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Mar 12, 2018 at 7:30 PM, Phil Edworthy
<phil.edworthy@renesas.com> wrote:

> Enable an optional bus clock provided by DT.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
> v2:
>  - Fix include order.
>  - Use a clock name.
>  - Check errors from clk_prepare_enable()
>  - Add calls to enable/disable the clock in PM

Patch applied with Andy's review tag.

Yours,
Linus Walleij
