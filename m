From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Wakeup gpio controller when it is used as IRQ controller
Date: Thu, 21 Sep 2017 14:19:52 +0200
Message-ID: <CACRpkdaQZiyfbBQh-CZZuiw96iqA6bZvN+V7HddJZcR7yz4Cmw@mail.gmail.com>
References: <09258550e475aa7135db7b91bb96deeaf900f8c2.1505891674.git.michal.simek@xilinx.com>
 <2cf9c866-5ace-b056-c80b-a7354fb951fc@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2cf9c866-5ace-b056-c80b-a7354fb951fc@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Borsodi Petr <Petr.Borsodi@i.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Sep 20, 2017 at 10:07 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 09/20/2017 02:14 AM, Michal Simek wrote:
>> From: Borsodi Petr <Petr.Borsodi@i.cz>
>>
>> There is a problem with GPIO driver when used as IRQ controller.
>> It is not working because the module is sleeping (clock is disabled).
>> The patch enables clocks when IP is used as IRQ controller.
>
> I think, it should be solved already in genirq core.
> commit be45beb "genirq: Add runtime power management support for IRQ chips"

Michal, can you verify?

Yours,
Linus Walleij
