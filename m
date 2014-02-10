From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/2] gpiolib: ACPI: remove gpio_to_desc() usage
Date: Mon, 10 Feb 2014 12:06:13 +0200
Message-ID: <20140210100613.GV18029@intel.com>
References: <1391935435-29002-1-git-send-email-acourbot@nvidia.com>
 <1391935435-29002-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1391935435-29002-2-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sun, Feb 09, 2014 at 05:43:55PM +0900, Alexandre Courbot wrote:
> gpio_to_desc() must die. Replace one of its usage by the
> newly-introduced gpiochip_get_desc() function.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Mika, can we have your review on this?

Sure, looks good.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
