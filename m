From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2] gpio: brcmstb: allow 0 width GPIO banks
Date: Fri, 17 Aug 2018 16:49:04 -0700
Message-ID: <a395c600-6d52-a3fb-208c-22c84004a77f@gmail.com>
References: <1534549659-15883-1-git-send-email-justinpopo6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1534549659-15883-1-git-send-email-justinpopo6@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: justinpopo6@gmail.com, linux-gpio@vger.kernel.org
Cc: gregory.0xf0@gmail.com, linus.walleij@linaro.org, computersforpeace@gmail.com, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 08/17/2018 04:47 PM, justinpopo6@gmail.com wrote:
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

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks Justin!
--
Florian
