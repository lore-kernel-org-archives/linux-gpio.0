From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH 2/4] gpio/xilinx: Convert the driver to platform device interface
Date: Wed, 10 Dec 2014 14:07:40 +0100
Message-ID: <CAPybu_0Z5p1e6O4e3Qg+poJ2GwcHpd5wdnJ3EfPf9aN_VLX1ZA@mail.gmail.com>
References: <1418051276-5476-1-git-send-email-ricardo.ribalda@gmail.com>
 <1418051276-5476-3-git-send-email-ricardo.ribalda@gmail.com> <CAAVeFuKj1ekbGyn_bLVN9ndF=B=H=2HQXDzjEvhes=GCcVyv_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuKj1ekbGyn_bLVN9ndF=B=H=2HQXDzjEvhes=GCcVyv_A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hello Alexandre

Will merge them and resend. May I add your acked by to the merged 2/3?

Thanks!

On Wed, Dec 10, 2014 at 11:49 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Tue, Dec 9, 2014 at 12:07 AM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>> This way we do not need to transverse the device tree manually and we
>> support hot plugged devices.
>
> Looks ok at first sight, but I think patch 3 should be merged into
> this one. They are really closely related.



-- 
Ricardo Ribalda
