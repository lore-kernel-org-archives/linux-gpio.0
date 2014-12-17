From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [patch] gpio: grgpio: off by one in grgpio_to_irq()
Date: Wed, 17 Dec 2014 11:18:49 +0900
Message-ID: <CAAVeFuLtWzjWO91R8YwqSnnUTD1kjPvY-FFpWEjqxNhtjbkn6w@mail.gmail.com>
References: <20141216235358.GD31467@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20141216235358.GD31467@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 17, 2014 at 8:53 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> "gc->ngpio" is a number between 1 and GRGPIO_MAX_NGPIO.  If "offset" is
> GRGPIO_MAX_NGPIO then we're going one step beyond the end of the
> priv->lirqs[] array.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
