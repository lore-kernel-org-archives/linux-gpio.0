From: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Subject: Re: [PATCH] gpio / ACPI: fix returned error from acpi_dev_gpio_irq_get()
Date: Wed, 12 Oct 2016 18:47:04 +0200
Message-ID: <CAN+gG=GUJ-VW7y1HMO+txdF8KpyaS6as3na=-FbAOUVBEkS=kA@mail.gmail.com>
References: <1476290430-19542-1-git-send-email-benjamin.tissoires@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476290430-19542-1-git-send-email-benjamin.tissoires@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@intel.com>
Cc: David Arcari <darcari@redhat.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 12, 2016 at 6:40 PM, Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
> From: David Arcari <darcari@redhat.com>
>
> acpi_dev_gpio_irq_get() currently ignores the error returned
> by acpi_get_gpiod_by_index() and overwrites it with -ENOENT.
>
> Problem is this error can be -EPROBE_DEFER, which just blows
> up some drivers when the module ordering is not correct.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: David Arcari <darcari@redhat.com>
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> ---
>
> Hi David,
>
> I am planning on sending this to the list, any last minute comments?

Of course, I forgot to remove our internal sync comment.
David's answer was "No.  This looks good to me.", so I just went ahead
and send the patch.

Cheers,
Benjamin
