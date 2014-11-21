From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] mdio-mux-gpio: Use GPIO descriptor interface and new
 gpiod_set_array function
Date: Fri, 21 Nov 2014 15:13:01 -0500 (EST)
Message-ID: <20141121.151301.477197043372693075.davem@davemloft.net>
References: <6441674.xrJo8HXDvD@pcimr>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <6441674.xrJo8HXDvD@pcimr>
Sender: netdev-owner@vger.kernel.org
To: imr@rtschenk.de
Cc: f.fainelli@gmail.com, netdev@vger.kernel.org, david.daney@cavium.com, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, acourbot@nvidia.com
List-Id: linux-gpio@vger.kernel.org

From: Rojhalat Ibrahim <imr@rtschenk.de>
Date: Thu, 20 Nov 2014 13:24:44 +0100

> Convert mdio-mux-gpio to the GPIO descriptor interface and use the new
> gpiod_set_array function to set all output signals simultaneously.
> 
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> --
> This patch depends on the gpiod_set_array function, which is available in
> the linux-gpio devel tree.

Then I really can't apply it to the networking GIT tree.
