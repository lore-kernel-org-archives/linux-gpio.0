From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH v2] gpio: brcmstb: allow 0 width GPIO banks
Date: Fri, 31 Aug 2018 14:26:01 -0700
Message-ID: <CADtm3G4yn2n_D8Kd8d9ohv1Fd6YFSyRtgrzLT=1xbcegNLMWCQ@mail.gmail.com>
References: <1534549659-15883-1-git-send-email-justinpopo6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1534549659-15883-1-git-send-email-justinpopo6@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Justin Chen <justinpopo6@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 17, 2018 at 4:48 PM <justinpopo6@gmail.com> wrote:
>
> From: Justin Chen <justinpopo6@gmail.com>
>
> Sometimes we have empty banks within the GPIO block. This commit allows
> proper handling of 0 width GPIO banks. We handle 0 width GPIO banks by
> incrementing the bank and number of GPIOs, but not initializing them.
> This will mean a call into the non-existent GPIOs will return an error.

This is clearer now; thanks for rewording!

>
> Also remove "GPIO registered" dev print. This information is misleading
> since the incremented banks and gpio_base do not reflect the actual GPIOs
> that get initialized. We leave this information out since it is already
> printed with dev_dbg.
>
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>

Looks like I'm a bit late on the response, but in case you feel like
adding it Linus:

Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
