From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: qcom-spmi-gpio: Fix input value report
Date: Tue, 28 Apr 2015 14:49:53 +0200
Message-ID: <CACRpkdZrdTgDvigO=v2M76uesZFpn5iuCc8oPg-59s-Kr_W1pA@mail.gmail.com>
References: <1428592717-21706-1-git-send-email-ivan.ivanov@linaro.org>
	<1428592717-21706-2-git-send-email-ivan.ivanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1428592717-21706-2-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Arnd Bergmann <arnd@arndb.de>, Soren Brinkmann <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 9, 2015 at 5:18 PM, Ivan T. Ivanov <ivan.ivanov@linaro.org> wrote:

> Read input buffer when input is enabled, not when it is
> disabled. Also fix interpretation of the pmic_gpio_read()
> return code, negative value means an error.
>
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>

Patch applied for fixes.

Yours,
Linus Walleij
