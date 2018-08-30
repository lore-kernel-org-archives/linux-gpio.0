From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: brcmstb: allow 0 width GPIO banks
Date: Thu, 30 Aug 2018 11:05:43 +0200
Message-ID: <CACRpkdYu8F6hzw4sHsqBbziYSQQK5Ppb+dwi1AqYZXbzAumw6w@mail.gmail.com>
References: <1534549659-15883-1-git-send-email-justinpopo6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1534549659-15883-1-git-send-email-justinpopo6@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: justinpopo6@gmail.com
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Aug 18, 2018 at 1:47 AM <justinpopo6@gmail.com> wrote:

> From: Justin Chen <justinpopo6@gmail.com>
>
> Sometimes we have empty banks within the GPIO block. This commit allows
> proper handling of 0 width GPIO banks. We handle 0 width GPIO banks by
> incrementing the bank and number of GPIOs, but not initializing them.
> This will mean a call into the non-existent GPIOs will return an error.
>
> Also remove "GPIO registered" dev print. This information is misleading
> since the incremented banks and gpio_base do not reflect the actual GPIOs
> that get initialized. We leave this information out since it is already
> printed with dev_dbg.
>
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>

Patch applied with Florian's ACK.

Yours,
Linus Walleij
