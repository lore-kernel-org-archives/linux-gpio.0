From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2] gpio: brcmstb: allow 0 width GPIO banks
Date: Mon, 20 Aug 2018 14:08:09 -0700
Message-ID: <8419b0dc-9998-3147-512f-85d2694c6a2e@gmail.com>
References: <1534549659-15883-1-git-send-email-justinpopo6@gmail.com>
 <20180818005211.GC26866@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180818005211.GC26866@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, justinpopo6@gmail.com
Cc: linux-gpio@vger.kernel.org, f.fainelli@gmail.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, gregory.0xf0@gmail.com, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On 08/17/2018 05:52 PM, Andrew Lunn wrote:
> On Fri, Aug 17, 2018 at 04:47:39PM -0700, justinpopo6@gmail.com wrote:
>> From: Justin Chen <justinpopo6@gmail.com>
>>
>> Sometimes we have empty banks within the GPIO block. This commit allows
>> proper handling of 0 width GPIO banks.
> 
> Hi Justin
> 
> This is coming from DT? Why do you put 0 width banks in DT in the
> first place?

The way the binding is defined, the "reg" property must cover the entire
GPIO block. On our chips we typically have two blocks, one called GIO
and one called AON_GIO. One of our chips, BCM7429 unfortunately does not
have contiguous banks (groups of 32 GPIOs) within the GIO register
range, it has a first bank from 0 -> 0x20, then nothing, then another
one from 0x40 -> 0x60, which is why this change was proposed, since it
does not break any existing DT blob.
-- 
Florian
