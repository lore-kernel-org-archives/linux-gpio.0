From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 04/33] gpiolib-of: use match_string() helper
Date: Tue, 22 May 2018 00:36:53 +0300
Message-ID: <CAHp75Vcxh5kf=mivmWN4aWPJc+9e5VPRjKPtBWNatrYEYt_07g@mail.gmail.com>
References: <1526903890-35761-1-git-send-email-xieyisheng1@huawei.com> <1526903890-35761-5-git-send-email-xieyisheng1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526903890-35761-5-git-send-email-xieyisheng1@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yisheng Xie <xieyisheng1@huawei.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 21, 2018 at 2:57 PM, Yisheng Xie <xieyisheng1@huawei.com> wrote:
> match_string() returns the index of an array for a matching string,
> which can be used intead of open coded variant.
>

https://patchwork.ozlabs.org/patch/908134/

> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Yisheng Xie <xieyisheng1@huawei.com>


-- 
With Best Regards,
Andy Shevchenko
