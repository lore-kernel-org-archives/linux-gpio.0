From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: dln2: use bus_sync_unlock instead of scheduling work
Date: Fri, 9 Jan 2015 07:58:48 +0100
Message-ID: <CACRpkdY-pW98cymyAKpV4s8x00e-7MPksMX1_0Tj+1QT3WskMw@mail.gmail.com>
References: <1418302951-9309-1-git-send-email-octavian.purdila@intel.com>
	<1418302951-9309-3-git-send-email-octavian.purdila@intel.com>
	<CACRpkdZq4r+3yLvumxM-+f-VyMCb-ZF8xE7_kOx7uAoxrPzpTw@mail.gmail.com>
	<CAE1zotKu0f+169_WO3O=+Q1hpU_r-x60FLpJRWyd-na7B9T_VA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAE1zotKu0f+169_WO3O=+Q1hpU_r-x60FLpJRWyd-na7B9T_VA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Octavian Purdila <octavian.purdila@intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Johan Hovold <johan@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 9, 2015 at 12:40 AM, Octavian Purdila
<octavian.purdila@intel.com> wrote:
> On Thu, Jan 1, 2015 at 9:56 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Thu, Dec 11, 2014 at 2:02 PM, Octavian Purdila
>> <octavian.purdila@intel.com> wrote:
>>
>>> Use the irq_chip bus_sync_unlock method to update hardware registers
>>> instead of scheduling work from the mask/unmask methods. This simplifies
>>> a bit the driver and make it more uniform with the other GPIO IRQ
>>> drivers.
>>>
>>> Signed-off-by: Octavian Purdila <octavian.purdila@intel.com>
>>
>> Patch applied for fixes.
>>
>
> Hi Linus,
>
> I don't see the patch applied, could you please consider it for the
> -for-next branch?

Ah sorry I thought only the first patch was a critical fix.
Applied this to fixes too now. Working on queueing the
GPIO fixes.

Yours,
Linus Walleij
