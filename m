From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio: add gpio_add_lookup_tables() to add several tables
 at once
Date: Wed, 2 Aug 2017 11:38:48 +0300
Message-ID: <20170802083848.GT2369@lahna.fi.intel.com>
References: <20170725205800.GA25245@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:57247 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752184AbdHBIlG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Aug 2017 04:41:06 -0400
Content-Disposition: inline
In-Reply-To: <20170725205800.GA25245@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 25, 2017 at 01:58:00PM -0700, Dmitry Torokhov wrote:
> +void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables,
> +			     unsigned int n)

This should probably be size_t instead.

Regardless this looks useful so,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
