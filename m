From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v3] gpio: better lookup method for platform GPIOs
Date: Tue, 3 Dec 2013 13:04:12 +0200
Message-ID: <20131203110412.GC26423@xps8300>
References: <CAAVeFu+LLR-EwiRskE_VBQwPrnXAdt-ahfcH08mOXsFuStFMJg@mail.gmail.com>
 <1386040811-27946-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1386040811-27946-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rhyland Klein <rklein@nvidia.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi,

On Tue, Dec 03, 2013 at 12:20:11PM +0900, Alexandre Courbot wrote:
> Change the format of the platform GPIO lookup tables to make them less
> confusing and improve lookup efficiency.
> 
> The previous format was a single linked-list that required to compare
> the device name and function ID of every single GPIO defined for each
> lookup. Switch that to a list of per-device tables, so that the lookup
> can be done in two steps, omitting the GPIOs that are not relevant for a
> particular device.
> 
> The matching rules are now defined as follows:
> - The device name must match *exactly*, and can be NULL for GPIOs not
>   assigned to a particular device,
> - If the function ID in the lookup table is NULL, the con_id argument of
>   gpiod_get() will not be used for lookup. However, if it is defined, it
>   must match exactly.
> - The index must always match.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> Changes since v2:
> - Removed size member of the gpiod_lookup_table struct (thanks Heikki!)
> - Added Andy's reviewed-by
> 
>  Documentation/gpio/board.txt |  28 ++++++-----
>  drivers/gpio/gpiolib.c       | 108 +++++++++++++++++++++++--------------------
>  include/linux/gpio/driver.h  |  21 ++++-----
>  3 files changed, 85 insertions(+), 72 deletions(-)

Looks good. Thanks Alexandre!


-- 
heikki
