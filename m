From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] extcon: gpio: Localize platform data
Date: Thu, 1 Mar 2018 10:14:47 +0100
Message-ID: <CACRpkdanbnodBa335hM5DYpgeW-6pU_oB_vbbUSxR2wRS6FPsw@mail.gmail.com>
References: <20180212085314.23014-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212085314.23014-1-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mike Lockwood <lockwood@google.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 12, 2018 at 9:53 AM, Linus Walleij <linus.walleij@linaro.org> wrote:

> Nothing in the entire kernel #includes <linux/extcon/extcon-gpio.h>
> so move the platform data declaration inside of the driver.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

No reply on these patches so far,
if you prefer I can just apply them to the GPIO
tree.

Yours,
Linus Walleij
