From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 12/17] pinctrl: uniphier: support pin configuration for
 dedicated pins
Date: Tue, 31 May 2016 12:51:39 +0200
Message-ID: <CACRpkdY9wRMJddR+yEqqCRwjvgnXtkiVb9bkvv1+-ugq1V7-Xw@mail.gmail.com>
References: <1464681923-7469-1-git-send-email-yamada.masahiro@socionext.com>
	<1464681923-7469-13-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464681923-7469-13-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 31, 2016 at 10:05 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> PH1-LD4 and PH1-sLD8 SoCs have pins that support pin configuration
> (pin biasing, drive strength control), but not pin-muxing.
>
> Allow to fill the mux value table with -1 for those pins; pins with
> mux value -1 will be skipped in the pin-mux set function.  The mux
> value type should be changed from "unsigned" to "int" in order to
> accommodate -1 as a special case.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
