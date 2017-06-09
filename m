From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: Re: [PATCH v2] gpio: mvebu: fix regmap_update_bits usage
Date: Fri, 9 Jun 2017 14:21:44 +0200
Message-ID: <20170609142144.5f6c916b@gmail.com>
References: <20170609100917.26660-1-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36748 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751572AbdFIMVs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 08:21:48 -0400
In-Reply-To: <20170609100917.26660-1-gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Chris Packham <Chris.Packham@alliedtelesis.co.nz>

On Fri,  9 Jun 2017 12:09:17 +0200
Gregory CLEMENT <gregory.clement@free-electrons.com> wrote:

> In some place in the driver regmap_update_bits was misused. Indeed the
> last argument is not the value of the bit (or group of bits) itself
> but the mask value inside the register.
> 
> So when setting the bit N, then the value must be BIT(N) and not 1.
> 
> CC: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
> CC: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---

Hi Gregory,

Tested-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>

Thanks for the prompt fix
Ralph

