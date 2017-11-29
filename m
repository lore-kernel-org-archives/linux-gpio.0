From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/6] gpiolib: acpi: Don't contaminate return parameter
 in case of error
Date: Wed, 29 Nov 2017 13:28:53 +0100
Message-ID: <CACRpkdb1xr60e+8ygj=6h3=SmNVGD=jpag4__fQjqB_YJvxadw@mail.gmail.com>
References: <20171110134033.85461-1-andriy.shevchenko@linux.intel.com> <20171110134033.85461-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20171110134033.85461-2-andriy.shevchenko@linux.intel.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 10, 2017 at 2:40 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> If error occurs, leave lookup parameter untouched.
>
> There is no functional change, since all current callers just bail out
> in case of error without using the assigned pieces.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
