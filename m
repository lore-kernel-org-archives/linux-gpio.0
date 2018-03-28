From: "Shah, Nehal-bakulchandra" <Nehal-Bakulchandra.shah@amd.com>
Subject: Re: [PATCH] pinctrl/amd: poll InterruptEnable bits in enable_irq
Date: Wed, 28 Mar 2018 10:49:49 +0530
Message-ID: <a5ff2e32-662d-1c34-2ab9-16d98ffe9390@amd.com>
References: <20180312164530.215524-1-djkurtz@chromium.org>
 <CACRpkdaXzf=2nap2oqU0z_sTQ7XaFJGBnuk0UBE7FfNpT8mAFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaXzf=2nap2oqU0z_sTQ7XaFJGBnuk0UBE7FfNpT8mAFA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Daniel Kurtz <djkurtz@chromium.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Ken Xue <Ken.Xue@amd.com>
Cc: adurbin@chromium.org, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi

On 3/26/2018 2:42 PM, Linus Walleij wrote:
> On Mon, Mar 12, 2018 at 5:45 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:
> 
>> In certain cases interrupt enablement will be delayed relative to when
>> the InterruptEnable bits are written.  One example of this is when
>> a GPIO's "debounce" logice is first enabled.  After enabling debounce,
>> there is a 900 us "warm up" period during which InterruptEnable[0]
>> (bit 11) will read as 0 despite being written 1.  During this time
>> InterruptSts will not be updated, nor will interrupts be delivered, even
>> if the GPIO's interrupt configuration has been written to the register.
>>
>> To work around this delay, poll the InterruptEnable bits after setting
>> them to ensure interrupts have truly been enabled in hardware before
>> returning from the irq_enable handler.
>>
>> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
> 
> Patch applied.
> 
> I see the AMD people were not on CC so adding them here so they can
> say if there is any problem with the approach.
> 
> Daniel: maybe you should consider listing yourself as comaintainer of this
> driver?
> 
> Yours,
> Linus Walleij
> 

Looks good. 

Regards
Nehal Shah
