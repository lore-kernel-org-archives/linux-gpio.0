From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: pass -DDEBUG in subdirs
Date: Sat, 10 Jan 2015 22:46:51 +0100
Message-ID: <CACRpkdYO2qhCjP2inviaAji-T-kLYxBUO0WxC_69Y96n2cp-Mg@mail.gmail.com>
References: <1420796506-10402-1-git-send-email-linus.walleij@linaro.org>
	<1420798956.23114.18.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420798956.23114.18.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 9, 2015 at 11:22 AM, Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
>
> On Fri, 2015-01-09 at 10:41 +0100, Linus Walleij wrote:
>> When drivers are compiled in subdirectories the -DDEBUG flag need
>> to be passed in the individual Makefiles.
>
> Hi,
>
> It will be easy to forget adding this when adding new subdirectories.
> Can we do this instead?
(...)
> -ccflags-$(CONFIG_DEBUG_PINCTRL)        += -DDEBUG
> +subdir-ccflags-$(CONFIG_DEBUG_PINCTRL) += -DDEBUG

Yeah of course :/

subdir-ccflags applies to this subdir and all below it then I take it.
Typical I don't know such stuff :(

Yours,
Linus Walleij
