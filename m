From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/2] pinctrl: intel: Pass CONFIG_DEBUG_PINCTRL to drivers
Date: Wed, 7 Jan 2015 12:25:20 +0200
Message-ID: <20150107102520.GO1386@lahna.fi.intel.com>
References: <1417689170-41627-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1417689170-41627-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 04, 2014 at 12:32:49PM +0200, Mika Westerberg wrote:
> If the user has selected CONFIG_DEBUG_PINCTRL=y make sure that Intel
> pinctrl drivers will be compiled with that option as well.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Gentle ping on these two.
