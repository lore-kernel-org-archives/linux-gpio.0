From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] iio: stx104: Add GPIO set_multiple callback function support
Date: Sun, 22 Jan 2017 14:26:58 +0100
Message-ID: <CACRpkdZbstNWvjb3_4Zyh89k637hfgY3GJ7_bt8ePrFF=DjTDw@mail.gmail.com>
References: <cover.1484838095.git.vilhelm.gray@gmail.com> <53039e49d1421a6f070c691988eb22ef0987eba4.1484838095.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53039e49d1421a6f070c691988eb22ef0987eba4.1484838095.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 19, 2017 at 4:06 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The Apex Embedded Systems STX104 series provides a digital output
> register where 4 lines may be set at a time. This patch add support for
> the set_multiple callback function, thus allowing multiple digital
> output lines to be set more efficiently in groups.
>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Hartmut Knaack <knaack.h@gmx.de>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Best if Jonathan queues this so the changes reside in the
IIO tree.

Yours,
Linus Walleij
