From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 1/7] gpio: brcmstb: Do not use gc->pin2mask()
Date: Sat, 28 Oct 2017 09:54:07 -0700
Message-ID: <914591ef-f6b6-8e9b-a3cc-b7ac82391fd6@gmail.com>
References: <20171024195451.30535-1-opendmb@gmail.com>
 <20171024195451.30535-2-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171024195451.30535-2-opendmb@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Brian Norris <computersforpeace@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org



On 10/24/2017 12:54 PM, Doug Berger wrote:
> From: Linus Walleij <linus.walleij@linaro.org>
> 
> The pin2mask() accessor only shuffles BIT ORDER in big endian systems,
> i.e. the bitstuffing is swizzled big endian so "bit 0" is bit 7 or
> bit 15 or bit 31 or so.
> 
> The brcmstb only uses big endian BYTE ORDER which will be taken car of
> by the ->write_reg() callback.
> 
> Just use BIT(offset) to assign the bit.
> 
> Cc: Gregory Fong <gregory.0xf0@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
