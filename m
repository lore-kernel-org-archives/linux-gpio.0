From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpiolib: fix lookup of platform-mapped GPIOs
Date: Mon, 25 Nov 2013 10:58:57 +0200
Message-ID: <20131125085857.GP2281@intel.com>
References: <1385186152-29188-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1385186152-29188-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sat, Nov 23, 2013 at 02:55:52PM +0900, Alexandre Courbot wrote:
> A typo resulted in GPIO lookup failing unconditionally.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Reported-by: Stephen Warren <swarren@wwwdotorg.org>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
