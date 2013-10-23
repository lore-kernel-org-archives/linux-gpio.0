From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpiolib: make GPIO_DEVRES depend on GPIOLIB
Date: Wed, 23 Oct 2013 10:14:33 +0200
Message-ID: <CACRpkdbm-N89_zdTufyGY8H53jBVQsVASd7eP3NMfh-37Rbx_g@mail.gmail.com>
References: <1382307299-22587-1-git-send-email-acourbot@nvidia.com>
	<1382307299-22587-4-git-send-email-acourbot@nvidia.com>
	<CACRpkdaXtE7TEGd0cV7Frw4MReppowRJPQTTXUM3K4B-62YCnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaXtE7TEGd0cV7Frw4MReppowRJPQTTXUM3K4B-62YCnw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 23, 2013 at 10:13 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Mon, Oct 21, 2013 at 12:14 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>
>> Current Kconfig allows GPIO_DEVRES to be selected and compiled without
>> GPIOLIB. This does not make sense anymore since GPIOLIB has become the
>> exclusive way to deal with GPIOs. This patch makes GPIO_DEVRES available
>> only if GPIOLIB is selected.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Hm, I wonder about this. Are, or where there ever consumers of generic
> GPIO using devres without gpiolib?

However I've applied the patch so we can see what happens, what
other way is there to test it...

Yours,
Linus Walleij
