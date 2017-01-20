From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: Widen the generic pinconf argument from 16
 to 24 bits
Date: Fri, 20 Jan 2017 09:43:07 +0100
Message-ID: <CACRpkdZzS5J-TTCdnVnu9FPiado17YmoaFJFOBy+-+E52tJrUQ@mail.gmail.com>
References: <20170119094820.83595-1-mika.westerberg@linux.intel.com> <20170119094820.83595-2-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170119094820.83595-2-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 19, 2017 at 10:48 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> The current pinconf packed format allows only 16-bit argument limiting
> the maximum value 65535. For most types this is enough. However,
> debounce time can be in range of hundreths of milliseconds in case of
> mechanical switches so we cannot represent the worst case using the
> current format.
>
> In order to support larger values change the packed format so that the
> lower 8 bits are used as type which leaves 24 bits for the argument.
> This allows representing values up to 16777215 and debounce times up to
> 16 seconds.
>
> We also convert the existing users to use 32-bit integer when extracting
> argument from the packed configuration value.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

I like the looks of this :)

Look into Andy's comment and whatever else appears, then let's
apply the v2 of this.

Yours,
Linus Walleij
