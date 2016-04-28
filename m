From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [patch] pinctrl: baytrail: fix some error handling in debugfs
Date: Thu, 28 Apr 2016 13:55:14 +0300
Message-ID: <20160428105514.GH10202@lahna.fi.intel.com>
References: <20160427080835.GB22469@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160427080835.GB22469@mwanda>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Cristina Ciocan <cristina.ciocan@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Apr 27, 2016 at 11:08:35AM +0300, Dan Carpenter wrote:
> We need to unlock before continuing.  Also the continue was accidentally
> left out on one error path which would lead to a NULL dereference.
> 
> Fixes: 86e3ef812fe3 ('pinctrl: baytrail: Update gpio chip operations')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch!

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
