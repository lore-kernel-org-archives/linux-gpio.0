From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: fix Strago DMI workaround
Date: Mon, 21 Jan 2019 13:12:13 +0200
Message-ID: <20190121111213.GV14577@lahna.fi.intel.com>
References: <20190115033836.GA150475@dtor-ws>
 <20190115053258.GA9170@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190115053258.GA9170@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 15, 2019 at 07:32:58AM +0200, Andy Shevchenko wrote:
> On Mon, Jan 14, 2019 at 07:38:36PM -0800, Dmitry Torokhov wrote:
> > Well, hopefully 3rd time is a charm. We tried making that check
> > DMI_BIOS_VERSION and DMI_BOARD_VERSION, but the real one is
> > DMI_PRODUCT_VERSION.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Also,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
