From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [RFC] gpio: remove gpio_descs global array
Date: Tue, 4 Nov 2014 18:10:16 +0900
Message-ID: <CAAVeFu+fsgG86b8iYVeHNmGqtb2m_P6esF1QFrbsMhwTh+P7Aw@mail.gmail.com>
References: <1414825380-15322-1-git-send-email-acourbot@nvidia.com> <CACRpkdaaXxXCm9===0zaKW5QJsHFBznnERdFrcbtKLQhxygzhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaaXxXCm9===0zaKW5QJsHFBznnERdFrcbtKLQhxygzhA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 3, 2014 at 11:11 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sat, Nov 1, 2014 at 8:03 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>
>> The issue with this patch is its use of kzalloc() in gpiochip_add(), a
>> function potentially called during early boot, before kzalloc() becomes
>> usable. Hence its [RFC] status until we can find a solution for this or
>> agree that this issue is actually never ran into (from which point can
>> one use kzalloc()?)
>
> So which driver requires that the gpiochip be statically defined...
> I heard about early call but not *that* early.

Let me know if you feel adventurous - in that case I will submit a
proper version of this patch to put in -next, and we'll see if people
complain... :)
