From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/1] gpio: add devm_ apis for gpio_chip_add and remove
Date: Sat, 20 Feb 2016 09:34:46 +0530
Message-ID: <56C7E5DE.30505@nvidia.com>
References: <1455542246-16761-1-git-send-email-ldewangan@nvidia.com> <CACRpkdYGS1DogPDnY87HsN2PzDVHw-h6Y15Gv8qhLzgKrkMJtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYGS1DogPDnY87HsN2PzDVHw-h6Y15Gv8qhLzgKrkMJtQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


On Tuesday 16 February 2016 08:33 PM, Linus Walleij wrote:
> On Mon, Feb 15, 2016 at 2:17 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> Add device managed APIs devm_gpiochip_add_data() and
>> devm_gpiochip_remove() for the APIs gpiochip_add_data()
>> and gpiochip_remove().
>>
>> This helps in reducing code in error path and sometimes
>> removal of .remove callback for driver unbind.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> I like the looks of this.
>
> One comment: you must also patch
> Documentation/driver-model/devres.txt

Sure,

>
> Will you also follow up with a massive patch set making use of
> this new API? I feel bad about merging an API if it's not used.
>
> Thanks for only supporting this for the new _data() function.
>
>
Yes, I have planned for this to use this new API. This is just for 
getting review whether fine or not to have devm_* APIs so that I can 
make changes on rest of driver to use this new APIs.
