From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: tighten up ACPI legacy gpio lookups
Date: Sun, 13 Dec 2015 17:37:38 +0100
Message-ID: <CACRpkda21=_XZyDYYTAUB4PrKVGhNxz4X-Cubn_eSNn3GY9StQ@mail.gmail.com>
References: <20151111194530.GA26559@dtor-ws>
	<CACRpkdbXaXzQ38sy9JJGEhx+ix3WzheAsKJqsXum2T9n00YEvA@mail.gmail.com>
	<20151127173721.GC27040@dtor-ws>
	<CACRpkda7fRZ=CB=Ec2iHmA=u9w6T7-WH2RNVvxBS5jL8he77Tg@mail.gmail.com>
	<20151209172133.GC27131@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151209172133.GC27131@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Johan Hovold <johan@kernel.org>, "Tirdea, Irina" <irina.tirdea@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 9, 2015 at 6:21 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

>> > Hmm, I'd like to get this patch into my tree as well to apply Irina's
>> > goodix pieces on top to make sure they do not break. Would it be OK for
>> > me to just apply the patch and hope git will sort it out when we merge
>> > into next/mainline, you maybe you could prepare a 4.3-based branch with
>> > the patch for me to pull?
>>
>> I had to fuzz the patch so then you need to get the version I applied out
>> of my tree.
>>
>> But I'm not going to rebase the tree so you can pull commit
>> 9c3c9bc9cc980d8981f75109f3921576daf75723
>> from the GPIO tree if you like. Or I can make a tag there if
>> you prefer, just tell me.
>
> Both would mean I will end up with parts of your work-in-progress queue,
> which I would rather avoid. If you create a branch (lets call it A) off
> v4.3 and apply that one patch there and merge branch A it into your main
> branch (even though you already have a version of the same patch in your
> main branch) and I will merge that branch A into my tree then we are
> guaranteed not to have conflicts as git will resolve everything nicely.

I can't do that, as this patch is not applying cleanly on v4.3.

It applies cleanly to v4.4-rc1 though, would you like an immutable
branch like such based on v4.4-rc1 instead?

Linus Walleij
