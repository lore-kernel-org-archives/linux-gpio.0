From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 1/2] x86: gpio: AMD G-Series pch gpio platform driver
Date: Mon, 11 Feb 2019 11:46:08 +0100
Message-ID: <f751539b-d844-9ab1-169b-ce6aa0056de6@metux.net>
References: <1549588593-4856-1-git-send-email-lkml@metux.net>
 <CACRpkdaSEZMR7LuLbO1V0k9QEBu4FWxFbq4ZL1pE9dAvNT1z_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaSEZMR7LuLbO1V0k9QEBu4FWxFbq4ZL1pE9dAvNT1z_Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 08.02.19 15:25, Linus Walleij wrote:

Hi,

<snip>

>> +/*>> + * struct amd_fch_gpio_reg - GPIO register definition>> + * @reg:
register index>> + * @name: signal name>> + */>> +struct
amd_fch_gpio_reg {>> +    int         reg;>> +    const char* name;>>
+};> > Can't you put this in the driver file?
I'm afraid, I can't. Because the board driver needs to tell the
gpio driver which gpio's we actually have. This seems to be really
board specific, and the register layout of the FCHs gpio bank seems
to be not actually linear (or maybe the pin naming is just weird)

What I really don't want is undocumented registers or lines being
exposed as gpio somewhere (not knowing what they actually do).
Therefore, I'd like to add only those gpio registers that I can
confirm being safe - at least until I've managed to get more
information.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
