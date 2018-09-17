From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: pinctrl-icelake: driver writes to wrong offsets?
Date: Mon, 17 Sep 2018 11:12:49 +0300
Message-ID: <20180917081249.GM14465@lahna.fi.intel.com>
References: <CACK8Z6ECjwWqDnaXKrmEbEXzmiX41Sbzys=FSCqMwh8eYLPH9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACK8Z6ECjwWqDnaXKrmEbEXzmiX41Sbzys=FSCqMwh8eYLPH9A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajat Jain <rajatja@google.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, casey.g.bowman@intel.com, "Atwood, Matthew S" <matthew.s.atwood@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Sep 14, 2018 at 05:18:34PM -0700, Rajat Jain wrote:
> This is to report what I think is a problem in the pinctrl-icelake
> driver. It seems that when trying to control GPIO pins GPP_A* and
> GPIO_B*, the driver ends up writing to incorrect PADCFG registers.
> I've reached this conclusion by putting debug prints in the driver,
> although this can be seen by the following commands too. Please let me
> know if something is wrong in my experiments. For example, when trying
> to control GPP_B8/ISH_I2C1_SCL, the driver ends up writing to
> GPP_A6/ESPI_RESETB registers.

Hmm, when you add debug prints to the driver and you access GPIO 224
(GPP_B8/ISH_I2C1_SCL) from userspace you can see that the driver
actually uses PADCFG registers of GPP_A6/ESPI_RESETB? So that it is not
just a side-effect of how the pins are wired on your board.
