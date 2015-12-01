From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/2] pinctrl: single: Use a separate lockdep class
Date: Tue, 1 Dec 2015 14:09:13 +0000
Message-ID: <565DAA09.3030201@arm.com>
References: <1448644860-29323-1-git-send-email-sudeep.holla@arm.com>
 <CACRpkda3g7FXV4vLtj0LnV5H3vhumDrngHeJ6F7yc8y1k_dABg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda3g7FXV4vLtj0LnV5H3vhumDrngHeJ6F7yc8y1k_dABg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org



On 01/12/15 14:06, Linus Walleij wrote:
> On Fri, Nov 27, 2015 at 6:20 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
>> The single pinmux controller can be cascaded to the other interrupt
>> controllers. Hence when propagating wake-up settings to its parent
>> interrupt controller, there's possiblity of detecting possible recursive
>> locking and getting lockdep warning.
>>
>> This patch avoids this false positive by using a separate lockdep class
>> for this single pinctrl interrupts.
>>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: linux-gpio@vger.kernel.org
>> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>
> I need Tony's ACK on this patch before applying.
>
> Is it a regression that needs to go into fixes?
>

Not really, only needed by PATCH 2/2 to avoid recursive locking.

-- 
Regards,
Sudeep
