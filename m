From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: mvebu: fix regmap_update_bits usage
Date: Fri, 16 Jun 2017 11:16:32 +0200
Message-ID: <CACRpkdbKde6Bj0pThxJ+Butzet1JCeFojSVVeoqM=x3qWGVw1w@mail.gmail.com>
References: <20170609100917.26660-1-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170609100917.26660-1-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Ralph Sennhauser <ralph.sennhauser@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 9, 2017 at 12:09 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> In some place in the driver regmap_update_bits was misused. Indeed the
> last argument is not the value of the bit (or group of bits) itself but
> the mask value inside the register.
>
> So when setting the bit N, then the value must be BIT(N) and not 1.
>
> CC: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
> CC: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
> Hi,
>
> In this second version I fixed the improper changed pointed by Thomas.

This version applied with the tags.

Yours,
Linus Walleij
