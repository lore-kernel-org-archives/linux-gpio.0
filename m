From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3] pinctrl:intel: Retain HOSTSW_OWN for requested gpio
 pin
Date: Mon, 15 Apr 2019 22:25:09 +0300
Message-ID: <20190415192509.GH2654@lahna.fi.intel.com>
References: <20190415055358.9269-1-chiu@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190415055358.9269-1-chiu@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: andriy.shevchenko@intel.com, heikki.krogerus@linux.intel.com, drake@endlessm.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 15, 2019 at 01:53:58PM +0800, Chris Chiu wrote:
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
> 
> Signed-off-by: Chris Chiu <chiu@endlessm.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
