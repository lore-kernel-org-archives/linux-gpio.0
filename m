From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH] gpio: dwapb: Add support for next generation of X-Gene
 SoC
Date: Wed, 15 Feb 2017 11:20:01 +0000
Message-ID: <20170215112001.GA30801@page>
References: <1485891838-27093-1-git-send-email-hotran@apm.com>
 <CACRpkdZw-QLOeiPqSRaEJ+mGGDwi5fh9B1uenPxQGBtTwj+cuw@mail.gmail.com>
 <20170213093834.GA16603@page>
 <CAFHUOYxxygE4ouZySwvLr3=xBPSATk0XqpMDVL=EZcciV7FNRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFHUOYxxygE4ouZySwvLr3=xBPSATk0XqpMDVL=EZcciV7FNRA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoan Tran <hotran@apm.com>
Cc: Jamie Iles <jamie@jamieiles.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Weike Chen <alvin.chen@intel.com>, Alexandre Courbot <gnurou@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Loc Ho <lho@apm.com>, Duc Dang <dhdang@apm.com>
List-Id: linux-gpio@vger.kernel.org

Hi Hoan,

On Tue, Feb 14, 2017 at 05:22:09PM -0800, Hoan Tran wrote:
> Hi Linus, Jamie and all,
> 
> Do you have any comments on this patch?

I think that the CONFIG_ACPI ifdef can be removed to clean it up - 
acpi_match_device() returns NULL for !CONFIG_ACPI.

Other than that, looks good to me.

Jamie
