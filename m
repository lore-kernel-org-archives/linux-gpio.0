From: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH v2] gpiolib: Show correct direction from the beginning
Date: Fri, 28 Sep 2018 14:22:46 -0500
Message-ID: <CAOZdJXUUWUWHzus+3sbEXbW_q92e+SSzTQJCqCyQp6Y6_HOo3g@mail.gmail.com>
References: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
 <20180921103604.13361-2-ricardo.ribalda@gmail.com> <153803107307.119890.10052910965015646333@swboyd.mtv.corp.google.com>
 <ffe11a8c-368b-8c74-54a7-a088c3997032@kernel.org> <3e07cab8-0f3e-7474-8f6d-e6bb16e8f998@codeaurora.org>
 <5aea282d-6fc9-cd70-cec4-10f28aa819b9@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5aea282d-6fc9-cd70-cec4-10f28aa819b9@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Timur Tabi <timur@kernel.org>, Stephen Boyd <swboyd@chromium.org>, lkml <linux-kernel@vger.kernel.org>, Linus <linus.walleij@linaro.org>, ricardo.ribalda@gmail.com, linux-gpio <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Sep 28, 2018 at 2:14 PM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> Nack.  Causes a XPU violation to the GPIO config registers.

That doesn't surprise me at all.

I believe that the problem is that gpiochip_line_is_valid() is being
called before gpiochip_irqchip_init_valid_mask() is called, which
means that gpiochip_line_is_valid() always returns true.
