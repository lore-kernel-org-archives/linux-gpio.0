From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: fix qcom ssbi drivers for 64-bit compilation
Date: Tue, 17 Nov 2015 15:34:52 +0100
Message-ID: <CACRpkdYekZ69TQbewCnr63R2qbPfuVF6gTMfpZQj07ppGsTb8w@mail.gmail.com>
References: <5235862.Gokjxf5QH1@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5235862.Gokjxf5QH1@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 16, 2015 at 5:41 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> When building pinctrl-ssbi-gpio and pinctrl-ssbi-mpp for ARM64, we ge=
t
> a compile warning about invalid types:
>
> drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c: In function 'pm8xxx_gpio_pr=
obe':
> drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from p=
ointer to integer of different size [-Wpointer-to-int-cast]
> drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c: In function 'pm8xxx_mpp_prob=
e':
> drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from po=
inter to integer of different size [-Wpointer-to-int-cast]
>
> This changes the code so we cast the pointer to 'unsigned long', whic=
h
> is the right thing to do here.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied for fixes with Bj=C3=B6rn's review tag.

Yours,
Linus Walleij
