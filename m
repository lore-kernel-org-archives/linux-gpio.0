From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] gpiolib: tighten up ACPI legacy gpio lookups
Date: Thu, 12 Nov 2015 11:02:11 +0200
Message-ID: <20151112090211.GL1509@lahna.fi.intel.com>
References: <20151111194530.GA26559@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151111194530.GA26559@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Johan Hovold <johan@kernel.org>, "Tirdea, Irina" <irina.tirdea@intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2015 at 11:45:30AM -0800, Dmitry Torokhov wrote:
> We should not fall back to the legacy unnamed gpio lookup style if the
> driver requests gpios with different names, because we'll give out the same
> gpio twice. Let's keep track of the names that were used for the device and
> only do the fallback for the first name used.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
