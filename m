From: Pramod Gurav <pramod.gurav.etc@gmail.com>
Subject: Re: [PATCH] gpio: Switch to using managed resources with devm_
Date: Tue, 21 Oct 2014 14:30:47 +0530
Message-ID: <CAMf-jSnr2QrXd7730G=O0XG-v0SUckgRWrjtw7H_Qh0HE8YuRg@mail.gmail.com>
References: <1412160393-5848-1-git-send-email-pramod.gurav@smartplayin.com>
	<CACRpkdZ1XM4ztKBO1aKWmFtQHp+6j9jJL8wuPVJ2mvQWR2cM5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ1XM4ztKBO1aKWmFtQHp+6j9jJL8wuPVJ2mvQWR2cM5A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Pramod Gurav <pramod.gurav@smartplayin.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 21, 2014 at 2:22 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Oct 1, 2014 at 12:46 PM, Pramod Gurav
> <pramod.gurav@smartplayin.com> wrote:
>
>> This change switches to devm_request_region to request region
>> and hence simplifies the module unload and does away with
>> release_region in remove function.
>>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Alexandre Courbot <gnurou@gmail.com>
>> Cc: linux-gpio@vger.kernel.org
>> Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>
>
> Patch applied with augmented subject.

Had sent v2 of this with change in subject. But thanks for the manual
change and applying.
>
> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/



-- 
Thanks and Regards
Pramod
