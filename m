From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: zynq: change error code for pinctrl_register failure
Date: Mon, 1 Jun 2015 17:00:53 +0200
Message-ID: <CACRpkdYU4MDP3dhVFvLgom36iwq_=dp8nQudO_t+mt9Kn7Dnow@mail.gmail.com>
References: <1432613909-13457-1-git-send-email-yamada.masahiro@socionext.com>
	<4437293.G26yCXqFQH@wuerfel>
	<20150526183734.GA31081@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150526183734.GA31081@xsjsorenbubuntu>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 26, 2015 at 8:37 PM, S=C3=B6ren Brinkmann
<soren.brinkmann@xilinx.com> wrote:
> On Tue, 2015-05-26 at 10:12AM +0200, Arnd Bergmann wrote:

>> Could we add a pinctrl_register_reason() variant that returns a mean=
ingful
>> error code as ERR_PTR?
>
> I agree with Arnd. As long as we don't get a precise error code we ca=
n
> just keep the current one.

pinctrl_register_cause() please.

Cause-and-effect, not "age of reason".

Yours,
Linus Walleij
