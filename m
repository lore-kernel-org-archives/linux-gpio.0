From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 2/2] x86: pcengines apuv2 gpio/leds/keys platform driver
Date: Thu, 14 Feb 2019 11:57:32 +0100
Message-ID: <4662508c-01cc-ca84-7241-d28c2719dc63@metux.net>
References: <1549588593-4856-1-git-send-email-lkml@metux.net>
 <1549588593-4856-2-git-send-email-lkml@metux.net>
 <CACRpkdaFJyGYeDZ83LQBG4pr3tgtYPkDQ3RGrrGPM==Sw1vE2w@mail.gmail.com>
 <39fe843d-feba-c871-7b2d-407ab3a35082@metux.net>
 <CACRpkdajLnMY3w40xx6jNEPqr-DYg2FjNgipt6tNBPgRoTx__w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdajLnMY3w40xx6jNEPqr-DYg2FjNgipt6tNBPgRoTx__w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 13.02.19 10:35, Linus Walleij wrote:

> For the dev_id you need to be aware of the following from> <linux/platform_device.h>:> #define PLATFORM_DEVID_NONE     (-1)>
#define PLATFORM_DEVID_AUTO     (-2)>> If the platform device has .id
set to -1 it will be just "leds-gpio",> if it is -2 it will be whatever,
take a chance on .0 or ideally fix> it up. Any positive number like .id
= 4 becomes "leds-gpio.4".> > So figure out the .id field on the
platform device.

Hacked up some debuging into the lookup code and found that it's
just "leds-gpio" and "gpio-keys-polled" in my case. I've just got one
instance of each right now and used PLATFORM_DEVID_NONE.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
