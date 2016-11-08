From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] ACPI / gpio: avoid warning for gpio hogging code
Date: Tue, 8 Nov 2016 16:12:48 +0200
Message-ID: <20161108141248.GA1447@lahna.fi.intel.com>
References: <20161108134035.1764500-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161108134035.1764500-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, Christophe Ricard <christophe.ricard@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 08, 2016 at 02:40:06PM +0100, Arnd Bergmann wrote:
> The newly added acpi_gpiochip_scan_gpios function produces a few harmless
> warnings:
> 
> drivers/gpio/gpiolib-acpi.c: In function ‘acpi_gpiochip_add’:
> drivers/gpio/gpiolib-acpi.c:925:7: error: ‘dflags’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
> drivers/gpio/gpiolib-acpi.c:925:9: error: ‘lflags’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
> 
> The problem is that he compiler cannot know that a negative return value
> from fwnode_property_read_u32_array() or acpi_gpiochip_pin_to_gpio_offset()
> implies that the IS_ERR(gpio_desc) is true, as the value could in theory
> be below -MAX_ERRNO.
> 
> The function already initializes its output values to zero, and moving
> that intialization a little higher up ensures that we can never have
> uninitialized data in the caller.
> 
> Fixes: c80f1ba75df2 ("ACPI / gpio: Add hogging support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
