From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: better lookup method for platform GPIOs
Date: Thu, 28 Nov 2013 15:45:37 +0100
Message-ID: <CACRpkda-TtKQr6hDx4corjxYv7r7f6_9sNp_2ocbvg9MHyOk7Q@mail.gmail.com>
References: <1385628388-23827-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1385628388-23827-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Rhyland Klein <rklein@nvidia.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 28, 2013 at 9:46 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

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
> ---
> Let's change this bad design before more users start using it. ;)

OK given that Mika has based his patches on this I'll request
that he ACK this and then I'll merge this so that he can put
this patch at the bottom of his patch stack.

Mika: requesting ACK.

Yours,
Linus Walleij
