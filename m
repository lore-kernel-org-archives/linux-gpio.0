From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] pinctrl: intel: Add support for variable size pad groups
Date: Fri, 9 Jun 2017 13:02:21 +0200
Message-ID: <CACRpkdZPm0OxQodqy8pxLaEGjX1SCY5bsbraKiHHMZTanrQfJw@mail.gmail.com>
References: <20170606131819.39845-1-mika.westerberg@linux.intel.com> <20170606131819.39845-2-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:38146 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751530AbdFILCX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 07:02:23 -0400
Received: by mail-it0-f47.google.com with SMTP id r63so30407958itc.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2017 04:02:23 -0700 (PDT)
In-Reply-To: <20170606131819.39845-2-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 6, 2017 at 3:18 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> The Intel GPIO hardware has a concept of pad groups, which means 1 to 32
> pads occupying their own GPI_IS, GPI_IE, PAD_OWN and so on registers. The
> existing hardware has the same amount of pads in each pad group (except the
> last one) so it is possible to use community->gpp_size to calculate start
> offset of each register.
>
> With the next generation SoCs the pad group size is not always the same
> anymore which means we cannot use community->gpp_size for register offset
> calculations directly.
>
> To support variable size pad groups we introduce struct intel_padgroup that
> can be filled in by the client drivers according the hardware pad group
> layout. The core driver will always use these when it performs calculations
> for pad register offsets. The core driver will automatically populate pad
> groups based on community->gpp_size if the driver does not provide any.
> This makes sure the existing drivers still work as expected.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Chuah, Kim Tatt <kim.tatt.chuah@intel.com>
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Patch applied!

Yours,
Linus Walleij
