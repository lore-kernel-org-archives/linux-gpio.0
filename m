From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio / ACPI: fix returned error from acpi_dev_gpio_irq_get()
Date: Thu, 20 Oct 2016 14:15:44 +0200
Message-ID: <CACRpkdb-DsuKaPk5riRJ8zEy-TDvTrhDH4Vi3L1kZwBMnC4bPQ@mail.gmail.com>
References: <1476290430-19542-1-git-send-email-benjamin.tissoires@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476290430-19542-1-git-send-email-benjamin.tissoires@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@intel.com>, David Arcari <darcari@redhat.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Patch applied for fixes with Mika's ACK.

Yours,
Linus Walleij
