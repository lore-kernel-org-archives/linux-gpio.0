From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH] pinctrl: generic: Avoid several implicit enum conversions
Date: Thu, 1 Nov 2018 11:46:25 +0000
Message-ID: <2ddee1f762ab404a8acc8ce05c96da78@AcuMS.aculab.com>
References: <20180925061855.19557-1-natechancellor@gmail.com>
 <CACRpkdadODxsuae7uhwcfBBMQ-eZ8bvnV71fhDCuudbJEbhhYA@mail.gmail.com>
 <20180925161459.GA15840@flashbox>
 <CAKwvOdkh0rqWcw4r7Y=Ki_MNJPoJNnvm3uGp4Q726PaESxZAnQ@mail.gmail.com>
 <20181025210456.GA14792@flashbox>
 <CACRpkda9LhdQybgci8gYs13L5pHWvDx43_Ftn5s+ERLLFPvLjQ@mail.gmail.com>
 <20181101000338.GA32577@flashbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181101000338.GA32577@flashbox>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 'Nathan Chancellor' <natechancellor@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

From: Nathan Chancellor
> Sent: 01 November 2018 00:04
...
> > A slightly lesser evil variant is to add a few PIN_CONFIG_CUSTOM_1
> > PIN_CONFIG_CUSTOM_2 etc at the end of the enum and just
> > #define MY_CONFIG PIN_CONFIG_CUSTOM_1
> > in all drivers that use these.
> >
> 
> Some drivers actually just define their pin config params like:
> 
> #define VAR (PIN_CONFIG_END + 1)

You probably want to add 'custom' definitions after PIN_CONFIG_END
so that a future compiler versions doesn't generate an error
because (PIN_CONFIG_END + 1) isn't a valid value for the enum.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
