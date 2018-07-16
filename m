From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/2] gpiolib: don't allow userspace to set values of input lines
Date: Mon, 16 Jul 2018 16:13:17 +0200
Message-ID: <CAMRc=MeZX0r1khVBY72_XgyUfW=GLFG-=hUuqZHWYgCRwFkUrQ@mail.gmail.com>
References: <20180716083424.11157-1-brgl@bgdev.pl> <20180716083424.11157-2-brgl@bgdev.pl>
 <CACRpkdaWGwhJ1D683R+7TV0JsUg-pNYZ2xm_0+16O2NgnBo+4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaWGwhJ1D683R+7TV0JsUg-pNYZ2xm_0+16O2NgnBo+4g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

2018-07-16 15:40 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> On Mon, Jul 16, 2018 at 10:34 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
>> User space can currently both read and set values of input lines using
>> the character device. This was not allowed by the old sysfs interface
>> nor is it a correct behavior.
>>
>> Check the first descriptor in the set for the OUT flag when asked to
>> set values and return -EPERM if the line is input.
>>
>> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>
> Patch applied! Thanks for fixing this.
>

Thanks. Do you think we should Cc stable on that one?

Bart
