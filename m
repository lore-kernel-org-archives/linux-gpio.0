From: Yong Li <sdliyong@gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: pca953x: enfore type for i2c_smbus_write_word_data()
Date: Wed, 1 Jun 2016 23:19:45 +0800
Message-ID: <CADO9-pdtfOKdAtwueg0YZ0GHnLkPwL842SXhpx+ENt+11wepPA@mail.gmail.com>
References: <1464721423-10969-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <CADO9-pd60y8u7fQ-thBfpKr58t-=i2D9gyW-PWcz1_CyvgOFsA@mail.gmail.com> <1464784534.1767.11.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:32857 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753789AbcFAPUF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2016 11:20:05 -0400
Received: by mail-io0-f195.google.com with SMTP id p194so3552263iod.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jun 2016 08:20:05 -0700 (PDT)
In-Reply-To: <1464784534.1767.11.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Phil Reid <preid@electromag.com.au>

Hi andy,

Sorry for the confusing. I tested the patch today, using Ubuntu 1604 +
gcc 5.3, the make bzImage does not output any warning messages about
this .c file. I am wondering how you captured the warnings. It seems
that I need the "make C=2" command.

Thanks,
Yong

2016-06-01 20:35 GMT+08:00 Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> On Wed, 2016-06-01 at 12:44 +0800, Yong Li wrote:
>> Hi Andy,
>>
>> Could you let me know which build system you are using? I am using
>> Ubuntu 1604(64 bit) to build the kernel source, but I did not find the
>> warning.
>
> Hmm... I'm confused what exactly you are asking here. My host system is
> Debian unstable, kernel is built by it's own KBuild infrastructure.
>
> I'm pretty sure you are talking about this:
>
> https://lwn.net/Articles/205624/
>
>>
>> Thanks,
>> Yong
>>
>> 2016-06-01 3:03 GMT+08:00 Andy Shevchenko <andriy.shevchenko@linux.int
>> el.com>:
>> > The commit 9b8e3ec34318 ("gpio: pca953x: Use correct u16 value for
>> > register
>> > word write") fixed regression in pca953x_write_regs(). At the same
>> > time the
>> > solution introduced a sparse warning:
>> >
>> > drivers/gpio/gpio-pca953x.c:168:39: warning: incorrect type in
>> > argument 3 (different base types)
>> > drivers/gpio/gpio-pca953x.c:168:39:    expected unsigned short
>> > [unsigned] [usertype] value
>> > drivers/gpio/gpio-pca953x.c:168:39:    got restricted __le16
>> > [usertype] <noident>
>> >
>> > Fix the code by enforcing the type of i2c_smbus_write_word_data()
>> > parameter.
>> >
>> > Cc: Yong Li <sdliyong@gmail.com>
>> > Cc: Phil Reid <preid@electromag.com.au>
>> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> > ---
>> >  drivers/gpio/gpio-pca953x.c | 9 ++++++---
>> >  1 file changed, 6 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-
>> > pca953x.c
>> > index d8233be..21b21cd 100644
>> > --- a/drivers/gpio/gpio-pca953x.c
>> > +++ b/drivers/gpio/gpio-pca953x.c
>> > @@ -163,10 +163,13 @@ static int pca953x_write_regs(struct
>> > pca953x_chip *chip, int reg, u8 *val)
>> >                                         NBANK(chip), val);
>> >         } else {
>> >                 switch (chip->chip_type) {
>> > -               case PCA953X_TYPE:
>> > -                       ret = i2c_smbus_write_word_data(chip-
>> > >client,
>> > -                           reg << 1, cpu_to_le16(get_unaligned((u16
>> > *)val)));
>> > +               case PCA953X_TYPE: {
>> > +                       __le16 word = cpu_to_le16(get_unaligned((u16
>> > *)val));
>> > +
>> > +                       ret = i2c_smbus_write_word_data(chip-
>> > >client, reg << 1,
>> > +                                                       (__force
>> > u16)word);
>> >                         break;
>> > +               }
>> >                 case PCA957X_TYPE:
>> >                         ret = i2c_smbus_write_byte_data(chip-
>> > >client, reg << 1,
>> >                                                         val[0]);
>> > --
>> > 2.8.1
>> >
>
> --
> Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Intel Finland Oy
