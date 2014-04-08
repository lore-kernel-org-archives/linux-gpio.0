From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: st: use gpiolib irqchip helpers
Date: Tue, 8 Apr 2014 15:11:36 +0200
Message-ID: <CACRpkdbMFaqtPh43sss-eZbY7gFVQHg_+WH7TsJ04KkZvNJg5g@mail.gmail.com>
References: <1396961147-2754-1-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1396961147-2754-1-git-send-email-maxime.coquelin@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime COQUELIN <maxime.coquelin@st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 8, 2014 at 2:45 PM, Maxime COQUELIN <maxime.coquelin@st.com> wrote:

> The v1 was sent by Linus (https://lkml.org/lkml/2014/4/4/287).
> Two changes were necessary to make it to work properly on STiH416:
>   1 - dev reference was not passed to the gpio_chip struct, causing a panic
>   2 - gpiochip_irqchip_add passed IRQ_TYPE_NONE as default type, which caused
> lot of warnings at init time. I choose IRQ_TYPE_LEVEL_LOW as default.

Thanks a lot for fixing this Maxime, this version of the patch
applied!

Yours,
Linus Walleij
