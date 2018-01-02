From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 18/27] pinctrl: replace devm_ioremap_nocache with devm_ioremap
Date: Tue, 2 Jan 2018 09:43:12 +0100
Message-ID: <CACRpkdaZ5HRC-Mhc=apRSXwizf_8b8ioLfg_=VN5b-eGYJGADQ@mail.gmail.com>
References: <1514026853-33422-1-git-send-email-xieyisheng1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1514026853-33422-1-git-send-email-xieyisheng1@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yisheng Xie <xieyisheng1@huawei.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, ysxie@foxmail.com, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sat, Dec 23, 2017 at 12:00 PM, Yisheng Xie <xieyisheng1@huawei.com> wrote:

> Default ioremap is ioremap_nocache, so devm_ioremap has the same
> function with devm_ioremap_nocache, which can just be killed to
> save the size of devres.o
>
> This patch is to use use devm_ioremap instead of devm_ioremap_nocache,
> which should not have any function change but prepare for killing
> devm_ioremap_nocache.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Yisheng Xie <xieyisheng1@huawei.com>

Patch applied.

Yours,
Linus Walleij
