From: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2] pinctrl:intel: Retain HOSTSW_OWN for requested gpio
 pin
Date: Mon, 8 Apr 2019 20:23:37 +0300
Message-ID: <20190408172337.GY9224@smile.fi.intel.com>
References: <20190408095127.6197-1-chiu@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190408095127.6197-1-chiu@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, drake@endlessm.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 08, 2019 at 05:51:27PM +0800, Chris Chiu wrote:
> The touchpad of the ASUS laptops E403NA, X540NA, X541NA are not
> responsive after suspend/resume. The following error message
> shows after resume.
>  i2c_hid i2c-ELAN1200:00: failed to reset device.
> 
> On these laptops, the touchpad interrupt is connected via a GPIO
> pin which is controlled by Intel pinctrl. After system resumes,
> the GPIO is in ACPI mode and no longer works as an IRQ.
> 
> This commit saves the HOSTSW_OWN value during suspend, make sure
> the HOSTSW_OWN mode remains the same after resume.

Some comments as per v1 are still applicable to this version.

-- 
With Best Regards,
Andy Shevchenko
