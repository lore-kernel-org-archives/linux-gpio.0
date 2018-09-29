From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v2] gpiolib: Show correct direction from the beginning
Date: Sat, 29 Sep 2018 08:23:32 +0200
Message-ID: <CAPybu_3v6Y1Bs1+WQKFfdNmAFdBN6VJTDiCG1ApNVM2AWt4vjA@mail.gmail.com>
References: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
 <20180921103604.13361-2-ricardo.ribalda@gmail.com> <153803107307.119890.10052910965015646333@swboyd.mtv.corp.google.com>
 <ffe11a8c-368b-8c74-54a7-a088c3997032@kernel.org> <3e07cab8-0f3e-7474-8f6d-e6bb16e8f998@codeaurora.org>
 <5aea282d-6fc9-cd70-cec4-10f28aa819b9@codeaurora.org> <CAOZdJXUUWUWHzus+3sbEXbW_q92e+SSzTQJCqCyQp6Y6_HOo3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOZdJXUUWUWHzus+3sbEXbW_q92e+SSzTQJCqCyQp6Y6_HOo3g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: timur@kernel.org
Cc: jhugo@codeaurora.org, swboyd@chromium.org, LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Timur

In fact  gpiochip_init_valid_mask is called some lines after in the
same function. We could reorder the function. Would that work for you?

The driver breaking is upstream? Is it possible to access the hardware?

Thanks

[Sorry for the two html mails in a row, I did not try to work with my
phone before :) ]
On Fri, Sep 28, 2018 at 9:23 PM Timur Tabi <timur@kernel.org> wrote:
>
> On Fri, Sep 28, 2018 at 2:14 PM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> > Nack.  Causes a XPU violation to the GPIO config registers.
>
> That doesn't surprise me at all.
>
> I believe that the problem is that gpiochip_line_is_valid() is being
> called before gpiochip_irqchip_init_valid_mask() is called, which
> means that gpiochip_line_is_valid() always returns true.



-- 
Ricardo Ribalda
