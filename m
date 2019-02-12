From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2 3/9] irq/irq_sim: provide irq_sim_fire_type()
Date: Tue, 12 Feb 2019 11:35:06 +0000
Message-ID: <fd5d4df5-c27c-8328-2d9b-f56c0a8a4d32@arm.com>
References: <20190129084411.30495-1-brgl@bgdev.pl>
 <20190129084411.30495-4-brgl@bgdev.pl>
 <656763ec-41b9-cdee-22bd-1f32d74473a0@arm.com>
 <CAMpxmJXdyiSLyx7O5G41GzfJQktOS1JeuRUoHejVB3ZOmCFMLQ@mail.gmail.com>
 <c562c67d-d6e3-15c3-b10b-315e8fb181a5@arm.com>
 <20190212110501.wd7ks7vms7pi63dk@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212110501.wd7ks7vms7pi63dk@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 12/02/2019 11:05, Uwe Kleine-König wrote:
> On Tue, Feb 12, 2019 at 10:27:54AM +0000, Marc Zyngier wrote:
>> On 12/02/2019 09:19, Bartosz Golaszewski wrote:
>>> When userspace wants to monitor GPIO line interrupts, the GPIO
>>> framework requests a threaded interrupt with IRQF_TRIGGER_FALLING,
>>> IRQF_TRIGGER_RISING or both. The testing module tries to act like real
>>> hardware and so if we pass only one of the *_TRIGGER_* flags, we want
>>> the simulated interrupt of corresponding type to be fired.
>>
>> Well, that's not how HW works.
> 
> I cannot follow. I agree with Bartosz here. If you configure your SoC's
> irq-controller to only fire on a raising edge, you don't get an event
> when the line falls.

I was a bit quick here. It is more the fact that level gets treated as
"just another type of edge" that really irritated me (yes, I've wasted
way too much time implementing interrupt controllers).

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
