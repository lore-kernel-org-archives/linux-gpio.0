From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: syscon: reduce message level when direction reg
 offset not in dt
Date: Fri, 27 Mar 2015 11:18:21 +0100
Message-ID: <CACRpkdYaScNxta0iDyyYeJ2VyD=fyhaK=+Lsm1NifnyJq1MTfQ@mail.gmail.com>
References: <20150324161358.GA694@kahuna>
	<1427222562-2223-1-git-send-email-grygorii.strashko@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427222562-2223-1-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@linaro.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Alexandre Courbot <gnurou@gmail.com>, Muralidharan Karicheri <m-karicheri2@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 24, 2015 at 7:42 PM,  <grygorii.strashko@linaro.org> wrote:

> From: Grygorii Strashko <grygorii.strashko@linaro.org>
>
> Now GPIO syscon driver produces bunch of warnings during the
> boot of Kesytone 2 SoCs:
>  gpio-syscon soc:keystone_dsp_gpio@02620240: can't read the dir register offset!
>  gpio-syscon soc:keystone_dsp_gpio@2620244: can't read the dir register offset!
>
> This message unintentionally was added using dev_err(), but its
> actual log level is debug, because third cell of "ti,syscon-dev" is
> optional.
>
> Hence change it to dev_dbg() as it should be.
>
> This patch fixes commit:
>  5a3e3f8 ("gpio: syscon: retriave syscon node and regs offsets from dt")
>
> Reported-by: Russell King <linux@arm.linux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>

OK sorry for missing this when asking about the strange messages.
Patch applied for fixes with these test tags and ack.

Yours,
Linus Walleij
