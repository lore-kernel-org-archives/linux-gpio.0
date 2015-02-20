From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: return NULL from gpiod_get_optional when GPIOLIB is disabled
Date: Fri, 20 Feb 2015 14:37:47 +0900
Message-ID: <CAAVeFuKrdcSmsS5S4eiQRDVeEZ2ks9J475jDFV7uH9cMCuthLg@mail.gmail.com>
References: <20150220003035.GA22334@dtor-glaptop> <CAAVeFu+Ys44Y0mcBYqoUEVST+TZuGXKUX5qQe9z9sDZCXdOZfQ@mail.gmail.com>
 <20150220053344.GA5518@dtor-glaptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150220053344.GA5518@dtor-glaptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 20, 2015 at 2:33 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>> I should have commented at that time, but let's do it now: I agree
>> with the idea, but this leaves the door open to confusing situations
>> in case gpiolib was unintentionally disabled. Could you also add a
>> note in the documentation of this function to explain this behavior,
>> to spare a few headaches to users of this function?
>
> You mean the inline documentation in drivers/gpio/gpiolib.c and
> drivers/gpio/devres.c? I can certainly mention there that is GPIOLIB is disabled
> thy will return NULL unlike the non-optional variants.

I was thinking about Documentation/gpio/consumer.txt, but having a
note in the inline documentation as well certainly makes sense.
