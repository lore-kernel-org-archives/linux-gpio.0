From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 0/3] simulated interrupts
Date: Wed, 19 Jul 2017 15:19:58 +0100
Message-ID: <7c98e6b0-3dbd-52f7-79d5-4ec64bf8a66e@arm.com>
References: <1500466814-32679-1-git-send-email-brgl@bgdev.pl>
 <alpine.DEB.2.20.1707191424190.2286@nanos>
 <CAMRc=McO4L59zDT4QJSmqsdOpLfAv4NDyjddd57Prz2hjE5zWw@mail.gmail.com>
 <alpine.DEB.2.20.1707191557390.2286@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1707191557390.2286@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 19/07/17 14:58, Thomas Gleixner wrote:
> On Wed, 19 Jul 2017, Bartosz Golaszewski wrote:
> 
>> 2017-07-19 14:25 GMT+02:00 Thomas Gleixner <tglx@linutronix.de>:
>>> On Wed, 19 Jul 2017, Bartosz Golaszewski wrote:
>>>
>>>> Some frameworks (e.g. iio, gpiolib) use irq_work to implement simulated
>>>> interrupts that can be 'fired' from process context when needed and
>>>> requested just like normal interrupts. This is useful for testing and
>>>> development purposes.
>>>>
>>>> Currently this code is reimplemented by every user. This series
>>>> proposes to add a new set of functions that can be used by drivers
>>>> that want to simulate interrupts without having to duplicate any
>>>> boilerplate code.
>>>>
>>>> The first patch adds a simple irq simulator framework. The second
>>>> extends it with resource management. The third uses the new
>>>> functionality in the gpio-mockup testing driver.
>>>>
>>>> NOTE: The next candidate for using this API would be iio-dummy-evgen.
>>>
>>> I like the general idea - have not looked at the code yet. Just a quick
>>> question: How many copies/variants of this scheme do we have in tree?
>>>
>>> Thanks,
>>>
>>>         tglx
>>
>> Currently there are two: iio and gpiolib basically duplicate the same
>> code in their respective testing drivers. I only used irq_sim in
>> gpio-mockup in this series as an example and to see if there's any
>> interest in merging it before spending time on iio-dummy-evgen.
> 
> Yes, I think so. Consolidation is always a good thing and simulation is
> useful for developing or validating code.

Indeed, that's pretty interesting.

On a slightly tangential subject, there is another aspect that I thought
of implementing for a while, but always ended up just relying on a quick
hack: forcing the injection of an actual interrupt. A number of
interrupt controllers have the ability to make an interrupt pending, for
it to be handled as if a device had actually triggered it.

In my case, it has proved to be incredibly useful when debugging the
interrupt controller itself, and also things that mess with interrupts
in a creative way (like KVM) while relying on a particular interrupt
controller.

What I had in mind was something like:

echo 1 >/proc/irq/9/trigger (or the corresponding
/sys/kernel/debug/irq/irqs/ interface if we want to make sure that this
is really not for production use...).

If there is any interest, I'll try to whip something up.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
