From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: arm:collie_defconfig broken since commit ff2b135922 ("gpio: make
 the gpiochip a real device")
Date: Thu, 31 Mar 2016 07:18:49 -0700
Message-ID: <20160331141849.GA28107@roeck-us.net>
References: <56F8BB39.5010708@roeck-us.net>
 <CACRpkdZ4P6Sk3__pJtHep91f8Bw4xQWLZ85V_=TEa3OMUze1aw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZ4P6Sk3__pJtHep91f8Bw4xQWLZ85V_=TEa3OMUze1aw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 31, 2016 at 03:26:49PM +0200, Linus Walleij wrote:
> On Mon, Mar 28, 2016 at 7:03 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > arm:collie_defconfig is broken since commit ff2b135922 ("gpio: make the
> > gpiochip a real device").
> 
> Oh I was worried that something like this would happen, but
> hoped we could find it in linux-next, oh well.
> 
I didn't have collie_defconfig in my list of qemu tests since last weekend.
Shows that qemu boot tests _are_ valuable ;-).

Question is how to get to a real solution. I tried calling gpiolib_dev_init()
from gpiochip_add_data() if gpiolib was not initialized yet, but at least for
collie this doesn't work, presumably since gpiochip_add_data() is called too
early. I am currently looking into deferring device initialization from
gpiochip_add_data() until gpiolib_dev_init() was called, as suggested by
Alexandre.

Guenter
