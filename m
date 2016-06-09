From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/9] pinctrl: baytrail: make it explicitly non-modular
Date: Thu, 9 Jun 2016 17:10:57 +0300
Message-ID: <20160609141057.GM1791@lahna.fi.intel.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
 <1465267388-17884-3-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465267388-17884-3-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Jun 06, 2016 at 10:43:01PM -0400, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> config PINCTRL_BAYTRAIL
>         bool "Intel Baytrail GPIO pin control"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
> 
> Since module_init() was already not in use in this driver, we don't
> have any concerns with init ordering changes here.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Yeah, probably good thing to do. No objections from me.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
