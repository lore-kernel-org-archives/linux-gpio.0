From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: Show correct direction from the beginning
Date: Mon, 1 Oct 2018 13:54:15 +0200
Message-ID: <CACRpkdawwrpEe6AAfdaxw6OMFXkCnq0gpznk1Up5p1=Wigx_2g@mail.gmail.com>
References: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
 <20180921103604.13361-2-ricardo.ribalda@gmail.com> <153803107307.119890.10052910965015646333@swboyd.mtv.corp.google.com>
 <ffe11a8c-368b-8c74-54a7-a088c3997032@kernel.org> <3e07cab8-0f3e-7474-8f6d-e6bb16e8f998@codeaurora.org>
 <5aea282d-6fc9-cd70-cec4-10f28aa819b9@codeaurora.org> <CAOZdJXUUWUWHzus+3sbEXbW_q92e+SSzTQJCqCyQp6Y6_HOo3g@mail.gmail.com>
 <D3E6F4C4-E1C4-4D88-B118-878576BF5281@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <D3E6F4C4-E1C4-4D88-B118-878576BF5281@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: timur@kernel.org, jhugo@codeaurora.org, Stephen Boyd <swboyd@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Sep 28, 2018 at 9:30 PM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> How do we proceed from here? Can you fix your driver somehow to
> init the valid mask before enabling the gpio?

Just include a hunk to the qcom driver reordering this call
at the same time. No need to make it separate patches,
it need to be tested together anyways.

I guess just switch the order of these two:

        ret = gpiochip_add_data(&pctrl->chip, pctrl);
        if (ret) {
                dev_err(pctrl->dev, "Failed register gpiochip\n");
                return ret;
        }

        ret = msm_gpio_init_valid_mask(chip, pctrl);
        if (ret) {
                dev_err(pctrl->dev, "Failed to setup irq valid bits\n");
                gpiochip_remove(&pctrl->chip);
                return ret;
        }

> Do we need to make more severe changes on the core?

Don't think so.

Yours,
Linus Walleij
