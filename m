From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cannonlake: Fix gpio base for GPP-E
Date: Mon, 17 Sep 2018 11:19:39 +0300
Message-ID: <20180917081939.GN14465@lahna.fi.intel.com>
References: <20180915211518.8155-1-s@sd.ai>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180915211518.8155-1-s@sd.ai>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Detheridge <s@sd.ai>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sat, Sep 15, 2018 at 10:15:18PM +0100, Simon Detheridge wrote:
> The gpio base for GPP-E was set incorrectly to 258 instead of 256,
> preventing the touchpad working on my Tong Fang GK5CN5Z laptop.
> 
> Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=200787
> Signed-off-by: Simon Detheridge <s@sd.ai>

Indeed, you are correct.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
