From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v2] gpio: mvebu: fix regmap_update_bits usage
Date: Fri, 9 Jun 2017 13:01:25 +0200
Message-ID: <20170609130125.43b8258f@free-electrons.com>
References: <20170609100917.26660-1-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170609100917.26660-1-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Ralph Sennhauser <ralph.sennhauser@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Hello,

On Fri,  9 Jun 2017 12:09:17 +0200, Gregory CLEMENT wrote:
> In some place in the driver regmap_update_bits was misused. Indeed the
> last argument is not the value of the bit (or group of bits) itself but
> the mask value inside the register.
> 
> So when setting the bit N, then the value must be BIT(N) and not 1.
> 
> CC: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
> CC: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks for fixing this so quickly!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
