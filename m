From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] gpio: gpio-kempld: Fix get_direction return value
Date: Mon, 11 May 2015 06:09:01 -0700
Message-ID: <20150511130901.GB24321@roeck-us.net>
References: <20150511124649.1221e86e@hyperion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150511124649.1221e86e@hyperion>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Brunner <mibru@gmx.de>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jochen Henneberg <jh@henneberg-systemdesign.com>, Michael Brunner <michael.brunner@kontron.com>, Darren Hart <dvhart@linux.intel.com>, Kevin Strasser <kevin.strasser@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 11, 2015 at 12:46:49PM +0200, Michael Brunner wrote:
> This patch fixes an inverted return value of the gpio get_direction
> function.
> 
> The wrong value causes the direction sysfs entry and GPIO debugfs file
> to indicate incorrect GPIO direction settings. In some cases it also
> prevents setting GPIO output values.
> 
> The problem is also present in all other stable kernel versions since
> linux-3.12.
> 
> Reported-by: Jochen Henneberg <jh@henneberg-systemdesign.com>
> Signed-off-by: Michael Brunner <michael.brunner@kontron.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
