From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1] usb: dwc3: pci: Switch to devm_acpi_dev_add_driver_gpios()
Date: Thu, 23 Mar 2017 13:40:03 +0100
Message-ID: <CACRpkdY+VejcCodKQ9aJMgvuqpp-xCq0cWpxKnGhZUZhRKs3dg@mail.gmail.com>
References: <20170322140807.34332-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170322140807.34332-1-andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 22, 2017 at 3:08 PM, Andy Shevchenko
<andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:

> Switch to use managed variant of acpi_dev_add_driver_gpios() to simplify
> error path and fix potentially wrong assignment if ->probe() fails.
>
> While here, add a debug message in case assignment fails to allow user
> see the cause of a potential issue.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>
>  Linus, according to preliminary agreement with Felipe it may go through
>  GPIO subsystem instead of pulling from it.

Patch applied with Felipe's ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
