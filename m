From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] mfd: remove use of gpiochip_remove() retval
Date: Tue, 7 Oct 2014 11:19:40 +0200
Message-ID: <CACRpkdayTNQNUDw_eZ9brDBAbd-iSLumJrQrrVnABt=C92kUOA@mail.gmail.com>
References: <1412086542-1662-1-git-send-email-pramod.gurav@smartplayin.com>
	<1412086542-1662-2-git-send-email-pramod.gurav@smartplayin.com>
	<CACRpkdZVyxN+W_8s3Hvij0wu=bE-tyAFhJPVKumRvDkpUDuncA@mail.gmail.com>
	<20141007091417.GM25331@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141007091417.GM25331@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Pramod Gurav <pramod.gurav@smartplayin.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 7, 2014 at 11:14 AM, Lee Jones <lee.jones@linaro.org> wrote:
> On Wed, 01 Oct 2014, Linus Walleij wrote:
>
>> On Tue, Sep 30, 2014 at 4:15 PM, Pramod Gurav
>> <pramod.gurav@smartplayin.com> wrote:
>>
>> > Get rid of using return value from gpiochip_remove() as it returns
>> > void.
>> >
>> > Cc: Linus Walleij <linus.walleij@linaro.org>
>> > Cc: Alexandre Courbot <gnurou@gmail.com>
>> > Cc: Samuel Ortiz <sameo@linux.intel.com>
>> > CC: Lee Jones <lee.jones@linaro.org>
>> > Cc: linux-gpio@vger.kernel.org
>> >
>> > Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>
>>
>> Already fixed in the GPIO tree.
>
> What does that mean?  That it doesn't need fixing here?

No. I think you already ACKed the patch fixing it in the GPIO
tree...

There has been some misunderstanding and duplicate patches
fixing already fixed problems are flying around.

Yours,
Linus Walleij
