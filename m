From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] pc104: Mask PC/104 Kconfig options
Date: Wed, 11 Jan 2017 16:26:19 +0100
Message-ID: <CACRpkdaqeLktgqmd6qcdGmruxABS0fWQacPOTYf0V24cKyiSRA@mail.gmail.com>
References: <cover.1484073324.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1484073324.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 10, 2017 at 7:50 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> PC/104 form factor devices serve a specific niche of embedded system
> users. Since PC/104 devices and hardware are typically used by just a
> subset of Linux users, it would be appropriate to filter PC/104 related
> Kconfig options for those uninterested.
>
> This patchset introduces the PC104 Kconfig option, and uses it to mask
> PC/104 specific device drivers and options, so that only those users
> interested in PC/104 related Kconfig options are exposed to them.

Tell me when/if the PC104 option is merged and I can merge the GPIO
patch.

Yours,
Linus Walleij
